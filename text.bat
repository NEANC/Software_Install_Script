rem @echo off

rem chcp 65001
set "software=v2rayN.exe"

%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

tasklist | find /i "v2rayN.exe" >nul
if %errorlevel% EQU 0 (
    echo v2rayN �������У����ڽ�����һ��
    
    rem ����winget��������
    winget settings --enable ProxyCommandLineOptions

    rem ���ж�ȡ����б��ļ�����װ���
    for /f "tokens=*" %%a in (software_list.txt) do (
        echo ���ڰ�װ: %%a
        winget install %%a --proxy http://127.0.0.1:10809
    )
) else (
    for /f "tokens=*" %%a in (software_list.txt) do (
        echo ���ڰ�װ: %%a
         winget install %%a
    )
)
ECHO ��װ�������밴������˳���
pause > nul
exit