@echo off
:: ����ѹ��CSS�ļ��ĸ�Ŀ¼���ű����Զ�������β��Һ�ѹ�����е�CSS

echo ��ǰĿ¼�ǣ�%cd%

echo ���ڲ���CSS�ļ�

:: ���ò���CSS��·����Ĭ���ڵ�ǰfolder�½��в���
SET CSSFOLDER=C:\Users\Levey\Desktop\cleanCss\test

chdir /d %CSSFOLDER%

for /r . %%b in (*.min.css) do (
	@echo %%~nb.css
	del %%~nb.css
)

for /r . %%a in (*.css) do (
    @echo ����ѹ�� %%~a ...
    "%~dp0/nodejs/cleancss" "%%~fa" --s1 -o "%%~dpna".css
	pause
)

echo ���!
pause & exit