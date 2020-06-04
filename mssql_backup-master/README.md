# MSSQL Backup
MSSQL içerisinden sqlcmd aracılığı ile veritabanı yedeği almak üzere Roberto Stefanetti tarafından yazılmış bir scripttir. 

Script üç parçadan oluşuyor. 
Bunlardan ilki olan SP_SQLBackupDatabase.sql dosyası MSSQL içerisinde bir bir prosedür oluşturmayı sağıyor. Bu prosedür alınan yedeklerin saklanacağı lokasyon ve yedek tipi (full veya diff) alarak çalışıyor. Sadece bu iki veri girildiğinde MSSQL üzerindeki tüm veritabanları için yedek alma işlemi yapılıyor. Ekstra olarak yedek almak istediğini veritabanını  belirterek sadece o veritabanını da yedekleyebiliyoruz. 

İkinci parça SQL-Backup dosyası. Bu dosya içerisinde sqlcmd komutu ile yedek alma işlemini tetikliyoruz. Buradaki parametreler:
  -U    Mssql kullanıcısı
  -P    Mssql parolası
  -S    Mssql sunucusu
  -E    Mssql'e güvenli bir yol sağlar
  -Q    EXEC komutu yürütebiliriz
  
  EXEC yapısı içerisindeki @backupLocation, yedeklenen verilerin nereye koyulacağını; @backupType ile Full mü yoksa Diff mi olacağını belirtiriz. Full için 'F' Diff için 'D' harfleri kullanılır. Ekstra olarak @databaseName ile sadece istediğimiz veritabanına yönlendirme yapabiliriz.
  
Son parça ise alınan yedeklerin çıktılarını mail atmamızı sağlar.

Sonrasında bu dosyalardan ikincisi için zamanlı bir görev oluşturup belirli aralıklarda yedekler alınması sağlanabilir. 



Orjinal Dosya
https://gallery.technet.microsoft.com/scriptcenter/Automate-backup-on-SQL-21eb452d

Ek Kaynaklar

https://kodcu.com/2011/11/stored-procedure-sql-server/


https://www.sqlshack.com/working-sql-server-command-line-sqlcmd/


https://docs.microsoft.com/en-us/sql/ssms/scripting/sqlcmd-use-the-utility?view=sql-server-ver15




https://support.microsoft.com/en-us/help/2019698/how-to-schedule-and-automate-backups-of-sql-server-databases-in-sql-se

