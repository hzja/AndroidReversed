# 动态调试smail代码

+ 首先将<code>apk</code>拉到<code>AndroidKiller</code>中，点工程管理器，点<code>smali</code>目录右键——》打开方式——》打开文件路径。

![屏幕截图_2024-09-19_003233](.\img\屏幕截图_2024-09-19_003233.png)



+ 新建<code>jwx02</code>文件夹，然后把上面打开文件路径目录里的<code>smali</code>文件夹复制到<code>jwx02</code>并改名为<code>src</code>，后面就可以用<code>Android_Studio</code>导入<code>src</code>了

![屏幕截图_2024-09-19_003515](.\img\屏幕截图_2024-09-19_003515.png)



+ 打开<code>AndroidStudio</code>，安装<code>ideasmali</code>插件，<code>File --> Settings --> Plugins</code>，安装<code>ideasmali</code>插件

  <code>ideasmali</code>插件链接：https://pan.baidu.com/s/1YhuXNAdbPPZABxWRkfVXPw ，提取码：b1u9

![202409192046](.\img\202409192046.PNG)



![202409192059](.\img\202409192059.PNG)



+ 打开<code>Android Device Monitor</code>

![屏幕截图_2024-09-20_011356](.\img\屏幕截图_2024-09-20_011356.png)

![屏幕截图_2024-09-20_012017](.\img\屏幕截图_2024-09-20_012017.png)

PS：这里<code>Android</code>需要<code>Android Studio</code>打开完整的项目时才会出现



+ 找到要调试<code>APK</code>的包名和入口的<code>Activity</code>

  + 用<code>Android Studio</code>打开要调试的<code>apk</code>，这里是<code>jwx02.apk</code>，这里包名是<code>hfdcxy.com.myapplication</code>和入口的<code>Activity</code>名<code>hfdcxy.com.myapplication.MainActivity</code>。同时注意一下，在<code>application</code>标签里面要有<code>android:debuggable="true"</code> 这句代码而没有是不能调试<code>apk</code>的，现在调试的这个例子默认是有这句代码的而有的apk中没有这句代码要自行添加上，这句代码的意思是开启调试模式

  ~~~ xml
  <?xml version="1.0" encoding="utf-8" standalone="no"?>
  <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="hfdcxy.com.myapplication" platformBuildVersionCode="26" platformBuildVersionName="8.0.0">
      <meta-data android:name="android.support.VERSION" android:value="26.0.0-alpha1"/>
      <application android:allowBackup="true" android:debuggable="true" android:icon="@mipmap/ic_launcher" android:label="@string/app_name" android:supportsRtl="true" android:theme="@style/AppTheme">
          <activity android:name="hfdcxy.com.myapplication.MainActivity">
              <intent-filter>
                  <action android:name="android.intent.action.MAIN"/>
                  <category android:name="android.intent.category.LAUNCHER"/>
              </intent-filter>
          </activity>
      </application>
  </manifest>
  ~~~

  ![屏幕截图 2024-09-20 012305](.\img\屏幕截图 2024-09-20 012305.png)

  

+ 把要调试的APK安装到手机中，并用数据线连接手机，打开USB调试模式

![Screenshot_2024-09-20-03-24-24-460_com.android.browser](.\img\Screenshot_2024-09-20-03-24-24-460_com.android.browser.jpg)





+ 打开命令行后输入命令<code> adb shell am start -D -n hfdcxy.com.myapplication/hfdcxy.com.myapplication.MainActivity</code> 对<code>apk</code>动态调试，其中<code>hfdcxy.com.myapplication</code>是包名而<code>hfdcxy.com.myapplication.MainActivity</code>是入口名，这条命令运行后手机屏幕将会进入到调试界面(如果手机屏幕没有进入到调试界面说明USB没有连接好手机 或者USB调试模式 没有打开 或者其他原因)

~~~ cmd
adb shell am start -D -n hfdcxy.com.myapplication/hfdcxy.com.myapplication.MainActivity
~~~

![屏幕截图 2024-09-20 021600](F:\Android逆向\0x01_教我兄弟学Android逆向\0x02_笔记\0X03_动态调试smail代码\img\屏幕截图 2024-09-20 021600.png)



+ 查看<code>Android Device Monitor</code>记住下图圈起来的两个值，然后把Android Device Monitor关掉(这里一定要关掉,因为它会占用8700端口导致后面转发端口失败)

![屏幕截图_2024-09-20_021124](.\img\屏幕截图_2024-09-20_021124.png)



+ 打开命令行窗口，输入命令<code>adb forward tcp:8700 jdwp::16795</code>转发8700 端口 (这里 jdwp是自己Android Device Monitor中要调试app的Online值 )

~~~ shell
adb forward tcp:8700 jdwp:16795
~~~

![屏幕截图_2024-09-20_021701](.\img\屏幕截图_2024-09-20_021701.png)



+ 用<code>Android Studio</code>导入<code>jwx02</code>文件夹

  ![屏幕截图 2024-09-20 022057](.\img\屏幕截图 2024-09-20 022057.png)

![屏幕截图 2024-09-20 022424](.\img\屏幕截图 2024-09-20 022424.png)



+ 设置项目的根文件，点击<code>Android</code>选择<code>Project</code>对之前反编译的<code>jwx02/src</code>文件夹<code>右键-->Make Directory As --->Source Root</code>

![屏幕截图_2024-09-20_023137](.\img\屏幕截图_2024-09-20_023137.png)



+ 配置远程调试的选项，选择<code>Run-->Edit Configurations</code>并增加一个<code>Remote</code>调试的调试选项，端口选择<code>8700</code>

![屏幕截图_2024-09-20_023548](.\img\屏幕截图_2024-09-20_023548.png)

![屏幕截图_2024-09-20_023656](.\img\屏幕截图_2024-09-20_023656.png)

![屏幕截图_2024-09-20_024011](.\img\屏幕截图_2024-09-20_024011.png)



+ 选择<code>File-->Project Structure</code>配置<code>JDK</code>

![屏幕截图_2024-09-20_024457](.\img\屏幕截图_2024-09-20_024457.png)



+ 在<code>Smali<code>文件中下好断点，断点的意思是程序运行到下断点的那行代码就会断下来

![屏幕截图_2024-09-20_024719](.\img\屏幕截图_2024-09-20_024719.png)



+ 下好断点之后<code>Run-->Debug'smali'</code>，这里的<code>smali</code>是之前配置好的调试选项

![屏幕截图_2024-09-20_024821](.\img\屏幕截图_2024-09-20_024821.png)



+ 此时手机会进入程序，在手机上输入用户名和密码，点登陆，程序会断在下的断点处

![Screenshot_2024-09-20-02-51-15-232_hfdcxy.com.myapplication](.\img\Screenshot_2024-09-20-02-51-15-232_hfdcxy.com.myapplication.jpg)

![屏幕截图_2024-09-20_025205](.\img\屏幕截图_2024-09-20_025205.png)

从此获得了输入的用户和密码



+ 在自己关心的语句前面下断点按F8执行下一步，F9运行程序，可以看到程序执行的逻辑。<code>Watches</code>窗口中可以点<code>+</code>按钮添加自己想看的寄存器的名字，就可以看到这个寄存器的值了

![001418xlpn2bssz4ks2ssv](.\img\001418xlpn2bssz4ks2ssv.png)



+ 结束

