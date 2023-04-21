/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/

with T1 as
(
select dim_customer.channel, round(sum(fact_gross_price.gross_price * fact_sales_monthly.sold_quantity / 1000000),2) as gross_sales_mln
from fact_sales_monthly join dim_customer  on fact_sales_monthly.customer_code = dim_customer.customer_code
join fact_gross_price on fact_sales_monthly.product_code = fact_gross_price.product_code
where fact_gross_price.fiscal_year = 2021
group by channel
),
T2 as 
(
select sum(gross_sales_mln) as total
from T1
),
T3 as
(
select channel, concat(round(gross_sales_mln * 100 / T2.total, 2), '%') as percentage
from T1, T2
)
select T1.channel, concat(T1.gross_sales_mln, 'M') as gross_sales_mln, T3.percentage
from T1 join T3 on T1.channel = T3.channel
order by T1.gross_sales_mln desc;
