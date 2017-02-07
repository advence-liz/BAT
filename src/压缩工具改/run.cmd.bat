@echo off
:: 设置压缩JS文件的根目录，脚本会自动按树层次查找和压缩所有的JS

echo 当前目录是：%cd%

echo 正在查找JS文件

:: 设置查找JS的路径，默认在当前folder下进行查找
SET JSFOLDER=.\test

chdir /d %JSFOLDER%

for /r . %%b in (*.min.js) do (
	@echo %%~nb.js
	del %%~nb.js
  )

for /r . %%a in (*.js) do (
    @echo 正在压缩 %%~a ...
   call  %~dp0/nodejs/uglifyjs %%~fa -cmo "%%~dpna".min.js
	
)

 @echo "ALL DONE!!!"

 pause & exit