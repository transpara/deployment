print getdate();
set nocount on;
print N'01.Database Begin...';
go

-- Time Series Tags (Header)
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TimeSeriesTags]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	create table [dbo].[TimeSeriesTags]
	(
		[ID] [int] identity(1,1) NOT NULL,
		[Name] [nvarchar](200) NULL,
		[Min] [float] NULL,
		[Max] [float] NULL,
		[Variability] [float] NULL,
		[DeltaInMinutes] [int] NULL,
		[Type] [tinyint] NULL,
		[Start]	[datetime] NULL,
		[End]	[datetime] NULL
		CONSTRAINT [PK_TimeSeriesTags] PRIMARY KEY CLUSTERED
		(
			[ID] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]
end
GO

-- Time Series Values (Data)
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TimeSeriesData]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	create table [dbo].[TimeSeriesData]
	(
		[ID] [int] NOT NULL,
		[Value] [float] NOT NULL,
		[Timestamp] [datetime] NOT NULL
	) 	ON [DEFAULT];
end
GO

-- Maintenance Log (Table Data)
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MaintenanceLog]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	create table [dbo].[MaintenanceLog](
	[LogID] int NULL,
	[DisplayOrder] int NULL,
	[Asset] [nvarchar](50) NULL,
	[Issue] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Detail] [nvarchar](100) NULL
) ON [PRIMARY]
end
GO

-- Gantt Chart (Tasks)
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GanttTasks]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	create table [dbo].[GanttTasks](
		[chartId] [int] NULL,
		[id] [int] NULL,
		[displayOrder] [int] NULL,
		[parentId] [int] NULL,
		[percentComplete] [float] NULL,
		[name] [nvarchar](50) NULL,
		[start] [datetime] NULL,
		[end] [datetime] NULL,
		[isSummary] [int] NULL
	) ON [PRIMARY]
end
GO

if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GanttDependencies]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
begin
	create table [dbo].[GanttDependencies](
		[chartId] [int] NULL,
		[predecessorId] [int] NULL,
		[successorId] [int] NULL
	) ON [PRIMARY]
end
go


-- Keys
if not exists (select * from sysobjects where name = N'FK_TimeSeriesData_ID')
	ALTER TABLE [dbo].[TimeSeriesData] ADD CONSTRAINT FK_TimeSeriesData_ID FOREIGN KEY ([ID]) REFERENCES [dbo].[TimeSeriesTags] ([ID]) ON DELETE CASCADE;

-- Sprocs
if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_InsertTimeSeriesData]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_InsertTimeSeriesData]
GO
create procedure [dbo].[usp_InsertTimeSeriesData]
	@name			nvarchar(50),
	@min			float,
	@max			float,
	@variability	float,
	@deltaInMinutes	int,
	@type			int			-- 0 (Random), 1 (Step), 2 (Ramp)
as
begin
	-- exec usp_InsertTimeSeriesData 0, 10, 0.25, 15, 0, 'test1'
	set nocount on
	declare @pi float
	declare @2pi float
	declare @randNum1 float
	declare @randNum2 float
	declare @value1 float
	declare @value2 float
	declare @iteration int
	declare @precision int --number of places to the right of the decimal point
	declare @mean float
	declare @meanOriginal float

	set @meanOriginal = ((@max - @min) / 2) + @min
	set @mean = @meanOriginal

	set @iteration = 0
	set @pi = pi()
	set @2pi = 2.0 * @pi
	set @precision = 2

	if (@type = 1) -- step
	begin
		set @precision = 0 -- ints
	end

	declare @id int
	declare @dateStart datetime
	declare @dateEnd datetime
	declare @date datetime

	if exists (select * from TimeSeriesTags where Name = @name)
	begin
		delete from TimeSeriesTags where Name = @name
	end


	set @dateStart = (select DATEADD(month, -1, GetDate()))
	set @dateEnd = (select DATEADD(month, 3, GetDate()))
	set @date = @datestart

	insert into TimeSeriesTags ([Name], [Min], [Max], Variability, DeltaInMinutes, [Type], [Start], [End]) values (@name, @min, @max, @variability, @deltaInMinutes, @type, @dateStart, @dateEnd)
	set @id = (select id from TimeSeriesTags where name = @name)

	declare @tempTable table (id int, value float, timestamp datetime)

	if (@type = 2) -- ramp
	begin
		declare @rampIncrement float
		set @rampIncrement = (@max - @min) / 10  -- 10 steps
		while (@date < @dateend)
		begin
			if (@value1 is null or @value1 >= @max)
			begin
				set @value1 = @min
			end
			else
			begin
				set @value1 = @value1 + @rampIncrement
				if (@value1 > @max)
				begin
					set @value1 = @max
				end
			end
			insert into @tempTable (id, value, timestamp) values (@id, @value1, @date)
			set @date = dateadd(minute, @deltaInMinutes, @date)
		end
	end
	else
	begin
		while (@date < @dateend)
		begin
		  select @randNum1 = rand()
		  select @randNum2 = rand()
		  select @value1 = round(round((sqrt(-2.0*log(@randNum1))*cos(@2pi*@randNum2))*@variability, @precision)+@mean, @precision)
		  select @value2 = round(round((sqrt(-2.0*log(@randNum1))*sin(@2pi*@randNum2))*@variability, @precision)+@mean, @precision)
			if (@value1 > @max)
			begin
				set @value1 = @max
			end
			else
			begin
				if (@value1 < @min)
				begin
					set @value1 = @min
				end
			end

			if (@value2 > @max)
			begin
				set @value2 = @max
			end
			else
			begin
				if (@value2 < @min)
				begin
					set @value2 = @min
				end
			end

		  insert into @tempTable (id, value, timestamp) values (@id, @value1, @date)
		  set @date = dateadd(minute, @deltaInMinutes, @date)
		  set @iteration = @iteration + 1
		  insert into @tempTable (id, value, timestamp) values (@id, @value2, @date)
		  set @date = dateadd(minute, @deltaInMinutes, @date)

		  set @mean = @value2
		  if (@mean > @max or @mean < @min)
		  begin
			set @mean = @meanOriginal
		  end
		end
	end
	insert into TimeSeriesData (id, value, timestamp)
	select id, value, timestamp from @tempTable
end
go

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_RefreshTimeSeriesData]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_RefreshTimeSeriesData]
go
create procedure [dbo].[usp_RefreshTimeSeriesData]
as
begin
	set nocount on
	-- Iterate all tags and create new data
	declare @name nvarchar(200)
	declare @min float
	declare @max float
	declare @variability float
	declare @deltaInMinutes int
	declare @type int
	declare @table table(	[name] varchar(200),
							[min] float,
							[max] float,
							variability float,
							deltaInMinutes int,
							[type] int)


	declare @cursor as cursor
	set @cursor = cursor for select [Name], [Min], [Max], Variability, DeltaInMinutes, [Type] from TimeSeriesTags

	open @cursor
	fetch next from @cursor into @name, @min, @max, @variability, @deltaInMinutes, @type

	while @@fetch_status = 0
	begin
	 insert into @table (	[name],
							[min],
							[max],
							variability,
							deltaInMinutes,
							[type])
	 select @name, @min, @max, @variability, @deltaInMinutes, @type
	 fetch next from @cursor into @name, @min, @max, @variability, @deltaInMinutes, @type
	end

	close @cursor
	deallocate @cursor

	set @cursor = cursor for select [Name], [Min], [Max], Variability, DeltaInMinutes, [Type] from @table
	open @cursor
	fetch next from @cursor into @name, @min, @max, @variability, @deltaInMinutes, @type

	while @@fetch_status = 0
	begin
	 exec usp_InsertTimeSeriesData @name, @min, @max, @variability, @deltaInMinutes, @type
	 fetch next from @cursor into @name, @min, @max, @variability, @deltaInMinutes, @type
	end

	close @cursor
	deallocate @cursor
end
go

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_GetMaintLog]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_GetMaintLog]
go
create procedure [dbo].[usp_GetMaintLog]
	@datetime dateTime = null
as
begin
	if (@dateTime = null)
	begin
		set @dateTime = getdate()
	end
	declare @day int
	set @day = datePart(weekday, @dateTime)

	if (cast(@dateTime as date) <= cast(getdate() as date))
	begin
		select	cast(@dateTime as date) as Date,
				Asset,
				Issue,
				Status,
				Detail
		from	MaintenanceLog
		where	LogID = @day
		order by	DisplayOrder
	end
	else
	begin
		select	cast(@dateTime as date) as Date,
				'Pump ' + cast(@day as nvarchar(2)) as Asset,
				'Scheduled Maintenance' as Issue,
				'N/A' as Status,
				'Routine maintenance and system check' as Detail
		union
		select	cast(@dateTime as date) as Date,
				'Motor ' + cast(@day + 7 as nvarchar(2)) as Asset,
				'Scheduled Maintenance' as Issue,
				'N/A' as Status,
				'Routine maintenance and system check' as Detail
				union
		select	cast(@dateTime as date) as Date,
				'Mixer ' + cast(@day + 4 as nvarchar(2)) as Asset,
				'Scheduled Maintenance' as Issue,
				'N/A' as Status,
				'Routine maintenance and system check' as Detail
	end
end
GO

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_GetGanttChartData]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_GetGanttChartData]
GO
create procedure [dbo].[usp_GetGanttChartData]
	@chartID int
as
begin
	set nocount on
	select	ID,
			DisplayOrder,
			ParentID,
			PercentComplete,
			[Name],
			[Start],
			[End],
			IsSummary
	from	GanttTasks
	where	ChartID = @chartID

	select	PredecessorID,
			SuccessorID
	from	GanttDependencies
	where	ChartID = @chartID
end
go

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_TransparaDemoData_GetCurrentValue]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_TransparaDemoData_GetCurrentValue]
GO
create procedure [dbo].[usp_TransparaDemoData_GetCurrentValue]
	@name			nvarchar(50)
as
begin
	select	top 1 Value,
			Timestamp as Date
	from	TimeSeriesData
			join TimeSeriesTags on TimeSeriesTags.ID = TimeSeriesData.Id
	where	[Name] = @name and Timestamp <= GetDate()
	order by Timestamp desc
end
go

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_TransparaDemoData_GetTrendData]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_TransparaDemoData_GetTrendData]
GO
create procedure [dbo].[usp_TransparaDemoData_GetTrendData]
	@name			nvarchar(50),
	@start			datetime,
	@end			datetime
as
begin
	declare @id int
	set @id = (select ID from TimeSeriesTags where [Name] = @name)
	if (@id is not null)
	begin
		select Value, Timestamp as Date from TimeSeriesData where ID = @id AND Timestamp between @start and @end
		union
		select Value, Timestamp as Date from (select top 1 value, timestamp from TimeSeriesData where ID = @id and Timestamp < @start order by Timestamp desc) as First
		union
		select Value, Timestamp as Date FROM (select top 1 value, timestamp from TimeSeriesData where ID = @id and Timestamp > @end order by Timestamp asc) as Last
		order by Timestamp asc
	end
end
go

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_TransparaDemoData_GetHistoricalValue]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_TransparaDemoData_GetHistoricalValue]
GO
create procedure [dbo].[usp_TransparaDemoData_GetHistoricalValue]
	@name			nvarchar(50),
	@timestamp		datetime
as
begin
	select	top 1 Value,
			Timestamp as Date
	from	TimeSeriesData
			join TimeSeriesTags on TimeSeriesTags.ID = TimeSeriesData.Id
	where	[Name] = @name and Timestamp <= @timestamp
	order by Timestamp desc
end


GO
print N'01.Database Complete';
print getdate();
go