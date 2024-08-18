@echo off
:begin
set /p user_input=Please enter yes/y to continue or no/n to stop: 
set "user_input=%user_input:~0,1%"
set "user_input=%user_input:y=yes%"
set "user_input=%user_input:n=no%"

if /i "%user_input%" == "yes" (
    echo You chose to continue.
    rem 这里可以添加你需要执行的命令或者脚本
    goto :eof
) else if /i "%user_input%" == "no" (
    echo You chose to stop.
    goto :eof
) else (
    echo Invalid input. Please try again.
    goto begin
)