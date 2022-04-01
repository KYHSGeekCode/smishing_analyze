.class public LTnxibnad/Pncibnsc/view/CallStateListner;
.super Landroid/telephony/PhoneStateListener;
.source "CallStateListner.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "CallStateListner"

.field private static previousState:I


# instance fields
.field private mContext:Landroid/content/Context;

.field private telephonyService:Lcom/android/internal/telephony/ITelephony;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput v0, LTnxibnad/Pncibnsc/view/CallStateListner;->previousState:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 20
    iput-object p1, p0, LTnxibnad/Pncibnsc/view/CallStateListner;->mContext:Landroid/content/Context;

    .line 21
    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .registers 13
    .param p1, "state"    # I
    .param p2, "incomingNumber"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 23
    packed-switch p1, :pswitch_data_90

    .line 59
    :cond_5
    :goto_5
    return-void

    .line 26
    :pswitch_6
    const-string v6, "CallStateListner"

    const-string v7, "IDLE"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 30
    :pswitch_e
    const-string v6, "CallStateListner"

    const-string v7, "OFFHOOK"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_5

    .line 34
    :pswitch_16
    iget-object v6, p0, LTnxibnad/Pncibnsc/view/CallStateListner;->mContext:Landroid/content/Context;

    const-string v7, "pref"

    invoke-virtual {v6, v7, v8}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 35
    .local v4, "pref":Landroid/content/SharedPreferences;
    const-string v6, "TEL_BlockState"

    invoke-interface {v4, v6, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 36
    .local v0, "bCallBlockState":Z
    const-string v6, "CallBlock"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    if-eqz v0, :cond_5

    .line 38
    const-string v6, "CallStateListner"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "RINGING >> Incoming number : "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    const-string v6, "CallStateListner"

    const-string v7, "end call!!"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    iget-object v6, p0, LTnxibnad/Pncibnsc/view/CallStateListner;->mContext:Landroid/content/Context;

    const-string v7, "phone"

    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 42
    check-cast v5, Landroid/telephony/TelephonyManager;

    .line 45
    .local v5, "telephony":Landroid/telephony/TelephonyManager;
    :try_start_5d
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 46
    .local v1, "c":Ljava/lang/Class;
    const-string v6, "getITelephony"

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Class;

    invoke-virtual {v1, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 47
    .local v3, "m":Ljava/lang/reflect/Method;
    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 48
    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {v3, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/internal/telephony/ITelephony;

    iput-object v6, p0, LTnxibnad/Pncibnsc/view/CallStateListner;->telephonyService:Lcom/android/internal/telephony/ITelephony;

    .line 50
    iget-object v6, p0, LTnxibnad/Pncibnsc/view/CallStateListner;->telephonyService:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v6}, Lcom/android/internal/telephony/ITelephony;->endCall()Z
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_86} :catch_8a

    .line 55
    .end local v1    # "c":Ljava/lang/Class;
    .end local v3    # "m":Ljava/lang/reflect/Method;
    :goto_86
    sput v9, LTnxibnad/Pncibnsc/view/CallStateListner;->previousState:I

    goto/16 :goto_5

    .line 51
    :catch_8a
    move-exception v2

    .line 52
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_86

    .line 23
    nop

    :pswitch_data_90
    .packed-switch 0x0
        :pswitch_6
        :pswitch_16
        :pswitch_e
    .end packed-switch
.end method
