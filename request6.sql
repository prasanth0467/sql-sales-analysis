# 6.  Generate a report which contains the top 5 customers who received an 
 # average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the Indian  market

SELECT * FROM gdb023.fact_pre_invoice_deductions;
select dc.customer_code,dc.customer,
round(avg(fp.pre_invoice_discount_pct),2) as average_discount_percentage
from gdb023.dim_customer as dc join gdb023.fact_pre_invoice_deductions as fp
on dc.customer_code=fp.customer_code
where fp.fiscal_year=2021 and dc.market='India'
group by dc.customer_code,dc.customer
order by average_discount_percentage desc
limit 5;