sleep 90s
#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/common/01.Database.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/common/02.Data.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/common/03.Indexes.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/manufacturing/01.Database.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/manufacturing/02.Data.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/manufacturing/03.Groups.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/manufacturing/04.KPIs.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/manufacturing/05.Tables.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/manufacturing/06.Charts.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Convoy#8" -i /scripts/manufacturing/07.Dashboards.sql
