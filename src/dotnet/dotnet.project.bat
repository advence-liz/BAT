@echo off
title dotnet
goto choice

:continue&leave
 echo Y:continue,N:leave
 choice
 if errorlevel 2 exit
 if errorlevel 1 goto choice

:choice
 echo I:restore package,R:run APP,B:build project.
 choice/c:irb 
 if errorlevel 3 goto build
 if errorlevel 2 goto run
 if errorlevel 1 goto init

:init
 echo restore!
 dotnet restore
 goto continue&leave

:run 
 echo run!
REM  dotnet run would pause process
 start cmd /c dotnet run 
 ping -n 3 127.0.0.1>nul
 start  http://localhost:5000
 goto continue&leave

:build
 echo build!
 dotnet build
 goto continue&leave

