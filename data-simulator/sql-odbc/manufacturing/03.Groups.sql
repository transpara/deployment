print getdate();
set nocount on;
print N'03.Groups Begin...';
go

-- Manufacturing Demo Groups
exec usp_CreateDemoGroup	@id = '3F5C7061-3C73-4D59-9DBF-F69B813728D3',
							@name = 'Demos',
							@description = 'Demo Data',
							@parentName = '-- Home --'

declare @demoRoot nvarchar(500)
set @demoRoot = (select name from tableGroups where ID = '3F5C7061-3C73-4D59-9DBF-F69B813728D3')

-- Manufacturing
exec usp_CreateDemoGroup	@id = 'ECC2006B-6D57-427F-85BE-48461AE1CA14',
							@name = 'Manufacturing',
							@description = 'Manufacturing Demo',
							@parentName = @demoRoot

-- Manufacturing | Safety
exec usp_CreateDemoGroup	@id = 'CEECBFD2-7D22-467F-8A3F-D8BBE8B72633',
							@name = 'Safety',
							@parentName = 'Manufacturing',
							@description = 'Manufacturing Safety',
							@displayOrder = 1

-- Manufacturing | Finance
exec usp_CreateDemoGroup	@id = 'AA939B75-1996-4298-83F6-5821B5715AB9',
							@name = 'Finance',
							@parentName = 'Manufacturing',
							@description = 'Manufacturing Finance',
							@displayOrder = 2

-- Manufacturing | Logistics
exec usp_CreateDemoGroup	@id = '3C823386-3796-4479-84C3-512873512C77',
							@name = 'Logistics',
							@parentName = 'Manufacturing',
							@description = 'Manufacturing Logistics',
							@displayOrder = 3

-- Manufacturing | Logistics | Transportation
exec usp_CreateDemoGroup	@id = 'FF844CE1-C152-4001-B7FD-BA3D369422B2',
							@name = 'Transportation',
							@parentName = 'Logistics',
							@description = 'Manufacturing Transportation',
							@displayOrder = 31

-- Manufacturing | Logistics | Warehouse
exec usp_CreateDemoGroup	@id = '952AF62F-BA9F-4922-B86B-450C51CCF386',
							@name = 'Warehouse',
							@parentName = 'Logistics',
							@description = 'Manufacturing Warehouse',
							@displayOrder = 32

-- Manufacturing | Production
exec usp_CreateDemoGroup	@id = '70D82D70-635A-4B22-A6F9-B302B0EF211A',
							@name = 'Production',
							@parentName = 'Manufacturing',
							@description = 'Manufacturing Production',
							@displayOrder = 4,
							@defaultGroupView = 1 -- Geo

-- Manufacturing | Production | E. Region
exec usp_CreateDemoGroup	@id = 'C40FFB28-1E4F-4746-B3AA-076A60EE21F2',
							@name = 'E. Region',
							@parentName = 'Production',
							@description = 'Manufacturing East Region',
							@displayOrder = 10,
							@defaultGroupView = 1, -- Geo
							@latitude = '38.037402',
							@longitude = '-78.402368'

-- Manufacturing | Production | E. Region | Plant 1
exec usp_CreateDemoGroup	@id = 'AC6F08AF-C475-4B36-A802-8FF00DD6E963',
							@name = 'Plant 1',
							@parentName = 'E. Region',
							@description = 'Manufacturing East Region Plant 1',
							@displayOrder = 21,
							@latitude = '34.280833',
							@longitude = '-83.829956'

-- Manufacturing | Production | E. Region | Plant 2
exec usp_CreateDemoGroup	@id = 'D98ADB5C-6562-48D1-A9BD-15DEC826DE16',
							@name = 'Plant 2',
							@parentName = 'E. Region',
							@description = 'Manufacturing East Region Plant 2',
							@displayOrder = 22,
							@latitude = '37.698142',
							@longitude = '-77.552461'

-- Manufacturing | Production | W. Region
exec usp_CreateDemoGroup	@id = 'D6D9DE8F-DD78-4532-A68D-93A8F44AA29E',
							@name = 'W. Region',
							@parentName = 'Production',
							@description = 'Manufacturing West Region',
							@displayOrder = 10,
							@defaultGroupView = 1, -- Geo
							@latitude = '37.539586',
							@longitude = '-121.992383'

-- Manufacturing | Production | W. Region | Plant 3
exec usp_CreateDemoGroup	@id = 'EB0D3B74-A189-4BB6-8DCF-70E0530C9B12',
							@name = 'Plant 3',
							@parentName = 'W. Region',
							@description = 'Manufacturing West Region Plant 3',
							@displayOrder = 23,
							@latitude = '37.363920',
							@longitude = '-122.037210'

-- Manufacturing | Production | W. Region | Plant 4
exec usp_CreateDemoGroup	@id = '0AD5C4C3-69F8-443A-86C5-6DE6CCAF559F',
							@name = 'Plant 4',
							@parentName = 'W. Region',
							@description = 'Manufacturing West Region Plant 4',
							@displayOrder = 24,
							@latitude = '37.550075',
							@longitude = '-121.994818'

-- Manufacturing | Supply Chain
exec usp_CreateDemoGroup	@id = '12921C50-750A-408F-AEB7-14B3B9BC0DE6',
							@name = 'Supply Chain',
							@parentName = 'Manufacturing',
							@description = 'Manufacturing Supply Chain',
							@displayOrder = 4

-- Manufacturing | Supply Chain | Costs
exec usp_CreateDemoGroup	@id = '2227F7F5-D760-44F5-A56E-59E187CCD815',
							@name = 'Costs',
							@parentName = 'Supply Chain',
							@description = 'Manufacturing Costs',
							@displayOrder = 10

-- Manufacturing | Supply Chain | Agility
exec usp_CreateDemoGroup	@id = '5076815E-3BCF-47A5-A83E-BB84C1B00058',
							@name = 'Agility',
							@parentName = 'Supply Chain',
							@description = 'Manufacturing Agility',
							@displayOrder = 11

-- Manufacturing | Supply Chain | Reliability
exec usp_CreateDemoGroup	@id = 'EE23813A-BE33-479C-90C8-ABF4EF023131',
							@name = 'Reliability',
							@parentName = 'Supply Chain',
							@description = 'Manufacturing Reliability',
							@displayOrder = 12

go
print N'03.Groups Complete';
print getdate();
go