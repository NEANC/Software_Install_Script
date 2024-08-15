@Echo off&setlocal,EnableDelayedExpansion

REM License
REM 本项目受 Apache License Version 2.0 约束

title 「软件列表初始化」基于 Winget 包管理器的自动化安装脚本

:Choice
REM 检查是否存在软件列表文件
if not exist ".\software_list.txt" (
    title 「初始化失败」列表文件不存在，请添加列表文件
    ECHO 列表文件不存在，请添加列表文件。
    ECHO 无法继续执行，请按任意键退出。
    pause > nul
    exit /b )
cls
ECHO 软件列表初始化完成...

title 「模式选择」基于 Winget 包管理器的自动化安装脚本
ECHO 请选择安装模式：
ECHO 1：代理模式，2：直连模式。
ECHO    Ps.代理模式,仅限v2rayN，且端口设置为10808
set /p Choice=请输入(1/2):
IF /i "!Choice!"=="1" Goto :1
IF /i "!Choice!"=="2" Goto :2
Echo 请输入1/2，请按任意键返回重新输入。
Pause>Nul&Goto :Choice

REM 满足条件1：执行块
:1
title 「代理模式初始化」基于 Winget 包管理器的自动化安装脚本

set proxy=v2rayN.exe

tasklist | find /i "%proxy%" >nul
if %errorlevel% EQU 0 (
    ECHO 发现 "%proxy%" 正在运行，正在进行下一步。
    start .\_internal\install_proxy.bat
    exit /b
) else (
    ECHO 错误："%proxy%"没有运行，请"%proxy%"运行后再尝试运行代理模式。
    ECHO 请按任意键返回选择界面。
    Pause>Nul&Goto :Choice )

REM 满足条件2：执行块
:2
start .\_internal\install_noproxy.bat
exit /b