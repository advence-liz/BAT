:: dir path current file
::%~d0
REM must have this statement
cd %~dp0
 powershell -ExecutionPolicy Unrestricted -file build.ps1

 cd ..

 cd MD

 npm run build