@echo off

findstr "10.2.165.40" C:\Windows\System32\drivers\etc\hosts > dns.txt

set "paths=dns.txt"
for %%a in ("%paths%") do (
     if "%%~za" equ "0" (
        echo ip not exist
        @echo #  >>C:\Windows\System32\drivers\etc\hosts
        @echo 10.2.165.40   demo.api.com >>C:\Windows\System32\drivers\etc\hosts 
      
        ) else (
       echo ip exist
     )
)
  del dns.txt
  start http://demo.api.com
pause
