@Echo off&setlocal,EnableDelayedExpansion

REM License
REM 本项目受 Apache License Version 2.0 约束

title 「代理模式」基于 Winget 包管理器的自动化安装脚本

REM 提权命令
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

set proxy=v2rayN.exe



REM 检查是否存在软件列表文件
if not exist "..\software_list.txt" (
    echo 错误：列表文件不存在，请添加列表文件。
    echo 安装失败，请按任意键退出。
    pause > nul
    exit /b )

REM 检查 curl 是否存在
where curl >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: curl command not found. Please install curl and add it to your PATH.
    echo 安装失败，请按任意键退出。
    pause > nul
    exit /b )


tasklist | find /i "%proxy%" >nul
if %errorlevel% EQU 0 (
    ECHO 发现 "%proxy%" 正在运行，正在进行代理链接检查
    
    REM 测试代理
    echo Testing proxy %proxyhttp%...
    curl --proxy %proxyhttp% %testUrl%
    curl --proxy http://127.0.0.1:10809 www.google.com

    REM 检查 curl 命令的返回值
    if %errorlevel% neq 0 (
        cls
        ECHO 错误：%proxyhttp% 链接测试失败，请检查 %proxy% 工作状态。
        ECHO 端口号必须设置为10808。
        ECHO 安装失败，请按任意键退出。
        pause > nul
        exit /b
        ) else (
            cls
            ECHO %proxyhttp% 链接测试成功，%proxy% 工作正常。)
    
) else (
    ECHO 错误："%proxy%"没有运行，请"%proxy%"运行后再运行本脚本。
    ECHO 安装失败，请按任意键退出。
    pause > nul
    exit /b )

REM 更换列表源 为 中科大源
REM winget source remove winget
REM winget source add winget https://mirrors.ustc.edu.cn/winget-source

REM 设置winget代理配置
winget settings --enable ProxyCommandLineOptions

REM 逐行读取软件列表文件并安装软件，且推荐http代理地址
for /f "tokens=* delims=" %%a in (..\software_list.txt) do (
    ECHO 正在安装: %%a
    winget install %%a --proxy http://127.0.0.1:10809
    )

REM 重置列表源 为 官方源
REM winget source reset winget

ECHO 安装结束，请按任意键退出。
pause > nul
exit