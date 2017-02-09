@IF EXIST "%~dp0\node.exe" (
 ::  %n %* 为参数
 ::echo %0 %0代表本批处理文件，其他的限定是基于对本文件的修饰（或者for 中代表文件的变量）
 ::echo %~f0
  %~dp0\node.exe  %~dp0\node_modules\uglify-js\bin\uglifyjs %*
) ELSE (
  node  %~dp0\node_modules\uglify-js\bin\uglifyjs %*
)