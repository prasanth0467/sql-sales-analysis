# 5.  Get the products that have the highest and lowest manufacturing costs

SELECT * FROM gdb023.fact_manufacturing_cost;
(select 
dp.product_code,dp.product,
fmc.manufacturing_cost 
from gdb023.fact_manufacturing_cost as fmc join gdb023.dim_product as dp
on dp.product_code=fmc.product_code
order by fmc.manufacturing_cost desc
limit 1)
union all
(select 
dp.product_code,dp.product,
fmc.manufacturing_cost 
from gdb023.fact_manufacturing_cost as fmc join gdb023.dim_product as dp
on dp.product_code=fmc.product_code
order by fmc.manufacturing_cost
limit 1)