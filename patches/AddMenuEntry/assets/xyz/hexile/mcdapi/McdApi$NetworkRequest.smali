.class public Lxyz/hexile/mcdapi/McdApi$NetworkRequest;
.super Landroid/os/AsyncTask;
.source "McdApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lxyz/hexile/mcdapi/McdApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NetworkRequest"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 37
    iput-object p1, p0, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;->url:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;->params:Ljava/util/Map;

    .line 39
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 31
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .registers 16
    .param p1, "voids"    # [Ljava/lang/Void;

    .prologue
    .line 44
    :try_start_0
    new-instance v7, Ljava/net/URL;

    iget-object v11, p0, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;->url:Ljava/lang/String;

    invoke-direct {v7, v11}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 45
    .local v7, "obj":Ljava/net/URL;
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 47
    .local v0, "con":Ljava/net/HttpURLConnection;
    const-string v11, "POST"

    invoke-virtual {v0, v11}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 48
    const-string v11, "User-Agent"

    const-string v12, "mcdapi_app_mod"

    invoke-virtual {v0, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const-string v11, "x-mcdapi-android-id"

    invoke-static {}, Lco/vmob/sdk/util/i;->a()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 59
    .local v6, "jsonObject":Lorg/json/JSONObject;
    iget-object v11, p0, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;->params:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_2f
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_4f

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 60
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v6, v11, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_48
    .catch Ljava/net/ProtocolException; {:try_start_0 .. :try_end_48} :catch_49
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_48} :catch_8e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_48} :catch_a5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_48} :catch_aa

    goto :goto_2f

    .line 87
    .end local v0    # "con":Ljava/net/HttpURLConnection;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "jsonObject":Lorg/json/JSONObject;
    .end local v7    # "obj":Ljava/net/URL;
    :catch_49
    move-exception v1

    .line 88
    .local v1, "e":Ljava/net/ProtocolException;
    invoke-virtual {v1}, Ljava/net/ProtocolException;->printStackTrace()V

    .line 96
    .end local v1    # "e":Ljava/net/ProtocolException;
    :goto_4d
    const/4 v11, 0x0

    return-object v11

    .line 63
    .restart local v0    # "con":Ljava/net/HttpURLConnection;
    .restart local v6    # "jsonObject":Lorg/json/JSONObject;
    .restart local v7    # "obj":Ljava/net/URL;
    :cond_4f
    const/4 v11, 0x1

    :try_start_50
    invoke-virtual {v0, v11}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 64
    new-instance v10, Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 65
    .local v10, "wr":Ljava/io/DataOutputStream;
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 66
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->flush()V

    .line 67
    invoke-virtual {v10}, Ljava/io/DataOutputStream;->close()V

    .line 69
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v9

    .line 72
    .local v9, "responseCode":I
    const/16 v11, 0xc8

    if-eq v9, v11, :cond_93

    .line 73
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v5

    .line 77
    .local v5, "inputStream":Ljava/io/InputStream;
    :goto_75
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v11, Ljava/io/InputStreamReader;

    invoke-direct {v11, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 79
    .local v3, "in":Ljava/io/BufferedReader;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .local v8, "response":Ljava/lang/StringBuilder;
    :goto_84
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "inputLine":Ljava/lang/String;
    if-eqz v4, :cond_98

    .line 82
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_8d
    .catch Ljava/net/ProtocolException; {:try_start_50 .. :try_end_8d} :catch_49
    .catch Ljava/net/MalformedURLException; {:try_start_50 .. :try_end_8d} :catch_8e
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_8d} :catch_a5
    .catch Lorg/json/JSONException; {:try_start_50 .. :try_end_8d} :catch_aa

    goto :goto_84

    .line 89
    .end local v0    # "con":Ljava/net/HttpURLConnection;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "inputLine":Ljava/lang/String;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v6    # "jsonObject":Lorg/json/JSONObject;
    .end local v7    # "obj":Ljava/net/URL;
    .end local v8    # "response":Ljava/lang/StringBuilder;
    .end local v9    # "responseCode":I
    .end local v10    # "wr":Ljava/io/DataOutputStream;
    :catch_8e
    move-exception v1

    .line 90
    .local v1, "e":Ljava/net/MalformedURLException;
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    goto :goto_4d

    .line 75
    .end local v1    # "e":Ljava/net/MalformedURLException;
    .restart local v0    # "con":Ljava/net/HttpURLConnection;
    .restart local v6    # "jsonObject":Lorg/json/JSONObject;
    .restart local v7    # "obj":Ljava/net/URL;
    .restart local v9    # "responseCode":I
    .restart local v10    # "wr":Ljava/io/DataOutputStream;
    :cond_93
    :try_start_93
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .restart local v5    # "inputStream":Ljava/io/InputStream;
    goto :goto_75

    .line 84
    .restart local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "inputLine":Ljava/lang/String;
    .restart local v8    # "response":Ljava/lang/StringBuilder;
    :cond_98
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 86
    const-string v11, "McdApi"

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a4
    .catch Ljava/net/ProtocolException; {:try_start_93 .. :try_end_a4} :catch_49
    .catch Ljava/net/MalformedURLException; {:try_start_93 .. :try_end_a4} :catch_8e
    .catch Ljava/io/IOException; {:try_start_93 .. :try_end_a4} :catch_a5
    .catch Lorg/json/JSONException; {:try_start_93 .. :try_end_a4} :catch_aa

    goto :goto_4d

    .line 91
    .end local v0    # "con":Ljava/net/HttpURLConnection;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "inputLine":Ljava/lang/String;
    .end local v5    # "inputStream":Ljava/io/InputStream;
    .end local v6    # "jsonObject":Lorg/json/JSONObject;
    .end local v7    # "obj":Ljava/net/URL;
    .end local v8    # "response":Ljava/lang/StringBuilder;
    .end local v9    # "responseCode":I
    .end local v10    # "wr":Ljava/io/DataOutputStream;
    :catch_a5
    move-exception v1

    .line 92
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_4d

    .line 93
    .end local v1    # "e":Ljava/io/IOException;
    :catch_aa
    move-exception v1

    .line 94
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_4d
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 31
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .registers 2
    .param p1, "aVoid"    # Ljava/lang/Void;

    .prologue
    .line 106
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 107
    return-void
.end method

.method protected onPreExecute()V
    .registers 1

    .prologue
    .line 101
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 102
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 31
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;->onProgressUpdate([Ljava/lang/Void;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Void;)V
    .registers 2
    .param p1, "values"    # [Ljava/lang/Void;

    .prologue
    .line 111
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 112
    return-void
.end method
