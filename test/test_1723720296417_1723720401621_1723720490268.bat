@echo off

REM License
REM ����Ŀ�� Apache License Version 2.0 Լ��

title ���� Winget �����������Զ�����װ�ű�

:begin
set /p user_input=������ y/n���Լ�����
set "user_input=%user_input:~0,1%" 

if /i "%user_input%" == "Y" (
    set "user_input=yes"
) else if /i "%user_input%" == "N" (
    set "user_input=no"
)

if /i "%user_input%" == "yes" (
    echo You chose to continue.
    rem ��������������Ҫִ�е�������߽ű�
    goto :eof
) else if /i "%user_input%" == "no" (
    echo You chose to stop.
    goto :eof
) else (
    echo Invalid input. Please try again.
    goto begin
)