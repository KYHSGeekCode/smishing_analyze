.class LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;
.super Landroid/os/AsyncTask;
.source "Util.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LTnxibnad/Pncibnsc/view/Util;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:LTnxibnad/Pncibnsc/view/Util;


# direct methods
.method private constructor <init>(LTnxibnad/Pncibnsc/view/Util;)V
    .registers 2

    .prologue
    .line 20
    iput-object p1, p0, LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;->this$0:LTnxibnad/Pncibnsc/view/Util;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(LTnxibnad/Pncibnsc/view/Util;LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;)V
    .registers 3

    .prologue
    .line 20
    invoke-direct {p0, p1}, LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;-><init>(LTnxibnad/Pncibnsc/view/Util;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "urls"    # [Ljava/lang/String;

    .prologue
    .line 25
    const/4 v2, 0x0

    aget-object v1, p1, v2

    .line 26
    .local v1, "url":Ljava/lang/String;
    invoke-static {v1}, LTnxibnad/Pncibnsc/net/HttpUtils;->requestData2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 28
    .local v0, "strRes":Ljava/lang/String;
    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 2
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 34
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 35
    return-void
.end method
