.class Lhfdcxy/com/myapplication/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lhfdcxy/com/myapplication/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lhfdcxy/com/myapplication/MainActivity;


# direct methods
.method constructor <init>(Lhfdcxy/com/myapplication/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lhfdcxy/com/myapplication/MainActivity;

    .prologue
    .line 19
    iput-object p1, p0, Lhfdcxy/com/myapplication/MainActivity$1;->this$0:Lhfdcxy/com/myapplication/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 22
    iget-object v0, p0, Lhfdcxy/com/myapplication/MainActivity$1;->this$0:Lhfdcxy/com/myapplication/MainActivity;

    iget-object v1, p0, Lhfdcxy/com/myapplication/MainActivity$1;->this$0:Lhfdcxy/com/myapplication/MainActivity;

    iget-object v1, v1, Lhfdcxy/com/myapplication/MainActivity;->Name:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lhfdcxy/com/myapplication/MainActivity$1;->this$0:Lhfdcxy/com/myapplication/MainActivity;

    iget-object v2, v2, Lhfdcxy/com/myapplication/MainActivity;->Pass:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lhfdcxy/com/myapplication/MainActivity;->check(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    return-void
.end method
