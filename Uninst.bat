::NFS Uninstaller By FIFCOM
@echo off
mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&&exit
rd /s /q C:\NFS\
del C:\Users\%username%\Desktop\NFS.lnk
del %temp%\*.bat
del %0