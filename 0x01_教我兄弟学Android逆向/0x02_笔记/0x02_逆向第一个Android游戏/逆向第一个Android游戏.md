+ 首先在<code>Android_Killer</code>里打开水果大战的<code>apk</code>文件，然后直接在工程搜索中搜索"失败"发现没有找到对应的结果

![屏幕截图_2024-11-20_70503](.\img\屏幕截图_2024-11-20_70503.png)



+ 然后通过将“失败”的文本格式转化为<code>unicode</code>格式，再搜索一遍最后成功发现<code>MymmPay.smail</code>这个文件，猜测这就是付费相关的文件

![屏幕截图_2024-11-20_170753](.\img\屏幕截图_2024-11-20_170753.png)

![屏幕截图_2024-11-20_171138](.\img\屏幕截图_2024-11-20_171138.png)



+ 双击点击进入<code>MymmPay.smail</code>文件中的第二个搜索结果然后往上寻找最后找到<code>payResultFalse()</code>函数

![屏幕截图_2024-11-20_171559](.\img\屏幕截图_2024-11-20_171559.png)



+ 继续往下寻找到了<code>payResultSuccess()</code>函数

![屏幕截图_2024-11-20_171717](.\img\屏幕截图_2024-11-20_171717.png)



+ 将<code>payResultSuccess()</code>函数里的部分代替到<code>payResultFalse()</code>函数部分

![屏幕截图_2024-11-20_173314](.\img\屏幕截图_2024-11-20_173314.png)



+ 最后搜索<code>android.permission.SEND_SMS</code>删除可能产生费用的危险权限，但结果没搜到所以不用删除了。。。

![屏幕截图_2024-11-20_173549](.\img\屏幕截图_2024-11-20_173549.png)



+ 最最后打包编译即可

![屏幕截图_2024-11-20_174153](.\img\屏幕截图_2024-11-20_174153.png)