with customer_city_address as (
    select
        o_custkey as customer_id,
        o_orderstatus as customer_orderstatus,
        o_totalprice as customer_totalprice
    from orders
)

select
    customers.c_custkey as customer_id,
    customers.c_name, 
    customers.c_address,
    customer_city_address.customer_orderstatus,
    customer_city_address.customer_totalprice

from customers

join customer_city_address on (customer_city_address.customer_id=customer_id) 
where customer_id in (select c_custkey from customers where c_address ='new york')