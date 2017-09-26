@echo off
color 2
start cmd /c npm run start-server
ping -n 3 127.0.0.1
start http://localhost:9000/
exit


REM echo start webpack-dev-server
REM title webpack-dev-server
REM node ..\..\node_modules\webpack-dev-server\bin\webpack-dev-server --inline --hot