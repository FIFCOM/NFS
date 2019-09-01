@echo off
title NFS MD5 GEN
md5 -n C:\NFS\NFS.exe>C:\NFS\md5.txt
set /p NFS.exe=<C:\NFS\md5.txt 
del C:\NFS\md5.txt>nul
cls
echo.NFS.exe=%NFS.exe%
pause>nul