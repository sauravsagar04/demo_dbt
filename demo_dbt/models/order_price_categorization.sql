{{ config(materialized='view') }}

with t as (
    select 'Low O_TotalPrice' category 
        union 
        select 'Average O_TotalPrice' 
        union 
        select 'High O_TotalPrice'
)
select t.category, ifnull(a.cnt, 0) as TotalPrice_count
    from t
    left join (
        select
            case when o_totalprice < 500000 then 'Low O_TotalPrice'
                 when o_totalprice > 1000000 then 'High O_TotalPrice'
                 else 'Average O_TotalPrice' end
            as category,
            count(1) as cnt
        from orders
        group by 1
    ) as a
    on t.category = a.category