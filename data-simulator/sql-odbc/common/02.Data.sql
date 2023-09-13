print getdate();
set nocount on;
print N'02.Data Begin...';
go

-- Time Series Data
exec usp_InsertTimeSeriesData 'Price', 0, 100, 0.25, 60, 0
exec usp_InsertTimeSeriesData 'Cost', 0, 100, 0.1, 60, 0
exec usp_InsertTimeSeriesData 'Temperature' , -20, 50, 0.25, 5, 0
exec usp_InsertTimeSeriesData 'TemperatureT', 22, 28, 0.25, 500, 0
exec usp_InsertTimeSeriesData 'TemperatureHH', 36, 41, 0.15, 500, 0
exec usp_InsertTimeSeriesData 'TemperatureH', 30, 35, 0.15, 500, 0
exec usp_InsertTimeSeriesData 'TemperatureL', 15, 20, 0.15, 500, 0
exec usp_InsertTimeSeriesData 'TemperatureLL', -10, 10, 0.15, 500, 0
exec usp_InsertTimeSeriesData 'Volume', 0, 100, 1.5, 15, 0
exec usp_InsertTimeSeriesData 'Speed', 0, 500, 1.5, 1, 0
exec usp_InsertTimeSeriesData 'Vibration', 0, 100, .1, 5, 0
exec usp_InsertTimeSeriesData 'Power', 0, 20, .7, 15, 0
exec usp_InsertTimeSeriesData 'Output', 0, 20, .1, 15, 0
exec usp_InsertTimeSeriesData 'Rate', 0, 1000, .2, 60, 0
exec usp_InsertTimeSeriesData 'Count', 0, 255, .1, 60, 0
exec usp_InsertTimeSeriesData 'Toggle', 0, 1, .5, 5, 1
exec usp_InsertTimeSeriesData 'Frequency', 59, 61, .5, 60, 0
exec usp_InsertTimeSeriesData 'Noise', -100, 100, 25, 5, 0
exec usp_InsertTimeSeriesData 'Ramp', 0, 100, 0, 4320, 2
exec usp_InsertTimeSeriesData 'RampFast', 0, 100, 0, 5, 2

GO
-- Maintenance Log Data
if ((select count(*) from MaintenanceLog) = 0)
begin
	-- Day 1
	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (1, 1, 'Air Handler', 'Frozen Handler', '<font style="color: #ff0000;">In Progress</font>', 'Technicians on location')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (1, 2, 'Heater 3', 'Not generating heat', '<font style="color: #669900;">Fixed</font>', 'Replaced lower assembly unit')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (1, 3, 'Mixer 2', 'No Power', '<font style="color: #669900;">Fixed</font>', 'Replaced power supply')

	-- Day 2
	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (2, 1, 'Motor 2', 'Loud Motor', '<font style="color: #ff0000;">In Progress</font>', 'Cavitation Issue')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (2, 2, 'Heater 3', 'Not generating heat', '<font style="color: #669900;">Fixed</font>', 'Replaced lower assembly unit')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (2, 3, 'Cooling Tower 5', 'Low Pressure', '<font style="color: #669900;">Fixed</font>', 'Reattached loose intake valve')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (2, 4, 'Pump 2', 'Water Leak', '<font style="color: #669900;">Fixed</font>', 'Replaced motor and recalibrated system')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (2, 5, 'Tank 1', 'Slow drain', '<font style="color: #669900;">Fixed</font>', 'Replaced release valve')

	-- Day 3
	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (3, 1, 'HVAC Failure', 'HVAC not operational', '<font style="color: #669900;">Fixed</font>', 'Replaced fan unit')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (3, 2, 'Heat Exchanger 2', 'Leak', '<font style="color: #669900;">Fixed</font>', 'Replaced cold water valve')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (3, 3, 'Mixer 3', 'No Power', '<font style="color: #669900;">Fixed</font>', 'Replaced power supply')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (3, 4, 'Mixer 1', 'Slow Speed', '<font style="color: #669900;">Fixed</font>', 'Recalibrated system')

	-- Day 4
	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (4, 1, 'Motor 1', 'Motor Failure', '<font style="color: #ff0000;">In Progress</font>', 'Worn motor contactor')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (4, 2, 'Pump 2', 'Pump Failure', '<font style="color: #ff0000;">In Progress</font>', 'Failed intake pump')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (4, 3, 'Cooling Tank', 'Invalid Data Read', '<font style="color: #ff0000;">In Progress</font>', 'Faulty sensor')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (4, 4, 'Packaging Line', 'General Maint', '<font style="color: #669900;">Fixed</font>', 'Routine Maintenance complete')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (4, 5, 'Mixer 3', 'No Power', '<font style="color: #669900;">Fixed</font>', 'Replaced power supply')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (4, 6, 'Pump 7', 'Water Leak', '<font style="color: #669900;">Fixed</font>', 'Replaced broken O-Ring')

	-- Day 5
	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (5, 1, 'High Speed Mixer 2', 'Noise level high', '<font style="color: #ff0000;">In Progress</font>', 'Replacing blade unit')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (5, 2, 'Oven 1', 'Alarm State', '<font style="color: #669900;">Fixed</font>', 'Faulty alarm sensor')


	-- Day 6
	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (6, 1, 'Motor 1', 'Motor Failure', '<font style="color: #ff0000;">In Progress</font>', 'Worn motor contactor')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (6, 2, 'Pump 2', 'Pump Failure', '<font style="color: #ff0000;">In Progress</font>', 'Failed intake pump')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (6, 3, 'Cooling Tank', 'Invalid Data Read', '<font style="color: #669900;">Fixed</font>', 'Faulty sensor')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (6, 4, 'Packaging Line', 'General Maint', '<font style="color: #669900;">Fixed</font>', 'Routine Maintenance complete')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (6, 5, 'Mixer 3', 'No Power', '<font style="color: #669900;">Fixed</font>', 'Replaced power supply')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (6, 6, 'Pump 7', 'Water Leak', '<font style="color: #669900;">Fixed</font>', 'Replaced broken O-Ring')

	-- Day 7
	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (7, 1, 'Tank 2', 'No draining', '<font style="color: #ff0000;">In Progress</font>', 'Clearing debris from valve')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (7, 2, 'Pump 1', 'Loud Noise', '<font style="color: #669900;">Fixed</font>', 'Replaced motor and recalibrated system')

	insert into MaintenanceLog(LogID, DisplayOrder, Asset, Issue, Status, Detail)
	values (7, 3, 'Waste Tank 2', 'Alarm State', '<font style="color: #669900;">Fixed</font>', 'Drained and cleaned tank')
end
go

truncate table GanttTasks
truncate table GanttDependencies
declare @date date
set @date = cast(getdate() as date)

insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 100, 1, null, 1, 'R&D', dateadd(day, -70, @date), dateadd(day, -26, @date), 1)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 101, 1, 100, 1, 'Prepare Drawings', dateadd(day, -70, @date), dateadd(day, -60, @date), 0)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 102, 2, 100, 1, 'Write Specifications', dateadd(day, -60, @date), dateadd(day, -40, @date), 0)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 103, 3, 100, 1, 'Build Prototype', dateadd(day, -40, @date), dateadd(day, -26, @date), 0)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 104, 4, 100, 1, 'Develop Marketing Concept', dateadd(day, -40, @date), dateadd(day, -26, @date), 0)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 200, 1, null, .7, 'Production Prep', dateadd(day, -26, @date), dateadd(day, 10, @date), 1)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 201, 1, 200, 1, 'Procure Raw Materials', dateadd(day, -26, @date), dateadd(day, -15, @date), 0)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 202, 1, 200, .9, 'Prepare Manufacturing Facility', dateadd(day, -15, @date), dateadd(day, 2, @date), 0)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 203, 1, 200, 0, 'Engineering Changes', dateadd(day, 2, @date), dateadd(day, 7, @date), 0)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 204, 1, 200, 0, 'Initial Production Run', dateadd(day, 7, @date), dateadd(day, 10, @date), 0)
insert into GanttTasks(chartId, id, displayOrder, parentId, percentComplete, name, [start], [end], isSummary) values (1, 300, 1, null, 0, 'Begin Full Scale Production', dateadd(day, 10, @date), dateadd(day, 10, @date), 0)

insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 101, 102)
insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 102, 103)
insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 102, 104)
insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 100, 200)
insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 200, 201)
insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 201, 202)
insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 202, 203)
insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 203, 204)
insert into GanttDependencies (chartId, predecessorid, successorid) values (1, 200, 300)

go
print N'02.Data Complete';
print getdate();
go