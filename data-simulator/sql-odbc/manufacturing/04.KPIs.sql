print getdate();
set nocount on;
print N'04.KPIs Begin...';
go

-- Manufacturing Demo KPIs
-- Safety | Days Since LTI
exec usp_CreateDemoKPI	@id = 'F9B48C7B-FDAC-4C00-A255-B2E7BBC1581B',
						@name = 'Days Since LTI',
						@description = 'Manufacturing Days Since LTI',
						@groupName = 'Safety',
						@min = 0,
						@l = 50,
						@ll = 25,
						@lll = 10,
						@target = 100,
						@actual = 'Ramp',
						@max = 365,
						@uom = 'Days',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Safety | Overall LTI Rate
exec usp_CreateDemoKPI	@id = 'EA38D63D-5DA9-479A-B7BC-D0A0769D373E',
						@name = 'Overall LTI Rate',
						@description = 'Manufacturing Overall LTI Rate',
						@groupName = 'Safety',
						@min = 0,
						@target = 0,
						@actual = 'value_0_30_01',
						@h = 3,
						@hh = 10,
						@hhh = 20,
						@max = 365,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Finance | A/P
exec usp_CreateDemoKPI	@id = '383592E8-8EFF-4536-9053-8B1A96B49D68',
						@name = 'A/P',
						@description = 'Manufacturing Accounts Payable',
						@groupName = 'Finance',
						@displayOrder = 1,
						@min = 0,
						@ll = 5,
						@l = 8,
						@target = 10,
						@actual = 'value_5_15_01',
						@h = 15,
						@hh = 18,
						@max = 20,
						@uom = '$mil',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Finance | A/R
exec usp_CreateDemoKPI	@id = 'CE493FEA-4EBD-454A-8F85-1718BC21DF7F',
						@name = 'A/R',
						@description = 'Manufacturing Accounts Receivable',
						@groupName = 'Finance',
						@displayOrder = 2,
						@min = 0,
						@ll = 4,
						@l = 4.5,
						@target = 5,
						@actual = 'value_5_15_02',
						@h = 7,
						@hh = 7.5,
						@max = 20,
						@uom = '$mil',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Logistics | Transportation | On-Time FD
exec usp_CreateDemoKPI	@id = 'C6724A3A-568C-4FA2-8D39-2A4019FD210D',
						@name = 'On-Time FD',
						@description = 'Manufacturing On-Time FD',
						@groupName = 'Transportation',
						@displayOrder = 1,
						@min = 0,
						@ll = 94,
						@l = 96,
						@target = 100,
						@actual = 'value_90_100_01',
						@max = 100,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Logistics | Transportation | Cost per Pound
exec usp_CreateDemoKPI	@id = '7EC0CA7E-7CA8-4F2C-BD12-10D7A6F64366',
						@name = 'Cost per Pound',
						@description = 'Manufacturing Cost per Pound',
						@groupName = 'Transportation',
						@displayOrder = 2,
						@min = 0,
						@target = .2,
						@actual = 'value_0_1_01',
						@h = .6,
						@hh = .8,
						@max = 1,
						@uom = '$/lb',
						@uomDisplayFormat = 1 -- Number + UOM

-- Logistics | Warehouse | Inventory Accuracy
exec usp_CreateDemoKPI	@id = 'A52A1552-DA2F-4654-8E10-67A33039EEB7',
						@name = 'Inventory Accuracy',
						@description = 'Manufacturing Inventory Accuracy',
						@groupName = 'Warehouse',
						@displayOrder = 4,
						@min = 0,
						@ll = 92,
						@l = 94,
						@target = 100,
						@actual = 'value_90_100_02',
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Logistics | Warehouse | Dock to Stock
exec usp_CreateDemoKPI	@id = '0C53C752-E12C-4DF9-AE66-6FD9481A3733',
						@name = 'Dock to Stock',
						@description = 'Manufacturing Dock to Stock Time',
						@groupName = 'Warehouse',
						@displayOrder = 5,
						@min = 0,
						@target = 8,
						@actual = 'value_5_48_01',
						@h = 20,
						@hh = 36,
						@uom = 'hrs',
						@uomDisplayFormat = 1 -- Number + UOM

-- Logistics | Warehouse | On-Time Shipping
exec usp_CreateDemoKPI	@id = '66F621ED-F652-473C-9521-BC23848380BB',
						@name = 'On-Time Shipping',
						@description = 'Manufacturing On-Time Shipping',
						@groupName = 'Warehouse',
						@displayOrder = 6,
						@min = 0,
						@ll = 90,
						@l = 93,
						@target = 100,
						@actual = 'value_90_100_03',
						@max = 100,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Logistics | Warehouse | Order Accuracy
exec usp_CreateDemoKPI	@id = '2690CA42-0BD2-48DB-B387-32CA87746D7F',
						@name = 'Order Accuracy',
						@description = 'Manufacturing Order Accuracy',
						@groupName = 'Warehouse',
						@displayOrder = 7,
						@min = 0,
						@ll = 85,
						@l = 90,
						@target = 100,
						@actual = 'value_80_100_01',
						@max = 100,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Logistics | Warehouse | Total Logistics Cost
exec usp_CreateDemoKPI	@id = '4FF6340E-FB81-4046-8306-E3CD44A16E27',
						@name = 'Total Logistics Cost',
						@description = 'Manufacturing Total Logistics Cost',
						@groupName = 'Warehouse',
						@displayOrder = 8,
						@min = 0,
						@target = 4,
						@actual = 'value_3_7_01',
						@h = 5.8,
						@hh = 6.5,
						@uom = '$mil',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | E. Region | Plant 1 | OEE
exec usp_CreateDemoKPI	@id = '53213A1C-E417-410C-BA36-009575E904BA',
						@name = 'OEE',
						@displayOrder = 100,
						@description = 'Plant 1: OEE',
						@groupName = 'Plant 1',
						@min = 0,
						@ll = 90,
						@l = 94,
						@target = 96,
						@actual = 'value_95_97_01',
						@groupMapPosition = 1,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | E. Region | Plant 1 | Downtime
exec usp_CreateDemoKPI	@id = '1653CBC1-552D-4725-A2DB-B0A7B738A518',
						@name = 'Downtime',
						@displayOrder = 101,
						@description = 'Plant 1: Downtime',
						@groupName = 'Plant 1',
						@min = 0,
						@target = 0,
						@actual = 'value_3_10_01',
						@h = 6,
						@hh = 8,
						@groupMapPosition = 2,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1	-- Step

-- Production | E. Region | Plant 1 | Quality
exec usp_CreateDemoKPI	@id = '869704E1-97DC-46BB-9D67-EB5C9BC6EBCE',
						@name = 'Quality',
						@displayOrder = 102,
						@description = 'Plant 1: Quality',
						@groupName = 'Plant 1',
						@min = 0,
						@ll = 82,
						@l = 85,
						@target = 90,
						@actual = 'value_80_100_02',
						@max = 100,
						@groupMapPosition = 3,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | E. Region | Plant 1 | Yield
exec usp_CreateDemoKPI	@id = 'B8DAD3B0-F0C4-4DE6-9F7A-4EC77EA2FCAA',
						@name = 'Yield',
						@displayOrder = 103,
						@description = 'Plant 1: Yield',
						@groupName = 'Plant 1',
						@min = 0,
						@ll = 85,
						@l = 90,
						@target = 92,
						@actual = 'value_80_100_06',
						@max = 100,
						@groupMapPosition = 4,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | E. Region | Plant 1 | Utilization
exec usp_CreateDemoKPI	@id = '1CC9367C-C1D0-4C65-98EB-123ABF4B3D5F',
						@name = 'Utilization',
						@displayOrder = 104,
						@description = 'Plant 1: Utilization',
						@groupName = 'Plant 1',
						@min = 0,
						@ll = 65,
						@l = 70,
						@target = 85,
						@actual = 'value_60_90_01',
						@h = 85,
						@hh = 88,
						@max = 100,
						@groupMapPosition = 5,
						@actualTrendType = 1, -- Step
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | E. Region | Plant 2 | OEE
exec usp_CreateDemoKPI	@id = 'FFE58E3E-22EA-469F-A3C9-9A35942B9B6F',
						@name = 'OEE',
						@displayOrder = 200,
						@description = 'Plant 2: OEE',
						@groupName = 'Plant 2',
						@min = 0,
						@ll = 90,
						@l = 92,
						@target = 96,
						@actual = 'value_89_94_01',
						@groupMapPosition = 1,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | E. Region | Plant 2 | Downtime
exec usp_CreateDemoKPI	@id = '623CB421-89AA-4B6C-A2CF-2C519580A031',
						@name = 'Downtime',
						@displayOrder = 201,
						@description = 'Plant 2: Downtime',
						@groupName = 'Plant 2',
						@min = 0,
						@target = 0,
						@actual = 'value_3_10_02',
						@h = 6,
						@hh = 8,
						@groupMapPosition = 2,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1	-- Step

-- Production | E. Region | Plant 2 | Quality
exec usp_CreateDemoKPI	@id = 'A23DCA4E-4DBC-487A-A993-C9F0EEA9D790',
						@name = 'Quality',
						@displayOrder = 202,
						@description = 'Plant 2: Quality',
						@groupName = 'Plant 2',
						@min = 0,
						@ll = 82,
						@l = 85,
						@target = 90,
						@actual = 'value_80_100_03',
						@max = 100,
						@groupMapPosition = 3,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | E. Region | Plant 2 | Yield
exec usp_CreateDemoKPI	@id = 'BE45CFAD-4F9E-4C96-B9FB-F8FFE1CF4B20',
						@name = 'Yield',
						@displayOrder = 203,
						@description = 'Plant 2: Yield',
						@groupName = 'Plant 2',
						@min = 0,
						@ll = 85,
						@l = 90,
						@target = 92,
						@actual = 'value_80_100_07',
						@max = 100,
						@groupMapPosition = 4,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | E. Region | Plant 2 | Utilization
exec usp_CreateDemoKPI	@id = 'E063DABF-FE61-4866-8877-A494694BEA54',
						@name = 'Utilization',
						@displayOrder = 204,
						@description = 'Plant 2: Utilization',
						@groupName = 'Plant 2',
						@min = 0,
						@ll = 65,
						@l = 70,
						@target = 85,
						@actual = 'value_60_90_02',
						@h = 85,
						@hh = 88,
						@max = 100,
						@groupMapPosition = 5,
						@actualTrendType = 1, -- Step
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | W. Region | Plant 3 | OEE
exec usp_CreateDemoKPI	@id = '0A8864BD-CF68-4331-9ACD-9BFDE78318A0',
						@name = 'OEE',
						@displayOrder = 300,
						@description = 'Plant 3: OEE',
						@groupName = 'Plant 3',
						@min = 0,
						@ll = 90,
						@l = 94,
						@target = 96,
						@actual = 'value_80_99_01',
						@groupMapPosition = 1,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | W. Region | Plant 3 | Downtime
exec usp_CreateDemoKPI	@id = 'B12A7961-6DE8-4F83-84AA-583F5DE86561',
						@name = 'Downtime',
						@displayOrder = 301,
						@description = 'Plant 3: Downtime',
						@groupName = 'Plant 3',
						@min = 0,
						@target = 0,
						@actual = 'value_3_10_03',
						@h = 6,
						@hh = 8,
						@groupMapPosition = 2,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1	-- Step

-- Production | W. Region | Plant 3 | Quality
exec usp_CreateDemoKPI	@id = 'C5CF9F2E-74F5-4AD4-A93C-9E087139E157',
						@name = 'Quality',
						@displayOrder = 302,
						@description = 'Plant 3: Quality',
						@groupName = 'Plant 3',
						@min = 0,
						@ll = 82,
						@l = 85,
						@target = 90,
						@actual = 'value_80_100_04',
						@max = 100,
						@groupMapPosition = 3,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | W. Region | Plant 3 | Yield
exec usp_CreateDemoKPI	@id = '6692CB73-1DDF-4D2A-BD81-270B2A772876',
						@name = 'Yield',
						@displayOrder = 303,
						@description = 'Plant 3: Yield',
						@groupName = 'Plant 3',
						@min = 0,
						@ll = 85,
						@l = 90,
						@target = 92,
						@actual = 'value_80_100_08',
						@max = 100,
						@groupMapPosition = 4,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | W. Region | Plant 3 | Utilization
exec usp_CreateDemoKPI	@id = 'D696B9B2-5746-433F-9781-72D9FDE670C3',
						@name = 'Utilization',
						@displayOrder = 304,
						@description = 'Plant 3: Utilization',
						@groupName = 'Plant 3',
						@min = 0,
						@ll = 65,
						@l = 70,
						@target = 85,
						@actual = 'value_60_90_03',
						@h = 85,
						@hh = 88,
						@max = 100,
						@groupMapPosition = 5,
						@actualTrendType = 1, -- Step
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | W. Region | Plant 4 | OEE
exec usp_CreateDemoKPI	@id = 'E7568469-3ED4-4DAA-A47D-D752DFC40A62',
						@name = 'OEE',
						@displayOrder = 400,
						@description = 'Plant 4: OEE',
						@groupName = 'Plant 4',
						@min = 0,
						@ll = 90,
						@l = 94,
						@target = 96,
						@actual = 'value_70_75_01',
						@groupMapPosition = 1,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | W. Region | Plant 4 | Downtime
exec usp_CreateDemoKPI	@id = 'BFF2CC81-8909-4A34-A976-4B41A30063A6',
						@name = 'Downtime',
						@displayOrder = 401,
						@description = 'Plant 4: Downtime',
						@groupName = 'Plant 4',
						@min = 0,
						@target = 0,
						@actual = 'value_6_10_01',
						@h = 6,
						@hh = 8,
						@groupMapPosition = 2,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1	-- Step

-- Production | W. Region | Plant 4 | Quality
exec usp_CreateDemoKPI	@id = '8721848F-C202-485F-8791-159C736AAD69',
						@name = 'Quality',
						@displayOrder = 402,
						@description = 'Plant 4: Quality',
						@groupName = 'Plant 4',
						@min = 0,
						@ll = 82,
						@l = 85,
						@target = 90,
						@actual = 'value_80_100_05',
						@max = 100,
						@groupMapPosition = 3,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | W. Region | Plant 4 | Yield
exec usp_CreateDemoKPI	@id = 'DA5011CE-22A4-4C18-8F95-826B2ECE2152',
						@name = 'Yield',
						@displayOrder = 403,
						@description = 'Plant 4: Yield',
						@groupName = 'Plant 4',
						@min = 0,
						@ll = 85,
						@l = 90,
						@target = 92,
						@actual = 'value_80_100_09',
						@max = 100,
						@groupMapPosition = 4,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Production | W. Region | Plant 4 | Utilization
exec usp_CreateDemoKPI	@id = '85185C3A-2332-4E86-A0A6-83689E0B044B',
						@name = 'Utilization',
						@displayOrder = 404,
						@description = 'Plant 4: Utilization',
						@groupName = 'Plant 4',
						@min = 0,
						@ll = 65,
						@l = 70,
						@target = 85,
						@actual = 'value_60_90_04',
						@h = 85,
						@hh = 88,
						@max = 100,
						@groupMapPosition = 5,
						@actualTrendType = 1, -- Step
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Supply Chain | Costs | COGS
exec usp_CreateDemoKPI	@id = '0475BAC0-7690-4D01-973A-31C963FB6192',
						@name = 'COGS',
						@description = 'Manufacturing Cost of Goods Sold',
						@groupName = 'Costs',
						@displayOrder = 51,
						@min = 0,
						@ll = 40,
						@l = 45,
						@target = 55,
						@actual = 'value_30_70_01',
						@h = 60,
						@hh = 62.5,
						@max = 70,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Supply Chain | Costs | Total SC Cost
exec usp_CreateDemoKPI	@id = '28D68475-B4C1-483B-8376-2E09FC7E5E57',
						@name = 'Total SC Cost',
						@description = 'Manufacturing Total SC Cost',
						@groupName = 'Costs',
						@displayOrder = 52,
						@min = 0,
						@ll = 45,
						@l = 50,
						@target = 60,
						@actual = 'value_30_70_02',
						@h = 65,
						@hh = 67.5,
						@max = 70,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Supply Chain | Costs | Productivity
exec usp_CreateDemoKPI	@id = 'BD0DFC74-2789-4578-BCD8-0F0711BF0667',
						@name = 'Productivity',
						@description = 'Manufacturing Productivity',
						@groupName = 'Costs',
						@displayOrder = 53,
						@min = 0,
						@ll = 70,
						@l = 85,
						@target = 92,
						@actual = 'value_50_100_01',
						@max = 100,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Supply Chain | Costs | Return Rate
exec usp_CreateDemoKPI	@id = 'B49432D8-2751-4EB3-9FFF-4FA960B6AE5A',
						@name = 'Return Rate',
						@description = 'Manufacturing Return Rate',
						@groupName = 'Costs',
						@displayOrder = 54,
						@min = 0,
						@ll = 1.25,
						@l = 1.9,
						@target = 2.25,
						@actual = 'value_0_5_01',
						@h = 3.25,
						@hh = 4,
						@max = 5,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Supply Chain | Costs | Carrying Cost (Inv)
exec usp_CreateDemoKPI	@id = 'FE24EA37-8494-4491-8337-122C1804E10A',
						@name = 'Carrying Cost (Inv)',
						@description = 'Manufacturing Carrying Cost Inventory',
						@groupName = 'Costs',
						@displayOrder = 55,
						@min = 0,
						@ll = 2,
						@l = 3,
						@target = 3.5,
						@actual = 'value_0_5_02',
						@h = 4.25,
						@hh = 4.5,
						@max = 5,
						@uom = '%',
						@uomDisplayFormat = 1 -- Number + UOM

-- Supply Chain | Agility | Order Lead Time
exec usp_CreateDemoKPI	@id = '69A791B7-DBF3-490F-AA8D-C91E8679BD08',
						@name = 'Order Lead Time',
						@description = 'Manufacturing Order Lead Time',
						@groupName = 'Agility',
						@displayOrder = 61,
						@min = 0,
						@target = 7,
						@actual = 'value_5_15_03',
						@h = 12,
						@hh = 14,
						@max = 15,
						@uom = 'Days',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Supply Chain | Agility | Late Orders
exec usp_CreateDemoKPI	@id = '4FFCC84D-EFE3-46E3-9FD8-E1ADFDEDECD4',
						@name = 'Late Orders',
						@description = 'Manufacturing Late Orders',
						@groupName = 'Agility',
						@displayOrder = 62,
						@min = 0,
						@target = 3,
						@actual = 'value_1_10_01',
						@h = 6,
						@hh = 9,
						@max = 10,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Supply Chain | Agility | Order Accuracy
exec usp_CreateDemoKPI	@id = '6F4B4F8A-5A62-4784-A110-5A6AAF240D74',
						@name = 'Order Accuracy',
						@description = 'Manufacturing Order Accuracy',
						@groupName = 'Agility',
						@displayOrder = 63,
						@min = 0,
						@ll = 92,
						@l = 95,
						@target = 99.5,
						@actual = 'value_90_100_04',
						@max = 100,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Supply Chain | Agility | Inv/Sales Ratio
exec usp_CreateDemoKPI	@id = '5B2018F6-6D06-46F1-9799-468FB9379DD1',
						@name = 'Inv/Sales Ratio',
						@description = 'Manufacturing Inventory to Sales Ratio',
						@groupName = 'Agility',
						@displayOrder = 64,
						@min = 0,
						@ll = 1,
						@l = 2,
						@target = 3,
						@actual = 'value_0_5_03',
						@h = 4,
						@hh = 4.5,
						@max = 5,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Supply Chain | Reliability | Fill Rate
exec usp_CreateDemoKPI	@id = '73618F70-520C-498C-A1F5-652C9332942B',
						@name = 'Fill Rate',
						@description = 'Manufacturing Fill Rate',
						@groupName = 'Reliability',
						@displayOrder = 71,
						@min = 90,
						@ll = 93,
						@l = 95,
						@target = 99,
						@actual = 'value_90_100_05',
						@max = 100,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

-- Supply Chain | Reliability | Inventory Turns
exec usp_CreateDemoKPI	@id = '5DDCEA24-392D-4450-810D-B1FF3C94E539',
						@name = 'Inventory Turns',
						@description = 'Manufacturing Inventory Turns',
						@groupName = 'Reliability',
						@displayOrder = 73,
						@min = 0,
						@ll = 5,
						@l = 8,
						@target = 18,
						@actual = 'value_0_30_02',
						@h = 25,
						@hh = 28,
						@max = 30,
						@uom = '%',
						@uomDisplayFormat = 1, -- Number + UOM
						@actualTrendType = 1 -- Step

go
print N'04.KPIs Complete';
print getdate();
go