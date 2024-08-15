@echo off

REM License
REM 本项目受 Apache License Version 2.0 约束

title 基于 Winget 包管理器的自动化安装脚本

:begin
set /p user_input=请输入 y/n，以继续：
set "user_input=%user_input:~0,1%" 

if /i "%user_input%" == "Y" (
    set "user_input=yes"
) else if /i "%user_input%" == "N" (
    set "user_input=no"
)

if /i "%user_input%" == "yes" (
    echo You chose to continue.
    rem 这里可以添加你需要执行的命令或者脚本
    goto :eof
) else if /i "%user_input%" == "no" (
    echo You chose to stop.
    goto :eof
) else (
    echo Invalid input. Please try again.
    goto begin
)