@ECHO OFF
REM  QBFC Project Options Begin
REM HasVersionInfo: Yes
REM Companyname: Fifcom Systems Incorporated
REM Productname: NFS Installer
REM Filedescription: NFS Installer
REM Copyrights: Fifcom Systems Incorporated
REM Trademarks: Fifcom Systems Incorporated
REM Originalname: NFS_Installer.exe
REM Comments: NFS Installer
REM Productversion:  5. 1. 0. 0
REM Fileversion:  5. 1. 0. 0
REM Internalname: NFS
REM ExeType: ghost
REM Architecture: x86
REM Appicon: E:\DevelopFiles\NFS-v4\NFS.ico
REM AdministratorManifest: Yes
REM Embeddedfile: E:\DevelopFiles\NFS-v4\curl.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\md5.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\FEC.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\lnk.vbs
REM Embeddedfile: E:\DevelopFiles\NFS-v4\NFS.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\NFS_NetworkFixer.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\NFS_Protect.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\nfs_reg.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\Uninst.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\wget.exe
REM Embeddedfile: E:\DevelopFiles\NFS-v4\NFS_Version.txt
REM Embeddedfile: E:\DevelopFiles\NFS-v4\NFSProxyService.exe.fifcom-encrypted
REM Embeddedfile: E:\DevelopFiles\NFS-v4\DOS\NFS_NetworkFixer.bat
REM Embeddedfile: E:\DevelopFiles\NFS-v4\DOS\NFS_AutoRun.bat
REM Embeddedfile: E:\DevelopFiles\NFS-v4\DOS\NFS_AutoRunSet.bat
REM Embeddedfile: E:\DevelopFiles\NFS-v4\DOS\NFS_AutoRunDel.bat
REM  QBFC Project Options End
@ECHO ON
@echo off

:install
rd /s/q C:\NFS\
del C:\Users\%username%\Desktop\NFS.lnk
md C:\NFS\
md C:\NFS\DOS
copy %MYFILES%\NFS.exe C:\NFS\
copy %MYFILES%\Uninst.exe C:\NFS\
copy %MYFILES%\nfs_reg.exe C:\NFS\
copy %MYFILES%\md5.exe C:\NFS\
copy %MYFILES%\wget.exe C:\NFS\
copy %MYFILES%\curl.exe C:\NFS\
copy %MYFILES%\FEC.exe C:\NFS\
copy %MYFILES%\NFS_Version.txt C:\NFS\
copy %MYFILES%\NFS_NetworkFixer.exe C:\NFS\
copy %MYFILES%\NFS_Protect.exe C:\NFS\
copy %MYFILES%\NFSProxyService.exe.fifcom-encrypted C:\NFS\
copy %MYFILES%\lnk.vbs C:\NFS\
copy %MYFILES%\NFS_NetworkFixer.bat C:\NFS\DOS\
copy %MYFILES%\NFS_AutoRun.bat C:\NFS\DOS\
copy %MYFILES%\NFS_AutoRunSet.bat C:\NFS\DOS\
copy %MYFILES%\NFS_AutoRunDel.bat C:\NFS\DOS\
start C:\NFS\lnk.vbs
start C:\NFS\NFS.exe
del %0
exit
