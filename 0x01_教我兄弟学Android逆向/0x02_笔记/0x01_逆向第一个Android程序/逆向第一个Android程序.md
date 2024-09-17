# 逆向第一个Android程序

+ 所需的工具：

  + Android Killer V1.3.1.0 和 apktool_2.9.3.jar

    链接：https://pan.baidu.com/s/1LOdfJYE29Zhbi7RXCCztXQ 
    提取码：kuzn

  

  + jdk
    链接：https://pan.baidu.com/s/1Mpd1z7NoZoIRLFBnktPbKw 
    提取码：i5xj

  

  + 要逆向的apk以及破解版

    链接：https://pan.baidu.com/s/1C-r-KteplM3JICGj6kP-YQ 
    提取码：d71z

    

  + 雷电模拟器
    链接：https://pan.baidu.com/s/152qzwbaxB98ULgpm-v3Znw 
    提取码：stv6



## 配置Android Killer

+ 首先用上面的<code>JDK</code>文件配置<code>Android Killer</code>

![屏幕截图_2024-09-16_201850](..\img\屏幕截图_2024-09-16_201850.png)



+ 用上面的文件配置<code>Android Killer</code>的<code>apktool</code>

![屏幕截图_2024-09-16_203702](..\img\屏幕截图_2024-09-16_203702.png)



---

## 对APK文件反编译

直接将apk文件拖进Android Killer软件

![屏幕截图_2024-09-16_050402](..\img\屏幕截图_2024-09-16_050402.png)

由图，反编译成功，且红框中的是程序入口地址。



## 找到登录逻辑点

+ 首先<code>ctrl</code>+<code>f</code>搜索“登录失败”(转化为<code>unicode</code>后)找到相应的登录逻辑点

![屏幕截图_2024-09-16_052510](..\img\屏幕截图_2024-09-16_052510.png)



+ 双击已经找到的登录逻辑点找到对应的登录代码上下文

![屏幕截图_2024-09-16_052658](..\img\屏幕截图_2024-09-16_052658.png)



+ 理解登录逻辑

~~~ java
# virtual methods
.method public check(Ljava/lang/String;Ljava/lang/String;)V    #代表check()方法
    .locals 2
    .param p1, "name"    # Ljava/lang/String;   将name参数赋值给p1,代表用户名
    .param p2, "pass"    # Ljava/lang/String;   将pass参数赋值给p2,代表密码

    .prologue			 # 这一行代表这个方法要开始了
    const/4 v1, 0x0		 

    .line 28
    const-string v0, "hfdcxy" 		# 将字符串"hfdcxy"赋值给v0;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z 	#这里将字符串p1和v0作为参数传给equals函数;

    move-result v0		# 将equals函数执行的结果给v0;

    if-eqz v0, :cond_0  # 如果v0等于0则执行cond_0后的语句否则继续往下执行

    const-string v0, "1234"		#将字符串"1234"赋值给v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z 		# 将p2和v0参数传给equals函数

    move-result v0	# 将上一句equals函数执行的结果赋值给v0

    if-eqz v0, :cond_0	# 如果v0等于0则执行cond_0后的语句否则继续往下执行

    .line 30
    const-string v0, "\u767b\u5f55\u6210\u529f"		#用const-string指令定义一常量字符串v0，内容为"\u767b\u5f55\u6210\u529f"(经Unicode编码的中文字符，表示“登录成功”含义)

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
		#通过invoke-static调用android/widget/Toast类的makeText静态方法创建一Toast对象
		#接受三个参数：一Context对象(p0，Android中通常是Activity或Service等上下文对象);一CharSequence对象，刚定义的常量字符串v0;一整数v1

    move-result-object v0
		#通过move-result-object v0指令存储makeText方法的结果（一Toast对象）存储在v0中	
    
	invoke-virtual {v0}, Landroid/widget/Toast;->show()V
		#用invoke - virtual调用v0(Toast对象）show方法将Toast消息显示在屏幕上

    .line 34
    :goto_0
    return-void
	# return-void表示方法（或代码块）执行结束，没有返回值

    .line 33
    :cond_0
    const-string v0, "\u767b\u5f55\u5931\u8d25" # (经Unicode编码的中文字符，表示“登录失败”含义)

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method
~~~



+ 分析登录逻辑

  +  这里两个smali指令 一个if-eqz 另一个if-nez，这两条指令是相对的
    (1) if-eqz vA, vB, :cond_**"  如果vA等于vB则跳转到:cond_**
    (2) if-nez vA, vB, :cond_**"  如果vA不等于vB则跳转到:cond_**

  

  + 小总结
    (1)首先程序把我们输入的用户名和密码给了p1和p2 然后把真正的用户名给了v0 再拿p1和v0对比 对比的结果放在v0中 如果这两个值不相等v0就等于0

    

    (2)然后用if-eqz v0, :cond_0这条指令去判断v0是不是0 如果v0等于0 也就是用户名和密码不相等 就跳转到:cond_0位置 执行登录失败 否则继续往下面执行

    

    (3)这里假设用户名输入正确了 程序往下继续执行 后面会进行同样的判断密码是不是相等 只有用户名和密码都是正确的 程序才不会跳转到:cond_0位置执行登录失败

  

  + 结合着上面的总结那么思路来了 

    + 如果不让程序跳转到:cond_0位置 让程序每次在if-eqz v0, :cond_0这条关键指令上继续往下执行 是不是就可以执行登录成功代码了？ 那怎么能让它不跳转呢？ 我现在有三种思路:

    + 第一种 程序有两个if-eqz 分别是用来判断用户名和密码是否正确的 我把这两个if-eqz都改成if-nez 

    + 第二种 我直接把这两条指令删除掉 

    + 第三种也是最省事最懒的一种 我直接用goto语句直接一条指令让程序执行跳转登录成的代码 也是可以达到程序破解的目的 

      这里强调一个问题 修改完smali代码后一定要ctrl+s保存 不然程序还是拿原来的smali代码编译。



## 修改登录逻辑点并重新编译

+ 修改代码后重新编译即可得到破解版的apk

![屏幕截图_2024-09-16_200611](..\img\屏幕截图_2024-09-16_200611.png)



![屏幕截图_2024-09-16_201430](..\img\屏幕截图_2024-09-16_201430.png)



## 软件破解后

+ 雷电模拟器安装并打开破解后的软件

![屏幕截图_2024-09-16_205901](..\img\屏幕截图_2024-09-16_205901.png)
