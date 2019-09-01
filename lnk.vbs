Set WshShell=CreateObject("WScript.Shell")
strDesKtop=WshShell.SpecialFolders("Desktop")
Set oShellLink=WshShell.CreateShortcut(strDesKtop&"\NFS.lnk")
oShellLink.TargetPath="C:\NFS\NFS.exe"
oShellLink.WorkingDirectory="C:\NFS\"
oShellLink.WindowStyle=1
oShellLink.Description="NFS"
oShellLink.Save
