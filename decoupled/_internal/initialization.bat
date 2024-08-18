@Echo off&setlocal,EnableDelayedExpansion

REM License
REM 本项目受 Apache License Version 2.0 约束

title 软件列表初始化中......

:Choice
REM 检查是否存在软件列表文件
if not exist ".\software_list.txt" (
    cls
    title 「初始化失败」列表文件不存在，请添加列表文件
    echo:
    echo:
    echo:
    echo:
    echo:       ______________________________________________________________
    echo:
    echo:             初始化失败！
    echo:
    echo:             错误: 列表文件不存在！
    echo:             请在start.bat同文件夹内添加列表文件
    echo:             无法继续执行，请按任意键退出。
    echo:
    echo:       ______________________________________________________________
    echo:
    pause > nul
    taskkill /f /im cmd.exe 
    exit /b )
cls
ECHO 软件列表初始化完成...

:Choice
cls
title  基于 Microsoft Winget 包管理器的自动化安装脚本
echo:
echo:
echo:
echo:
echo:       ______________________________________________________________
echo:
echo:             基于 Winget 包管理器的自动化安装脚本
echo:
echo:             请选择安装模式：
echo:             [1]代理模式
echo:             [2]直连模式
echo:
echo:             [N]退出安装
echo:             __________________________________________________      
echo:
echo:             Ps.代理模式需要通过 v2rayN 的默认端口进行下载加速
echo:
echo:       ______________________________________________________________
echo:
set /p Choice=请输入:
IF /i "!Choice!"=="1" Goto :1
IF /i "!Choice!"=="2" Goto :2
IF /i "!Choice!"=="N" Goto :End
Echo 请输入正确命令，请按任意键返回重新输入。
Pause>Nul&Goto :Choice

REM 满足条件1：执行块
:1
title 代理模式初始化......

set proxy=v2rayN.exe

tasklist | find /i "%proxy%" >nul
if %errorlevel% EQU 0 (
    ECHO 发现 "%proxy%" 正在运行，正在进行下一步。
    start /b .\_internal\install_proxy.bat
    taskkill /f /im cmd.exe
    exit /b
) else (
    cls
    title 「代理模式初始化失败」"%proxy%"没有运行，请在"%proxy%"运行后再尝试运行代理模式
    echo:
    echo:
    echo:
    echo:
    echo:       ______________________________________________________________
    echo:
    echo:             代理模式初始化失败！
    echo:
    echo:             错误: "%proxy%"没有运行
    echo:             请在 "%proxy%" 运行后再尝试运行代理模式；
    echo:             请按任意键返回选择界面。
    echo:
    echo:       ______________________________________________________________
    echo:
    Pause>Nul&Goto :Choice )

REM 满足条件2：执行块
:2
start /b .\_internal\install_noproxy.bat
taskkill /f /im cmd.exe
exit /b

REM 终止执行块
:End
ECHO 用户取消安装，正在退出。
taskkill /f /im cmd.exe 
exit /b