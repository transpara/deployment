print getdate();
set nocount on;
print N'03.Indexes Begin...';
go

if not exists (select * from sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TimeSeriesData]') AND name = N'IN_TimeSeriesData_ID')
	CREATE NONCLUSTERED INDEX [IN_TimeSeriesData_ID] ON [dbo].[TimeSeriesData]([ID] ASC) INCLUDE ( 	[Timestamp]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

go
print N'03.Indexes Complete';
print getdate();
go