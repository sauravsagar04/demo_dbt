
{% macro change_date_format(dt) %}
coalesce(safe.parse_date('%Y/%m/%d', {{ dt }}), 
          safe.parse_date('%d-%m-%y', {{ dt }}), 
          safe.parse_date('%d-%m-%Y', {{ dt }}))
{% endmacro %}

-- Call the macro inside the SQL query
select 
    c_name, 
    Date as old_date_format,
    {{ change_date_format('first_order_date') }} as new_date_format
from {{ source( 'customers_info_model') }}

