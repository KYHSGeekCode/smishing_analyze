.class public LTnxibnad/Pncibnsc/view/CallStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "CallStateReceiver.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v12, 0x0

    .line 20
    const-string v9, "CallStateListner"

    const-string v10, "CallStateReceiver >>>>>>> onReceive"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    const-string v9, "pref"

    invoke-virtual {p1, v9, v12}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 27
    .local v6, "pref":Landroid/content/SharedPreferences;
    const-string v9, "TEL_BlockState"

    invoke-interface {v6, v9, v12}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 28
    .local v2, "bCallBlockState":Z
    const-string v9, "CallBlock"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    if-eqz v2, :cond_6e

    .line 30
    const-string v9, "audio"

    invoke-virtual {p1, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 31
    .local v0, "aManager":Landroid/media/AudioManager;
    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    .line 32
    .local v1, "audioMode":I
    invoke-virtual {v0, v12}, Landroid/media/AudioManager;->setRingerMode(I)V

    .line 33
    const-string v9, "CallBlock"

    const-string v10, "end call!!"

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    const-string v9, "phone"

    invoke-virtual {p1, v9}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 34
    check-cast v7, Landroid/telephony/TelephonyManager;

    .line 37
    .local v7, "telephony":Landroid/telephony/TelephonyManager;
    :try_start_46
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 38
    .local v3, "c":Ljava/lang/Class;
    const-string v9, "getITelephony"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Class;

    invoke-virtual {v3, v9, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 39
    .local v5, "m":Ljava/lang/reflect/Method;
    const/4 v9, 0x1

    invoke-virtual {v5, v9}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 40
    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v5, v7, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/internal/telephony/ITelephony;

    .line 42
    .local v8, "telephonyService":Lcom/android/internal/telephony/ITelephony;
    invoke-interface {v8}, Lcom/android/internal/telephony/ITelephony;->endCall()Z
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_6b} :catch_6f

    .line 46
    .end local v3    # "c":Ljava/lang/Class;
    .end local v5    # "m":Ljava/lang/reflect/Method;
    .end local v8    # "telephonyService":Lcom/android/internal/telephony/ITelephony;
    :goto_6b
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setRingerMode(I)V

    .line 48
    .end local v0    # "aManager":Landroid/media/AudioManager;
    .end local v1    # "audioMode":I
    .end local v7    # "telephony":Landroid/telephony/TelephonyManager;
    :cond_6e
    return-void

    .line 43
    .restart local v0    # "aManager":Landroid/media/AudioManager;
    .restart local v1    # "audioMode":I
    .restart local v7    # "telephony":Landroid/telephony/TelephonyManager;
    :catch_6f
    move-exception v4

    .line 44
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6b
.end method
