@echo off
SET scriptFileName=%~n0
SET scriptFolderPath=%~dp0
SET powershellScriptFileName=%scriptFileName%.ps1
SET "mycommand=Set-Location '%scriptFolderPath%' ; .\%powershellScriptFileName%"

REM Check if the PowerShell script exists
if not exist "%scriptFolderPath%%powershellScriptFileName%" (
    echo PowerShell script %powershellScriptFileName% not found in %scriptFolderPath%.
    pause
    exit /b 1
)

REM run powershell script WITH THE SAME NAME
powershell -NoProfile -Command "& {Start-Process powershell -ArgumentList '-NoProfile', '-ExecutionPolicy', 'Bypass', '-Command', \"%mycommand%\" -Verb RunAs}"

if %ERRORLEVEL% neq 0 (
    echo Failed to start PowerShell 7 script with admin rights.
    pause
    exit /b 1
)
