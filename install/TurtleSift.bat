@ECHO OFF
REM Set local environmental variable for this script.
SETLOCAL

REM Log file.
TITLE TURTLESIFT
SET LOGFILE="%CD%\TurtleSift.log"

ECHO Installation of TurtleSift issue tracker plugin for TortoiseSVN. > %LOGFILE% 2>&1
ECHO Installation of TurtleSift issue tracker plugin for TortoiseSVN.

ECHO Change to src\bin\Release directory. >> %LOGFILE% 2>&1
ECHO Change to src\bin\Release directory.
SET ROOTDIR=%CD%
SET ROOTDIR=%ROOTDIR:\install=%
SET ROOTDIR=%ROOTDIR:\INSTALL=%
CD "%ROOTDIR%\SRC\BIN\RELEASE" >> %LOGFILE% 2>&1

ECHO Register COM interface for plugin. >> %LOGFILE% 2>&1
ECHO Register COM interface for plugin.
C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\RegAsm TurtleSift.dll /codebase /regfile:TurtleSift.reg >> %LOGFILE% 2>&1

ECHO Add Implemented Categories key. >> %LOGFILE% 2>&1
ECHO Add Implemented Categories key.
SET NEWKEY=[HKEY_CLASSES_ROOT\CLSID\{5870B3F1-8393-4c83-ACED-1D5E803A4F2B}\Implemented Categories\{3494FA92-B139-4730-9591-01135D5E7831}]
ECHO %NEWKEY% >> TurtleSift.reg

ECHO Back up registry. >> %LOGFILE% 2>&1
ECHO Back up registry.
SET RGBKFILE=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-regbkfile.reg  >> %LOGFILE% 2>&1
REGEDIT /E %RGBKFILE% >> %LOGFILE% 2>&1

ECHO Merge registry keys. >> %LOGFILE% 2>&1
ECHO Merge registry keys.
REGEDIT /S TurtleSift.reg >> %LOGFILE% 2>&1

ECHO Installation complete: %DATE%. >> %LOGFILE% 2>&1
PAUSE

REM End local environmental variable for this script.
ENDLOCAL
