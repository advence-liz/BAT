@echo off
color 2
title uglify tool

:: "set the directory where to find js files"
SET JSFOLDER=%cd%\test
::cd /d %JSFOLDER%
echo    HELLO   Passenger   

echo    working directory %JSFOLDER%
echo ******************************

echo    setp 1 delect *.min.js 
echo -------------------------------
:: delect js which has been uglifyed
for /r %JSFOLDER% %%b in (*.min.js) do (
	echo delect %%~nb.js
	del %%~fb
)
echo -------------------------------

echo    step 2 uglifying js files 
echo +++++++++++++++++++++++++++++++
echo %time% %date% >> log.txt 

for /r %JSFOLDER% %%a in (*.js) do (
   echo uglifying %%~na.js
   echo uglifyed %%~fa ... >>log.txt
REM    :: %%~fa -cmo "%%~dpna".min.js 作为参数传入下个文件
   call  %~dp0/nodejs/uglifyjs %%~fa -cmo "%%~dpna".min.js --source-map "%%~dpna".min.js.map
	
)
echo +++++++++++++++++++++++++++++++

echo    ALL DONE!!!
whoami >>log.txt

pause & exit

: 选项语法: d p 之类的扩展确实是根据当前文件扩展的（以文件为中心读出其他信息）
:: ~I - 删除任何引号(")，扩充 %I 
:: %~fI - 将 %I 扩充到一个完全合格的路径名 
:: %~dI - 仅将 %I 扩充到一个驱动器号 
:: %~pI - 仅将 %I 扩充到一个路径 
:: %~nI - 仅将 %I 扩充到一个文件名 
:: %~xI - 仅将 %I 扩充到一个文件扩展名 
:: %~sI - 扩充的路径只含有短名 
:: %~aI - 将 %I 扩充到文件的文件属性 
:: %~tI - 将 %I 扩充到文件的日期/时间 
:: %~zI - 将 %I 扩充到文件的大小 
:: %~$PATH:I - 查找列在路径环境变量的目录，并将 %I 扩充 
:: 到找到的第一个完全合格的名称。如果环境变量名 
:: 未被定义，或者没有找到文件，此组合键会扩充到 
:: 空字符串 
:: 可以组合修饰符来得到多重结果: 
:: %~dpI - 仅将 %I 扩充到一个驱动器号和路径 
:: %~nxI - 仅将 %I 扩充到一个文件名和扩展名 
:: %~fsI - 仅将 %I 扩充到一个带有短名的完整路径名 
:: %~dp$PATH:i - 查找列在路径环境变量的目录，并将 %I 扩充 
:: 到找到的第一个驱动器号和路径。 
:: %~ftzaI - 将 %I 扩充到类似输出线路的 DIR