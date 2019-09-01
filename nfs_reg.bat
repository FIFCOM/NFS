@ECHO OFF
REM  QBFC Project Options Begin
REM HasVersionInfo: Yes
REM Companyname: Fifcom Systems Incorporated
REM Productname: NFS Project Registration tool
REM Filedescription: NFS Project Registration tool
REM Copyrights: Fifcom Systems Incorporated
REM Trademarks: Fifcom Systems Incorporated
REM Originalname: NFS Project Registration tool
REM Comments: NFS Project Registration tool
REM Productversion:  5. 1. 0. 0
REM Fileversion:  5. 1. 0. 0
REM Internalname: NFS Project Registration tool
REM ExeType: console
REM Architecture: x86
REM Appicon: 
REM AdministratorManifest: No
REM  QBFC Project Options End
@ECHO ON
@echo off
setlocal ENABLEDELAYEDEXPANSION
title NFS Project - ע��/����
mode con: cols=65 lines=25
color 8b
if exist C:\NFS\reg.txt (goto ok) else goto menu

:error
cls
echo.
echo.      NFS Project
echo.   ___________________________________________________________
echo.
echo.
echo.      ��������NFS��ע���û���������޷�ʹ��NFS
echo.
echo.      ������NFS�ر����û�ע��ͨ����������¡�
echo.
echo.      ��������˳���
pause>nul
exit

:menu
goto error
cls
echo.
echo.      ��Ȩʹ�� NFS
echo.   ___________________________________________________________
echo.
echo.
echo.      ������֤��Ȩ,���Ե�...
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
C:\NFS\wget.exe -P "C:\NFS" "http://accounts.fifcom.cn/NFS/%md5_pcid%.key"
if exist C:\NFS\%md5_pcid%.key (goto decrypt_auth) else goto set_accounts_info
:decrypt_auth
C:\NFS\FEC.exe -d %pcid% C:\NFS\%md5_pcid%.key C:\NFS\%md5_pcid%.key.tmp
if exist C:\NFS\%md5_pcid%.key.tmp (goto verify_pcid_exist) else goto set_accounts_info
:verify_pcid_exist
cls
for /f "delims== tokens=1*" %%a in ('type C:\NFS\%md5_pcid%.key.tmp ^|C:\Windows\System32\findstr /i "qq"') do set qq=%%b
for /f "delims== tokens=1*" %%a in ('type C:\NFS\%md5_pcid%.key.tmp ^|C:\Windows\System32\findstr /i "service"') do set service=%%b
title NFS Project - ��Ȩ
del C:\NFS\%md5_pcid%.key
del C:\NFS\%md5_pcid%.key.tmp
cls
echo.
echo.      ��Ȩʹ�� NFS
echo.   ___________________________________________________________
echo.
echo.
echo.      ������ʹ��NFS����������ײ�����ϵ QQ1280874899
echo.
echo.      QQ: %qq%
echo.
echo.      cmKEY: %md5_pcid%
echo.
echo.      �ײ�: %service%
echo.
echo.      ��������˳�
pause>nul
exit

:set_accounts_info
title NFS Project - ��Ȩ
cls
echo.
echo.      ע�ᵽNFS
echo.   ___________________________________________________________
echo.
echo.
echo.      ����Ҫע���ſ���ʹ��NFS.
echo.
set /p qq=       QQ(����д׼ȷ):
echo.
set /p confirm_qq=       ȷ��QQ:
If "%qq%"=="%confirm_qq%" goto buy
goto set_accounts_info

:buy
cls
echo.
echo.      ѡ���ײ�
echo.   ___________________________________________________________
echo.
echo.
echo.      1. ��ѽڵ�   ����:10Mbps  ����:10G/�� �۸�:0.01/��
echo.
echo.      2. ��������   ����:100Mbps ��������    �۸�:2.00/��
echo.
echo.      3. �ձ�����   ����:100Mbps ��������    �۸�:5.00/��
echo.
echo.      4. ��۹���   ����:150Mbps ��������    �۸�:12.00/��
echo.
set /p buy_select=       ��ѡ���ײ�:
If "%buy_select%"=="1" set service=free
If "%buy_select%"=="2" set service=us
If "%buy_select%"=="3" set service=hk-low
If "%buy_select%"=="4" set service=hk
goto reg

:reg
echo.
echo.      ���Ե�...
if exist C:\NFS\reg.data del C:\NFS\reg.data
echo.qq=%qq%>>C:\NFS\reg.data
echo.service=%service%>>C:\NFS\reg.data
for /f "tokens=2* delims=[]" %%i in ('ver') do set v=%%i
for /f "tokens=2* delims= " %%i in ("%v%") do set windowsversion=%%i
echo.os=%windowsversion%>>C:\NFS\reg.data
echo.computername=%computername%>>C:\NFS\reg.data
echo.pcid=%pcid%>>C:\NFS\reg.data
set "URL=http://www.ip138.com/ips1388.asp"  
for /f "tokens=2 delims=[]" %%a in ('C:\NFS\wget -q "%URL%" -O -') do (  
    set "PublicIP=%%a"  
)  
echo.ipaddr=%PublicIP%>>C:\NFS\reg.data
echo.username=%username%>>C:\NFS\reg.data
:get_cpu
setlocal ENABLEDELAYEDEXPANSION
for /f "tokens=1,* delims==" %%a in ('wmic cpu get name^,ExtClock^,CpuStatus^,Description /value') do (
set /a tee+=1
if "!tee!" == "6" echo cpu=%%b>>C:\NFS\reg.data
)
goto encrypt

:encrypt
move "C:\NFS\reg.data" C:\NFS\reg.data.FEC >nul
C:\NFS\FEC.exe -e PUBLIKEYsjXZRVsQvYevTnInstkZV19K7iagj1TReBzefYBXfy5WyEJ3y0yiwwKHRX7PGjpsypiXT4LLFsbV8HwFr9acdQ19pjf0S0W1Z4PlUrgYKaGcsz8xbIVBfS0d2Aw3Bru5al C:\NFS\reg.data.FEC C:\NFS\reg.data
if exist C:\NFS\reg.data.FEC del C:\NFS\reg.data.FEC
if exist C:\NFS\reg.txt del C:\NFS\reg.txt
C:\Windows\System32\certutil -encode C:\NFS\reg.data C:\NFS\reg.txt
if exist C:\NFS\reg.data del C:\NFS\reg.data
echo. >>C:\NFS\reg.txt
echo.�뽫�������ַ�����QQ1280874899�����ע��>>C:\NFS\reg.txt
:ok
start C:\NFS\reg.txt
cls
echo.
echo.      ��Ȩʹ�� NFS
echo.   ___________________________________________________________
echo.
echo.
echo.      ��Ȩ�ļ�������! 
echo.
echo.      ������ļ�˵�����ļ�������QQ1280874899�������Ȩ
echo.
echo.      ����Ȩ����ɣ��밴��������� NFS ...
pause>nul
start C:\NFS\NFS.exe
exit
