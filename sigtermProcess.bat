@REM @author 		Onofrio Falco
@REM @description 	Kill a process on Windows if it's running on specific port
@REM @date 			Jun 2017
@REM @version 		1.0
@REM
@REM Usage:
@REM 	nport 	- Input port number
@REM

@echo off
setlocal enableextensions enabledelayedexpansion
set /p nport="Enter port number: "
echo %nport%|findstr /xr "[1-9][0-9]* 0" >nul && (
	echo %nport% is a valid number
	GOTO :exec
) || (
	echo.
	echo @author: f.onofrio@reply.it
	echo @description: Kill process on Windows if It's running on specific port number;
	echo.
	echo Usage:
	echo 	[nport]  Port number where the process is running;
	echo.
	GOTO :esci
)
:exec
FOR /F "tokens=4 delims= " %%P IN ('netstat -a -n -o ^| findstr :%nport%') DO @ECHO TaskKill.exe /PID %%P
:esci
pause

