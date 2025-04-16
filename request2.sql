# 2.What is the percentage of unique product increase in 2021 vs. 2020? 

SELECT * FROM gdb023.fact_gross_price;
select
count(distinct case when fiscal_year=2020
then product_code end) as unique_products_2020,
count(distinct case when fiscal_year=2021
then product_code end) as unique_products_2021,
round(
((count(distinct case when fiscal_year=2021
then product_code end)-
count(distinct case when fiscal_year=2020
then product_code end))*100.0)/
count(distinct case when fiscal_year=2020
then product_code end),
2) as percentage_chg
from gdb023.fact_gross_price;

