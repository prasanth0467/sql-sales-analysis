# 10.  Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021.

with rankedproducts as (
select dp.division,dp.product_code,dp.product,fsm.sold_quantity,
rank() over(partition by dp.division order by fsm.sold_quantity desc) as rank_order
from gdb023.dim_product dp join gdb023.fact_sales_monthly fsm
on dp.product_code=fsm.product_code
where fsm.fiscal_year=2021
)
select division,product_code,product,sold_quantity,rank_order from rankedproducts
where rank_order<=3
order by division,rank_order;