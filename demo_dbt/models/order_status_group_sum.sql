
select o_orderstatus, sum(O_totalprice) as totalSum 
from test_snowflake.test_schema.orders 
group by o_orderstatus

