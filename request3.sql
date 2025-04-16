#3.Provide a report with all the unique product counts for each  segment  and 
 # sort them in descending order of product counts

SELECT * FROM gdb023.dim_product;
select 
segment,count(product_code) as product_count
from gdb023.dim_product
group by segment
order by product_count desc;