@Echo off&setlocal,EnableDelayedExpansion

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ������ģʽ������ Winget �����������Զ�����װ�ű�

REM ��Ȩ����
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

REM �ٴμ���Ƿ��������б��ļ�
if not exist "..\software_list.txt" (
    echo �����б��ļ������ڣ�������б��ļ���
    echo ��װʧ�ܣ��밴������˳���
    pause > nul
    exit /b )

REM �����б�Դ Ϊ �пƴ�Դ
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

REM ����winget��������
winget settings --enable ProxyCommandLineOptions

REM ���ж�ȡ����б��ļ�����װ��������Ƽ�http�����ַ
for /f "tokens=* delims=" %%a in (..\software_list.txt) do (
    ECHO ���ڰ�װ: %%a
    winget install %%a --proxy http://127.0.0.1:10809
    )

REM �����б�Դ Ϊ �ٷ�Դ
winget source reset winget

ECHO ��װ�������밴������˳���
pause > nul
exit