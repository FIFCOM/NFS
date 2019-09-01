@echo off
title NetworkFixer - NFS Project

:check
for /f "delims= " %%i in ('tasklist^|find /i "NFS-Proxy.exe"') do (
if /i "%%i"=="NFS-Proxy.exe" goto nfs_on)
goto fix

:nfs_on
cls
start mshta vbscript:msgbox("当前NFS正在运行中，无法修复。",0,"NFS NetworkFixer")(window.close)&&exit
exit

:fix
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d 0 /f
ipconfig /flushdns
cls
start mshta vbscript:msgbox("NFS 的本地代理已清空,请重启无法联网的应用程序。",0,"NFS NetworkFixer")(window.close)&&exit
exit
