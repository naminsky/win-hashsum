@echo off
setlocal

set /a argc=0
for %%a in ( %* ) do set /a argc+=1

if not %argc%==3 echo "USAGE: hashsum.bat <target-file> <hash-str> <hash-type>" & exit /b 2

for /f "usebackq skip=1" %%i in (`CertUtil -hashfile %1 %3`) do call :sethash %%i

if "%2"=="%hash%" (
  echo %1: OK
) else (
  echo %1: NG
)

endlocal
exit /b



:sethash
rem echo %1
if "%1"=="CertUtil:" exit /b
set hash=%1
exit /b