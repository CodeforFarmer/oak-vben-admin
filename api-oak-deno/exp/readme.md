this is experiment

1. multi-tenant design
{ tenantId: "" } => controller => service => repository, where tenant_id = ""

2. snowflake design
create request => ... => repository,   insert id,... into table values (snowflake,...)

3. generator design 
database schema => view engine => write file in typescript、vue syntax