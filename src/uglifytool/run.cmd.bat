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
   call  %~dp0/nodejs/uglifyjs %%~fa -cmo "%%~dpna".min.js
	
)
echo +++++++++++++++++++++++++++++++

echo    ALL DONE!!!
whoami >>log.txt

pause & exit