@Echo off&setlocal,EnableDelayedExpansion

REM License
REM 本项目受 Apache License Version 2.0 约束

title 「代理模式」基于 Winget 包管理器的自动化安装脚本

REM 提权命令
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

REM 再次检查是否存在软件列表文件
if not exist "..\software_list.txt" (
    echo 错误：列表文件不存在，请添加列表文件。
    echo 安装失败，请按任意键退出。
    pause > nul
    exit /b )

REM 更换列表源 为 中科大源
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

REM 设置winget代理配置
winget settings --enable ProxyCommandLineOptions

REM 逐行读取软件列表文件并安装软件，且推荐http代理地址
for /f "tokens=* delims=" %%a in (..\software_list.txt) do (
    ECHO 正在安装: %%a
    winget install %%a --proxy http://127.0.0.1:10809
    )

REM 重置列表源 为 官方源
winget source reset winget

ECHO 安装结束，请按任意键退出。
pause > nul
exit