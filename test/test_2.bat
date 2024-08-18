REM @echo off

REM License
REM 本项目受 Apache License Version 2.0 约束

title 基于 Winget 包管理器的自动化安装脚本

:start
ECHO.
ECHO 安装脚本会进行以下操作：申请管理员权限，更换 Winget 列表源，并在安装结束后重置 Winget 列表源。

set /p var=yes or no:
echo.
if /i "%var%"=="" goto start
if /i %var%==n goto a0
if /i %var%==N goto a1
if /i %var%==y (goto b0) else (echo 输入错误，请重试。&pause)
if /i %var%==Y (goto b1) else (echo 输入错误，请重试。&pause)
if /i %var%==s (goto b2) else (echo 输入错误，请重试。&pause)
goto start
:a0
:a1
pause
exit /b



goto start
:b
pause
echo start E:\GitHub\Software_Install_Script\Software_Install_Script\software_install_proxy.bat
exit /b