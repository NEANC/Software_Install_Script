@Echo off&setlocal,EnableDelayedExpansion

REM ���� Winget �����������Զ�����װ�ű�

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

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
echo:             �ű�����������Ϊ:
echo:             1.�������ԱȨ��
echo:             2.���� Winget �б�Դ
echo:             3.�ڰ�װ���������� Winget �б�Դ
echo:             __________________________________________________      
echo:
echo:             Ps1.�ű���Ҫ��������ֵ����ȷ�ϡ�
echo:             Ps2.����ģʽ��Ҫͨ�� v2rayN ��Ĭ�϶˿ڽ������ؼ���
echo:             [Y] ͬ�� [N] �ܾ�
echo:
echo:       ______________________________________________________________
echo:
set /p Choice=������(Y/N)�Լ���:
IF /i "!Choice!"=="Y" Goto :Next
IF /i "!Choice!"=="N" Goto :End
Echo ������Y/N���밴����������������롣
Pause>Nul&Goto :Choice

REM ����ִ�п�
:Next
start /b .\_internal\initialization.bat
exit /b

REM ��ִֹ�п�
:End
ECHO �û�ȡ����װ�������˳���
taskkill /f /im cmd.exe
exit /b