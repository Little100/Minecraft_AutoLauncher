:: GayMC AutoLauncher
:: Created by Little_100
@echo off
chcp 65001
echo "Created by Little_100"
echo "程序即将开始执行，请确保你使用的原生客户端"

set /p choice=输入1. 进入含有注册"&"登录的步骤 输入2.跳过注册"&"登录的步骤 。
if "%choice%"=="1" (
    goto CONTINUE
) else if "%choice%"=="2" (
    goto ASK
) else (
    echo "无效的输入，正在退出脚本..."
    pause
    exit
)
:CONTINUE
cls
start https://www.bilibili.com/video/BV1sQ4y117G6/
start https://littleskin.cn/
msg * 请看视频操作然后自行完成注册 不要问任何其他问题了 谢谢理解
echo "请问您是否有客户端"
set /p choice=输入1. 进入下载页面 输入2.有文件并跳过下载 。
if "%choice%"=="1" (
    goto ASK
) else if "%choice%"=="2" (
    goto NEXT
) else (
    echo "无效的输入，正在退出脚本..."
    pause
    exit
)
:END
:ASK
echo "请问您是否有客户端"
set /p choice=输入1. 进入下载页面 输入2.有文件并跳过下载 。
if "%choice%"=="1" (
    goto ASK1
) else if "%choice%"=="2" (
    goto NEXT
) else (
    echo "无效的输入，正在退出脚本..."
    pause
    exit
)
:ASK1
cls
msg * 请您下载完文件之后把下载的文件放置到和此文件同目录(同文件夹下)
echo "即将为你的网络进行测速(两次) 你准备好了吗？如果您知道自己的网络速度 那么请选择S并且输入您的网络速度(Y/N/S)"
choice /C:YS /M "选择Y继续，S跳过测速并输入自己的网络速度"
if errorlevel 2 goto then
if errorlevel 1 goto DNEXT
:DNEXT
start https://www.speedtest.cn/
echo "请等待测试完成..."
echo "完成后请按任意键继续(下一个测速点)"
pause >nul
start https://test.ustc.edu.cn/
goto :then
:then
set /p userValue=两次测试最大的下行(下载)速度(Mbps):
if not defined userValue goto then
if not "%userValue:~0,1%"=="" (
    set "isNumber=true"
    for %%N in ("%userValue%") do (
        if not "%%N"=="0" if not "%%N"=="1" if not "%%N"=="2" if not "%%N"=="3" if not "%%N"=="4" if not "%%N"=="5" if not "%%N"=="6" if not "%%N"=="7" if not "%%N"=="8" if not "%%N"=="9" (
            set "isNumber=false"
        )
    )
    if "!isNumber!"=="false" (
        echo "输入无效，请输入一个数字。"
        goto then
    )
)
if %userValue% leq 300 (
    echo "正在为您跳转适合您的网络文件"
    start https://www.123pan.com/s/qVjgjv-xrUkd.html
) else (
    echo "正在为您跳转适合您的网络文件"
    start https://www.123pan.com/s/qVjgjv-prUkd.html
)
:END
:NEXT
echo "请您等客户端下载完毕,并放置到正确的位置"
echo "程序即将执行自动解压，此过程会覆盖本目录下的"客户端"同名文件，是否继续？(Y/N)"
choice /C:Y /M "选择Y继续"
if errorlevel 1 goto UNEXT1
:UNEXT1
echo "正在解压文件..."
set "a=0"

for /f "tokens=2 delims=[]. " %%a in ('ver') do (
    set "version=%%a"
)
set /a major=version %% 100
set /a minor=(version / 100) %% 100

if %major% lss 10 if %minor% lss 0 (
    set "a=0"
) else (
    set "a=1"
)
if %a% == 1 (
    goto :UNEXT
) else (
    msg * 您不是 Windows 10 及以上版本，请您自行解压并把客户端放置到%parentDir%中！(解压出的文件名字必须是“客户端”)
    exit /b
)
:UNEXT
set ZIPFILE=客户端.zip
set EXTRACT_TO=客户端

if not exist "%ZIPFILE%" (
    echo "ZIP文件不存在: %ZIPFILE%"
    set EXTRACT_TO=客户端
)

if not exist "%EXTRACT_TO%" (
    echo "目标路径不存在，正在创建: %EXTRACT_TO%"
    mkdir "%EXTRACT_TO%"
)

taskkill /f /t /im "Plain Craft Launcher 2.exe"
taskkill /f /t /im "PCL2.exe"
taskkill /f /t /im "OPL_WpfApp.exe"
echo "正在解压文件: %ZIPFILE%"
echo "解压到: %EXTRACT_TO%"
powershell -Command "Expand-Archive -LiteralPath '%ZIPFILE%' -DestinationPath '%EXTRACT_TO%' -Force"
cls
echo "解压完成。"

endlocal
:END

echo "程序即将执行自动打开PCL2启动器，这将会杀死你原有的PCL2进程，继续(Y)"
choice /C:Y /M "选择Y继续"
if errorlevel 1 goto STARTPCL2
:STARTPCL2
cd 客户端
taskkill /f /t /im "Plain Craft Launcher 2.exe"
taskkill /f /t /im "PCL2.exe"
start cmd /k ""Plain Craft Launcher 2.exe""
timeout /t 0.5 /nobreak >nul
msg * 现在你需要点击“开始游戏” tips:如果你没有显示账号请登录你在开头注册的账号
:END

echo "程序即将执行自动启动p2p，继续(Y)"
choice /C:Y /M "选择Y继续"
if errorlevel 1 STARTP2P
:STARTP2P
taskkill /f /t /im "OPL_WpfApp.exe"
start cmd /k "OPL_WpfApp.exe" -on
set "textToCopy=127.0.0.1:25565"
where clip >nul 2>&1
echo %textToCopy% | clip
msg * 请你检查右上角的圆圈是否变为绿色 变为绿色后从我的世界多人游戏中输入"127.0.0.1:25565"(已经复制到您的剪贴板 您直接Ctrl V即可粘贴)
:END
echo "结束程序执行。"
pause
