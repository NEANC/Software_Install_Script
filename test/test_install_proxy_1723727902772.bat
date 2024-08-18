@Echo off&setlocal,EnableDelayedExpansion

set "proxy=http://127.0.0.1:1080"
set "testUrl=www.google.com"

:: ��� curl �����Ƿ����
where curl >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: curl command not found. Please install curl and add it to your PATH.
    exit /b 1
)

:: ���Դ���
echo Testing proxy %proxy%...
curl --proxy %proxy% %testUrl%
curl --proxy http://127.0.0.1:10816 www.google.com
:: ��� curl ����ķ���ֵ
if %errorlevel% neq 0 (
    cls
    echo %proxy% ����ʧ��.
) else (
    cls
    echo Proxy %proxy% �����ɹ�.
)
pause