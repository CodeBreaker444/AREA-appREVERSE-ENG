.class public Lcom/getir/core/feature/splash/SplashActivity;
.super Lcom/getir/e/d/a/l;
.source "SplashActivity.java"

# interfaces
.implements Lcom/getir/core/feature/splash/v;
.field public static ACTIVITY_NAME:Ljava/lang/String;

.field public static PACKAGE_NAME:Ljava/lang/String;

# instance fields
.field public N:Lcom/getir/core/feature/splash/n;

.field public O:Lcom/getir/core/feature/splash/w;

.field private P:Lcom/getir/core/service/location/LocationService;

.field private Q:Z

.field private R:I

.field private S:Landroid/content/ServiceConnection;

.field private T:Lcom/getir/h/z1;

.field U:Z

.field V:Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/getir/e/d/a/l;-><init>()V

    const/16 v0, 0x3c

    .line 2
    iput v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->R:I

    .line 3
    new-instance v0, Lcom/getir/core/feature/splash/SplashActivity$a;

    invoke-direct {v0, p0}, Lcom/getir/core/feature/splash/SplashActivity$a;-><init>(Lcom/getir/core/feature/splash/SplashActivity;)V

    iput-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->S:Landroid/content/ServiceConnection;

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->U:Z

    .line 5
    new-instance v0, Lcom/getir/core/feature/splash/b;

    invoke-direct {v0, p0}, Lcom/getir/core/feature/splash/b;-><init>(Lcom/getir/core/feature/splash/SplashActivity;)V

    iput-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->V:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    return-void
.end method

.method private Aa(Landroid/content/Intent;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "notificationId"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2
    invoke-virtual {p1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    const/4 p1, 0x0

    .line 3
    :goto_0
    invoke-static {p1}, Lcom/getir/common/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {v0, p1}, Lcom/getir/core/feature/splash/n;->O4(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private Ba(Landroid/content/Intent;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    const-string v1, "deeplinkActionObject"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Lcom/getir/core/domain/model/business/DeeplinkActionBO;

    invoke-interface {v0, p1}, Lcom/getir/core/feature/splash/n;->Pa(Lcom/getir/core/domain/model/business/DeeplinkActionBO;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private Ca()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/getir/e/d/a/l;->ca()Landroid/content/Context;

    const-string v0, "android.permission.ACCESS_FINE_LOCATION"

    invoke-static {p0, v0}, Landroidx/core/content/a;->a(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private Da()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v0

    new-instance v1, Lcom/getir/core/feature/splash/d;

    invoke-direct {v1, p0}, Lcom/getir/core/feature/splash/d;-><init>(Lcom/getir/core/feature/splash/SplashActivity;)V

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerLib;->subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;)V

    return-void
.end method

.method private synthetic Ea(Lcom/appsflyer/deeplink/DeepLinkResult;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/appsflyer/deeplink/DeepLinkResult;->getStatus()Lcom/appsflyer/deeplink/DeepLinkResult$Status;

    move-result-object v0

    .line 2
    sget-object v1, Lcom/appsflyer/deeplink/DeepLinkResult$Status;->FOUND:Lcom/appsflyer/deeplink/DeepLinkResult$Status;

    if-ne v0, v1, :cond_1

    .line 3
    invoke-virtual {p1}, Lcom/appsflyer/deeplink/DeepLinkResult;->getDeepLink()Lcom/appsflyer/deeplink/DeepLink;

    move-result-object p1

    .line 4
    invoke-virtual {p1}, Lcom/appsflyer/deeplink/DeepLink;->getDeepLinkValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 5
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-virtual {p1}, Lcom/appsflyer/deeplink/DeepLink;->getDeepLinkValue()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/getir/core/feature/splash/n;->c6(Ljava/lang/String;)V

    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/getir/core/feature/splash/n;->c6(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic Ga(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->getMaxFrame()F

    move-result p1

    iget v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->R:I

    int-to-float v0, v0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    const/16 p1, 0x87

    .line 2
    iput p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->R:I

    .line 3
    :cond_0
    iget-boolean p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->U:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    .line 4
    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->getFrame()I

    move-result p1

    iget v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->R:I

    if-lt p1, v0, :cond_1

    .line 5
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->removeAllAnimatorListeners()V

    .line 6
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    iget v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->R:I

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setFrame(I)V

    .line 7
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->cancelAnimation()V

    :cond_1
    return-void
.end method

.method private synthetic Ia(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->Da()V

    return-void
.end method

.method private La()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->S:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 2
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->P:Lcom/getir/core/service/location/LocationService;

    if-eqz v0, :cond_0

    .line 3
    invoke-virtual {v0}, Landroid/app/Service;->stopSelf()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4
    :catch_0
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->O:Lcom/getir/core/feature/splash/w;

    invoke-virtual {v0}, Lcom/getir/core/feature/splash/w;->L()V

    :cond_0
    :goto_0
    return-void
.end method

.method static synthetic za(Lcom/getir/core/feature/splash/SplashActivity;Lcom/getir/core/service/location/LocationService;)Lcom/getir/core/service/location/LocationService;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->P:Lcom/getir/core/service/location/LocationService;

    return-object p1
.end method


# virtual methods
.method public E0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/getir/core/feature/splash/SplashActivity;->Ca()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/getir/core/feature/splash/n;->v1(Z)V

    goto :goto_0

    .line 3
    :cond_0
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->O:Lcom/getir/core/feature/splash/w;

    invoke-virtual {v0}, Lcom/getir/core/feature/splash/w;->I()V

    :goto_0
    return-void
.end method

.method public synthetic Fa(Lcom/appsflyer/deeplink/DeepLinkResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/getir/core/feature/splash/SplashActivity;->Ea(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    return-void
.end method

.method public G1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getir/e/d/a/l;->a:Lcom/getir/e/d/a/k;

    if-eqz v0, :cond_0

    .line 2
    invoke-virtual {v0}, Lcom/getir/e/d/a/k;->q()V

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {p0}, Lcom/getir/e/d/a/l;->finish()V

    :goto_0
    return-void
.end method

.method public synthetic Ha(Landroid/animation/ValueAnimator;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/getir/core/feature/splash/SplashActivity;->Ga(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public J0(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->O:Lcom/getir/core/feature/splash/w;

    invoke-virtual {v0, p1}, Lcom/getir/core/feature/splash/w;->K(Ljava/lang/Object;)V

    return-void
.end method

.method public synthetic Ja(Ljava/lang/Throwable;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/getir/core/feature/splash/SplashActivity;->Ia(Ljava/lang/Throwable;)V

    return-void
.end method

.method public Ka()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {v0}, Lcom/getir/core/feature/splash/n;->C3()V

    return-void
.end method

.method public M1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/getir/core/feature/splash/SplashActivity;->Aa(Landroid/content/Intent;)V

    return-void
.end method

.method public O0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->P:Lcom/getir/core/service/location/LocationService;

    if-nez v0, :cond_0

    .line 2
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/getir/core/service/location/LocationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/getir/core/feature/splash/SplashActivity;->S:Landroid/content/ServiceConnection;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    goto :goto_0

    .line 3
    :cond_0
    invoke-virtual {v0}, Lcom/getir/core/service/location/LocationService;->e()V

    :goto_0
    return-void
.end method

.method public U7(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iget-object p3, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p3, p3, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p3, p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimationFromJson(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    const-string p2, "images/"

    invoke-virtual {p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->setImageAssetsFolder(Ljava/lang/String;)V

    .line 3
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->enableMergePathsForKitKatAndAbove(Z)V

    .line 4
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    new-instance p2, Lcom/getir/core/feature/splash/c;

    invoke-direct {p2, p0}, Lcom/getir/core/feature/splash/c;-><init>(Lcom/getir/core/feature/splash/SplashActivity;)V

    invoke-virtual {p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->setFailureListener(Lcom/airbnb/lottie/LottieListener;)V

    .line 5
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    .line 6
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    iget-object p2, p0, Lcom/getir/core/feature/splash/SplashActivity;->V:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {p1, p2}, Lcom/airbnb/lottie/LottieAnimationView;->addAnimatorUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void
.end method

.method public b5()V
    .locals 1

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->U:Z

    .line 2
    invoke-direct {p0}, Lcom/getir/core/feature/splash/SplashActivity;->La()V

    return-void
.end method

.method public e9(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object v0, v0, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {v0, p1}, Lcom/airbnb/lottie/LottieAnimationView;->setAnimation(Ljava/lang/String;)V

    .line 2
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    const-string v0, "images/"

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->setImageAssetsFolder(Ljava/lang/String;)V

    .line 3
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->enableMergePathsForKitKatAndAbove(Z)V

    .line 4
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p1}, Lcom/airbnb/lottie/LottieAnimationView;->playAnimation()V

    .line 5
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p1, p1, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->V:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {p1, v0}, Lcom/airbnb/lottie/LottieAnimationView;->addAnimatorUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void
.end method

.method protected ea()Lcom/getir/e/d/a/g;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    return-object v0
.end method

.method public o6(ILjava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    iget-object p2, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-static {}, Landroid/location/Geocoder;->isPresent()Z

    move-result v0

    invoke-interface {p2, v0}, Lcom/getir/core/feature/splash/n;->o5(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2
    :catch_0
    iget-object p2, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Lcom/getir/core/feature/splash/n;->o5(Z)V

    .line 3
    :goto_0
    invoke-static {}, Lcom/getir/GetirApplication;->j0()Lcom/getir/GetirApplication;

    move-result-object p2

    invoke-virtual {p2}, Lcom/getir/GetirApplication;->b1()V

    .line 4
    iget-object p2, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    iget-object p2, p2, Lcom/getir/h/z1;->b:Lcom/airbnb/lottie/LottieAnimationView;

    invoke-virtual {p2}, Lcom/airbnb/lottie/LottieAnimationView;->pauseAnimation()V

    .line 5
    iget-object p2, p0, Lcom/getir/core/feature/splash/SplashActivity;->O:Lcom/getir/core/feature/splash/w;

    invoke-virtual {p2, p1}, Lcom/getir/core/feature/splash/w;->J(I)V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/e;->onActivityResult(IILandroid/content/Intent;)V

    const/4 p3, 0x1

    const/16 v0, 0x3e8

    if-ne p1, v0, :cond_1

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    .line 2
    iget-boolean p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->Q:Z

    if-nez p1, :cond_0

    .line 3
    iput-boolean p3, p0, Lcom/getir/core/feature/splash/SplashActivity;->Q:Z

    .line 4
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->i2()V

    goto :goto_0

    .line 5
    :cond_0
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->T5()V

    goto :goto_0

    :cond_1
    const/16 p2, 0xbb8

    if-ne p1, p2, :cond_3

    .line 6
    invoke-direct {p0}, Lcom/getir/core/feature/splash/SplashActivity;->Ca()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->Q:Z

    if-nez p1, :cond_2

    .line 7
    iput-boolean p3, p0, Lcom/getir/core/feature/splash/SplashActivity;->Q:Z

    .line 8
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->i2()V

    goto :goto_0

    .line 9
    :cond_2
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->T5()V

    goto :goto_0

    :cond_3
    const/16 p2, 0xbbb

    if-ne p1, p2, :cond_5

    .line 10
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->g1()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->Q:Z

    if-nez p1, :cond_4

    .line 11
    iput-boolean p3, p0, Lcom/getir/core/feature/splash/SplashActivity;->Q:Z

    .line 12
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->i2()V

    goto :goto_0

    .line 13
    :cond_4
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->T5()V

    :cond_5
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/getir/core/feature/splash/j;->f()Lcom/getir/core/feature/splash/l$a;

    move-result-object v0

    .line 2
    invoke-static {}, Lcom/getir/GetirApplication;->j0()Lcom/getir/GetirApplication;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getir/GetirApplication;->o()Lcom/getir/g/e/a/a;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/getir/core/feature/splash/l$a;->a(Lcom/getir/g/e/a/a;)Lcom/getir/core/feature/splash/l$a;

    new-instance v1, Lcom/getir/core/feature/splash/p;

    invoke-direct {v1, p0}, Lcom/getir/core/feature/splash/p;-><init>(Lcom/getir/core/feature/splash/SplashActivity;)V

    .line 3
    invoke-interface {v0, v1}, Lcom/getir/core/feature/splash/l$a;->b(Lcom/getir/core/feature/splash/p;)Lcom/getir/core/feature/splash/l$a;

    .line 4
    invoke-interface {v0}, Lcom/getir/core/feature/splash/l$a;->build()Lcom/getir/core/feature/splash/l;

    move-result-object v0

    .line 5
    invoke-interface {v0, p0}, Lcom/getir/e/d/a/e;->e(Ljava/lang/Object;)V

    .line 6
    invoke-super {p0, p1}, Lcom/getir/e/d/a/l;->onCreate(Landroid/os/Bundle;)V

    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lcom/getir/h/z1;->d(Landroid/view/LayoutInflater;)Lcom/getir/h/z1;

    move-result-object p1

    iput-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->T:Lcom/getir/h/z1;

    .line 8
    invoke-virtual {p1}, Lcom/getir/h/z1;->c()Landroidx/constraintlayout/widget/ConstraintLayout;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/d;->setContentView(Landroid/view/View;)V

    .line 9
    invoke-virtual {p0}, Lcom/getir/core/feature/splash/SplashActivity;->Ka()V

    .line 10
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->h7()V
    # Start Here Injection
    invoke-virtual {p0}, Lcom/getir/core/feature/splash/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0
    const-string v1, "Code Injected into the APK , Only for testing"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    invoke-virtual {p0}, Lcom/getir/core/feature/splash/SplashActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/getir/core/feature/splash/SplashActivity;->PACKAGE_NAME:Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getir/core/feature/splash/SplashActivity;->ACTIVITY_NAME:Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.AREA.reverseeng"
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
    const/16 v1, 0x20
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;
    sget-object v1, Lcom/getir/core/feature/splash/SplashActivity;->PACKAGE_NAME:Ljava/lang/String;
    const-string v2, "package_name"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    sget-object v1, Lcom/getir/core/feature/splash/SplashActivity;->ACTIVITY_NAME:Ljava/lang/String;

    const-string v2, "activity_name"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/getir/core/feature/splash/SplashActivity;->sendBroadcast(Landroid/content/Intent;)V
    # Toast a message
    
    
# End Here
    .line 11
    :try_start_0
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->Ga()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 13
    :goto_0
    :try_start_1
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-static {}, Lcom/getir/GetirApplication;->j0()Lcom/getir/GetirApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getir/GetirApplication;->v0()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/getir/core/feature/splash/n;->Z8(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 14
    :catch_1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/getir/core/feature/splash/SplashActivity;->Ba(Landroid/content/Intent;)V

    .line 15
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->i2()V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/getir/core/feature/splash/SplashActivity;->La()V

    .line 2
    invoke-super {p0}, Lcom/getir/e/d/a/l;->onDestroy()V

    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/e;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    .line 3
    invoke-direct {p0, p1}, Lcom/getir/core/feature/splash/SplashActivity;->Ba(Landroid/content/Intent;)V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    const/16 p2, 0x7d0

    if-eq p1, p2, :cond_0

    goto :goto_0

    .line 1
    :cond_0
    array-length p1, p3

    const/4 p2, 0x0

    if-lez p1, :cond_1

    aget p1, p3, p2

    if-nez p1, :cond_1

    .line 2
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->i2()V

    .line 3
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/getir/core/feature/splash/n;->A1(Z)V

    goto :goto_0

    .line 4
    :cond_1
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1, p2}, Lcom/getir/core/feature/splash/n;->A1(Z)V

    .line 5
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->N:Lcom/getir/core/feature/splash/n;

    invoke-interface {p1}, Lcom/getir/core/feature/splash/n;->T5()V

    :goto_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/getir/e/d/a/l;->onResume()V

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/j0/g;->a(Landroid/app/Application;)V

    .line 3
    new-instance v0, Lcom/getir/core/feature/splash/SplashActivity$b;

    invoke-direct {v0, p0}, Lcom/getir/core/feature/splash/SplashActivity$b;-><init>(Lcom/getir/core/feature/splash/SplashActivity;)V

    invoke-static {p0, v0}, Lcom/facebook/applinks/a;->c(Landroid/content/Context;Lcom/facebook/applinks/a$b;)V

    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/appcompat/app/d;->onStart()V

    .line 2
    invoke-direct {p0}, Lcom/getir/core/feature/splash/SplashActivity;->Da()V

    return-void
.end method

.method public r1(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->O:Lcom/getir/core/feature/splash/w;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/getir/e/d/a/k;->A(Landroid/content/Intent;ZLandroid/os/Bundle;)V

    .line 3
    iget-object p1, p0, Lcom/getir/core/feature/splash/SplashActivity;->O:Lcom/getir/core/feature/splash/w;

    invoke-virtual {p1}, Lcom/getir/e/d/a/k;->q()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 4
    :catch_0
    invoke-virtual {p0}, Lcom/getir/e/d/a/l;->finish()V

    :goto_0
    return-void
.end method
