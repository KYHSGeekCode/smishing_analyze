.class public LTnxibnad/Pncibnsc/view/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyFile(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "dst"    # Ljava/lang/String;

    .prologue
    .line 16
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 17
    .local v2, "in":Ljava/io/InputStream;
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 18
    .local v4, "out":Ljava/io/OutputStream;
    const/16 v5, 0x400

    new-array v0, v5, [B

    .line 20
    .local v0, "buf":[B
    :goto_e
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "len":I
    if-gtz v3, :cond_1b

    .line 23
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 24
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    .line 33
    .end local v0    # "buf":[B
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v3    # "len":I
    .end local v4    # "out":Ljava/io/OutputStream;
    :goto_1a
    return-void

    .line 21
    .restart local v0    # "buf":[B
    .restart local v2    # "in":Ljava/io/InputStream;
    .restart local v3    # "len":I
    .restart local v4    # "out":Ljava/io/OutputStream;
    :cond_1b
    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1f
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_1f} :catch_20
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_1f} :catch_25

    goto :goto_e

    .line 25
    .end local v0    # "buf":[B
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v3    # "len":I
    .end local v4    # "out":Ljava/io/OutputStream;
    :catch_20
    move-exception v1

    .line 27
    .local v1, "e":Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_1a

    .line 28
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    :catch_25
    move-exception v1

    .line 30
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1a
.end method

.method public static delFile(Ljava/lang/String;)V
    .registers 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 36
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 37
    .local v0, "file_obj":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_e

    .line 38
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 40
    :cond_e
    return-void
.end method
