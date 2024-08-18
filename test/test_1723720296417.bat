@echo off
set /p user_input=Please enter yes/y to continue or no/n to stop: 
if /i "%user_input%" == "yes" (
    echo You chose to continue.
    rem 这里可以添加你需要执行的命令或者脚本
) else if /i "%user_input%" == "y" (
    echo You chose to continue.
    rem 这里可以添加你需要执行的命令或者脚本
) else if /i "%user_input%" == "no" (
    echo You chose to stop.
    goto :eof
) else if /i "%user_input%" == "n" (
    echo You chose to stop.
    goto :eof
) else (
    echo Invalid input. Please try again.
    goto :eof
)