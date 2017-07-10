@echo off
:: 设置压缩CSS文件的根目录，脚本会自动按树层次查找和压缩所有的CSS

echo 当前目录是：%cd%

echo 正在查找CSS文件

:: 设置查找CSS的路径，默认在当前folder下进行查找
SET CSSFOLDER=C:\Users\Levey\Desktop\cleanCss\test

chdir /d %CSSFOLDER%

for /r . %%b in (*.min.css) do (
	@echo %%~nb.css
	del %%~nb.css
)

for /r . %%a in (*.css) do (
    @echo 正在压缩 %%~a ...
    "%~dp0/nodejs/cleancss" "%%~fa" --s1 -o "%%~dpna".css
	pause
)

echo 完成!
pause & exit