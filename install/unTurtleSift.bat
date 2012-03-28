@ECHO OFF
REM Set local environmental variable for this script.
SETLOCAL

REM Log file.
TITLE UNTURTLESIFT
SET LOGFILE="%CD%\unTurtleSift.log"

ECHO Uninstall TurtleSift issue tracker plugin for TortoiseSVN. > %LOGFILE% 2>&1
ECHO Uninstall TurtleSift issue tracker plugin for TortoiseSVN.

ECHO Change to install directory. >> %LOGFILE% 2>&1
ECHO Change to install directory.
SET ROOTDIR=%CD%
SET ROOTDIR=%ROOTDIR:\install=%
SET ROOTDIR=%ROOTDIR:\INSTALL=%
CD "%ROOTDIR%\SRC\BIN\RELEASE" >> %LOGFILE% 2>&1

ECHO Back up registry. >> %LOGFILE% 2>&1
ECHO Back up registry.
SET RGBKFILE=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-regbkfile.reg  >> %LOGFILE% 2>&1
REGEDIT /E %RGBKFILE% >> %LOGFILE% 2>&1

SETLOCAL ENABLEDELAYEDEXPANSION
SET LINE=
FOR /F "TOKENS=* DELIMS= " %%A IN (TurtleSift.reg) DO (
SET LINE=%%A
SET LINE=!LINE:[HKEY=[-HKEY!
ECHO !LINE! >> removeTurtleSift.reg
)
SETLOCAL DISABLEDELAYEDEXPANSION

ECHO Remove TurtleSift registry keys. >> %LOGFILE% 2>&1
ECHO Remove TurtleSift registry keys.
REGEDIT /S removeTurtleSift.reg >> %LOGFILE% 2>&1

ECHO Unregister COM interface for plugin. >> %LOGFILE% 2>&1
ECHO Unregister COM interface for plugin.
C:\WINDOWS\Microsoft.NET\Framework64\v4.0.30319\RegAsm TurtleSift.dll /unregister >> %LOGFILE% 2>&1

ECHO Uninstallation complete. >> %LOGFILE% 2>&1
PAUSE

REM End local environmental variable for this script.
ENDLOCAL
