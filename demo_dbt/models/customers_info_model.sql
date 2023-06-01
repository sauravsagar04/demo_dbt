{{ config(materialized='table') }}

with customer_orders as (
    select
        o_custkey as customer_id,
        min(o_orderdate) as first_order_date,
        max(o_orderdate) as most_recent_order_date,
        count(o_orderkey) as number_of_orders

    from orders

    group by 1
)

select
    customers.c_custkey as customer_id,
    customers.c_name, 
    customer_orders.first_order_date,
    customer_orders.most_recent_order_date,
    coalesce(customer_orders.number_of_orders, 0) as number_of_orders

from customers

left join customer_orders on (customer_orders.customer_id=customer_id) 
order by number_of_orders desc limit 100
