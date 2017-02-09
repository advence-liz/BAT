# BAT
for window bat

## 参考链接
- [API](http://www.cnblogs.com/SunShineYPH/archive/2011/12/13/2285570.html)
- [api](http://www.cnblogs.com/Greensun/archive/2008/07/25/1251788.html)
- [Api](http://blog.csdn.net/junmuzi/article/details/12239303)
- [百度百科](http://baike.baidu.com/subview/283786/283786.htm)
- [%~dp0](http://blog.csdn.net/lightyearwp/article/details/2778677)

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

  - 14. 修改文件的更新日期
        copy 文件名+,,>nul  (修改为当前时间，如果要修改为指定时间，先修改系统时间，再改回系统时间)
  - 15. 修改文件的后缀名
        ren C:\test\*.jpg *.JPG
	for /r %%c in (*.jpg) do (ren %%c *.JPG)  :: 修改当前目录下的所有文件的后缀名，包括子目录的
  - 16. 修改文件的文件名
        rename test.jpg test2.JPG
        rename *.jpg *.888.JPG
  - 17. 查看DNS、IP、Mac等
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
