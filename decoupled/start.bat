@Echo off&setlocal,EnableDelayedExpansion

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ���� Winget �����������Զ�����װ�ű�

:Choice
cls
ECHO ǰ��
ECHO �ű�����������Ϊ��
ECHO �������ԱȨ�ޣ����� Winget �б�Դ�����ڰ�װ���������� Winget �б�Դ��
ECHO �ű���Ҫ��������ֵ����ȷ�ϡ�
ECHO Ps.����ģʽ��Ҫͨ�� v2rayN ��Ĭ�϶˿ڽ������ؼ���
set /p Choice=������(Y/N)�Լ���:
IF /i "!Choice!"=="Y" Goto :Next
IF /i "!Choice!"=="N" Goto :End
Echo ������Y/N���밴����������������롣
Pause>Nul&Goto :Choice

REM ����ִ�п�
:Next
start .\_internal\initialization.bat
exit /b

REM ��ִֹ�п�
:End
ECHO �û�ȡ����װ�������˳���
exit /b