@Echo off&setlocal,EnableDelayedExpansion

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ������ģʽ������ Winget �����������Զ�����װ�ű�

REM ��Ȩ����
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

REM �ٴμ���Ƿ��������б��ļ�
if not exist "..\software_list.txt" (
    cls
    title ����ʼ��ʧ�ܡ��б��ļ������ڣ�������б��ļ�
    echo:
    echo:
    echo:
    echo:
    echo:       ______________________________________________________________
    echo:
    echo:             ��ʼ��ʧ�ܣ�
    echo:
    echo:             ����: �б��ļ������ڣ�
    echo:             ����start.batͬ�ļ���������б��ļ�
    echo:             �޷�����ִ�У��밴������˳���
    echo:
    echo:       ______________________________________________________________
    echo:
    pause > nul
    taskkill /f /im cmd.exe 
    exit /b )

REM �����б�Դ Ϊ �пƴ�Դ
winget source remove winget
winget source add winget https://mirrors.ustc.edu.cn/winget-source

REM ����winget��������
winget settings --enable ProxyCommandLineOptions

REM ���ж�ȡ����б��ļ�����װ��������Ƽ�http�����ַ
for /f "tokens=* delims=" %%a in (..\software_list.txt) do (
    title ���ڰ�װ��......
    ECHO.
    ECHO ���ڰ�װ: %%a
    ECHO.
    winget install %%a --proxy http://127.0.0.1:10809
    )

REM �����б�Դ Ϊ �ٷ�Դ
ECHO.
winget source reset winget

ECHO.
ECHO ��װ�������밴������˳���
pause > nul
exit