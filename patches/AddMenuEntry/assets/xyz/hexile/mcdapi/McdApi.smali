.class public Lxyz/hexile/mcdapi/McdApi;
.super Ljava/lang/Object;
.source "McdApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lxyz/hexile/mcdapi/McdApi$NetworkRequest;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "McdApi"

.field private static final USER_AGENT:Ljava/lang/String; = "mcdapi_app_mod"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static sendPostRequest(Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .param p0, "url"    # Ljava/lang/String;
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
    .line 28
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;

    invoke-direct {v0, p0, p1}, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lxyz/hexile/mcdapi/McdApi$NetworkRequest;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 29
    return-void
.end method
