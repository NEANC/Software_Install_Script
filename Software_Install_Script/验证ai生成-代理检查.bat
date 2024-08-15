@echo off
setlocal EnableDelayedExpansion

rem 定义软件列表文件路径
set "proxysoftwarelist=proxy_software_list.txt"

rem 检查文件是否存在
if not exist "%proxysoftware%" (
    echo Error: File %proxysoftware% does not exist.
    exit /b
)

rem 读取并检查每个软件
for /f "tokens=*" %%s in ("%proxysoftware%") do (
    set "software=%%s"
    tasklist | find /i "!software!" >nul
    if %errorlevel% NEQ 0 (
        echo !software! is not running. Exiting script.
        exit /b
    )
)

echo All required software is running.
rem 这里可以添加更多的命令继续执行