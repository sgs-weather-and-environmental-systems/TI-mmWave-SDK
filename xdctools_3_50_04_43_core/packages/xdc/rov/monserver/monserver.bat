@echo off

setlocal
set root=%~dp0

rem cd to monserver package base to get it's repo on the package path
cd %root%

rem run xs
if defined XDCROOT (
    %XDCROOT%/xs.exe -Djava.library.path="%root%/Windows/i368-mingw32" %* xdc.rov.monserver
) else (
    xs.exe -Djava.library.path="%root%/Windows/i368-mingw32" %* xdc.rov.monserver
)
if errorlevel 1 exit /b 1
exit /b 0
