@Echo off&setlocal,EnableDelayedExpansion

set "proxy=http://127.0.0.1:1080"
set "testUrl=www.google.com"

:: 检查 curl 命令是否存在
where curl >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: curl command not found. Please install curl and add it to your PATH.
    exit /b 1
)

:: 测试代理
echo Testing proxy %proxy%...
curl --proxy %proxy% %testUrl%
curl --proxy http://127.0.0.1:10816 www.google.com
:: 检查 curl 命令的返回值
if %errorlevel% neq 0 (
    cls
    echo %proxy% 连接失败.
) else (
    cls
    echo Proxy %proxy% 工作成功.
)
pause