@Echo off&setlocal,EnableDelayedExpansion

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ������ģʽ������ Winget �����������Զ�����װ�ű�

REM ��Ȩ����
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

set proxy=v2rayN.exe



REM ����Ƿ��������б��ļ�
if not exist "..\software_list.txt" (
    echo �����б��ļ������ڣ�������б��ļ���
    echo ��װʧ�ܣ��밴������˳���
    pause > nul
    exit /b )

REM ��� curl �Ƿ����
where curl >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: curl command not found. Please install curl and add it to your PATH.
    echo ��װʧ�ܣ��밴������˳���
    pause > nul
    exit /b )


tasklist | find /i "%proxy%" >nul
if %errorlevel% EQU 0 (
    ECHO ���� "%proxy%" �������У����ڽ��д������Ӽ��
    
    REM ���Դ���
    echo Testing proxy %proxyhttp%...
    curl --proxy %proxyhttp% %testUrl%
    curl --proxy http://127.0.0.1:10809 www.google.com

    REM ��� curl ����ķ���ֵ
    if %errorlevel% neq 0 (
        cls
        ECHO ����%proxyhttp% ���Ӳ���ʧ�ܣ����� %proxy% ����״̬��
        ECHO �˿ںű�������Ϊ10808��
        ECHO ��װʧ�ܣ��밴������˳���
        pause > nul
        exit /b
        ) else (
            cls
            ECHO %proxyhttp% ���Ӳ��Գɹ���%proxy% ����������)
    
) else (
    ECHO ����"%proxy%"û�����У���"%proxy%"���к������б��ű���
    ECHO ��װʧ�ܣ��밴������˳���
    pause > nul
    exit /b )

REM �����б�Դ Ϊ �пƴ�Դ
REM winget source remove winget
REM winget source add winget https://mirrors.ustc.edu.cn/winget-source

REM ����winget��������
winget settings --enable ProxyCommandLineOptions

REM ���ж�ȡ����б��ļ�����װ��������Ƽ�http�����ַ
for /f "tokens=* delims=" %%a in (..\software_list.txt) do (
    ECHO ���ڰ�װ: %%a
    winget install %%a --proxy http://127.0.0.1:10809
    )

REM �����б�Դ Ϊ �ٷ�Դ
REM winget source reset winget

ECHO ��װ�������밴������˳���
pause > nul
exit