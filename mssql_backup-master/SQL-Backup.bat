
IF EXIST "C:\SQLBackups\" (
	echo "SQLBackups dizini var"
	IF EXIST "C:\SQLBackups\Log\" (
		echo "Log dizini var"
	) ELSE (
		mkdir C:\SQLBackups\Log
		echo "Log dizini olusturuldu"
	)
) ELSE (
	mkdir C:\SQLBackups\
	mkdir C:\SQLBackups\Log\
	echo "SQLBackups ve Log dizini olusturuldu."
)

sqlcmd -U sa -P sasa! -S .\SQL2012EXPRESS -Q "EXEC sp_BackupDatabases @backupLocation = 'C:\SQLBackups\', @backupType = 'F'" > C:\SQLBackups\Log\MSSQL-%date:~-4,4%%date:~-6,1%%date:~-10,2%.log
Powershell.exe -executionpolicy remotesigned -File  C:\Batch\Send-email.ps1
