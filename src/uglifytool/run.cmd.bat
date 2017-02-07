@echo off
color 2


:: "set the directory where to find js files"
SET JSFOLDER=.\test
chdir /d %JSFOLDER%
echo    HELLO   Passenger   
echo    working directory %cd%
echo ******************************

echo    setp 1 delect *.min.js
echo -------------------------------
:: delect js which has been uglifyed
for /r . %%b in (*.min.js) do (
	echo delect %%~nb.js
	del %%~nb.js
  )
echo -------------------------------

echo    step 2 uglifying js files
echo +++++++++++++++++++++++++++++++
for /r . %%a in (*.js) do (
   echo uglifying %%~a ...
   call  %~dp0/nodejs/uglifyjs %%~fa -cmo "%%~dpna".min.js
	
)
echo +++++++++++++++++++++++++++++++

echo    ALL DONE!!!

pause & exit