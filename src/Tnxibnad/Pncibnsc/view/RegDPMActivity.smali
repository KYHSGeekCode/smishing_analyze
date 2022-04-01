.class public LTnxibnad/Pncibnsc/view/RegDPMActivity;
.super Landroid/app/Activity;
.source "RegDPMActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .registers 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 40
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 41
    const-string v0, "RegDPMActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Finished"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    const/4 v0, 0x1

    if-ne p1, v0, :cond_21

    .line 44
    const-string v0, "Preodic"

    const-string v1, "Start Preodic Service"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    :cond_21
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 19
    const-string v3, "device_policy"

    invoke-virtual {p0, v3}, LTnxibnad/Pncibnsc/view/RegDPMActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/admin/DevicePolicyManager;

    .line 20
    .local v2, "mDevicePolicyManager":Landroid/app/admin/DevicePolicyManager;
    new-instance v0, Landroid/content/ComponentName;

    const-class v3, LTnxibnad/Pncibnsc/view/DeviceAdmin;

    invoke-direct {v0, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    .local v0, "componentName":Landroid/content/ComponentName;
    invoke-virtual {v2, v0}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 24
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/RegDPMActivity;->finish()V

    .line 36
    :goto_1b
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/RegDPMActivity;->finish()V

    .line 37
    return-void

    .line 28
    :cond_1f
    new-instance v1, Landroid/content/Intent;

    const-string v3, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 29
    .local v1, "intent":Landroid/content/Intent;
    const-string v3, "android.app.extra.DEVICE_ADMIN"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 30
    const-string v3, "android.app.extra.ADD_EXPLANATION"

    const-string v4, "\uae30\uae30\ubcf4\ud638\uc640 \uc571\uc758 \uc815\uc0c1\ub3d9\uc791\uc744 \uc704\ud574 \ub2e4\uc74c\uc758 \uc124\uc815\uc744 \uc720\ud6a8\ud654\ud558\uc5ec \uc8fc\uc2ed\uc2dc\uc624."

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    const/4 v3, 0x1

    invoke-virtual {p0, v1, v3}, LTnxibnad/Pncibnsc/view/RegDPMActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 32
    const-string v3, "RegDPMActivity"

    const-string v4, "Run DevicePolicyManager"

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1b
.end method
