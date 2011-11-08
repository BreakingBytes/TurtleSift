@ECHO OFF
REM Set local environmental variable for this script.
SETLOCAL

REM Log file.
SET LOGFILE=C:\TurtleSift\unTurtleSift.log

ECHO Uninstall TurtleSift issue tracker plugin for TortoiseSVN. > %LOGFILE% 2>&1
ECHO Uninstall TurtleSift issue tracker plugin for TortoiseSVN.

ECHO Change to install directory. >> %LOGFILE% 2>&1
ECHO Change to install directory.
CD C:\TurtleSift >> %LOGFILE% 2>&1

ECHO Back up registry. >> %LOGFILE% 2>&1
ECHO Back up registry.
SET RGBKFILE=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-regbkfile.reg  >> %LOGFILE% 2>&1
REGEDIT /E %RGBKFILE% >> %LOGFILE% 2>&1

SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=* DELIMS= " %%A in (ExampleCsPlugin.reg) do (
SET /A N+=1
SET L!N!=%%A
)
SETLOCAL DISABLEDELAYEDEXPANSION
ECHO %L1% > removeExampleCsPlugin.reg
SET L2=%L2:[=[-%
ECHO %L2% >> removeExampleCsPlugin.reg
ECHO %L3% >> removeExampleCsPlugin.reg
SET L4=%L4:[=[-%
ECHO %L4% >> removeExampleCsPlugin.reg
ECHO %L5% >> removeExampleCsPlugin.reg
SET L6=%L6:[=[-%
ECHO %L6% >> removeExampleCsPlugin.reg
ECHO %L7% >> removeExampleCsPlugin.reg
SET L8=%L8:[=[-%
ECHO %L8% >> removeExampleCsPlugin.reg
ECHO %L9% >> removeExampleCsPlugin.reg
ECHO %L10% >> removeExampleCsPlugin.reg
ECHO %L11% >> removeExampleCsPlugin.reg
ECHO %L12% >> removeExampleCsPlugin.reg
ECHO %L13% >> removeExampleCsPlugin.reg
ECHO %L14% >> removeExampleCsPlugin.reg
SET L15=%L15:[=[-%
ECHO %L15% >> removeExampleCsPlugin.reg
ECHO %L16% >> removeExampleCsPlugin.reg
ECHO %L17% >> removeExampleCsPlugin.reg
ECHO %L18% >> removeExampleCsPlugin.reg
ECHO %L19% >> removeExampleCsPlugin.reg
SET L20=%L20:[=[-%
ECHO %L20% >> removeExampleCsPlugin.reg
ECHO %L21% >> removeExampleCsPlugin.reg
SET L22=%L22:[=[-%
ECHO %L22% >> removeExampleCsPlugin.reg
SET L23=%L23:[=[-%
ECHO %L23% >> removeExampleCsPlugin.reg

ECHO Remove TurtleSift registry keys. >> %LOGFILE% 2>&1
ECHO Remove TurtleSift registry keys.
REGEDIT /S removeExampleCsPlugin.reg >> %LOGFILE% 2>&1

ECHO Unregister COM interface for plugin. >> %LOGFILE% 2>&1
ECHO Unregister COM interface for plugin.
C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\RegAsm ExampleCsPlugin.dll /unregister >> %LOGFILE% 2>&1

ECHO Delete files. >> %LOGFILE% 2>&1
ECHO Delete files.
DEL ExampleCsPlugin.dll >> %LOGFILE% 2>&1
DEL Interop.BugTraqProvider.dll >> %LOGFILE% 2>&1
DEL SifterApi.dll >> %LOGFILE% 2>&1
DEL ExampleCsPlugin.reg >> %LOGFILE% 2>&1
COPY removeExampleCsPlugin.reg removesKeys.txt >> %LOGFILE% 2>&1
DEL removeExampleCsPlugin.reg >> %LOGFILE% 2>&1
DEL unTurtleSift.bat >> %LOGFILE% 2>&1

ECHO Uninstallation complete. >> %LOGFILE% 2>&1
PAUSE

REM End local environmental variable for this script.
ENDLOCAL
