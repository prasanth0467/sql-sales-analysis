# 4. Which segment had the most increase in unique products in  2021  vs 2020?

select dp.segment,
count(distinct case when fgp.fiscal_year=2020 then
fgp.product_code end) as product_count_2020,
count(distinct case when fgp.fiscal_year=2021 then
fgp.product_code end) as product_count_2021,
(count(distinct case when fgp.fiscal_year=2021 then
fgp.product_code end)-
count(distinct case when fgp.fiscal_year=2020 then
fgp.product_code end)) as difference
from gdb023.fact_gross_price as fgp
join gdb023.dim_product as dp
on fgp.product_code=dp.product_code
group by dp.segment
order by difference desc
limit 1;