REM @echo off

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ���� Winget �����������Զ�����װ�ű�

:start
ECHO.
ECHO ��װ�ű���������²������������ԱȨ�ޣ����� Winget �б�Դ�����ڰ�װ���������� Winget �б�Դ��

set /p var=yes or no:
echo.
if /i "%var%"=="" goto start
if /i %var%==n goto a0
if /i %var%==N goto a1
if /i %var%==y (goto b0) else (echo ������������ԡ�&pause)
if /i %var%==Y (goto b1) else (echo ������������ԡ�&pause)
if /i %var%==s (goto b2) else (echo ������������ԡ�&pause)
goto start
:a0
:a1
pause
exit /b



goto start
:b
pause
echo start E:\GitHub\Software_Install_Script\Software_Install_Script\software_install_proxy.bat
exit /b