@echo off
cd /d "%~dp0"
smartDTE.exe > "%TEMP%\smartDTE-diagnostico.log" 2>&1
type "%TEMP%\smartDTE-diagnostico.log"
echo.
echo Registro: %TEMP%\smartDTE-diagnostico.log
pause
