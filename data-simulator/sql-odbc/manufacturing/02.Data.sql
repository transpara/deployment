print getdate();
set nocount on;
print N'02.Data Begin...';
go

-- Manufacturing Demo Data
exec usp_InsertTimeSeriesData 'value_0_30_01', 0, 30, 0.1, 60, 0
exec usp_InsertTimeSeriesData 'value_0_30_02', 0, 30, 0.1, 60, 0
exec usp_InsertTimeSeriesData 'value_5_15_01', 5, 15, 0.1, 1440, 0
exec usp_InsertTimeSeriesData 'value_5_15_02', 5, 15, 0.2, 1440, 0
exec usp_InsertTimeSeriesData 'value_5_15_03', 5, 15, 3, 1440, 1
exec usp_InsertTimeSeriesData 'value_3_7_01', 3, 7, 0.2, 1440, 0
exec usp_InsertTimeSeriesData 'value_90_100_01', 90, 100, 0.2, 60, 0
exec usp_InsertTimeSeriesData 'value_90_100_02', 90, 100, 0.15, 1440, 0
exec usp_InsertTimeSeriesData 'value_90_100_03', 90, 100, 0.1, 60, 0
exec usp_InsertTimeSeriesData 'value_90_100_04', 90, 100, 0.1, 1440, 0
exec usp_InsertTimeSeriesData 'value_90_100_05', 90, 100, 0.1, 1440, 0
exec usp_InsertTimeSeriesData 'value_60_90_01', 60, 90, 0.2, 1440, 0
exec usp_InsertTimeSeriesData 'value_60_90_02', 60, 90, 0.2, 1440, 0
exec usp_InsertTimeSeriesData 'value_60_90_03', 60, 90, 0.3, 1440, 0
exec usp_InsertTimeSeriesData 'value_60_90_04', 60, 90, 0.3, 1440, 0
exec usp_InsertTimeSeriesData 'value_30_70_01', 30, 70, 1.5, 60, 0
exec usp_InsertTimeSeriesData 'value_30_70_02', 30, 70, 1.5, 60, 0
exec usp_InsertTimeSeriesData 'value_0_1_01', 0, 1, 0.5, 60, 0
exec usp_InsertTimeSeriesData 'value_1_10_01', 1, 10, 2, 1440, 0
exec usp_InsertTimeSeriesData 'value_5_48_01', 5, 48, 0.15, 60, 0
exec usp_InsertTimeSeriesData 'value_50_100_01', 50, 100, 0.1, 60, 0
exec usp_InsertTimeSeriesData 'value_0_5_01', 0, 5, 1.5, 60, 0
exec usp_InsertTimeSeriesData 'value_0_5_02', 0, 5, .5, 60, 0
exec usp_InsertTimeSeriesData 'value_0_5_03', 0, 5, .5, 1440, 0
exec usp_InsertTimeSeriesData 'value_95_97_01', 95, 97, 1, 540, 0
exec usp_InsertTimeSeriesData 'value_89_94_01', 89, 94, 1, 540, 0
exec usp_InsertTimeSeriesData 'value_80_99_01', 80, 99, 1, 540, 0
exec usp_InsertTimeSeriesData 'value_70_75_01', 70, 75, 1, 540, 0
exec usp_InsertTimeSeriesData 'value_3_10_01', 3, 10, 1, 540, 0
exec usp_InsertTimeSeriesData 'value_3_10_02', 3, 10, 1, 540, 0
exec usp_InsertTimeSeriesData 'value_3_10_03', 3, 10, 1, 540, 0
exec usp_InsertTimeSeriesData 'value_6_10_01', 6, 10, 1, 540, 0
exec usp_InsertTimeSeriesData 'value_80_100_01', 80, 100, 0.15, 60, 0
exec usp_InsertTimeSeriesData 'value_80_100_02', 80, 100, 0.15, 60, 0
exec usp_InsertTimeSeriesData 'value_80_100_03', 80, 100, 0.15, 60, 0
exec usp_InsertTimeSeriesData 'value_80_100_04', 80, 100, 0.2, 60, 0
exec usp_InsertTimeSeriesData 'value_80_100_05', 80, 100, 0.2, 60, 0
exec usp_InsertTimeSeriesData 'value_80_100_06', 80, 100, 0.15, 60, 0
exec usp_InsertTimeSeriesData 'value_80_100_07', 80, 100, 0.2, 60, 0
exec usp_InsertTimeSeriesData 'value_80_100_08', 80, 100, 0.15, 60, 0
exec usp_InsertTimeSeriesData 'value_80_100_09', 80, 100, 0.15, 60, 0



go
print N'02.Data Complete';
print getdate();
go