@Echo off&setlocal,EnableDelayedExpansion

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ����б��ʼ����......

:Choice
REM ����Ƿ��������б��ļ�
if not exist ".\software_list.txt" (
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
cls
ECHO ����б��ʼ�����...

:Choice
cls
title  ���� Microsoft Winget �����������Զ�����װ�ű�
echo:
echo:
echo:
echo:
echo:       ______________________________________________________________
echo:
echo:             ���� Winget �����������Զ�����װ�ű�
echo:
echo:             ��ѡ��װģʽ��
echo:             [1]����ģʽ
echo:             [2]ֱ��ģʽ
echo:
echo:             [N]�˳���װ
echo:             __________________________________________________      
echo:
echo:             Ps.����ģʽ��Ҫͨ�� v2rayN ��Ĭ�϶˿ڽ������ؼ���
echo:
echo:       ______________________________________________________________
echo:
set /p Choice=������:
IF /i "!Choice!"=="1" Goto :1
IF /i "!Choice!"=="2" Goto :2
IF /i "!Choice!"=="N" Goto :End
Echo ��������ȷ����밴����������������롣
Pause>Nul&Goto :Choice

REM ��������1��ִ�п�
:1
title ����ģʽ��ʼ��......

set proxy=v2rayN.exe

tasklist | find /i "%proxy%" >nul
if %errorlevel% EQU 0 (
    ECHO ���� "%proxy%" �������У����ڽ�����һ����
    start /b .\_internal\install_proxy.bat
    taskkill /f /im cmd.exe
    exit /b
) else (
    cls
    title ������ģʽ��ʼ��ʧ�ܡ�"%proxy%"û�����У�����"%proxy%"���к��ٳ������д���ģʽ
    echo:
    echo:
    echo:
    echo:
    echo:       ______________________________________________________________
    echo:
    echo:             ����ģʽ��ʼ��ʧ�ܣ�
    echo:
    echo:             ����: "%proxy%"û������
    echo:             ���� "%proxy%" ���к��ٳ������д���ģʽ��
    echo:             �밴���������ѡ����档
    echo:
    echo:       ______________________________________________________________
    echo:
    Pause>Nul&Goto :Choice )

REM ��������2��ִ�п�
:2
start /b .\_internal\install_noproxy.bat
taskkill /f /im cmd.exe
exit /b

REM ��ִֹ�п�
:End
ECHO �û�ȡ����װ�������˳���
taskkill /f /im cmd.exe 
exit /b