@ECHO OFF
REM Set local environmental variable for this script.
SETLOCAL

REM Log file.
RMDIR C:\TurtleSift /S /Q
MKDIR C:\TurtleSift
SET LOGFILE=C:\TurtleSift\TurtleSift.log

ECHO Installation of TurtleSift issue tracker plugin for TortoiseSVN. > %LOGFILE% 2>&1
ECHO Installation of TurtleSift issue tracker plugin for TortoiseSVN.

ECHO Copy files. >> %LOGFILE% 2>&1
ECHO Copy files.
SET FILE1=ExampleCsPlugin.dll >> %LOGFILE% 2>&1
SET FILE2=Interop.BugTraqProvider.dll >> %LOGFILE% 2>&1
SET FILE3=SifterApi.dll >> %LOGFILE% 2>&1
SET SOURCEDIR1="%CD%\tortoisesvn contrib issue-tracker-plugin\ExampleCsPlugin\bin\Release\%FILE1%" >> %LOGFILE% 2>&1
SET SOURCEDIR2="%CD%\tortoisesvn contrib issue-tracker-plugin\ExampleCsPlugin\bin\Release\%FILE2%" >> %LOGFILE% 2>&1
SET SOURCEDIR3="%CD%\tortoisesvn contrib issue-tracker-plugin\ExampleCsPlugin\bin\Release\%FILE3%" >> %LOGFILE% 2>&1
COPY %SOURCEDIR1% C:\TurtleSift\ExampleCsPlugin.dll /V /Y >> %LOGFILE% 2>&1
COPY %SOURCEDIR2% C:\TurtleSift\Interop.BugTraqProvider.dll /V /Y >> %LOGFILE% 2>&1
COPY %SOURCEDIR3% C:\TurtleSift\SifterApi.dll /V /Y >> %LOGFILE% 2>&1
COPY unTurtleSift.bat C:\TurtleSift\unTurtleSift.bat /V /Y >> %LOGFILE% 2>&1

ECHO Change to install directory. >> %LOGFILE% 2>&1
ECHO Change to install directory.
CD C:\TurtleSift >> %LOGFILE% 2>&1

ECHO Register COM interface for plugin. >> %LOGFILE% 2>&1
ECHO Register COM interface for plugin.
C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\RegAsm ExampleCsPlugin.dll /codebase /regfile:ExampleCsPlugin.reg >> %LOGFILE% 2>&1

ECHO Add Implemented Categories key. >> %LOGFILE% 2>&1
ECHO Add Implemented Categories key.
SET NEWKEY=[HKEY_CLASSES_ROOT\CLSID\{5870B3F1-8393-4c83-ACED-1D5E803A4F2B}\Implemented Categories\{3494FA92-B139-4730-9591-01135D5E7831}]
ECHO %NEWKEY% >> ExampleCsPlugin.reg

ECHO Back up registry. >> %LOGFILE% 2>&1
ECHO Back up registry.
SET RGBKFILE=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-regbkfile.reg  >> %LOGFILE% 2>&1
REGEDIT /E %RGBKFILE% >> %LOGFILE% 2>&1

ECHO Merge registry keys. >> %LOGFILE% 2>&1
ECHO Merge registry keys.
REGEDIT /S ExampleCsPlugin.reg >> %LOGFILE% 2>&1

ECHO Installation complete: %DATE%. >> %LOGFILE% 2>&1
PAUSE

REM End local environmental variable for this script.
ENDLOCAL
