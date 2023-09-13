print getdate();
set nocount on;
print N'07.Dashboards Begin...';
go

-- Profile Group
if not exists (select * from tableProfileGroups where ID = '65B21D30-B494-46C6-BC93-EA4E51B4852F')
begin
	insert into tableProfileGroups (	ID,
										Name,
										[Description],
										Locked,
										IsSystem,
										IsPrivate,
										Show)
	values ('65B21D30-B494-46C6-BC93-EA4E51B4852F',		-- ID
			'Demo Profiles',							-- Name
			'Demo Profile Group',						-- Description
			0,											-- Locked
			0,											-- Is System
			0,											-- Is Private
			1)											-- Show
end
go

-- Profile
if not exists (select * from tableProfiles where ID = '2F5761DA-8EB7-4A1A-A2B1-56839F66341E')
begin
	insert into tableProfiles (	ID,
								ProfileGroupID,
								Name,
								[Description],
								Locked,
								Show,
								IsDefault)
	values ('2F5761DA-8EB7-4A1A-A2B1-56839F66341E',		-- ID
			'65B21D30-B494-46C6-BC93-EA4E51B4852F',		-- Profile Group ID (Demo Profiles Group)
			'Demos',									-- Name
			'Demo Profile',								-- Description
			0,											-- Locked
			1,											-- Show
			1)											-- Is Default
end
go

-- Watchlist
if not exists (select * from tableProfiles where ID = '338ab54f-2c85-4053-ba45-0ba7e1cf4c49')
begin
	insert into tableWatchlists (	ID,
									GroupID,
									ProfileID)
	values ('338ab54f-2c85-4053-ba45-0ba7e1cf4c49',
			'7EE27D6E-A1CB-48CD-A073-2968AF67F477',
			'2F5761DA-8EB7-4A1A-A2B1-56839F66341E')
end
go

-- Dashboard
if not exists (select * from tableDashboards where ID = 'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0')
begin
	insert into tableDashboards	(	ID,
									GroupID,
									Name,
									[Description],
									Locked,
									Show,
									IsDefault,
									StartTime,
									EndTime)
	values ('C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- ID
			'7EE27D6E-A1CB-48CD-A073-2968AF67F477',		-- Group ID (Home)
			'Manufacturing Demo',						-- Name
			'Manufacturing Demo Dashboard',				-- Description
			0,											-- Locked
			1,											-- Show
			1,											-- Is Default
			'*-7d',										-- Start Time
			'*')										-- End Time

	insert into tableProfileDashboards(ProfileID, DashboardID) values ('2F5761DA-8EB7-4A1A-A2B1-56839F66341E', 'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0')
end
go

-- Widgets
if not exists (select * from tableWidgets where ID = '1A27846C-8AE9-40F0-B420-FB807754080D')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('1A27846C-8AE9-40F0-B420-FB807754080D',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			1,											-- Row Start
			4,											-- Row End
			1,											-- Column Start
			1,											-- Column End
			2,											-- Object Type
			'53213A1C-E417-410C-BA36-009575E904BA',		-- Object ID
			2,											-- Widget Type
			'KPI Block',								-- Meta Description
			'?pid=70&kpi=53213a1c-e417-410c-ba36-009575e904ba')	-- URI
end
go
if not exists (select * from tableWidgets where ID = 'E0005318-D4E4-4159-96E7-AA331556BF4B')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('E0005318-D4E4-4159-96E7-AA331556BF4B',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			1,											-- Row Start
			4,											-- Row End
			2,											-- Column Start
			2,											-- Column End
			2,											-- Object Type
			'FFE58E3E-22EA-469F-A3C9-9A35942B9B6F',		-- Object ID
			2,											-- Widget Type
			'KPI Block',								-- Meta Description
			'?pid=70&kpi=ffe58e3e-22ea-469f-a3c9-9a35942b9b6f')	-- URI
end
go
if not exists (select * from tableWidgets where ID = '0AF8F998-9532-4A22-99AB-408DA79C4C36')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('0AF8F998-9532-4A22-99AB-408DA79C4C36',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			1,											-- Row Start
			4,											-- Row End
			3,											-- Column Start
			3,											-- Column End
			2,											-- Object Type
			'0A8864BD-CF68-4331-9ACD-9BFDE78318A0',		-- Object ID
			2,											-- Widget Type
			'KPI Block',								-- Meta Description
			'?pid=70&kpi=0a8864bd-cf68-4331-9acd-9bfde78318a0')	-- URI
end
go
if not exists (select * from tableWidgets where ID = '06D52596-F14C-46F2-B6F2-A63CF915044D')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('06D52596-F14C-46F2-B6F2-A63CF915044D',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			1,											-- Row Start
			4,											-- Row End
			4,											-- Column Start
			4,											-- Column End
			2,											-- Object Type
			'E7568469-3ED4-4DAA-A47D-D752DFC40A62',		-- Object ID
			2,											-- Widget Type
			'KPI Block',								-- Meta Description
			'?pid=70&kpi=e7568469-3ed4-4daa-a47d-d752dfc40a62')	-- URI
end
go
if not exists (select * from tableWidgets where ID = 'F997AC64-C6A9-452A-9FB2-B3FCC64C7239')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('F997AC64-C6A9-452A-9FB2-B3FCC64C7239',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			5,											-- Row Start
			20,											-- Row End
			1,											-- Column Start
			2,											-- Column End
			1,											-- Object Type
			'70D82D70-635A-4B22-A6F9-B302B0EF211A',		-- Object ID
			1,											-- Widget Type
			'Group Geo',								-- Meta Description
			'?gid0=ecc2006b-6d57-427f-85be-48461ae1ca14&gid=70d82d70-635a-4b22-a6f9-b302b0ef211a&pid=10&gid1=3f5c7061-3c73-4d59-9dbf-f69b813728d3&gv=1&gx=0')	-- URI
end
go
if not exists (select * from tableWidgets where ID = '3F025B5F-A528-4938-9409-520563A3DE6F')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('3F025B5F-A528-4938-9409-520563A3DE6F',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			5,											-- Row Start
			12,											-- Row End
			3,											-- Column Start
			4,											-- Column End
			1,											-- Object Type
			'70D82D70-635A-4B22-A6F9-B302B0EF211A',		-- Object ID
			1,											-- Widget Type
			'KPI Group Map',							-- Meta Description
			'?pid=20&gid=70d82d70-635a-4b22-a6f9-b302b0ef211a&gid0=ecc2006b-6d57-427f-85be-48461ae1ca14&kx=1&kv=3&gid1=3f5c7061-3c73-4d59-9dbf-f69b813728d3&gmx=1')	-- URI
end
go
if not exists (select * from tableWidgets where ID = '74659C22-8355-4BCE-BE5B-5BB4CE458E67')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('74659C22-8355-4BCE-BE5B-5BB4CE458E67',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			13,											-- Row Start
			28,											-- Row End
			3,											-- Column Start
			4,											-- Column End
			3,											-- Object Type
			'49EC3380-A454-4921-A7E0-EA2E97CB0E98',		-- Object ID
			1,											-- Widget Type
			'Trend',									-- Meta Description
			'?gid0=3f5c7061-3c73-4d59-9dbf-f69b813728d3&gid=ecc2006b-6d57-427f-85be-48461ae1ca14&pid=70&trend=49ec3380-a454-4921-a7e0-ea2e97cb0e98&fromtime=9/14/2017 4:46:31 PM&totime=9/21/2017 4:46:31 PM&ms=2&sl=b7ffa1e5-8f62-4889-af41-93ff2a7eb9a9')	-- URI
end
go
if not exists (select * from tableWidgets where ID = 'F0523049-1FDF-43C6-867C-D5D48FAB49D4')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('F0523049-1FDF-43C6-867C-D5D48FAB49D4',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			21,											-- Row Start
			28,											-- Row End
			1,											-- Column Start
			2,											-- Column End
			9,											-- Object Type
			'4F4ED979-0F99-455F-B786-9B85302F35D4',		-- Object ID
			1,											-- Widget Type
			'Pareto Chart',								-- Meta Description
			'?gid0=3f5c7061-3c73-4d59-9dbf-f69b813728d3&gid=ecc2006b-6d57-427f-85be-48461ae1ca14&pid=400&pcid=4f4ed979-0f99-455f-b786-9b85302f35d4&charttime=*')	-- URI
end
go
if not exists (select * from tableWidgets where ID = 'CF28BDBF-CA12-4896-91B7-5DDDB845B605')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('CF28BDBF-CA12-4896-91B7-5DDDB845B605',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			29,											-- Row Start
			36,											-- Row End
			1,											-- Column Start
			2,											-- Column End
			1,											-- Object Type
			'952AF62F-BA9F-4922-B86B-450C51CCF386',		-- Object ID
			1,											-- Widget Type
			'KPI Bullet',								-- Meta Description
			'?pid=20&gid=952af62f-ba9f-4922-b86b-450c51ccf386&gid0=3c823386-3796-4479-84c3-512873512c77&gid1=ecc2006b-6d57-427f-85be-48461ae1ca14&gid2=3f5c7061-3c73-4d59-9dbf-f69b813728d3&kv=1&bct=2&kx=0&')	-- URI
end
go
if not exists (select * from tableWidgets where ID = '724E021E-5DC9-434B-AF2C-F9C9B5DB57FC')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('724E021E-5DC9-434B-AF2C-F9C9B5DB57FC',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			29,											-- Row Start
			30,											-- Row End
			3,											-- Column Start
			3,											-- Column End
			2,											-- Object Type
			'F9B48C7B-FDAC-4C00-A255-B2E7BBC1581B',		-- Object ID
			2,											-- Widget Type
			'KPI Block',								-- Meta Description
			'?pid=70&kpi=f9b48c7b-fdac-4c00-a255-b2e7bbc1581b')	-- URI
end
go
if not exists (select * from tableWidgets where ID = '62917067-8474-4C6C-B1FA-D1D5DF139393')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('62917067-8474-4C6C-B1FA-D1D5DF139393',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			29,											-- Row Start
			30,											-- Row End
			4,											-- Column Start
			4,											-- Column End
			2,											-- Object Type
			'EA38D63D-5DA9-479A-B7BC-D0A0769D373E',		-- Object ID
			2,											-- Widget Type
			'KPI Block',								-- Meta Description
			'?pid=70&kpi=ea38d63d-5da9-479a-b7bc-d0a0769d373e')	-- URI
end
go
if not exists (select * from tableWidgets where ID = 'CA577C43-C2C3-4344-AE9B-786D884EBA40')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('CA577C43-C2C3-4344-AE9B-786D884EBA40',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			31,											-- Row Start
			38,											-- Row End
			3,											-- Column Start
			4,											-- Column End
			1,											-- Object Type
			'70D82D70-635A-4B22-A6F9-B302B0EF211A',		-- Object ID
			1,											-- Widget Type
			'KPI Map',									-- Meta Description
			'?pid=20&gid=70d82d70-635a-4b22-a6f9-b302b0ef211a&gid0=ecc2006b-6d57-427f-85be-48461ae1ca14&kx=1&kv=2&gid1=3f5c7061-3c73-4d59-9dbf-f69b813728d3')	-- URI
end
go
if not exists (select * from tableWidgets where ID = '4928C7D1-C4BB-460D-86FE-F197D284D04F')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('4928C7D1-C4BB-460D-86FE-F197D284D04F',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			27,											-- Row Start
			52,											-- Row End
			1,											-- Column Start
			2,											-- Column End
			13,											-- Object Type
			'0B324E88-EF52-4022-B8BB-D80859199DCD',		-- Object ID
			1,											-- Widget Type
			'Gantt Chart',								-- Meta Description
			'?pid=440&gcid=0b324e88-ef52-4022-b8bb-d80859199dcd')	-- URI
end
go
if not exists (select * from tableWidgets where ID = '3E845A30-09B3-4DFD-B6A2-B2A60AC7FB8E')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('3E845A30-09B3-4DFD-B6A2-B2A60AC7FB8E',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			39,											-- Row Start
			54,											-- Row End
			3,											-- Column Start
			4,											-- Column End
			11,											-- Object Type
			'CEC14B95-76DE-4A49-B4D3-561FBB45526A',		-- Object ID
			1,											-- Widget Type
			'Bar Chart',								-- Meta Description
			'?gid0=3f5c7061-3c73-4d59-9dbf-f69b813728d3&gid=ecc2006b-6d57-427f-85be-48461ae1ca14&pid=420&bcid=cec14b95-76de-4a49-b4d3-561fbb45526a&charttime=*')	-- URI
end
go
if not exists (select * from tableWidgets where ID = 'DFE03A9D-F7AB-4FAE-98AF-4B9D5CF93C5E')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('DFE03A9D-F7AB-4FAE-98AF-4B9D5CF93C5E',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			53,											-- Row Start
			60,											-- Row End
			1,											-- Column Start
			2,											-- Column End
			4,											-- Object Type
			'896A0FE8-65FF-44E3-A984-37E1C6E003DD',		-- Object ID
			1,											-- Widget Type
			'Table',									-- Meta Description
			'?gid0=3f5c7061-3c73-4d59-9dbf-f69b813728d3&gid=ecc2006b-6d57-427f-85be-48461ae1ca14&pid=80&tid=896a0fe8-65ff-44e3-a984-37e1c6e003dd&charttime=*')	-- URI
end
go
if not exists (select * from tableWidgets where ID = 'C61734C8-0896-4D1A-AB7D-BE93093508F1')
begin
	insert into tableWidgets (	ID,
								DashboardID,
								RowStart,
								RowEnd,
								ColumnStart,
								ColumnEnd,
								ObjectType,
								ObjectID,
								WidgetType,
								MetaDescription,
								URI)
	values ('C61734C8-0896-4D1A-AB7D-BE93093508F1',		-- ID
			'C23DF90F-04D3-47F5-8A53-4FE34DA4A1F0',		-- Dashboard ID
			55,											-- Row Start
			62,											-- Row End
			3,											-- Column Start
			4,											-- Column End
			12,											-- Object Type
			'CC09B182-0DBF-4693-ACC5-4F8C3025EA65',		-- Object ID
			1,											-- Widget Type
			'Pie Chart',								-- Meta Description
			'?gid0=3f5c7061-3c73-4d59-9dbf-f69b813728d3&gid=ecc2006b-6d57-427f-85be-48461ae1ca14&pid=430&pieid=cc09b182-0dbf-4693-acc5-4f8c3025ea65&charttime=*')	-- URI
end
go
print N'07.Dashboards Complete';
print getdate();
go