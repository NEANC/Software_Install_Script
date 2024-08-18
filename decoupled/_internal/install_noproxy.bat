@Echo off&setlocal,EnableDelayedExpansion

REM License
REM 本项目受 Apache License Version 2.0 约束

title 「直连模式」基于 Winget 包管理器的自动化安装脚本

REM 提权命令
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

REM 执行前再次检查是否存在软件列表文件
if not exist "..\software_list.txt" (
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

REM 更换列表源 为 中科大源
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

REM 逐行读取软件列表文件并安装软件
for /f "tokens=* delims=" %%a in (..\software_list.txt) do (
    title 正在安装中......
    ECHO.
    echo 正在安装: %%a
    
    ECHO.
    winget install %%a 
)

REM 重置列表源 为 官方源
ECHO.
winget source reset winget

ECHO.
ECHO 安装结束，请按任意键退出。
pause > nul
exit