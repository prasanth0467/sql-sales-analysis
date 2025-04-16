# 7.  Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month 
 
 
SELECT * FROM gdb023.fact_sales_monthly;
select month(fsm.date) as monthh,year(fsm.date) as yearr,
round(sum(fgp.gross_price)*sum(fsm.sold_quantity)/1e6,2) as Gross_Sales_Amount_mln
from gdb023.fact_sales_monthly as fsm join gdb023.fact_gross_price as fgp
on fsm.product_code=fgp.product_code
join gdb023.dim_customer as dc
on dc.customer_code=fsm.customer_code
where dc.customer='Atliq Exclusive'
group by yearr,monthh
order by yearr,monthh
