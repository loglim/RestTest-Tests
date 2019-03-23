@echo off

REM Definitions - environment
set jmeter=java -jar {PATH_TO_JMETER}.jar
set url={SERVER_URL}
set port=8080  
set JMETER_LANGUAGE=-Duser.language="en" -Duser.region="EN"

REM Definitions - colors     
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

REM TEST 1
set test=T1
for /L %%i in (1,1,6) do (
  call :notify "Please restart server, then press enter to run test..."
  pause
  call :notify "Running Test %test%.%%i"  
  %jmeter% -n -t tests\%test%.%%i.jmx -l results\log_%test%.%%i.jtl -H %url% -P %port%
)

REM TEST 2    
call :RunTest T2 4 4  

REM TEST 3    
call :RunTest T3 2 4

REM TEST 4    
call :RunTest T4 4 4

call :notify "All tests are completed"
pause    
goto :eof

:RunTest test iterations subiterations
for /L %%i in (1,1,%~2) do (
  for /L %%j in (1,1,%~3) do (
    call :notify "Running Test %~1.%%i.%%j"  
    %jmeter% -n -t tests\%~1.%%i.%%j.jmx -l results\log_%~1.%%i.%%j.jtl -H %url% -P %port%
  )
)
goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof

:notify message
echo ------------------------------------------------------------
call :ColorText 0a "--- %~1 --"
echo -
echo ------------------------------------------------------------
goto :eof
REM exit /B 0