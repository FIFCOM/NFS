@ECHO OFF
REM  QBFC Project Options Begin
REM HasVersionInfo: Yes
REM Companyname: Fifcom Systems Incorporated
REM Productname: NFS Internet Speeder
REM Filedescription: NFS Internet Speeder
REM Copyrights: Fifcom Systems Incorporated
REM Trademarks: Fifcom Systems Incorporated
REM Originalname: NFS.exe
REM Comments: NFS Internet Speeder
REM Productversion:  5. 1. 0. 0
REM Fileversion:  5. 1. 0. 0
REM Internalname: NFS Internet Speeder
REM ExeType: console
REM Architecture: x86
REM Appicon: E:\DevelopFiles\NFS-v4\NFS.ico
REM AdministratorManifest: Yes
REM  QBFC Project Options End
@ECHO ON
@echo off
setlocal ENABLEDELAYEDEXPANSION
title NFS Project
mode con: cols=65 lines=25
color 8b


::检查更新
:update
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS_Version.txt ^|C:\Windows\System32\findstr /i "version"') do set localversion=%%b
cls
:update_1
cls
echo.
echo.      NFS Initializing ...
echo.   ___________________________________________________________
echo.
echo.
echo.      NFS 正在初始化，请稍等...
:update_2
::下载版本文件
C:\NFS\curl -sL http://www.fifcom.tk/softs-fifcom-cn-mirror/NFS/NFS.txt -o "C:\NFS\NFS.txt"
:update_3
::对比当前版本和服务器版本
for /f "delims== tokens=1*" %%a in ('type "C:\NFS\NFS.txt" ^|C:\Windows\System32\findstr /i "serverversion"') do set serverversion=%%b
if "%serverversion%"=="in_maintenance" goto in_maintenance
if "%serverversion%"=="svcstop" goto svcstop
if "%localversion%"=="%serverversion%" goto verify_install
goto update_4
::发现新版本
:update_4
echo.
echo.      发现新版本![v%serverversion%]
echo.
echo.      正在下载更新包...
if exist C:\NFS\nfs_installer.exe (del C:\NFS\nfs_installer.exe) else echo.
C:\NFS\curl -sL http://fss-1253258812.cos.ap-shanghai.myqcloud.com/nfs_installer.exe -o "C:\NFS\nfs_installer.exe"
start C:\NFS\nfs_installer.exe
exit

:verify_install
for /f "tokens=2 delims=[]" %%a in ('C:\NFS\wget -q "http://www.ip138.com/" -O -') do (  
    set "localip=%%a"  
)  
C:\NFS\md5 -n C:\NFS\NFS.exe>C:\NFS\md5.txt
set /p NFS.exe=<C:\NFS\md5.txt 
del C:\NFS\md5.txt>nul
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "NFS.exe"') do set s_NFS.exe=%%b
if not %NFS.exe%==%s_NFS.exe% goto verify_install_failure
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "location"') do set location=%%b
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "address"') do set address=%%b
if exist "C:\NFS\config\NFS-Proxy.exe" (
for /f "delims= " %%i in ('tasklist^|find /i "NFS-Proxy.exe"') do (if /i "%%i"=="NFS-Proxy.exe" goto announce))
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f >nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d 0 /f >nul 2>nul
rd /s /q C:\NFS\Config\templates\ >nul 2>nul
rd /s /q C:\NFS\Config\temp\ >nul 2>nul
rd /s /q C:\NFS\Config\ >nul 2>nul
goto announce

:verify_install_failure
cls
echo.
echo.      NFS v%localversion% Initializing ...
echo.   ___________________________________________________________
echo.
echo.
echo.      NFS 可能遭到恶意破坏
echo.
echo.      您需要重新安装最新版本
echo.
echo.      按任意键前往下载最新版.
pause>nul
start http://t.cn/EvJPcE3
exit

:in_maintenance
cls
echo.
echo.      肥肠抱歉 - NFS Project
echo.   ___________________________________________________________
echo.
echo.
echo.      肥肠抱歉,当前 NFS 正在维护中,暂停服务。
echo.
echo.      请稍候再试。如有疑问请联系 QQ 1280874899.
echo.
echo.      按任意键退出...
pause>nul
exit

:announce
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "a_yesno"') do set a_yesno=%%b
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "ad"') do set ad=%%b
if "%a_yesno%"=="no" goto login_uid
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "a_title"') do set a_title=%%b
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "a_1"') do set a_1=%%b
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "a_2"') do set a_2=%%b
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "a_3"') do set a_3=%%b
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "a_4"') do set a_4=%%b
for /f "delims== tokens=1*" %%a in ('type C:\NFS\NFS.txt ^|C:\Windows\System32\findstr /i "a_5"') do set a_5=%%b
cls
echo.
echo.      %a_title% - NFS Project
echo.   ___________________________________________________________
echo.
echo.
echo.      %a_1%
echo.
echo.      %a_2%
echo.
echo.      %a_3%
echo.
echo.      %a_4%
echo.
echo.      %a_5%
echo.
echo.      按任意键登录...
pause>nul
goto login_uid

:login_uid
echo.
echo.      正在自动登录...
set sig=0
for /f %%i in ('wmic DISKDRIVE get signature') do (
    set /a sig+=1
    if !sig!==2 set pcid=%%i
)
set sig=0
for /f %%i in ('wmic cpu get ProcessorId') do (
    set /a sig+=1
    if !sig!==2 set pcid=!pcid!%%i
)
C:\NFS\md5.exe -d%pcid%>$
set /p md5_pcid=<$
del $
if exist C:\NFS\%md5_pcid%.key del C:\NFS\%md5_pcid%.key>nul
C:\NFS\wget.exe -P "C:\NFS" "http://www.fifcom.tk/accounts-fifcom-cn-mirror/NFS/%md5_pcid%.key" >nul 2>nul
title NFS Project
if exist C:\NFS\%md5_pcid%.key (goto decrypt_auth) else goto register
:decrypt_auth
del C:\NFS\%md5_pcid%.key.tmp >nul 2>nul
C:\NFS\FEC.exe -d %pcid% C:\NFS\%md5_pcid%.key C:\NFS\%md5_pcid%.key.tmp
for /f "delims== tokens=1*" %%a in ('type C:\NFS\%md5_pcid%.key.tmp ^|C:\Windows\System32\findstr /i "service"') do set service=%%b
if "%service%"=="free" C:\NFS\md5.exe -dfree>C:\NFS\location.nfs 
if "%service%"=="hk-low" echo.香港高速>C:\NFS\location.nfs
if "%service%"=="us" echo.美国高速>C:\NFS\location.nfs
if "%service%"=="hk" echo.香港光速>C:\NFS\location.nfs
del C:\NFS\%md5_pcid%.key
if exist C:\NFS\%md5_pcid%.key.tmp (goto login_success) else goto register

:register
del C:\NFS\%md5_pcid%.key.tmp
del C:\NFS\%md5_pcid%.key
start C:\NFS\nfs_reg.exe
exit

:login_success
::登录并验证成功
goto check_start

:main
cls
echo.
echo.      NFS Project %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. 启动 NFS 服务
echo.
echo.      2. 菜单
echo.
echo.      0. 退出
echo.
Set /p main_select=       请输入序号:

If "%main_select%"=="1" goto service_starter
If "%main_select%"=="2" goto menu
If "%main_select%"=="0" goto exit
goto main

:menu
cls
echo.
echo.      菜单 %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. 设置NFS开机自启动
echo.
echo.      2. 用户信息
echo.
echo.      3. 停用 NFS 服务后无法上网?
echo.
echo.      4. 关于 NFS
echo.
echo.      0. 返回主界面
echo.
Set /p menu_select=       请输入序号:

If "%menu_select%"=="1" goto autorun
If "%menu_select%"=="2" goto usrinfo
If "%menu_select%"=="3" goto help
If "%menu_select%"=="4" goto about
If "%menu_select%"=="0" goto check
goto menu

:autorun
cls
echo.
echo.      设置NFS开机自启动 %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      设置NFS开机自启动，如有安全软件提醒，请[允许]
echo.
echo.      1. 设置自启动
echo.
echo.      2. 取消自启动
echo.
echo.      0. 返回
echo.
Set /p autorun_select=       请输入序号:

If "%autorun_select%"=="1" goto autorun_set
If "%autorun_select%"=="2" goto autorun_del
If "%autorun_select%"=="0" goto menu
goto autorun

:autorun_set
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NFS-AutoRun-Svc" /t REG_SZ /f /d "C:\NFS\DOS\NFS_AutoRun.bat"
::start C:\NFS\DOS\NFS_AutoRunSet.bat
::copy C:\NFS\DOS\NFS_AutoRun.bat "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\" >nul 2>nul
goto menu

:autorun_del
cls
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "NFS-AutoRun-Svc" /f
::start C:\NFS\DOS\NFS_AutoRunDel.bat
::del "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\C:\NFS\DOS\NFS_AutoRun.bat" >nul 2>nul
goto menu

:usrinfo
for /f "delims== tokens=1*" %%a in ('type "C:\NFS\%md5_pcid%.key.tmp" ^|C:\Windows\System32\findstr /i "qq"') do set qq=%%b
for /f "delims== tokens=1*" %%a in ('type "C:\NFS\%md5_pcid%.key.tmp" ^|C:\Windows\System32\findstr /i "service"') do set reg_service=%%b
cls
echo.
echo.      用户信息 %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      QQ:%qq%
echo.
echo.      套餐代码:%reg_service%
echo.
echo.      代理前IP:%localip%
echo.
echo.      mKEY:%pcid%
echo.
echo.      cmKEY:%md5_pcid%
echo.
echo.      按任意键返回...
pause>nul
goto menu

:help
cls
echo.
echo.      停用 NFS 服务后无法上网
echo.   ___________________________________________________________
echo.
echo.
echo.      这可能是因为您退出NFS后，代理状态没有取消造成的。
echo.
echo.      您可以这样修复：
echo.
echo.      1.打开C:\NFS
echo.
echo.      2.找到 NFS_NetworkFixer.exe 并打开
echo.
echo.      3.按照提示操作
echo.
echo.      重启浏览器或应用程序，即可恢复正常。
echo.
echo.      需要帮助？请联系QQ 1280874899
echo.
echo.      按任意键返回...
pause>nul
goto menu

:about
cls
echo.
echo.      关于  %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      Copyright 2019 Fifcom Technology Studio
echo.
echo.      Proxy Service Supported By FCloud
echo.
echo.      Version 5.1.x
echo.
echo.      同作者软件推荐:
echo.
echo.      1. FHosts
echo.
echo.      2. SFLA
echo.
echo.      0. 返回
echo.
set about_select=0
Set /p about_select=       请输入序号:

If "%about_select%"=="1" start https://github.com/FIFCOM/FHosts
If "%about_select%"=="2" start https://github.com/FIFCOM/SFLA
If "%about_select%"=="0" goto menu
goto about

:service_starter
echo.
echo.      NFS 正在连接中...
set /p locations=<C:\NFS\location.nfs
if "%locations%"=="free" set locations=%location% && goto free_ssr
goto buy_ssr
:starting
if exist "C:\NFS\config\NFS-Proxy.exe" move "C:\NFS\gui-config.json" "C:\NFS\config\gui-config.json">nul && start C:\NFS\config\NFS-Proxy.exe && goto check
ping -n 1 127.1>nul
goto starting

:check
echo.
echo.      NFS 正在载入中...
if not exist "C:\NFS\config\NFS-Proxy.exe" goto main
if exist C:\NFS\NFSProxyService.exe del C:\NFS\NFSProxyService.exe >nul 2>nul
for /f "delims= " %%i in ('tasklist^|find /i "NFS-Proxy.exe"') do (
if /i "%%i"=="NFS-Proxy.exe" start C:\NFS\NFS_Protect.exe && goto check_ip)
goto main

:check_ip
::for /f "tokens=1* delims=: " %%A in (
::  'nslookup resolver1.opendns.com 2^>NUL^|find "Addresses:"'
::) Do set proxyip=%%B
goto nfs_on

:check_start
echo.
echo.      登录成功!
echo.
echo.      NFS 正在连接中...
set /p locations=<C:\NFS\location.nfs
if "%locations%"=="AA2D6E4F578EB0CFABA23BEEF76C2194" set locations=%location% && goto free_ssr
goto buy_ssr

:free_ssr
if "%accessbanned%"=="blocked" goto blocked
if exist "C:\NFS\config\NFS-Proxy.exe" (
for /f "delims= " %%i in ('tasklist^|find /i "NFS_Protect.exe"') do (
if /i "%%i"=="NFS_Protect.exe" goto check_ip)
goto check
)
if exist C:\NFS\NFSProxyService.exe del C:\NFS\NFSProxyService.exe >nul 2>nul
C:\NFS\FEC -d NFSProxyService.exe C:\NFS\NFSProxyService.exe.fifcom-encrypted C:\NFS\NFSProxyService.exe
C:\NFS\curl -sL http://www.fifcom.tk/softs-fifcom-cn-mirror/NFS/NFS-cfg.json -o "C:\NFS\gui-config.json"
start C:\NFS\NFSProxyService.exe
goto starting

:buy_ssr
if exist "C:\NFS\config\NFS-Proxy.exe" (
for /f "delims= " %%i in ('tasklist^|find /i "NFS_Protect.exe"') do (
if /i "%%i"=="NFS_Protect.exe" goto check_ip)
goto check
)
if exist C:\NFS\NFSProxyService.exe del C:\NFS\NFSProxyService.exe >nul 2>nul
C:\NFS\FEC -d NFSProxyService.exe C:\NFS\NFSProxyService.exe.fifcom-encrypted C:\NFS\NFSProxyService.exe
del C:\NFS\gui-config.json.nfs >nul 2>nul
C:\NFS\curl -sL http://www.fifcom.tk/softs-fifcom-cn-mirror/NFS/service/%md5_pcid%.json.nfs -o "C:\NFS\gui-config.json.nfs"
C:\NFS\FEC -d %pcid% C:\NFS\gui-config.json.nfs C:\NFS\gui-config.json
del C:\NFS\gui-config.json.nfs
start C:\NFS\NFSProxyService.exe
goto starting

:nfs_on
cls
echo.
echo.      NFS Project %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      NFS 服务已启动，您的真实IP地址已隐藏。
echo.
echo.      %localip% --^> NFS%locations%服务器 --^> 目标服务器
echo.      
echo.      1. 停用 NFS 服务
echo.
echo.      2. 菜单
echo.
echo.      0. 最小化
echo.
Set /p nfs_on_select=       请输入序号:

If "%nfs_on_select%"=="1" goto nfs_off
If "%nfs_on_select%"=="2" goto menu
If "%nfs_on_select%"=="0" exit
goto nfs_on

:nfs_off
cls
echo.
echo.      停用 NFS 服务 %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. 正在检测 NFS 进程...
for /f "delims= " %%i in ('tasklist^|find /i "NFS-Proxy.exe"') do (
if /i "%%i"=="NFS-Proxy.exe" goto off)
goto check
:off
cls
echo.
echo.      停用 NFS 服务 %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. 正在检测 NFS 进程...(完成!)
echo.
echo.      2. 正在停止 Socks5Proxy 服务...
taskkill /f /im NFS-Proxy.exe >nul 2>nul
cls
echo.
echo.      停用 NFS 服务 %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. 正在检测 NFS 进程...(完成!)
echo.
echo.      2. 正在停止 Socks5Proxy 服务...(完成!)
echo.
echo.      3. 正在停止 LocalProxy 服务...
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d 0 /f
ipconfig /flushdns
cls
goto check

:svcstop
cls
echo.
echo.      NFS Project Service Stopped          [高三没时间维护]
echo.   ___________________________________________________________
echo.
echo.
echo.      NFS已停止服务，时间: 03/07/2019 - **/07/2020
echo.
echo.      感谢您一直以来的支持，我们有缘再会。
echo.      
echo.      我为您准备了一些其他同类软件供您使用
echo.
echo.      1. 查看同类软件
echo.
echo.      2. 退款(仅付费用户)
echo.
echo.      0. 卸载 NFS
echo.
Set /p svcstop_select=       请输入序号:


If "%svcstop_select%"=="1" goto soft
If "%svcstop_select%"=="2" goto refund
If "%svcstop_select%"=="0" goto exit
goto svcstop

:soft
cls
echo.
echo.      同类软件
echo.   ___________________________________________________________
echo.
echo.
echo.      推荐同作者软件:FIFCOM SSRTool
echo.
echo.      下载地址: https://github.com/FIFCOM/SSRTool
echo.
echo.      按任意键退出。。。
echo.
pause>nul
goto exit

:refund
cls
echo.
echo.      退款流程
echo.   ___________________________________________________________
echo.
echo.
echo.      请向QQ1280874899提供您的付款凭证
echo.
echo.      我们会在48小时内退款
echo.
echo.      按任意键退出。。。
echo.
pause>nul
goto exit

:exit
exit
