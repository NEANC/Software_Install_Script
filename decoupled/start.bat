@Echo off&setlocal,EnableDelayedExpansion

REM License
REM 本项目受 Apache License Version 2.0 约束

title 基于 Winget 包管理器的自动化安装脚本

:Choice
cls
ECHO 前言
ECHO 脚本会有以下行为：
ECHO 申请管理员权限，更换 Winget 列表源，并在安装结束后重置 Winget 列表源。
ECHO 脚本会要求您输入值进行确认。
ECHO Ps.代理模式需要通过 v2rayN 的默认端口进行下载加速
set /p Choice=请输入(Y/N)以继续:
IF /i "!Choice!"=="Y" Goto :Next
IF /i "!Choice!"=="N" Goto :End
Echo 请输入Y/N，请按任意键返回重新输入。
Pause>Nul&Goto :Choice

REM 继续执行块
:Next
start .\_internal\initialization.bat
exit /b

REM 终止执行块
:End
ECHO 用户取消安装，正在退出。
exit /b