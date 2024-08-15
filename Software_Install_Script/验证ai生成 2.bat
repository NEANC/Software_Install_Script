@echo off
set "software=v2rayN.exe"

rem 检查winget是否存在
where winget >nul
if %errorlevel% NEQ 0 (
    echo winget is not installed or not in the PATH. Please install it.
    exit /b 1
)

rem 读取代理配置
set "proxy=http://127.0.0.1:10809"
rem 如果需要可以通过环境变量或配置文件来设置代理
rem set "proxy=%PROXY%"

tasklist | find /i "%software%" >nul
if %errorlevel% EQU 0 (
    echo %software% is running.
    
    rem 设置winget代理配置
    winget settings --enable ProxyCommandLineOptions
    if %errorlevel% NEQ 0 (
        echo Failed to enable winget proxy settings.
        exit /b 1
    )

    rem 逐行读取软件列表文件并安装软件
    for /f "tokens=*" %%a in (software_list.txt) do (
        echo 正在安装: %%a
        winget install %%a --proxy %proxy%
        if %errorlevel% NEQ 0 (
            echo Failed to install %%a
        )
    )
) else (
    echo %software% is not running. Exiting script.
    exit /b
)