select *
from {{ ref('customers_info_model') }}
where c_name like ('%8')