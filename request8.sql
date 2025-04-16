#8. In which quarter of 2020, got the maximum total_sold_quantity?

SELECT * FROM gdb023.fact_sales_monthly;
select
quarter(date) as Quarterr,
sum(sold_quantity) as total_sold_quantity
from gdb023.fact_sales_monthly
where year(date)=2020
group by Quarterr
order by total_sold_quantity desc;