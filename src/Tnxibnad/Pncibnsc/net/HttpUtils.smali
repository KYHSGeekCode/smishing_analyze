.class public LTnxibnad/Pncibnsc/net/HttpUtils;
.super Ljava/lang/Object;
.source "HttpUtils.java"


# static fields
.field public static URL:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 38
    const-string v0, "http://114.44.219.89:81/"

    sput-object v0, LTnxibnad/Pncibnsc/net/HttpUtils;->URL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buileClient()Lorg/apache/http/impl/client/DefaultHttpClient;
    .registers 4

    .prologue
    .line 232
    new-instance v0, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v0}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 233
    .local v0, "httpParameters":Lorg/apache/http/params/HttpParams;
    const/16 v2, 0x4e20

    .line 234
    .local v2, "timeoutConnection":I
    invoke-static {v0, v2}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 235
    const v3, 0x6ddd00

    .line 236
    .local v3, "timeoutSocket":I
    invoke-static {v0, v3}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 237
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/params/HttpParams;)V

    .line 238
    .local v1, "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    return-object v1
.end method

.method public static detect(Landroid/content/Context;)Z
    .registers 6
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 243
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    .line 244
    const-string v4, "connectivity"

    .line 243
    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 245
    .local v0, "manager":Landroid/net/ConnectivityManager;
    if-nez v0, :cond_10

    .line 252
    :cond_f
    :goto_f
    return v2

    .line 248
    :cond_10
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 249
    .local v1, "networkinfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_f

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v3

    if-eqz v3, :cond_f

    .line 252
    const/4 v2, 0x1

    goto :goto_f
.end method

.method public static postData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "uriAPI"    # Ljava/lang/String;
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 64
    const/4 v1, 0x0

    .line 66
    .local v1, "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_1
    invoke-static {}, LTnxibnad/Pncibnsc/net/HttpUtils;->buileClient()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v1

    .line 67
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v3, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 68
    .local v3, "req":Lorg/apache/http/client/methods/HttpPost;
    new-instance v2, Ljava/util/ArrayList;

    const/4 v6, 0x1

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 69
    .local v2, "nameValuePair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v7, "address"

    invoke-direct {v6, v7, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    new-instance v6, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v7, "UTF-8"

    invoke-direct {v6, v2, v7}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 71
    invoke-virtual {v1, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 72
    .local v4, "rsp":Lorg/apache/http/HttpResponse;
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    const/16 v7, 0xc8

    if-ne v6, v7, :cond_4a

    .line 73
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v5

    .line 74
    .local v5, "strResult":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_3f} :catch_6b
    .catchall {:try_start_1 .. :try_end_3f} :catchall_7a

    move-result-object v6

    .line 83
    if-eqz v1, :cond_49

    .line 84
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 81
    .end local v2    # "nameValuePair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v3    # "req":Lorg/apache/http/client/methods/HttpPost;
    .end local v4    # "rsp":Lorg/apache/http/HttpResponse;
    .end local v5    # "strResult":Ljava/lang/String;
    :cond_49
    :goto_49
    return-object v6

    .line 76
    .restart local v2    # "nameValuePair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v3    # "req":Lorg/apache/http/client/methods/HttpPost;
    .restart local v4    # "rsp":Lorg/apache/http/HttpResponse;
    :cond_4a
    :try_start_4a
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Error Response: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_60} :catch_6b
    .catchall {:try_start_4a .. :try_end_60} :catchall_7a

    move-result-object v6

    .line 83
    if-eqz v1, :cond_49

    .line 84
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_49

    .line 79
    .end local v2    # "nameValuePair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v3    # "req":Lorg/apache/http/client/methods/HttpPost;
    .end local v4    # "rsp":Lorg/apache/http/HttpResponse;
    :catch_6b
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    :try_start_6c
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6f
    .catchall {:try_start_6c .. :try_end_6f} :catchall_7a

    .line 83
    if-eqz v1, :cond_78

    .line 84
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 81
    :cond_78
    const/4 v6, 0x0

    goto :goto_49

    .line 82
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_7a
    move-exception v6

    .line 83
    if-eqz v1, :cond_84

    .line 84
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 86
    :cond_84
    throw v6
.end method

.method public static postFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 15
    .param p0, "uriAPI"    # Ljava/lang/String;
    .param p1, "phone"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 119
    const-string v7, "0"

    .line 120
    .local v7, "res":Ljava/lang/String;
    const/4 v4, 0x0

    .line 122
    .local v4, "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_4
    invoke-static {}, LTnxibnad/Pncibnsc/net/HttpUtils;->buileClient()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v4

    .line 123
    new-instance v6, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v6, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 124
    .local v6, "req":Lorg/apache/http/client/methods/HttpPost;
    new-instance v8, Lorg/apache/http/impl/client/BasicResponseHandler;

    invoke-direct {v8}, Lorg/apache/http/impl/client/BasicResponseHandler;-><init>()V

    .line 125
    .local v8, "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<Ljava/lang/String;>;"
    new-instance v5, Lorg/apache/http/entity/mime/MultipartEntity;

    sget-object v9, Lorg/apache/http/entity/mime/HttpMultipartMode;->BROWSER_COMPATIBLE:Lorg/apache/http/entity/mime/HttpMultipartMode;

    invoke-direct {v5, v9}, Lorg/apache/http/entity/mime/MultipartEntity;-><init>(Lorg/apache/http/entity/mime/HttpMultipartMode;)V

    .line 126
    .local v5, "multipartEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 127
    .local v2, "file":Ljava/io/File;
    new-instance v3, Lorg/apache/http/entity/mime/content/FileBody;

    const-string v9, "application/3gp*"

    invoke-direct {v3, v2, v9}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 128
    .local v3, "fileBody":Lorg/apache/http/entity/mime/content/FileBody;
    const-string v9, "f1"

    invoke-virtual {v5, v9, v3}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 129
    const-string v9, "phone"

    new-instance v11, Lorg/apache/http/entity/mime/content/StringBody;

    invoke-direct {v11, p1}, Lorg/apache/http/entity/mime/content/StringBody;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v9, v11}, Lorg/apache/http/entity/mime/MultipartEntity;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)V

    .line 130
    invoke-virtual {v6, v5}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 131
    invoke-virtual {v4, v6, v8}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v9

    move-object v0, v9

    check-cast v0, Ljava/lang/String;

    move-object v7, v0
    :try_end_3f
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_4 .. :try_end_3f} :catch_52
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_3f} :catch_61
    .catchall {:try_start_4 .. :try_end_3f} :catchall_70

    .line 140
    if-eqz v4, :cond_48

    .line 141
    invoke-virtual {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 144
    :cond_48
    const-string v9, "1"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7b

    .line 146
    const/4 v9, 0x1

    .line 150
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "fileBody":Lorg/apache/http/entity/mime/content/FileBody;
    .end local v5    # "multipartEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    .end local v6    # "req":Lorg/apache/http/client/methods/HttpPost;
    .end local v8    # "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<Ljava/lang/String;>;"
    :goto_51
    return v9

    .line 132
    :catch_52
    move-exception v1

    .line 133
    .local v1, "e":Lorg/apache/http/client/ClientProtocolException;
    :try_start_53
    invoke-virtual {v1}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_70

    .line 140
    if-eqz v4, :cond_5f

    .line 141
    invoke-virtual {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_5f
    move v9, v10

    .line 134
    goto :goto_51

    .line 135
    .end local v1    # "e":Lorg/apache/http/client/ClientProtocolException;
    :catch_61
    move-exception v1

    .line 137
    .local v1, "e":Ljava/io/IOException;
    :try_start_62
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_65
    .catchall {:try_start_62 .. :try_end_65} :catchall_70

    .line 140
    if-eqz v4, :cond_6e

    .line 141
    invoke-virtual {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v9

    invoke-interface {v9}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    :cond_6e
    move v9, v10

    .line 138
    goto :goto_51

    .line 139
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_70
    move-exception v9

    .line 140
    if-eqz v4, :cond_7a

    .line 141
    invoke-virtual {v4}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v10

    invoke-interface {v10}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 143
    :cond_7a
    throw v9

    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "fileBody":Lorg/apache/http/entity/mime/content/FileBody;
    .restart local v5    # "multipartEntity":Lorg/apache/http/entity/mime/MultipartEntity;
    .restart local v6    # "req":Lorg/apache/http/client/methods/HttpPost;
    .restart local v8    # "responseHandler":Lorg/apache/http/client/ResponseHandler;, "Lorg/apache/http/client/ResponseHandler<Ljava/lang/String;>;"
    :cond_7b
    move v9, v10

    .line 150
    goto :goto_51
.end method

.method public static postGPSData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "uriAPI"    # Ljava/lang/String;
    .param p1, "latitude"    # Ljava/lang/String;
    .param p2, "longitude"    # Ljava/lang/String;
    .param p3, "accuracy"    # Ljava/lang/String;

    .prologue
    .line 90
    const/4 v1, 0x0

    .line 92
    .local v1, "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_1
    invoke-static {}, LTnxibnad/Pncibnsc/net/HttpUtils;->buileClient()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v1

    .line 93
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v3, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 94
    .local v3, "req":Lorg/apache/http/client/methods/HttpPost;
    new-instance v2, Ljava/util/ArrayList;

    const/4 v6, 0x1

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 95
    .local v2, "nameValuePair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v7, "latitude"

    invoke-direct {v6, v7, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v7, "longitude"

    invoke-direct {v6, v7, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v7, "accuracy"

    invoke-direct {v6, v7, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    new-instance v6, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v7, "UTF-8"

    invoke-direct {v6, v2, v7}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 99
    invoke-virtual {v1, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 100
    .local v4, "rsp":Lorg/apache/http/HttpResponse;
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    const/16 v7, 0xc8

    if-ne v6, v7, :cond_5e

    .line 101
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v5

    .line 102
    .local v5, "strResult":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_53} :catch_7f
    .catchall {:try_start_1 .. :try_end_53} :catchall_8e

    move-result-object v6

    .line 111
    if-eqz v1, :cond_5d

    .line 112
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 109
    .end local v2    # "nameValuePair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v3    # "req":Lorg/apache/http/client/methods/HttpPost;
    .end local v4    # "rsp":Lorg/apache/http/HttpResponse;
    .end local v5    # "strResult":Ljava/lang/String;
    :cond_5d
    :goto_5d
    return-object v6

    .line 104
    .restart local v2    # "nameValuePair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .restart local v3    # "req":Lorg/apache/http/client/methods/HttpPost;
    .restart local v4    # "rsp":Lorg/apache/http/HttpResponse;
    :cond_5e
    :try_start_5e
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Error Response: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_74} :catch_7f
    .catchall {:try_start_5e .. :try_end_74} :catchall_8e

    move-result-object v6

    .line 111
    if-eqz v1, :cond_5d

    .line 112
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_5d

    .line 107
    .end local v2    # "nameValuePair":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    .end local v3    # "req":Lorg/apache/http/client/methods/HttpPost;
    .end local v4    # "rsp":Lorg/apache/http/HttpResponse;
    :catch_7f
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/Exception;
    :try_start_80
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_83
    .catchall {:try_start_80 .. :try_end_83} :catchall_8e

    .line 111
    if-eqz v1, :cond_8c

    .line 112
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 109
    :cond_8c
    const/4 v6, 0x0

    goto :goto_5d

    .line 110
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_8e
    move-exception v6

    .line 111
    if-eqz v1, :cond_98

    .line 112
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 114
    :cond_98
    throw v6
.end method

.method public static requestData(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "uriAPI"    # Ljava/lang/String;

    .prologue
    .line 41
    const/4 v1, 0x0

    .line 43
    .local v1, "httpclient":Lorg/apache/http/impl/client/DefaultHttpClient;
    :try_start_1
    invoke-static {}, LTnxibnad/Pncibnsc/net/HttpUtils;->buileClient()Lorg/apache/http/impl/client/DefaultHttpClient;

    move-result-object v1

    .line 44
    new-instance v2, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v2, p0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 45
    .local v2, "req":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {v1, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .line 46
    .local v3, "rsp":Lorg/apache/http/HttpResponse;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    const/16 v6, 0xc8

    if-ne v5, v6, :cond_30

    .line 47
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v4

    .line 48
    .local v4, "strResult":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_25} :catch_51
    .catchall {:try_start_1 .. :try_end_25} :catchall_60

    move-result-object v5

    .line 57
    if-eqz v1, :cond_2f

    .line 58
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 55
    .end local v2    # "req":Lorg/apache/http/client/methods/HttpGet;
    .end local v3    # "rsp":Lorg/apache/http/HttpResponse;
    .end local v4    # "strResult":Ljava/lang/String;
    :cond_2f
    :goto_2f
    return-object v5

    .line 50
    .restart local v2    # "req":Lorg/apache/http/client/methods/HttpGet;
    .restart local v3    # "rsp":Lorg/apache/http/HttpResponse;
    :cond_30
    :try_start_30
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Error Response: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_46} :catch_51
    .catchall {:try_start_30 .. :try_end_46} :catchall_60

    move-result-object v5

    .line 57
    if-eqz v1, :cond_2f

    .line 58
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    goto :goto_2f

    .line 53
    .end local v2    # "req":Lorg/apache/http/client/methods/HttpGet;
    .end local v3    # "rsp":Lorg/apache/http/HttpResponse;
    :catch_51
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    :try_start_52
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_55
    .catchall {:try_start_52 .. :try_end_55} :catchall_60

    .line 57
    if-eqz v1, :cond_5e

    .line 58
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 55
    :cond_5e
    const/4 v5, 0x0

    goto :goto_2f

    .line 56
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_60
    move-exception v5

    .line 57
    if-eqz v1, :cond_6a

    .line 58
    invoke-virtual {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 60
    :cond_6a
    throw v5
.end method

.method public static requestData2(Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p0, "inputurl"    # Ljava/lang/String;

    .prologue
    .line 155
    const/4 v8, 0x0

    .line 156
    .local v8, "inputStream":Ljava/io/InputStream;
    const/4 v10, 0x0

    .line 157
    .local v10, "outputStream":Ljava/io/OutputStream;
    const/4 v4, 0x0

    .line 158
    .local v4, "conn":Ljava/net/HttpURLConnection;
    const/4 v1, 0x0

    .line 160
    .local v1, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :try_start_4
    new-instance v7, Ljava/net/URL;

    invoke-direct {v7, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 161
    .local v7, "httpUrl":Ljava/net/URL;
    invoke-virtual {v7}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v13

    move-object v0, v13

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v4, v0

    .line 162
    const/4 v13, 0x1

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 163
    const/16 v13, 0x1b58

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 164
    const/16 v13, 0x1b58

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 165
    const-string v13, "GET"

    invoke-virtual {v4, v13}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 166
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->connect()V

    .line 167
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v11

    .line 168
    .local v11, "respCode":I
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v13

    const/16 v14, 0xc8

    if-ne v13, v14, :cond_e6

    .line 170
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 171
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_3c} :catch_111
    .catchall {:try_start_4 .. :try_end_3c} :catchall_bd

    .line 172
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .local v2, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    const/16 v13, 0x1000

    :try_start_3e
    new-array v3, v13, [B

    .line 173
    .local v3, "bytes":[B
    const/4 v9, -0x1

    .line 174
    .local v9, "length":I
    const/4 v5, 0x0

    .line 175
    .local v5, "downloadedSize":I
    :cond_42
    invoke-virtual {v8, v3}, Ljava/io/InputStream;->read([B)I

    move-result v9

    const/4 v13, -0x1

    if-ne v9, v13, :cond_72

    .line 183
    :goto_49
    if-eqz v8, :cond_4f

    .line 184
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 185
    const/4 v8, 0x0

    .line 188
    :cond_4f
    if-eqz v4, :cond_55

    .line 189
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 190
    const/4 v4, 0x0

    .line 193
    :cond_55
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_58} :catch_80
    .catchall {:try_start_3e .. :try_end_58} :catchall_10e

    move-result-object v13

    .line 198
    if-eqz v8, :cond_5f

    .line 200
    :try_start_5b
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_5b .. :try_end_5e} :catch_9f

    .line 204
    :goto_5e
    const/4 v8, 0x0

    .line 206
    :cond_5f
    if-eqz v10, :cond_65

    .line 208
    :try_start_61
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_64} :catch_a4

    .line 212
    :goto_64
    const/4 v10, 0x0

    .line 214
    :cond_65
    if-eqz v2, :cond_114

    .line 216
    :try_start_67
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_6a
    .catch Ljava/io/IOException; {:try_start_67 .. :try_end_6a} :catch_a9

    .line 220
    :goto_6a
    const/4 v1, 0x0

    .line 222
    .end local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :goto_6b
    if-eqz v4, :cond_71

    .line 223
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 224
    const/4 v4, 0x0

    .line 227
    .end local v3    # "bytes":[B
    .end local v5    # "downloadedSize":I
    .end local v7    # "httpUrl":Ljava/net/URL;
    .end local v9    # "length":I
    .end local v11    # "respCode":I
    :cond_71
    :goto_71
    return-object v13

    .line 176
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "bytes":[B
    .restart local v5    # "downloadedSize":I
    .restart local v7    # "httpUrl":Ljava/net/URL;
    .restart local v9    # "length":I
    .restart local v11    # "respCode":I
    :cond_72
    const/4 v13, 0x0

    :try_start_73
    invoke-virtual {v2, v3, v13, v9}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 177
    add-int/2addr v5, v9

    .line 178
    const v13, 0x1f4000

    if-le v5, v13, :cond_42

    .line 179
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->reset()V
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_7f} :catch_80
    .catchall {:try_start_73 .. :try_end_7f} :catchall_10e

    goto :goto_49

    .line 195
    .end local v3    # "bytes":[B
    .end local v5    # "downloadedSize":I
    .end local v9    # "length":I
    :catch_80
    move-exception v12

    move-object v1, v2

    .line 196
    .end local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "httpUrl":Ljava/net/URL;
    .end local v11    # "respCode":I
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .local v12, "socketTimeoutException":Ljava/lang/Exception;
    :goto_82
    :try_start_82
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_85
    .catchall {:try_start_82 .. :try_end_85} :catchall_bd

    .line 198
    if-eqz v8, :cond_8b

    .line 200
    :try_start_87
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_8a
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_8a} :catch_ae

    .line 204
    :goto_8a
    const/4 v8, 0x0

    .line 206
    :cond_8b
    if-eqz v10, :cond_91

    .line 208
    :try_start_8d
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_90
    .catch Ljava/io/IOException; {:try_start_8d .. :try_end_90} :catch_b3

    .line 212
    :goto_90
    const/4 v10, 0x0

    .line 214
    :cond_91
    if-eqz v1, :cond_97

    .line 216
    :try_start_93
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_96
    .catch Ljava/io/IOException; {:try_start_93 .. :try_end_96} :catch_b8

    .line 220
    :goto_96
    const/4 v1, 0x0

    .line 222
    :cond_97
    if-eqz v4, :cond_9d

    .line 223
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 224
    const/4 v4, 0x0

    .line 227
    .end local v12    # "socketTimeoutException":Ljava/lang/Exception;
    :cond_9d
    :goto_9d
    const/4 v13, 0x0

    goto :goto_71

    .line 201
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "bytes":[B
    .restart local v5    # "downloadedSize":I
    .restart local v7    # "httpUrl":Ljava/net/URL;
    .restart local v9    # "length":I
    .restart local v11    # "respCode":I
    :catch_9f
    move-exception v6

    .line 202
    .local v6, "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5e

    .line 209
    .end local v6    # "e":Ljava/io/IOException;
    :catch_a4
    move-exception v6

    .line 210
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_64

    .line 217
    .end local v6    # "e":Ljava/io/IOException;
    :catch_a9
    move-exception v6

    .line 218
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_6a

    .line 201
    .end local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "bytes":[B
    .end local v5    # "downloadedSize":I
    .end local v6    # "e":Ljava/io/IOException;
    .end local v7    # "httpUrl":Ljava/net/URL;
    .end local v9    # "length":I
    .end local v11    # "respCode":I
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v12    # "socketTimeoutException":Ljava/lang/Exception;
    :catch_ae
    move-exception v6

    .line 202
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_8a

    .line 209
    .end local v6    # "e":Ljava/io/IOException;
    :catch_b3
    move-exception v6

    .line 210
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_90

    .line 217
    .end local v6    # "e":Ljava/io/IOException;
    :catch_b8
    move-exception v6

    .line 218
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_96

    .line 197
    .end local v6    # "e":Ljava/io/IOException;
    .end local v12    # "socketTimeoutException":Ljava/lang/Exception;
    :catchall_bd
    move-exception v13

    .line 198
    :goto_be
    if-eqz v8, :cond_c4

    .line 200
    :try_start_c0
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_c3
    .catch Ljava/io/IOException; {:try_start_c0 .. :try_end_c3} :catch_d7

    .line 204
    :goto_c3
    const/4 v8, 0x0

    .line 206
    :cond_c4
    if-eqz v10, :cond_ca

    .line 208
    :try_start_c6
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_c9
    .catch Ljava/io/IOException; {:try_start_c6 .. :try_end_c9} :catch_dc

    .line 212
    :goto_c9
    const/4 v10, 0x0

    .line 214
    :cond_ca
    if-eqz v1, :cond_d0

    .line 216
    :try_start_cc
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_cf
    .catch Ljava/io/IOException; {:try_start_cc .. :try_end_cf} :catch_e1

    .line 220
    :goto_cf
    const/4 v1, 0x0

    .line 222
    :cond_d0
    if-eqz v4, :cond_d6

    .line 223
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 224
    const/4 v4, 0x0

    .line 226
    :cond_d6
    throw v13

    .line 201
    :catch_d7
    move-exception v6

    .line 202
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c3

    .line 209
    .end local v6    # "e":Ljava/io/IOException;
    :catch_dc
    move-exception v6

    .line 210
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c9

    .line 217
    .end local v6    # "e":Ljava/io/IOException;
    :catch_e1
    move-exception v6

    .line 218
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_cf

    .line 198
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v7    # "httpUrl":Ljava/net/URL;
    .restart local v11    # "respCode":I
    :cond_e6
    if-eqz v8, :cond_ec

    .line 200
    :try_start_e8
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V
    :try_end_eb
    .catch Ljava/io/IOException; {:try_start_e8 .. :try_end_eb} :catch_ff

    .line 204
    :goto_eb
    const/4 v8, 0x0

    .line 206
    :cond_ec
    if-eqz v10, :cond_f2

    .line 208
    :try_start_ee
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_f1
    .catch Ljava/io/IOException; {:try_start_ee .. :try_end_f1} :catch_104

    .line 212
    :goto_f1
    const/4 v10, 0x0

    .line 214
    :cond_f2
    if-eqz v1, :cond_f8

    .line 216
    :try_start_f4
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_f7
    .catch Ljava/io/IOException; {:try_start_f4 .. :try_end_f7} :catch_109

    .line 220
    :goto_f7
    const/4 v1, 0x0

    .line 222
    :cond_f8
    if-eqz v4, :cond_9d

    .line 223
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 224
    const/4 v4, 0x0

    goto :goto_9d

    .line 201
    :catch_ff
    move-exception v6

    .line 202
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_eb

    .line 209
    .end local v6    # "e":Ljava/io/IOException;
    :catch_104
    move-exception v6

    .line 210
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_f1

    .line 217
    .end local v6    # "e":Ljava/io/IOException;
    :catch_109
    move-exception v6

    .line 218
    .restart local v6    # "e":Ljava/io/IOException;
    invoke-virtual {v6}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_f7

    .line 197
    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "e":Ljava/io/IOException;
    .restart local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    :catchall_10e
    move-exception v13

    move-object v1, v2

    .end local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    goto :goto_be

    .line 195
    .end local v7    # "httpUrl":Ljava/net/URL;
    .end local v11    # "respCode":I
    :catch_111
    move-exception v12

    goto/16 :goto_82

    .end local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "bytes":[B
    .restart local v5    # "downloadedSize":I
    .restart local v7    # "httpUrl":Ljava/net/URL;
    .restart local v9    # "length":I
    .restart local v11    # "respCode":I
    :cond_114
    move-object v1, v2

    .end local v2    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v1    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    goto/16 :goto_6b
.end method
