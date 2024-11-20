.class public Lhfdcxy/com/myapplication/MainActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "MainActivity.java"


# instance fields
.field Name:Landroid/widget/EditText;

.field Pass:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public check(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 28
    const-string v0, "hfdcxy"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "1234"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 30
    const-string v0, "\u767b\u5f55\u6210\u529f"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 34
    :goto_0
    return-void

    .line 33
    :cond_0
    const-string v0, "\u767b\u5f55\u5931\u8d25"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 14
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 15
    const v1, 0x7f04001b

    invoke-virtual {p0, v1}, Lhfdcxy/com/myapplication/MainActivity;->setContentView(I)V

    .line 16
    const v1, 0x7f0b005b

    invoke-virtual {p0, v1}, Lhfdcxy/com/myapplication/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lhfdcxy/com/myapplication/MainActivity;->Name:Landroid/widget/EditText;

    .line 17
    const v1, 0x7f0b0059

    invoke-virtual {p0, v1}, Lhfdcxy/com/myapplication/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lhfdcxy/com/myapplication/MainActivity;->Pass:Landroid/widget/EditText;

    .line 18
    const v1, 0x7f0b005a

    invoke-virtual {p0, v1}, Lhfdcxy/com/myapplication/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 19
    .local v0, "Login":Landroid/widget/Button;
    new-instance v1, Lhfdcxy/com/myapplication/MainActivity$1;

    invoke-direct {v1, p0}, Lhfdcxy/com/myapplication/MainActivity$1;-><init>(Lhfdcxy/com/myapplication/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    return-void
.end method
