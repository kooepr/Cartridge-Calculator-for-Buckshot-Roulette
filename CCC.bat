@echo off
title Cooper's Cartidge Calculator
color 0a


echo Welcome to Cooper's Cartridge Calculator!
timeout -t 3 >nopause >nul
title CCC
cls

:prep
cls
set /p LIVES="Number of live rounds: "
set /p BLANKS="Number of blank rounds: "
cls

:exec
cls
color 07
echo %LIVES% Lives
color 08
echo %BLANKS% Blanks

color 0a
set /p SHOT="What was shot: "
if /i %SHOT%==L (
set /a LIVES=%LIVES% - 1
cls
echo A live round was shot!
timeout -t 2 >nopause >nul 
cls
goto exec ) else if /i %SHOT%==B (
set /a BLANKS=%BLANKS% - 1
cls
echo A blank round was shot!
timeout -t 2 >nopause >nul 
cls
goto exec ) else if /i %SHOT%==R (
goto prep ) else (
cls
echo Invalid Input. Check the GitHub ReadMe for valid inputs.
pause
goto exec )
