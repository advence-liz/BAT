@echo off
REM color 2
title build prometheus

:: "set the directory where to find js files"
SET prometheus=%cd%\prometheus3
SET react=%cd%\react-component
SET mdpath="%cd%\MD"

echo    HELLO   Passenger   
cd %prometheus%
echo working directory %cd%
echo ******************************
REM 没有call 运行完npm run build 就结束了
call npm run build
echo +++++++++++++++++++++++++++++++
cd %react%
echo working directory %cd%
echo ******************************
call npm run build
echo +++++++++++++++++++++++++++++++
cd %mdpath%
echo working directory %cd%
echo ******************************
call gulp "copy:sources"
echo +++++++++++++++++++++++++++++++
echo    ALL DONE!!!

REM whoami >>log.txt

pause & exit

:: 选项语法: d p 之类的扩展确实是根据当前文件扩展的（以文件为中心读出其他信息）
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