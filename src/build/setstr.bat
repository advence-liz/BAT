set buildpath=%cd%

set liz="c://ddd%buildpath%";
set cc="ccccc://ddbuildpaht";
echo %cc%
echo %liz%

@ECHO OFF
set buildpath=%cd%
echo starting
cd ../../server/VCControl
call npm install
for /f "delims=" %%a in (..\..\server\ManagerBuild\BuildJSXPathList.txt) do (
    cd ../../
    @echo %%~a
    cd %%~a
    call npm run scm
    @echo complete 
    cd %buildpath%
    @echo %buildpath% 
)
@echo complete build