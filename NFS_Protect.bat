@ECHO OFF
REM  QBFC Project Options Begin
REM HasVersionInfo: Yes
REM Companyname: Fifcom Systems Incorporated
REM Productname: FIFCOM ANTI CRACK(FAC)
REM Filedescription: NFS Protect
REM Copyrights: Fifcom Systems Incorporated
REM Trademarks: Fifcom Systems Incorporated
REM Originalname: NFS_Protect.exe
REM Comments: NFS Protect
REM Productversion:  5. 0. 1. 3
REM Fileversion:  5. 0. 1. 3
REM Internalname: NFS Protect
REM ExeType: ghost
REM Architecture: x86
REM Appicon: 
REM AdministratorManifest: No
REM  QBFC Project Options End
@ECHO ON
@echo off

:1
for /f "delims= " %%i in ('tasklist^|find /i "NFS-Proxy.exe"') do (
if /i "%%i"=="NFS-Proxy.exe" goto ec)
goto ne

:ne
cls
::未检测到NFS-Proxy.exe进程
taskkill /f /im NFS.exe
echo y|cacls.exe "C:\NFS\Config\" /g everyone:f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d 0 /f
rd /s /q C:\NFS\Config\
exit

:ec
cls
::检测到NFS-Proxy.exe进程
ping -n 11 127.0.0.1>nul
goto 1
