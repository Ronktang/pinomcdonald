#!/usr/bin/env bash

#  Copyright 2019 Giacomo Ferretti
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# === ERRORS === #
# 100: Missing an argument.
# 101: Cannot create temp folder. Try again.
# 102: There was an error with the input file. Check the path.
# 103: Apktool error in decompiling.
# 104: Apktool error in recompiling.
# 105: Cannot find file to patch. Try again.
# 106: There was an error with the patch. Try again.
# 107: There was an error signing the APK. Try again.
# 108: There was an error zipaligning the APK. Try again.
# ============== #

OUTPUT="mcdapi"

OUTPUT_FILENAME="${OUTPUT}_mod_v23"

PATCH_VERSION="1.0.0"
PATCH_CODE="0001"

KEYSTORE="mcdapi_mod.keystore"
KEYSTORE_PASS="mcdapi_key_password"
KEYSTORE_ALIAS="mcdapi_keystore"

# =============================== #
# !!! DO NOT EDIT BEYOND THIS !!! #
# =============================== #

echo -e "# ===================================== #"
echo -e "| \e[92mMcD API Patcher\e[0m - developed by Hexile |"
echo -e "# ===================================== #"
echo -e "  \e[94m${PATCH_VERSION}\e[0m"

source utils.sh

FRAMEWORK="$(pwd)/bin"
PATCH_FOLDER=$(mktemp -d tmpdir.patch.XXXXXXXXXX) || error "Failed to create temp folder." 101

# Add necessary tools to PATH
if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="$(pwd)/bin/macos/:$PATH"
elif [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    export PATH="$(pwd)/bin/linux/:$PATH"
fi
export PATH="$(pwd)/bin/universal/:$PATH"

# Check for commands
check_command java
check_command jarsigner
check_command sed

# Check input variables
if [[ -z "${1}" || -z "${2}" ]]; then
    error "Missing an argument.\e[0m\nUsage: ./patch <APK_PATH> <TARGET_URL>" 100
fi

# Check if input file exists
if [[ ! -f "${1}" ]]; then
    error "There was an error with the input file. Check the path." 102
fi

NAME=$(basename "${1}" .apk)

print_apk_info "${1}"

info "Patching \e[92m${1}\e[94m with \e[92m${2}"

# Generate keystore
if [[ ! -f "${KEYSTORE}" ]]; then
    info "Generating keystore: ${KEYSTORE}..."
    keytool -genkeypair -alias "${KEYSTORE_ALIAS}" -keypass "${KEYSTORE_PASS}" -keystore "${KEYSTORE}" -storepass "${KEYSTORE_PASS}" -keyalg RSA -sigalg SHA1withRSA -dname "CN=mcdapi,OU=mcdapi,O=mcdapi,L=mcdapi,ST=mcdapi,C=mcdapi" -validity 10000
fi

if [[ "${2: -1}" != "/" ]]; then
    TARGET_URL="${2}/"
else
    TARGET_URL="${2}"
fi

# Decompile
info "Decompiling in ${PATCH_FOLDER}..."
apktool d -p "${FRAMEWORK}" -f "${1}" -o "${PATCH_FOLDER}" || error "There was an error decompiling the apk." 103

# Run patches
for f in `find "patches/" -maxdepth 2 -type f ! -path "*.*" | sort -n`; do source "${f}" || error "There was an error with the patch ${f}" 106; done

# Delete files that throw errors while recompiling
# In these files there are some strings malformatted.
info "Removing malformatted files..."
rm -fr "${PATCH_FOLDER}/res/values-ar-rLB/strings.xml"
rm -fr "${PATCH_FOLDER}/res/values-ar-rAE/strings.xml"
rm -fr "${PATCH_FOLDER}/res/values-sv-rSE/strings.xml"
rm -fr "${PATCH_FOLDER}/res/values-ar-rEG/strings.xml"
rm -fr "${PATCH_FOLDER}/res/values-de-rCH/strings.xml"
rm -fr "${PATCH_FOLDER}/res/values-nb-rNO/strings.xml"
rm -fr "${PATCH_FOLDER}/res/values-hr-rHR/strings.xml"
rm -fr "${PATCH_FOLDER}/res/values-de-rAT/strings.xml"

read
# Rebuild
info "Recompiling..."
apktool b -p "${FRAMEWORK}" "${PATCH_FOLDER}" || error "There was an error recompiling the apk." 104

# Sign and zipaling
info "Signing APK..."
jarsigner -keystore "${KEYSTORE}" -storepass "${KEYSTORE_PASS}" -keypass "${KEYSTORE_PASS}" -sigalg MD5withRSA -digestalg SHA1 -sigfile CERT -signedjar "${PATCH_FOLDER}/dist/${NAME}-patched-signed.apk" "${PATCH_FOLDER}/dist/${NAME}.apk" "${KEYSTORE_ALIAS}" || error "There was an error signing the APK." 107

info "Zipaligning APK..."
zipalign -f 4 "${PATCH_FOLDER}/dist/${NAME}-patched-signed.apk" "${OUTPUT_FILENAME}.apk" || error "There was an error zipaligning the APK." 108

# Final cleanup
cleanup

print_apk_info "${OUTPUT_FILENAME}.apk"

echo -e "\e[32mDone!\e[0m"