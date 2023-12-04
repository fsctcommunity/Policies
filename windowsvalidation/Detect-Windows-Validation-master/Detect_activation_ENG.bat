@echo off
for /f "tokens=3 delims=: " %%a in (
		'cscript //nologo "%systemroot%\system32\slmgr.vbs" /dli ^| find "License Status:"' 
) do set "licenseStatus=%%a"

if /i "%licenseStatus%"=="Licensed" (
	echo yes
) else (
	echo no
)