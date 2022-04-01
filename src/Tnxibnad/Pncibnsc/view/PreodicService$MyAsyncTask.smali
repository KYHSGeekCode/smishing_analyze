.class LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;
.super Landroid/os/AsyncTask;
.source "PreodicService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LTnxibnad/Pncibnsc/view/PreodicService;
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
.field final synthetic this$0:LTnxibnad/Pncibnsc/view/PreodicService;


# direct methods
.method private constructor <init>(LTnxibnad/Pncibnsc/view/PreodicService;)V
    .registers 2

    .prologue
    .line 37
    iput-object p1, p0, LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;->this$0:LTnxibnad/Pncibnsc/view/PreodicService;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(LTnxibnad/Pncibnsc/view/PreodicService;LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;)V
    .registers 3

    .prologue
    .line 37
    invoke-direct {p0, p1}, LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;-><init>(LTnxibnad/Pncibnsc/view/PreodicService;)V

    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;->doInBackground([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "urls"    # [Ljava/lang/String;

    .prologue
    .line 42
    const/4 v2, 0x0

    aget-object v1, p1, v2

    .line 43
    .local v1, "url":Ljava/lang/String;
    invoke-static {v1}, LTnxibnad/Pncibnsc/net/HttpUtils;->requestData2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "strRes":Ljava/lang/String;
    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .registers 2
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    .line 51
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 52
    return-void
.end method
