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


::������
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
echo.      NFS ���ڳ�ʼ�������Ե�...
:update_2
::���ذ汾�ļ�
C:\NFS\curl -sL http://www.fifcom.tk/softs-fifcom-cn-mirror/NFS/NFS.txt -o "C:\NFS\NFS.txt"
:update_3
::�Աȵ�ǰ�汾�ͷ������汾
for /f "delims== tokens=1*" %%a in ('type "C:\NFS\NFS.txt" ^|C:\Windows\System32\findstr /i "serverversion"') do set serverversion=%%b
if "%serverversion%"=="in_maintenance" goto in_maintenance
if "%serverversion%"=="svcstop" goto svcstop
if "%localversion%"=="%serverversion%" goto verify_install
goto update_4
::�����°汾
:update_4
echo.
echo.      �����°汾![v%serverversion%]
echo.
echo.      �������ظ��°�...
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
echo.      NFS �����⵽�����ƻ�
echo.
echo.      ����Ҫ���°�װ���°汾
echo.
echo.      �������ǰ���������°�.
pause>nul
start http://t.cn/EvJPcE3
exit

:in_maintenance
cls
echo.
echo.      �ʳ���Ǹ - NFS Project
echo.   ___________________________________________________________
echo.
echo.
echo.      �ʳ���Ǹ,��ǰ NFS ����ά����,��ͣ����
echo.
echo.      ���Ժ����ԡ�������������ϵ QQ 1280874899.
echo.
echo.      ��������˳�...
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
echo.      ���������¼...
pause>nul
goto login_uid

:login_uid
echo.
echo.      �����Զ���¼...
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
if "%service%"=="hk-low" echo.��۸���>C:\NFS\location.nfs
if "%service%"=="us" echo.��������>C:\NFS\location.nfs
if "%service%"=="hk" echo.��۹���>C:\NFS\location.nfs
del C:\NFS\%md5_pcid%.key
if exist C:\NFS\%md5_pcid%.key.tmp (goto login_success) else goto register

:register
del C:\NFS\%md5_pcid%.key.tmp
del C:\NFS\%md5_pcid%.key
start C:\NFS\nfs_reg.exe
exit

:login_success
::��¼����֤�ɹ�
goto check_start

:main
cls
echo.
echo.      NFS Project %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. ���� NFS ����
echo.
echo.      2. �˵�
echo.
echo.      0. �˳�
echo.
Set /p main_select=       ���������:

If "%main_select%"=="1" goto service_starter
If "%main_select%"=="2" goto menu
If "%main_select%"=="0" goto exit
goto main

:menu
cls
echo.
echo.      �˵� %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. ����NFS����������
echo.
echo.      2. �û���Ϣ
echo.
echo.      3. ͣ�� NFS ������޷�����?
echo.
echo.      4. ���� NFS
echo.
echo.      0. ����������
echo.
Set /p menu_select=       ���������:

If "%menu_select%"=="1" goto autorun
If "%menu_select%"=="2" goto usrinfo
If "%menu_select%"=="3" goto help
If "%menu_select%"=="4" goto about
If "%menu_select%"=="0" goto check
goto menu

:autorun
cls
echo.
echo.      ����NFS���������� %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      ����NFS���������������а�ȫ������ѣ���[����]
echo.
echo.      1. ����������
echo.
echo.      2. ȡ��������
echo.
echo.      0. ����
echo.
Set /p autorun_select=       ���������:

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
echo.      �û���Ϣ %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      QQ:%qq%
echo.
echo.      �ײʹ���:%reg_service%
echo.
echo.      ����ǰIP:%localip%
echo.
echo.      mKEY:%pcid%
echo.
echo.      cmKEY:%md5_pcid%
echo.
echo.      �����������...
pause>nul
goto menu

:help
cls
echo.
echo.      ͣ�� NFS ������޷�����
echo.   ___________________________________________________________
echo.
echo.
echo.      ���������Ϊ���˳�NFS�󣬴���״̬û��ȡ����ɵġ�
echo.
echo.      �����������޸���
echo.
echo.      1.��C:\NFS
echo.
echo.      2.�ҵ� NFS_NetworkFixer.exe ����
echo.
echo.      3.������ʾ����
echo.
echo.      �����������Ӧ�ó��򣬼��ɻָ�������
echo.
echo.      ��Ҫ����������ϵQQ 1280874899
echo.
echo.      �����������...
pause>nul
goto menu

:about
cls
echo.
echo.      ����  %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      Copyright 2019 Fifcom Technology Studio
echo.
echo.      Proxy Service Supported By FCloud
echo.
echo.      Version 5.1.x
echo.
echo.      ͬ��������Ƽ�:
echo.
echo.      1. FHosts
echo.
echo.      2. SFLA
echo.
echo.      0. ����
echo.
set about_select=0
Set /p about_select=       ���������:

If "%about_select%"=="1" start https://github.com/FIFCOM/FHosts
If "%about_select%"=="2" start https://github.com/FIFCOM/SFLA
If "%about_select%"=="0" goto menu
goto about

:service_starter
echo.
echo.      NFS ����������...
set /p locations=<C:\NFS\location.nfs
if "%locations%"=="free" set locations=%location% && goto free_ssr
goto buy_ssr
:starting
if exist "C:\NFS\config\NFS-Proxy.exe" move "C:\NFS\gui-config.json" "C:\NFS\config\gui-config.json">nul && start C:\NFS\config\NFS-Proxy.exe && goto check
ping -n 1 127.1>nul
goto starting

:check
echo.
echo.      NFS ����������...
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
echo.      ��¼�ɹ�!
echo.
echo.      NFS ����������...
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
echo.      NFS ������������������ʵIP��ַ�����ء�
echo.
echo.      %localip% --^> NFS%locations%������ --^> Ŀ�������
echo.      
echo.      1. ͣ�� NFS ����
echo.
echo.      2. �˵�
echo.
echo.      0. ��С��
echo.
Set /p nfs_on_select=       ���������:

If "%nfs_on_select%"=="1" goto nfs_off
If "%nfs_on_select%"=="2" goto menu
If "%nfs_on_select%"=="0" exit
goto nfs_on

:nfs_off
cls
echo.
echo.      ͣ�� NFS ���� %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. ���ڼ�� NFS ����...
for /f "delims= " %%i in ('tasklist^|find /i "NFS-Proxy.exe"') do (
if /i "%%i"=="NFS-Proxy.exe" goto off)
goto check
:off
cls
echo.
echo.      ͣ�� NFS ���� %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. ���ڼ�� NFS ����...(���!)
echo.
echo.      2. ����ֹͣ Socks5Proxy ����...
taskkill /f /im NFS-Proxy.exe >nul 2>nul
cls
echo.
echo.      ͣ�� NFS ���� %ad%
echo.   ___________________________________________________________
echo.
echo.
echo.      1. ���ڼ�� NFS ����...(���!)
echo.
echo.      2. ����ֹͣ Socks5Proxy ����...(���!)
echo.
echo.      3. ����ֹͣ LocalProxy ����...
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
echo.      NFS Project Service Stopped          [����ûʱ��ά��]
echo.   ___________________________________________________________
echo.
echo.
echo.      NFS��ֹͣ����ʱ��: 03/07/2019 - **/07/2020
echo.
echo.      ��л��һֱ������֧�֣�������Ե�ٻᡣ
echo.      
echo.      ��Ϊ��׼����һЩ����ͬ���������ʹ��
echo.
echo.      1. �鿴ͬ�����
echo.
echo.      2. �˿�(�������û�)
echo.
echo.      0. ж�� NFS
echo.
Set /p svcstop_select=       ���������:


If "%svcstop_select%"=="1" goto soft
If "%svcstop_select%"=="2" goto refund
If "%svcstop_select%"=="0" goto exit
goto svcstop

:soft
cls
echo.
echo.      ͬ�����
echo.   ___________________________________________________________
echo.
echo.
echo.      �Ƽ�ͬ�������:FIFCOM SSRTool
echo.
echo.      ���ص�ַ: https://github.com/FIFCOM/SSRTool
echo.
echo.      ��������˳�������
echo.
pause>nul
goto exit

:refund
cls
echo.
echo.      �˿�����
echo.   ___________________________________________________________
echo.
echo.
echo.      ����QQ1280874899�ṩ���ĸ���ƾ֤
echo.
echo.      ���ǻ���48Сʱ���˿�
echo.
echo.      ��������˳�������
echo.
pause>nul
goto exit

:exit
exit
