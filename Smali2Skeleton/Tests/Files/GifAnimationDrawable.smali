.class public Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;
.super Landroid/graphics/drawable/AnimationDrawable;
.source "GifAnimationDrawable.java"


# instance fields
.field private decoded:Z

.field private height:I

.field private loader:Ljava/lang/Runnable;

.field private mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

.field private mTmpBitmap:Landroid/graphics/Bitmap;

.field private width:I


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;-><init>(Ljava/io/File;Z)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .locals 3
    .param p1, "f"    # Ljava/io/File;
    .param p2, "inline"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const v2, 0x8000

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {p0, v0, p2}, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;-><init>(Ljava/io/InputStream;Z)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;-><init>(Ljava/io/InputStream;Z)V

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 6
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "inline"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 60
    invoke-direct {p0}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    .line 82
    new-instance v3, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable$1;

    invoke-direct {v3, p0}, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable$1;-><init>(Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;)V

    iput-object v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->loader:Ljava/lang/Runnable;

    .line 61
    move-object v0, p1

    .line 62
    .local v0, "bis":Ljava/io/InputStream;
    const-class v3, Ljava/io/BufferedInputStream;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    new-instance v0, Ljava/io/BufferedInputStream;

    .end local v0    # "bis":Ljava/io/InputStream;
    const v3, 0x8000

    invoke-direct {v0, p1, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 63
    .restart local v0    # "bis":Ljava/io/InputStream;
    :cond_0
    iput-boolean v1, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->decoded:Z

    .line 64
    new-instance v3, Lcom/perk/livetv/aphone/utils/GifDecoder;

    invoke-direct {v3}, Lcom/perk/livetv/aphone/utils/GifDecoder;-><init>()V

    iput-object v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    .line 65
    iget-object v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    invoke-virtual {v3, v0}, Lcom/perk/livetv/aphone/utils/GifDecoder;->read(Ljava/io/InputStream;)I

    .line 66
    iget-object v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    invoke-virtual {v3, v1}, Lcom/perk/livetv/aphone/utils/GifDecoder;->getFrame(I)Landroid/graphics/Bitmap;

    move-result-object v3

    iput-object v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    .line 67
    const-string v3, "GifAnimationDrawable"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "===>Lead frame: ["

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->width:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->height:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    invoke-virtual {v5, v1}, Lcom/perk/livetv/aphone/utils/GifDecoder;->getDelay(I)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    invoke-virtual {v5}, Lcom/perk/livetv/aphone/utils/GifDecoder;->getLoopCount()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    iget-object v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iput v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->height:I

    .line 69
    iget-object v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iput v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->width:I

    .line 70
    new-instance v3, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v4, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v3, v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    iget-object v4, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    invoke-virtual {v4, v1}, Lcom/perk/livetv/aphone/utils/GifDecoder;->getDelay(I)I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 71
    iget-object v3, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    invoke-virtual {v3}, Lcom/perk/livetv/aphone/utils/GifDecoder;->getLoopCount()I

    move-result v3

    if-eqz v3, :cond_1

    move v1, v2

    :cond_1
    invoke-virtual {p0, v1}, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->setOneShot(Z)V

    .line 72
    invoke-virtual {p0, v2, v2}, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->setVisible(ZZ)Z

    .line 73
    if-eqz p2, :cond_2

    .line 74
    iget-object v1, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->loader:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 78
    :goto_0
    return-void

    .line 76
    :cond_2
    new-instance v1, Ljava/lang/Thread;

    iget-object v2, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->loader:Ljava/lang/Runnable;

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method static synthetic access$0(Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;)Lcom/perk/livetv/aphone/utils/GifDecoder;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    return-object v0
.end method

.method static synthetic access$1(Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;Landroid/graphics/Bitmap;)V
    .locals 0

    .prologue
    .line 39
    iput-object p1, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method static synthetic access$2(Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;)Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mTmpBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$3(Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;Z)V
    .locals 0

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->decoded:Z

    return-void
.end method

.method static synthetic access$4(Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;Lcom/perk/livetv/aphone/utils/GifDecoder;)V
    .locals 0

    .prologue
    .line 37
    iput-object p1, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->mGifDecoder:Lcom/perk/livetv/aphone/utils/GifDecoder;

    return-void
.end method


# virtual methods
.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 100
    iget v0, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->height:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 101
    iget v0, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->width:I

    return v0
.end method

.method public getMinimumHeight()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->height:I

    return v0
.end method

.method public getMinimumWidth()I
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->width:I

    return v0
.end method

.method public isDecoded()Z
    .locals 1

    .prologue
    .line 80
    iget-boolean v0, p0, Lcom/perk/livetv/aphone/utils/GifAnimationDrawable;->decoded:Z

    return v0
.end method
