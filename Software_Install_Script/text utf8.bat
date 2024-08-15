@echo off
chcp 65001
set "software=v2rayN.exe"

%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

tasklist | find /i "v2rayN.exe" >nul
if %errorlevel% EQU 0 (
    echo v2rayN 正在运行，正在进行下一步
    
    rem 设置winget代理配置
    winget settings --enable ProxyCommandLineOptions

    rem 逐行读取软件列表文件并安装软件
    for /f "tokens=*" %%a in (software_list.txt) do (
        echo 正在安装: %%a
        winget install %%a --proxy http://127.0.0.1:10809
    )
) else (
    echo 错误：v2rayN 没有运行，请按任意键退出。
    pause > nul
    exit /b
)
pause