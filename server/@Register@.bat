@echo off
cls
color 8b
echo. >reg.txt
start reg.txt
echo.����дFifcom Register Certificate�����������...
pause>nul
cls
echo.���Ե�...
C:\Windows\System32\certutil -decode reg.txt reg.txt.FEC
del reg.txt
FEC.exe -d PUBLIKEYsjXZRVsQvYevTnInstkZV19K7iagj1TReBzefYBXfy5WyEJ3y0yiwwKHRX7PGjpsypiXT4LLFsbV8HwFr9acdQ19pjf0S0W1Z4PlUrgYKaGcsz8xbIVBfS0d2Aw3Bru5al reg.txt.FEC reg.txt
del reg.txt.FEC
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "qq"') do set r_qq=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "username"') do set r_usrname=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "ipaddr"') do set r_ipaddr=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "computername"') do set r_computername=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "pcid"') do set r_pcid=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "email"') do set r_email=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "cpu"') do set r_cpu=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "os"') do set r_os=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "todev"') do set r_todev=%%b
for /f "delims== tokens=1*" %%a in ('type reg.txt ^|C:\Windows\System32\findstr /i "antivirus"') do set r_antivirus=%%b
echo.{  >>users\%r_qq%.txt
echo.	pcid="%r_pcid%"; >>users\%r_qq%.txt
echo.	qq="%r_qq%"; >>users\%r_qq%.txt
echo.	email="%r_email%"; >>users\%r_qq%.txt
echo.	todev="%r_todev%"; >>users\%r_qq%.txt
echo.	ip="%r_ipaddr%"; >>users\%r_qq%.txt
echo.	username="%r_usrname%"; >>users\%r_qq%.txt
echo.	computername="%r_computername%"; >>users\%r_qq%.txt
echo.	cpu="%r_cpu%"; >>users\%r_qq%.txt
echo.	os="%r_os%"; >>users\%r_qq%.txt
echo.	antivirus="%r_antivirus%" >>users\%r_qq%.txt
echo. } >>users\%r_qq%.txt
del reg.txt
md5 -d%r_pcid%>$
set /p md5_pcid=<$
del $
echo.pcid=%r_pcid%>%md5_pcid%.key.FEC
echo.email=%r_email%>>%md5_pcid%.key.FEC
echo.ip=%r_ipaddr%>>%md5_pcid%.key.FEC
FEC.exe -e %r_pcid% %md5_pcid%.key.FEC accounts\%md5_pcid%.key
del %md5_pcid%.key.FEC
cls
echo.
echo. �û���Ϣ:
echo.
echo. PCID:%r_pcid% MD5:%md5_pcid%
echo.
echo. IP��ַ:%r_ipaddr%
echo.
echo. ��ϵ��ʽ:
echo.
echo. QQ:%r_qq%
echo.
echo. Email:%r_email%
echo.
echo. ������Ϣ:
echo.
echo. ϵͳ�汾:%r_os%
echo.
echo. CPU:%r_cpu%
echo.
echo. �û���:%r_usrname%
echo.
echo. ������:%r_computername%
echo.
echo. ���������:%r_antivirus%
echo.
echo. ������Ϣ:
echo.
echo. �Կ�����˵:%r_todev%
echo.
echo. ��������˳�...
pause>nul
exit
