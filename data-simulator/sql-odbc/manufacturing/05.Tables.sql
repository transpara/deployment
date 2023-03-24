print getdate();
set nocount on;
print N'05.Tables Begin...';
go

if not exists (select * from tableTables where ID = '896A0FE8-65FF-44E3-A984-37E1C6E003DD')
begin
	insert into tableTables(ID,
							Name,
							[Description],
							ConnectString,
							Query,
							GroupName,
							Show)
	values	(	'896A0FE8-65FF-44E3-A984-37E1C6E003DD',
				'Maint Log',
				'Daily Maintenance Log',
				'[CONNECTSTRING]',
				'exec usp_GetMaintLog {TIMESTAMP}',
				'Manufacturing',
				1)
end
go
print N'05.Tables Complete';
print getdate();
go