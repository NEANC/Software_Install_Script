@Echo off&setlocal,EnableDelayedExpansion

REM 基于 Winget 包管理器的自动化安装脚本

REM License
REM 本项目受 Apache License Version 2.0 约束

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
echo:             脚本会有以下行为:
echo:             1.申请管理员权限
echo:             2.更换 Winget 列表源
echo:             3.在安装结束后重置 Winget 列表源
echo:             __________________________________________________      
echo:
echo:             Ps1.脚本会要求您输入值进行确认。
echo:             Ps2.代理模式需要通过 v2rayN 的默认端口进行下载加速
echo:             [Y] 同意 [N] 拒绝
echo:
echo:       ______________________________________________________________
echo:
set /p Choice=请输入(Y/N)以继续:
IF /i "!Choice!"=="Y" Goto :Next
IF /i "!Choice!"=="N" Goto :End
Echo 请输入Y/N，请按任意键返回重新输入。
Pause>Nul&Goto :Choice

REM 继续执行块
:Next
start /b .\_internal\initialization.bat
exit /b

REM 终止执行块
:End
ECHO 用户取消安装，正在退出。
taskkill /f /im cmd.exe
exit /b