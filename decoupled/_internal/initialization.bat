@Echo off&setlocal,EnableDelayedExpansion

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ������б��ʼ�������� Winget �����������Զ�����װ�ű�

:Choice
REM ����Ƿ��������б��ļ�
if not exist ".\software_list.txt" (
    title ����ʼ��ʧ�ܡ��б��ļ������ڣ�������б��ļ�
    ECHO �б��ļ������ڣ�������б��ļ���
    ECHO �޷�����ִ�У��밴������˳���
    pause > nul
    exit /b )
cls
ECHO ����б��ʼ�����...

title ��ģʽѡ�񡹻��� Winget �����������Զ�����װ�ű�
ECHO ��ѡ��װģʽ��
ECHO 1������ģʽ��2��ֱ��ģʽ��
ECHO    Ps.����ģʽ,����v2rayN���Ҷ˿�����Ϊ10808
set /p Choice=������(1/2):
IF /i "!Choice!"=="1" Goto :1
IF /i "!Choice!"=="2" Goto :2
Echo ������1/2���밴����������������롣
Pause>Nul&Goto :Choice

REM ��������1��ִ�п�
:1
title ������ģʽ��ʼ�������� Winget �����������Զ�����װ�ű�

set proxy=v2rayN.exe

tasklist | find /i "%proxy%" >nul
if %errorlevel% EQU 0 (
    ECHO ���� "%proxy%" �������У����ڽ�����һ����
    start .\_internal\install_proxy.bat
    exit /b
) else (
    ECHO ����"%proxy%"û�����У���"%proxy%"���к��ٳ������д���ģʽ��
    ECHO �밴���������ѡ����档
    Pause>Nul&Goto :Choice )

REM ��������2��ִ�п�
:2
start .\_internal\install_noproxy.bat
exit /b