@echo off 
set /p input=AorB： 
if "%input%"=="A" goto A 
if "%input%"=="B" goto B 
pause 
exit 

:A 
echo is A 
pause 
exit 

:B 
echo is B 
pause 
REM exit 　

