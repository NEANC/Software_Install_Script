@echo off

REM License
REM 本项目受 Apache License Version 2.0 约束

title 「直连模式」基于 Winget 包管理器的自动化安装脚本

ECHO.
ECHO 请注意，安装脚本会进行以下操作：申请管理员权限，更换 Winget 列表源，并在安装结束后重置 Winget 列表源。
ECHO 若同意，请按任意键继续......
pause > nul

REM 提权命令
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

REM 检查是否存在软件列表文件
if not exist "software_list.txt" (
    echo 错误：列表文件不存在，请添加列表文件。
    echo 安装失败，请按任意键退出。
    pause > nul
    exit /b
)

REM 更换列表源 为 中科大源
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

REM 逐行读取软件列表文件并安装软件
for /f "tokens=*" %%a in (software_list.txt) do (
    echo 正在安装: %%a
    winget install %%a 
)

REM 重置列表源
winget source reset --force

ECHO 安装结束，请按任意键退出。
pause > nul
exit