.class public Lcom/perk/livetv/aphone/utils/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static final HOSTS_FILES:[Ljava/lang/String;

.field private static final HOSTS_FILE_PATTERNS:[Ljava/lang/String;

.field static appUtils:Lcom/perk/livetv/aphone/utils/ApplicationUtils; = null

.field public static editor:Landroid/content/SharedPreferences$Editor; = null

.field static m_nTwitterCurrentIndex:I = 0x0

.field private static final perk_random_string:Ljava/lang/String; = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

.field public static sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 141
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "/etc/hosts"

    aput-object v1, v0, v2

    .line 142
    const-string v1, "/system/etc/hosts"

    aput-object v1, v0, v3

    const-string v1, "/data/data/hosts"

    aput-object v1, v0, v4

    .line 141
    sput-object v0, Lcom/perk/livetv/aphone/utils/Utils;->HOSTS_FILES:[Ljava/lang/String;

    .line 147
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "liverail"

    aput-object v1, v0, v2

    const-string v1, "aerserv"

    aput-object v1, v0, v3

    const-string v1, "rhythm"

    aput-object v1, v0, v4

    sput-object v0, Lcom/perk/livetv/aphone/utils/Utils;->HOSTS_FILE_PATTERNS:[Ljava/lang/String;

    .line 335
    sput v2, Lcom/perk/livetv/aphone/utils/Utils;->m_nTwitterCurrentIndex:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CopyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 5
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 39
    const/16 v0, 0x400

    .line 41
    .local v0, "buffer_size":I
    const/16 v3, 0x400

    :try_start_0
    new-array v1, v3, [B

    .line 43
    .local v1, "bytes":[B
    :goto_0
    const/4 v3, 0x0

    const/16 v4, 0x400

    invoke-virtual {p0, v1, v3, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 44
    .local v2, "count":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_0

    .line 50
    .end local v1    # "bytes":[B
    .end local v2    # "count":I
    :goto_1
    return-void

    .line 46
    .restart local v1    # "bytes":[B
    .restart local v2    # "count":I
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p1, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 48
    .end local v1    # "bytes":[B
    .end local v2    # "count":I
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public static SHA1(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 117
    const-string v2, "SHA-1"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 118
    .local v0, "md":Ljava/security/MessageDigest;
    const/16 v2, 0x28

    new-array v1, v2, [B

    .line 119
    .local v1, "sha1hash":[B
    const-string v2, "iso-8859-1"

    invoke-virtual {p0, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v0, v2, v3, v4}, Ljava/security/MessageDigest;->update([BII)V

    .line 120
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 121
    invoke-static {v1}, Lcom/perk/livetv/aphone/utils/Utils;->convertToHex([B)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static convertToHex([B)Ljava/lang/String;
    .locals 6
    .param p0, "data"    # [B

    .prologue
    .line 99
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 100
    .local v0, "buf":Ljava/lang/StringBuffer;
    array-length v3, p0

    .line 101
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-lt v2, v3, :cond_0

    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 102
    :cond_0
    aget-byte v5, p0, v2

    ushr-int/lit8 v5, v5, 0x4

    and-int/lit8 v1, v5, 0xf

    .line 103
    .local v1, "halfbyte":I
    const/4 v4, 0x0

    .line 105
    .local v4, "two_halfs":I
    :cond_1
    if-ltz v1, :cond_2

    const/16 v5, 0x9

    if-gt v1, v5, :cond_2

    .line 106
    add-int/lit8 v5, v1, 0x30

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 109
    :goto_1
    aget-byte v5, p0, v2

    and-int/lit8 v1, v5, 0xf

    .line 110
    add-int/lit8 v4, v4, 0x1

    const/4 v5, 0x1

    .line 104
    if-lt v4, v5, :cond_1

    .line 101
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 108
    :cond_2
    add-int/lit8 v5, v1, -0xa

    add-int/lit8 v5, v5, 0x61

    int-to-char v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method public static deleteDir(Ljava/io/File;)Z
    .locals 5
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 273
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 274
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v0

    .line 275
    .local v0, "children":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-lt v1, v3, :cond_1

    .line 284
    .end local v0    # "children":[Ljava/lang/String;
    .end local v1    # "i":I
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v3

    :goto_1
    return v3

    .line 276
    .restart local v0    # "children":[Ljava/lang/String;
    .restart local v1    # "i":I
    :cond_1
    new-instance v3, Ljava/io/File;

    aget-object v4, v0, v1

    invoke-direct {v3, p0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v3}, Lcom/perk/livetv/aphone/utils/Utils;->deleteDir(Ljava/io/File;)Z

    move-result v2

    .line 277
    .local v2, "success":Z
    if-nez v2, :cond_2

    .line 278
    const/4 v3, 0x0

    goto :goto_1

    .line 275
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static detectAdBlockers()Z
    .locals 1

    .prologue
    .line 151
    invoke-static {}, Lcom/perk/livetv/aphone/utils/Utils;->detectInHostFile()Z

    move-result v0

    return v0
.end method

.method private static detectInHostFile()Z
    .locals 12

    .prologue
    const/4 v7, 0x0

    .line 156
    const/4 v2, 0x0

    .line 157
    .local v2, "hostsFile":Ljava/io/File;
    sget-object v9, Lcom/perk/livetv/aphone/utils/Utils;->HOSTS_FILES:[Ljava/lang/String;

    array-length v10, v9

    move v8, v7

    :goto_0
    if-lt v8, v10, :cond_3

    .line 163
    :cond_0
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 164
    const/4 v3, 0x0

    .line 166
    .local v3, "in":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/FileReader;

    invoke-direct {v8, v2}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 168
    .end local v3    # "in":Ljava/io/BufferedReader;
    .local v4, "in":Ljava/io/BufferedReader;
    :cond_1
    :try_start_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v5

    .local v5, "ln":Ljava/lang/String;
    if-nez v5, :cond_4

    .line 192
    if-eqz v4, :cond_2

    .line 193
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    .line 198
    .end local v4    # "in":Ljava/io/BufferedReader;
    .end local v5    # "ln":Ljava/lang/String;
    :cond_2
    :goto_1
    return v7

    .line 157
    :cond_3
    aget-object v1, v9, v8

    .line 158
    .local v1, "fileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    .end local v2    # "hostsFile":Ljava/io/File;
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 159
    .restart local v2    # "hostsFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v11

    if-nez v11, :cond_0

    .line 157
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 169
    .end local v1    # "fileName":Ljava/lang/String;
    .restart local v4    # "in":Ljava/io/BufferedReader;
    .restart local v5    # "ln":Ljava/lang/String;
    :cond_4
    :try_start_3
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_1

    const/4 v8, 0x0

    invoke-virtual {v5, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x23

    if-eq v8, v9, :cond_1

    .line 170
    sget-object v9, Lcom/perk/livetv/aphone/utils/Utils;->HOSTS_FILE_PATTERNS:[Ljava/lang/String;

    array-length v10, v9

    move v8, v7

    :goto_2
    if-ge v8, v10, :cond_1

    aget-object v6, v9, v8

    .line 172
    .local v6, "pattern":Ljava/lang/String;
    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 181
    const-string v8, "Ad Blocker Detected"

    invoke-static {v8}, Lcom/perk/livetv/aphone/utils/ApplicationUtils;->_AppEvents(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_5
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 192
    if-eqz v4, :cond_5

    .line 193
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 183
    :cond_5
    :goto_3
    const/4 v7, 0x1

    goto :goto_1

    .line 170
    :cond_6
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 188
    .end local v4    # "in":Ljava/io/BufferedReader;
    .end local v5    # "ln":Ljava/lang/String;
    .end local v6    # "pattern":Ljava/lang/String;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/Exception;
    :goto_4
    if-eqz v3, :cond_2

    .line 193
    :try_start_5
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 194
    :catch_1
    move-exception v8

    goto :goto_1

    .line 190
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v7

    .line 192
    :goto_5
    if-eqz v3, :cond_7

    .line 193
    :try_start_6
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 196
    :cond_7
    :goto_6
    throw v7

    .line 194
    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "in":Ljava/io/BufferedReader;
    .restart local v5    # "ln":Ljava/lang/String;
    .restart local v6    # "pattern":Ljava/lang/String;
    :catch_2
    move-exception v7

    goto :goto_3

    .end local v4    # "in":Ljava/io/BufferedReader;
    .end local v5    # "ln":Ljava/lang/String;
    .end local v6    # "pattern":Ljava/lang/String;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :catch_3
    move-exception v8

    goto :goto_6

    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "in":Ljava/io/BufferedReader;
    .restart local v5    # "ln":Ljava/lang/String;
    :catch_4
    move-exception v8

    goto :goto_1

    .line 190
    .end local v5    # "ln":Ljava/lang/String;
    :catchall_1
    move-exception v7

    move-object v3, v4

    .end local v4    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    goto :goto_5

    .line 188
    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "in":Ljava/io/BufferedReader;
    :catch_5
    move-exception v0

    move-object v3, v4

    .end local v4    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    goto :goto_4
.end method

.method public static findBinary(Ljava/lang/String;)Z
    .locals 8
    .param p0, "binaryName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 288
    const/4 v0, 0x0

    .line 289
    .local v0, "found":Z
    if-nez v0, :cond_0

    .line 290
    const/16 v4, 0x8

    new-array v1, v4, [Ljava/lang/String;

    const-string v4, "/sbin/"

    aput-object v4, v1, v3

    const/4 v4, 0x1

    const-string v5, "/system/bin/"

    aput-object v5, v1, v4

    const/4 v4, 0x2

    const-string v5, "/system/xbin/"

    aput-object v5, v1, v4

    const/4 v4, 0x3

    .line 291
    const-string v5, "/data/local/xbin/"

    aput-object v5, v1, v4

    const/4 v4, 0x4

    const-string v5, "/data/local/bin/"

    aput-object v5, v1, v4

    const/4 v4, 0x5

    .line 292
    const-string v5, "/system/sd/xbin/"

    aput-object v5, v1, v4

    const/4 v4, 0x6

    const-string v5, "/system/bin/failsafe/"

    aput-object v5, v1, v4

    const/4 v4, 0x7

    const-string v5, "/data/local/"

    aput-object v5, v1, v4

    .line 293
    .local v1, "places":[Ljava/lang/String;
    array-length v4, v1

    :goto_0
    if-lt v3, v4, :cond_1

    .line 300
    .end local v1    # "places":[Ljava/lang/String;
    :cond_0
    :goto_1
    return v0

    .line 293
    .restart local v1    # "places":[Ljava/lang/String;
    :cond_1
    aget-object v2, v1, v3

    .line 294
    .local v2, "where":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 295
    const/4 v0, 0x1

    .line 296
    goto :goto_1

    .line 293
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static generateRandomString(Landroid/content/Context;)Ljava/lang/String;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 126
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 128
    .local v0, "buffer":Ljava/lang/StringBuffer;
    const-string v3, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    .line 130
    .local v1, "charactersLength":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    const/16 v3, 0x14

    if-lt v2, v3, :cond_0

    .line 134
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 131
    :cond_0
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    int-to-double v8, v1

    mul-double v4, v6, v8

    .line 132
    .local v4, "index":D
    const-string v3, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"

    double-to-int v6, v4

    invoke-virtual {v3, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 130
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public static getDefaultEmail(Landroid/content/Context;)Ljava/lang/String;
    .locals 7
    .param p0, "con"    # Landroid/content/Context;

    .prologue
    .line 323
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 324
    .local v2, "am":Landroid/accounts/AccountManager;
    invoke-virtual {v2}, Landroid/accounts/AccountManager;->getAccounts()[Landroid/accounts/Account;

    move-result-object v1

    .line 325
    .local v1, "accounts":[Landroid/accounts/Account;
    array-length v4, v1

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v4, :cond_0

    .line 332
    const/4 v3, 0x0

    :goto_1
    return-object v3

    .line 325
    :cond_0
    aget-object v0, v1, v3

    .line 326
    .local v0, "ac":Landroid/accounts/Account;
    iget-object v5, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    const-string v6, "com.google"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 328
    iget-object v3, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    goto :goto_1

    .line 325
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static getMACAddress(Ljava/lang/String;)Ljava/lang/String;
    .locals 9
    .param p0, "interfaceName"    # Ljava/lang/String;

    .prologue
    .line 62
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v2

    .line 63
    .local v2, "interfaces":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_1

    .line 80
    .end local v2    # "interfaces":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :goto_0
    const-string v5, ""

    :goto_1
    return-object v5

    .line 63
    .restart local v2    # "interfaces":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    :cond_1
    :try_start_1
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/NetworkInterface;

    .line 64
    .local v3, "intf":Ljava/net/NetworkInterface;
    if-eqz p0, :cond_2

    .line 65
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 68
    :cond_2
    invoke-virtual {v3}, Ljava/net/NetworkInterface;->getHardwareAddress()[B
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 69
    .local v4, "mac":[B
    if-nez v4, :cond_3

    .line 70
    const-string v5, ""

    goto :goto_1

    .line 71
    :cond_3
    :try_start_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_2
    array-length v5, v4

    if-lt v1, v5, :cond_5

    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_4

    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 76
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/perk/livetv/aphone/utils/Utils;->SHA1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 73
    :cond_5
    const-string v5, "%02X:"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aget-byte v8, v4, v1

    invoke-static {v8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 72
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 78
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v1    # "idx":I
    .end local v2    # "interfaces":Ljava/util/List;, "Ljava/util/List<Ljava/net/NetworkInterface;>;"
    .end local v3    # "intf":Ljava/net/NetworkInterface;
    .end local v4    # "mac":[B
    :catch_0
    move-exception v5

    goto :goto_0
.end method

.method public static getTwitterText()Ljava/lang/String;
    .locals 3

    .prologue
    .line 339
    const-string v0, ""

    .line 340
    .local v0, "str":Ljava/lang/String;
    sget v1, Lcom/perk/livetv/aphone/utils/Utils;->m_nTwitterCurrentIndex:I

    const/4 v2, 0x5

    if-lt v1, v2, :cond_0

    .line 341
    const/4 v1, 0x0

    sput v1, Lcom/perk/livetv/aphone/utils/Utils;->m_nTwitterCurrentIndex:I

    .line 343
    :cond_0
    sget v1, Lcom/perk/livetv/aphone/utils/Utils;->m_nTwitterCurrentIndex:I

    packed-switch v1, :pswitch_data_0

    .line 364
    :goto_0
    sget v1, Lcom/perk/livetv/aphone/utils/Utils;->m_nTwitterCurrentIndex:I

    add-int/lit8 v1, v1, 0x1

    .line 365
    sput v1, Lcom/perk/livetv/aphone/utils/Utils;->m_nTwitterCurrentIndex:I

    .line 366
    return-object v0

    .line 345
    :pswitch_0
    const-string v0, "I\'m earning rewards for watching TV with @GetPerk! #{{ShowName}} #perktv"

    .line 346
    goto :goto_0

    .line 349
    :pswitch_1
    const-string v0, "I\'m using @GetPerk, the app that gives you real rewards for watching TV. You should too! #{{ShowName}} #perktv"

    .line 350
    goto :goto_0

    .line 353
    :pswitch_2
    const-string v0, "I\'m watching {{ShowNameFull}} and getting rewarded for it! #{{ShowName}} #perktv"

    .line 354
    goto :goto_0

    .line 357
    :pswitch_3
    const-string v0, "#perktv is rewarding me for watching #{{ShowName}} right now! Perk.com"

    .line 358
    goto :goto_0

    .line 361
    :pswitch_4
    const-string v0, "I love getting rewarded for watching {{ShowNameFull}} with #perktv!"

    goto :goto_0

    .line 343
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public static isEmailValid(Ljava/lang/String;)Z
    .locals 5
    .param p0, "email"    # Ljava/lang/String;

    .prologue
    .line 307
    const-string v3, "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"

    .line 310
    .local v3, "regExpn":Ljava/lang/String;
    move-object v0, p0

    .line 312
    .local v0, "inputStr":Ljava/lang/CharSequence;
    const/4 v4, 0x2

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 313
    .local v2, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 315
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 316
    const/4 v4, 0x1

    .line 318
    :goto_0
    return v4

    :cond_0
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public static isNetworkAvailable(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 236
    const/4 v0, 0x0

    .line 239
    .local v0, "activeNetworkInfo":Landroid/net/NetworkInfo;
    :try_start_0
    const-string v3, "connectivity"

    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 238
    check-cast v1, Landroid/net/ConnectivityManager;

    .line 240
    .local v1, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 245
    .end local v1    # "connectivityManager":Landroid/net/ConnectivityManager;
    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    :goto_1
    return v3

    .line 241
    :catch_0
    move-exception v2

    .line 243
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 245
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v3, 0x0

    goto :goto_1
.end method

.method public static isRunningOnEmulator()Z
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 202
    const/4 v1, 0x0

    .line 206
    .local v1, "result":Z
    :try_start_0
    sget-object v4, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    const-string v5, "generic"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 207
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "Emulator"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 208
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "VirtualBox"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 209
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "VirtualBox"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 210
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "Virtual Box"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 211
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v5, "Virtual"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 212
    sget-object v4, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v5, "Android-x86"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 213
    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v5, "VMware"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 214
    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v5, "innotek GmbH"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    move v1, v3

    .line 215
    :goto_0
    if-eqz v1, :cond_1

    move v1, v2

    .line 225
    :goto_1
    return v1

    :cond_0
    move v1, v2

    .line 206
    goto :goto_0

    .line 217
    :cond_1
    sget-object v4, Landroid/os/Build;->BRAND:Ljava/lang/String;

    const-string v5, "generic"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 218
    sget-object v4, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string v5, "generic"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_2

    :goto_2
    or-int/2addr v1, v2

    .line 219
    goto :goto_1

    :cond_2
    move v2, v3

    .line 218
    goto :goto_2

    .line 221
    :catch_0
    move-exception v0

    .line 223
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public static randInt(II)I
    .locals 3
    .param p0, "min"    # I
    .param p1, "max"    # I

    .prologue
    .line 252
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 256
    .local v0, "rand":Ljava/util/Random;
    sub-int v2, p1, p0

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int v1, v2, p0

    .line 258
    .local v1, "randomNum":I
    return v1
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 372
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 371
    sput-object v0, Lcom/perk/livetv/aphone/utils/Utils;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 373
    sget-object v0, Lcom/perk/livetv/aphone/utils/Utils;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    sput-object v0, Lcom/perk/livetv/aphone/utils/Utils;->editor:Landroid/content/SharedPreferences$Editor;

    .line 375
    return-void
.end method

.method public static trimCache(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 263
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    .line 264
    .local v0, "dir":Ljava/io/File;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 265
    invoke-static {v0}, Lcom/perk/livetv/aphone/utils/Utils;->deleteDir(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    .end local v0    # "dir":Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 267
    :catch_0
    move-exception v1

    goto :goto_0
.end method
