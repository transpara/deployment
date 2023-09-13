print getdate();
set nocount on;
print N'01.Database Begin...';
go

-- Sprocs
if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_GetManufacturingChartData]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_GetManufacturingChartData]
GO
create procedure [dbo].[usp_GetManufacturingChartData]
	@datetime dateTime = null
as
begin
	if (@dateTime = null)
	begin
		set @dateTime = getdate()
	end

	select	Plant1.Value,
			Plant1.Name,
			'#3891a6' as Color
	from	(select top 1 TimeSeriesData.Value, 'Plant 1 OEE' as Name
						from	TimeSeriesData
						join TimeSeriesTags on TimeSeriesTags.ID = TimeSeriesData.ID
						where	TimeSeriesTags.Name = 'value_95_97_01'
						and TimeSeriesData.Timestamp <= @dateTime
						order by TimeSeriesData.Timestamp desc) as Plant1
	union
	select	Plant2.Value,
			Plant2.Name,
			'#e5822b' as Color
	from	(select top 1 TimeSeriesData.Value, 'Plant 2 OEE' as Name
						from	TimeSeriesData
						join TimeSeriesTags on TimeSeriesTags.ID = TimeSeriesData.ID
						where	TimeSeriesTags.Name = 'value_89_94_01'
						and TimeSeriesData.Timestamp <= @dateTime
						order by TimeSeriesData.Timestamp desc) as Plant2
	union
	select	Plant3.Value,
			Plant3.Name,
			'#453643' as Color
	from	(select top 1 TimeSeriesData.Value, 'Plant 3 OEE' as Name
						from	TimeSeriesData
						join TimeSeriesTags on TimeSeriesTags.ID = TimeSeriesData.ID
						where	TimeSeriesTags.Name = 'value_80_99_01'
						and TimeSeriesData.Timestamp <= @dateTime
						order by TimeSeriesData.Timestamp desc) as Plant3
	union
	select	Plant4.Value,
			Plant4.Name,
			'#f46197' as Color
	from	(select top 1 TimeSeriesData.Value, 'Plant 4 OEE' as Name
						from	TimeSeriesData
						join TimeSeriesTags on TimeSeriesTags.ID = TimeSeriesData.ID
						where	TimeSeriesTags.Name = 'value_70_75_01'
						and TimeSeriesData.Timestamp <= @dateTime
						order by TimeSeriesData.Timestamp desc) as Plant4
end
go

if exists (select * from sys.objects where object_id = OBJECT_ID(N'[dbo].[usp_GetManufacturingBarChartData]') AND type in (N'P', N'PC'))
	drop procedure [dbo].[usp_GetManufacturingBarChartData]
GO
create procedure [dbo].[usp_GetManufacturingBarChartData]
	@datetime dateTime = null
as
begin
	if (@dateTime = null)
	begin
		set @dateTime = getdate()
	end

	;with PlantInfo(PlantName, TypeName, TagName)
	as
	(
		select	'Plant 1' as PlantName,
				'OEE' as TypeName,
				'value_95_97_01' as TagName
		union
		select	'Plant 1' as PlantName,
				'Downtime' as TypeName,
				'value_3_10_01' as TagName
		union
		select	'Plant 1' as PlantName,
				'Yield' as TypeName,
				'value_80_100_06' as TagName
		union
		select	'Plant 2' as PlantName,
				'OEE' as TypeName,
				'value_89_94_01' as TagName
		union
		select	'Plant 2' as PlantName,
				'Downtime' as TypeName,
				'value_3_10_02' as TagName
		union
		select	'Plant 2' as PlantName,
				'Yield' as TypeName,
				'value_80_100_07' as TagName
		union
		select	'Plant 3' as PlantName,
				'OEE' as TypeName,
				'value_80_99_01' as TagName
		union
		select	'Plant 3' as PlantName,
				'Downtime' as TypeName,
				'value_3_10_03' as TagName
		union
		select	'Plant 3' as PlantName,
				'Yield' as TypeName,
				'value_80_100_08' as TagName
		union
		select	'Plant 4' as PlantName,
				'OEE' as TypeName,
				'value_70_75_01' as TagName
		union
		select	'Plant 4' as PlantName,
				'Downtime' as TypeName,
				'value_6_10_01' as TagName
		union
		select	'Plant 4' as PlantName,
				'Yield' as TypeName,
				'value_80_100_09' as TagName
	)
	,PlantMetrics (PlantName, TypeName, TagName, Value, Timestamp, RN)
	as
	(
		select	PlantInfo.PlantName,
				PlantInfo.TypeName,
				PlantInfo.TagName,
				TimeSeriesData.Value,
				TimeSeriesData.Timestamp,
				row_number() over(partition by TimeSeriesTags.Name order by TimeSeriesData.Timestamp desc) as rn
		from	TimeSeriesData
				join TimeSeriesTags on TimeSeriesTags.ID = TimeSeriesData.ID
				join PlantInfo on PlantInfo.TagName = TimeSeriesTags.Name
		where	TimeSeriesData.Timestamp <= @dateTime
	)
	,OEE (PlantName, Value)
	as
	(
		select	PlantMetrics.PlantName as Name,
				PlantMetrics.Value as OEE
		from	PlantMetrics where RN = 1
				and PlantMetrics.TypeName = 'OEE'
	)
	,Downtime (PlantName, Value)
	as
	(
		select	PlantMetrics.PlantName as Name,
				PlantMetrics.Value as OEE
		from	PlantMetrics where RN = 1
				and PlantMetrics.TypeName = 'Downtime'
	)
	,Yield (PlantName, Value)
	as
	(
		select	PlantMetrics.PlantName as Name,
				PlantMetrics.Value as OEE
		from	PlantMetrics where RN = 1
				and PlantMetrics.TypeName = 'Yield'
	)
	select	OEE.PlantName as Name,
			OEE.Value as OEE,
			'#4C5B5C' as OEEColor,
			Downtime.Value as Downtime,
			'#db5461' as DowntimeColor,
			Yield.Value as Yield,
			'#669900' as YieldColor
	from	OEE
			join Downtime on OEE.PlantName = Downtime.PlantName
			join Yield on OEE.PlantName = Yield.PlantName
	order by Name
end

go
print N'01.Database Complete';
print getdate();
go