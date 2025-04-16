# 9.   Which channel helped to bring more gross sales in the fiscal year 2021 ?

select dc.channel,
round(sum(fgp.gross_price)*sum(fsm.sold_quantity)/1e6,2) as gross_sales_million
from gdb023.fact_gross_price fgp join gdb023.fact_sales_monthly fsm
on fgp.product_code=fsm.product_code
join gdb023.dim_customer dc
on dc.customer_code=fsm.customer_code
where fgp.fiscal_year=2021
group by dc.channel
order by gross_sales_million desc;