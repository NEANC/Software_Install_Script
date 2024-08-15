@ECHO off

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ������ģʽ������ Winget �����������Զ�����װ�ű�

ECHO.
ECHO ��ע�⣬��װ�ű���������²������������ԱȨ�ޣ����� Winget �б�Դ�����ڰ�װ���������� Winget �б�Դ��
ECHO ���ű���Ҫͨ�� v2rayN ��Ĭ�϶˿ڽ������ؼ��١�
ECHO ��ͬ���������ݣ��밴�����������
pause > nul

REM ��Ȩ����
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

REM ����Ƿ��������б��ļ�
if not exist "software_list.txt" (
    ECHO �����б��ļ������ڣ�������б��ļ���
    ECHO ��װʧ�ܣ��밴������˳���
    pause > nul
    exit /b
)

REM �����б�Դ Ϊ �пƴ�Դ
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

tasklist | find /i "v2rayN.exe" >nul
if %errorlevel% EQU 0 (
    ECHO ���� v2rayN �������У����ڽ�����һ��

    REM ����winget��������
    winget settings --enable ProxyCommandLineOptions

    REM ���ж�ȡ����б��ļ�����װ��������Ƽ�http�����ַ
    for /f "tokens=*" %%a in (software_list.txt) do (
        ECHO ���ڰ�װ: %%a
        winget install %%a --proxy http://127.0.0.1:10809
    )
) else (
    ECHO ����v2rayNû�����У���v2rayN���к������б��ű���
    ECHO ��װʧ�ܣ��밴������˳���
    pause > nul
    exit
)

REM �����б�Դ Ϊ �ٷ�Դ
winget source reset winget

ECHO ��װ�������밴������˳���
pause > nul
exit