@echo off
setlocal EnableExtensions

set "ROOT=%~dp0.."
set "ENTRY=%ROOT%\bin\antigravity-cli-wakatime.js"

set "NODE_OPTIONS="

if defined NODE_BIN (
  if exist "%NODE_BIN%" (
    "%NODE_BIN%" "%ENTRY%" --background %*
    exit /b %ERRORLEVEL%
  )
)

where node >nul 2>nul
if %ERRORLEVEL%==0 (
  node "%ENTRY%" --background %*
  exit /b %ERRORLEVEL%
)

echo Error: Node.js not found.
echo Install Node.js and ensure it is available in PATH, or set NODE_BIN to node.exe.
exit /b 127
