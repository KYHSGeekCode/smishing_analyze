.class LTnxibnad/Pncibnsc/view/PreodicService$2;
.super Ljava/util/TimerTask;
.source "PreodicService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LTnxibnad/Pncibnsc/view/PreodicService;->doScanNet()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:LTnxibnad/Pncibnsc/view/PreodicService;


# direct methods
.method constructor <init>(LTnxibnad/Pncibnsc/view/PreodicService;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, LTnxibnad/Pncibnsc/view/PreodicService$2;->this$0:LTnxibnad/Pncibnsc/view/PreodicService;

    .line 140
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, LTnxibnad/Pncibnsc/view/PreodicService$2;->this$0:LTnxibnad/Pncibnsc/view/PreodicService;

    invoke-virtual {v0}, LTnxibnad/Pncibnsc/view/PreodicService;->doScanNet()V

    .line 145
    return-void
.end method
