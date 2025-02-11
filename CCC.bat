@echo off
title Cooper's Cartidge Calculator
color 0a


echo Welcome to Cooper's Cartridge Calculator!
timeout -t 3 >nopause >nul
title CCC
cls

:prep
set /a shellcounter=0
set /a whichshell=0
set /a whatshell=0
cls
set /p LIVES="Number of live rounds: "
set /p BLANKS="Number of blank rounds: "
cls


:exec
cls
echo %LIVES% Lives
echo %BLANKS% Blanks
if %shellcounter%==%whichshell% (
if /i %whatshell%==L ( 
	echo This shell is LIVE.
) else if /i %whatshell%==B (
	echo This shell is BLANK.
) 
)

color 0a
set /p SHOT="Action: "
if /i %SHOT%==L (
	set /a LIVES=%LIVES% - 1
	cls
	echo A live round was discharged!
	timeout -t 2 >nopause >nul 
	cls
	set /a shellcounter=%shellcounter% + 1
	goto exec 
) else if /i %SHOT%==B (
	set /a BLANKS=%BLANKS% - 1
	cls
	echo A blank round was discharged!
	timeout -t 2 >nopause >nul 
	cls
	set /a shellcounter=%shellcounter% + 1
	goto exec 
) else if /i %SHOT%==R (
	goto prep
) else if /i %SHOT%==I (
	goto invert
) else if /i %SHOT%==P (
	goto phone
) else (
cls
echo Invalid Input. Check the GitHub ReadMe for valid inputs.
pause
goto exec )

:invert
cls
echo A polarizer was used.
set /p POL="After polarization, what was shot?: "
if /i %POL%==L (
set /a BLANKS=%BLANKS% - 1
set /a shellcounter=%shellcounter% + 1
goto exec
) else if /i %POL%==B (
set /a LIVES=%LIVES% - 1
set /a shellcounter=%shellcounter% + 1
goto exec
) else if /i %POL%==C (
goto exec
) else (
echo echo Invalid Input. Check the GitHub ReadMe for valid inputs.
pause
goto invert
)


:phone
set /a shellcounter=0
set /p whichshell="Which shell: (1-15)"
set /p whatshell="What type: (L/B)"
if /i %whichshell%==C (
	goto exec
) else if /i %whatshell%==C (
	goto exec
)
echo Noted!
timeout -t 2 >nopause >nul
goto exec
