@echo off
title %~nx0

for /f "delims=" %%E in ('forfiles /p "%~dp0." /m "%~nx0" /c "cmd /c echo(0x1B"') do (
    set ESC=%%E
)
set BLUE=%ESC%[33m
set ENDC=%ESC%[0m
set RED=%ESC%[91m
REM Colors: https://docs.microsoft.com/en-us/windows/console/console-virtual-terminal-sequences#span-idtextformattingspanspan-idtextformattingspanspan-idtextformattingspantext-formatting

net.exe session 1>nul 2>nul || (
echo This script requires administrative rights.
pause
exit /b 1
)

set path=%~dp0
set backuppath=%path%_retail_\WTF
set backuplocation=%path%_retail_WTF-Backups
set taskname=World of Warcraft Automatic WTF Backup

REM Backup WTF folder
"X:\Programs\7-Zip\7z.exe" a -t7z "%backuplocation%\WTF_%DATE%.zip" "%backuppath%"

schtasks /query /TN "%taskname%" >nul 2>&1
if not %errorlevel% == 0 ( goto CreateTask )
exit

:CreateTask
cls
echo %backuplocation%\WTF_%DATE%.zip
echo.
echo First time launch detected!
echo Adding the script to Windows Task Scheduler for automatic run.
echo Task has been added as "%BLUE%%taskname%%ENDC%",
echo and set to run every Tuesday and Saturday at 02:00 (AM).
echo.
echo %RED%You can always edit or remove this again, by pressing the Windows key, and searching for "Task Scheduler".%ENDC%
echo %RED%You will find the task under "Task Scheduler Library" under the name listed above.%ENDC%
echo.
echo Status:
schtasks /Create /SC WEEKLY /D TUE,SAT /TN "%taskname%" /TR "%path%%~nx0" /ST 02:00 /RL HIGHEST
echo.
echo.
pause

