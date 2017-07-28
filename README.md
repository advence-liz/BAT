# BAT
for window bat

## 参考链接
- [API](http://www.cnblogs.com/SunShineYPH/archive/2011/12/13/2285570.html)
- [api](http://www.cnblogs.com/Greensun/archive/2008/07/25/1251788.html)
- [Api](http://blog.csdn.net/junmuzi/article/details/12239303)
- [百度百科](http://baike.baidu.com/subview/283786/283786.htm)
- [%~dp0](http://blog.csdn.net/lightyearwp/article/details/2778677)
- [cmd](http://www.jb51.net/article/11287.htm)
- [cmd.exe](https://ss64.com/nt/cmd.html)
- [bat&cmd](http://blog.csdn.net/bingjie1217/article/details/12947327)
## problem
- 文件名不用跟命令名一样不然会执行文件而不是命令囧
-  start cmd /k echo ee 打开新窗口执行命令并且窗口不关
- cmd.exe /c gulp -b "D:\Git\prometheus3\prometheus3\prometheus3" --color --gulpfile "D:\Git\prometheus3\prometheus3\prometheus3\Gulpfile.js" default
- explorer %windir%   打开模块目录
-  @echo 10.1.87.74          demo.api.com >>C:\Windows\System32\drivers\etc\hosts 
  start http://demo.api.com/demo/widget.html
```
D:\lizgit\BAT\src\findstr>set str= ffff

D:\lizgit\BAT\src\findstr>str
'str' is not recognized as an internal or external command,
operable program or batch file.

D:\lizgit\BAT\src\findstr>echo str
str

D:\lizgit\BAT\src\findstr>echo "%str%"
" ffff"

D:\lizgit\BAT\src\findstr>
```
- [call&start](http://www.bathome.net/thread-3162-1-1.html) call 主要调用其它批处理文件并且可以传参数 start 调用其它exe 或者调用对应文件格式的默认启动程序
## guide
  - 1. 调用其他程序时，对文件的大小写不敏感，文件后缀也可忽略
       如：start LeapFTP.exe  与 start leapftp 效果一样，都是运行“LeapFTP.exe”文件
       每行的开头的字符串会自动查找程序来运行，还可用双引号引起来(文件名或目录名含空格时必须用)
       如："D:\Program Files\Leap FTP.exe"
       "LeapFTP.exe" 可正常运行文件，start "" "LeapFTP.exe" 也可以正常运行文件(注意，第一个参数是窗口显示的标题)
  - 3. copy C:\test\*.* D:\back  (复制C盘test文件夹的所有文件(不包括文件夹及子文件夹里的东西)到D盘的back文件夹)
  - 4. dir c:\*.* > a.txt　(将c盘文件列表写入 a.txt 中)
  - 5.  \> 生成文件并写入内容(如果有这文件则覆盖)，  >> 文件里追加内容
  - 6. md d:\aa (创建文件夹)
  - 7. 在命令末尾加上“>NUL 2>NUL”，表示隐蔽返回信息。
  - 8. 等待用户输入： set /p 变量名=屏幕显示信息。  Sample：set /p pass=请输入密码:
  - 9. 让用户按回车退出
       小技巧(替代pause)，文件的最后一句：set /p tmp=操作结束，请按回车键退出...
  - 10.设置标题： title JDK安装
  - 11.设置屏幕显示颜色，如绿色: color 0a
  - 12.清屏： cls
  - 13.查看自己的IP：
       for /f "tokens=15" %%i in ('ipconfig ^| find /i "ip address"') do set ip=%%i
       echo %ip% (这时的 %ip% 就是自己的IP地址)

  - 14.修改文件的更新日期
        copy 文件名+,,>nul  (修改为当前时间，如果要修改为指定时间，先修改系统时间，再改回系统时间)
  - 15.修改文件的后缀名
        ren C:\test\*.jpg *.JPG
	for /r %%c in (*.jpg) do (ren %%c *.JPG)  :: 修改当前目录下的所有文件的后缀名，包括子目录的
  - 16.修改文件的文件名
        rename test.jpg test2.JPG
        rename *.jpg *.888.JPG
  - 17.查看DNS、IP、Mac等
        1) Win98： winipcfg
        2) Win2000以上： Ipconfig /all
        3) NSLOOKUP
  - 18.查看IP上的共享资源，就可以
        net view 192.168.10.8
  - 19.共享
      -  A.查看你机器的共享资源: net share
      -  B.手工删除共享
          net share 共享资源名称$ /d
          注意$后有空格。
      -  C.增加一个共享：
          net share mymovie=e:\downloads\movie /users:3
          mymovie 共享成功。 同时限制链接用户数为3人。
  - 20.打开某网站
          start iexplore.exe http://www.baidu.com
          使用默认浏览器 start http://www.baidu.com
##
```

main.bat
@echo off
set a=1
pause
echo call child.bat
call child.bat
echo end call
pause
echo %b%
pause
复制代码

child.bat
 @echo off
echo %a%
set b=20
pause
复制代码


注意，这个实验中，main.bat定义了变量a为1，在child.bat中定义了变量b为1
main.bat首先将call child.bat，然后child.bat将echo %a%，现在能正常显示1。call完之后，main.bat将echo %b%，也能正常显示20

如果将call改为start，待child.bat执行完再关闭之后，main.bat继续echo %b%，将无法显示变量b的值

call的时候，他们拥有同一个壳cmd.exe，在同一个进程当中，所以他们的变量是互通的

start的时候，他们拥有两个壳cmd.exe，但在不同的进程当中，而由于这是他们的壳都是cmd.exe，所以child.bat可以看成是main.bat的子进程，子进程可以读取父进程中的变量，但不能赋予父进程变量的值。而当start的程序不同的壳的时候，他们就不是父子进程关系。

我是这样理解的，有不同意见以砖拍之。。。
```