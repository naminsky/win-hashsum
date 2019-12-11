@echo off
setlocal

set file=dummy.txt
set hash=615a3c9d156504f2b757b5be8aace03ead845895
set type=SHA1

echo expect OK...
call hashsum.bat %file% %hash% %type%
echo.
echo expect NG...
call hashsum.bat %file% foobar %type%

endlocal
pause
exit /b