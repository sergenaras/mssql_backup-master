$data = Get-Date -format ddMMyyyy
mkdir "D:\SQLBackups-External\Backup-$data"
#xcopy.exe C:\SQLBackups\* D:\SQLBackups-External\Backup-$data /Y
C:\Windows\System32\forfiles.exe /p "C:\SQLBackups\" /s /d 0  /c "cmd /c copy @path D:\SQLBackups-External\Backup-$data"

C:\Windows\System32\forfiles.exe /p "D:\SQLBackups-External\" /s /d -7 /c "cmd /c del @file"
