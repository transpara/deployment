
print getdate();
set nocount on;
print N'06.Charts Begin...';
go

-- Trends
if not exists (select * from tableTrends where ID = '49EC3380-A454-4921-A7E0-EA2E97CB0E98')
begin
	insert into tableTrends(ID,
							Name,
							[Description],
							GroupName,
							Show,
							Pen01,
							Pen01InterfaceID,
							Pen01Name,
							Pen02,
							Pen02InterfaceID,
							Pen02Name,
							TrendScale)
	values	(	'49EC3380-A454-4921-A7E0-EA2E97CB0E98',	-- ID
				'Rates',								-- Name
				'Fill vs Return Rates',					-- Description
				'Manufacturing',						-- GroupName
				1,										-- Show
				'value_90_100_05',						-- Pen 1 (Fill Rate)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 1 Interface (ODBC)
				'Fill Rate',							-- Pen 1 Name
				'value_0_5_01',							-- Pen 2 (Return Rate)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 2 Interface (ODBC)
				'Return Rate',							-- Pen 2 Name
				1)										-- Trend Scale (1 = Multi)
end

-- Bar Charts
if not exists (select * from tableBarCharts where ID = 'CBD50469-4FAA-4F83-8782-20903682118C')
begin
	insert into tableBarCharts(	ID,
								Name,
								[Description],
								GroupName,
								Show,
								XAxisLabel,
								YAxisLabel,
								Pen01,
								Pen01InterfaceID,
								Pen01Name,
								Pen02,
								Pen02InterfaceID,
								Pen02Name,
								Pen03,
								Pen03InterfaceID,
								Pen03Name,
								Pen04,
								Pen04InterfaceID,
								Pen04Name)
	values	(	'CBD50469-4FAA-4F83-8782-20903682118C',	-- ID
				'Downtime',								-- Name
				'Plant Downtime (non-query)',			-- Description
				'Manufacturing',						-- GroupName
				1,										-- Show
				'Plant Downtime',						-- X Axis Label
				'Percent (%)',							-- Y Axis Label
				'value_3_10_01',						-- Pen 1 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 1 Interface (ODBC)
				'Plant 1',								-- Pen 1 Name
				'value_3_10_02',						-- Pen 2 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 2 Interface (ODBC)
				'Plant 2',								-- Pen 2 Name
				'value_3_10_03',						-- Pen 3 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 3 Interface (ODBC)
				'Plant 3',								-- Pen 3 Name
				'value_6_10_01',						-- Pen 4 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 4 Interface (ODBC)
				'Plant 4')								-- Pen 4 Name
end
go
if not exists (select * from tableBarCharts where ID = 'D03E52C4-9BC8-46DB-99C8-2AF51546C4AE')
begin
	insert into tableBarCharts(	ID,
								Name,
								[Description],
								GroupName,
								Show,
								XAxisLabel,
								YAxisLabel,
								[ConnectString],
								Query,
								[Target],
								TargetName,
								TargetColor,
								TargetShow,
								ConditionalColoring,
								AboveTargetName,
								AboveTargetColor,
								BelowTargetName,
								BelowTargetColor)
	values	(	'D03E52C4-9BC8-46DB-99C8-2AF51546C4AE',				-- ID
				'OEE',												-- Name
				'Plant OEE (standard query)',						-- Description
				'Manufacturing',									-- GroupName
				1,													-- Show
				'Plant OEE',										-- X Axis Label
				'Percent (%)',										-- Y Axis Label
				'[CONNECTSTRING]',									-- Connectstring
				'exec usp_GetManufacturingChartData {TIMESTAMP}',	-- Query
				'92',												-- Target
				'Goal',												-- Target Name
				12,													-- Target Color Index
				1,													-- Target Show
				1,													-- Conditional Coloring (on)
				'Pass',												-- Above Target Name
				4,													-- Above Target Color Index
				'Fail',												-- Below Target Name
				7)													-- Below Target Color Index
end
go
if not exists (select * from tableBarCharts where ID = 'CEC14B95-76DE-4A49-B4D3-561FBB45526A')
begin
	insert into tableBarCharts(	ID,
								Name,
								[Description],
								GroupName,
								Show,
								XAxisLabel,
								YAxisLabel,
								[ConnectString],
								Query,
								QueryChartType)
	values	(	'CEC14B95-76DE-4A49-B4D3-561FBB45526A',				-- ID
				'Plant Metrics',									-- Name
				'Plant Metrics (stacked query)',					-- Description
				'Manufacturing',									-- GroupName
				1,													-- Show
				'Plant',											-- X Axis Label
				'Percent (%)',										-- Y Axis Label
				'[CONNECTSTRING]',									-- Connectstring
				'exec usp_GetManufacturingBarChartData {TIMESTAMP}',-- Query
				1)													-- Query Chart Type (stacked)
end
go
if not exists (select * from tableBarCharts where ID = '10769CBD-14CA-4BBF-A42F-1AD12E409FAD')
begin
	insert into tableBarCharts(	ID,
								Name,
								[Description],
								GroupName,
								Show,
								XAxisLabel,
								YAxisLabel,
								[ConnectString],
								Query,
								QueryChartType)
	values	(	'10769CBD-14CA-4BBF-A42F-1AD12E409FAD',				-- ID
				'Plant Metrics',									-- Name
				'Plant Metrics (clustered query)',					-- Description
				'Manufacturing',									-- GroupName
				1,													-- Show
				'Plant',											-- X Axis Label
				'Percent (%)',										-- Y Axis Label
				'[CONNECTSTRING]',									-- Connectstring
				'exec usp_GetManufacturingBarChartData {TIMESTAMP}',-- Query
				2)													-- Query Chart Type (clustered)
end
go

-- Pareto Charts
if not exists (select * from tableParetoCharts where ID = '4F4ED979-0F99-455F-B786-9B85302F35D4')
begin
	insert into tableParetoCharts(	ID,
									Name,
									[Description],
									GroupName,
									Show,
									XAxisLabel,
									YAxisLabel,
									Pen01,
									Pen01InterfaceID,
									Pen01Name,
									Pen02,
									Pen02InterfaceID,
									Pen02Name,
									Pen03,
									Pen03InterfaceID,
									Pen03Name,
									Pen04,
									Pen04InterfaceID,
									Pen04Name)
	values	(	'4F4ED979-0F99-455F-B786-9B85302F35D4',	-- ID
				'Downtime',								-- Name
				'Plant Downtime (non-query)',			-- Description
				'Manufacturing',						-- GroupName
				1,										-- Show
				'Plant Downtime',						-- X Axis Label
				'Percent (%)',							-- Y Axis Label
				'value_3_10_01',						-- Pen 1 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 1 Interface (ODBC)
				'Plant 1',								-- Pen 1 Name
				'value_3_10_02',						-- Pen 2 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 2 Interface (ODBC)
				'Plant 2',								-- Pen 2 Name
				'value_3_10_03',						-- Pen 3 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 3 Interface (ODBC)
				'Plant 3',								-- Pen 3 Name
				'value_6_10_01',						-- Pen 4 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 4 Interface (ODBC)
				'Plant 4')								-- Pen 4 Name
end
go

if not exists (select * from tableParetoCharts where ID = 'E95891EB-13CD-4AAE-B915-AE13E4B4510E')
begin
	insert into tableParetoCharts(	ID,
									Name,
									[Description],
									GroupName,
									Show,
									XAxisLabel,
									YAxisLabel,
									[ConnectString],
									Query)
	values	(	'E95891EB-13CD-4AAE-B915-AE13E4B4510E',				-- ID
				'OEE',												-- Name
				'Plant OEE (query)',								-- Description
				'Manufacturing',									-- GroupName
				1,													-- Show
				'Plant',											-- X Axis Label
				'Percent (%)',										-- Y Axis Label
				'[CONNECTSTRING]',									-- Connectstring
				'exec usp_GetManufacturingChartData {TIMESTAMP}')	-- Query
end
go

-- Pie Charts
if not exists (select * from tablePieCharts where ID = 'CC09B182-0DBF-4693-ACC5-4F8C3025EA65')
begin
	insert into tablePieCharts(	ID,
								Name,
								[Description],
								GroupName,
								Show,
								Pen01,
								Pen01InterfaceID,
								Pen01Name,
								Pen02,
								Pen02InterfaceID,
								Pen02Name,
								Pen03,
								Pen03InterfaceID,
								Pen03Name,
								Pen04,
								Pen04InterfaceID,
								Pen04Name)
	values	(	'CC09B182-0DBF-4693-ACC5-4F8C3025EA65',	-- ID
				'Downtime',								-- Name
				'Plant Downtime (non-query)',			-- Description
				'Manufacturing',						-- GroupName
				1,										-- Show
				'value_3_10_01',						-- Pen 1 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 1 Interface (ODBC)
				'Plant 1',								-- Pen 1 Name
				'value_3_10_02',						-- Pen 2 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 2 Interface (ODBC)
				'Plant 2',								-- Pen 2 Name
				'value_3_10_03',						-- Pen 3 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 3 Interface (ODBC)
				'Plant 3',								-- Pen 3 Name
				'value_6_10_01',						-- Pen 4 (Downtime)
				'DC76E6D3-C649-40C3-9C78-90E7245CE0F2',	-- Pen 4 Interface (ODBC)
				'Plant 4')								-- Pen 4 Name
end
go

if not exists (select * from tablePieCharts where ID = '348A5598-D74B-49DE-9A89-A22D0FAE1E38')
begin
	insert into tablePieCharts(	ID,
								Name,
								[Description],
								GroupName,
								Show,
								[ConnectString],
								Query)
	values	(	'348A5598-D74B-49DE-9A89-A22D0FAE1E38',				-- ID
				'OEE',												-- Name
				'Plant OEE (query)',								-- Description
				'Manufacturing',									-- GroupName
				1,													-- Show
				'[CONNECTSTRING]',									-- Connectstring
				'exec usp_GetManufacturingChartData {TIMESTAMP}')	-- Query
end
go

-- Gantt Chart
if not exists (select * from tableGanttCharts where ID = '0B324E88-EF52-4022-B8BB-D80859199DCD')
begin
	insert into tableGanttCharts(ID,
							Name,
							[Description],
							ConnectString,
							Query,
							GroupName,
							Show)
	values	(	'0B324E88-EF52-4022-B8BB-D80859199DCD',
				'Production Gantt',
				'Production Gantt Chart',
				'[CONNECTSTRING]',
				'exec usp_GetGanttChartData 1',
				'Manufacturing',
				1)
end

go
print N'06.Charts Complete';
print getdate();
go