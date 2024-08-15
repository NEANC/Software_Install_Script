@echo off
set "software=v2rayN.exe"

tasklist | find /i "%software%" >nul
if %errorlevel% EQU 0 (
    echo %software% is running.
    rem 这里可以添加更多的命令继续执行
    winget settings --enable ProxyCommandLineOptions

    REM 逐行读取软件列表文件并安装软件
    for /f "tokens=*" %%a in (software_list.txt) do (
        echo 正在安装: %%a
    winget install %%a --proxy http://127.0.0.1:10809
)
) else (
    echo %software% is not running. Exiting script.
    exit /b
)