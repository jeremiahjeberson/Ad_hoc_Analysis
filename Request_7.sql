/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

SELECT concat(monthname(fact_sales_monthly.date), '(', year(fact_sales_monthly.date), ')') as month, fact_sales_monthly.fiscal_year as year, 
	   round(sum(fact_gross_price.gross_price * fact_sales_monthly.sold_quantity), 2) as Gross_sales_amount
	   from fact_sales_monthly join fact_gross_price on fact_sales_monthly.product_code = fact_gross_price.product_code
       join dim_customer on fact_sales_monthly.customer_code = dim_customer.customer_code
       where dim_customer.customer = "Atliq Exclusive"
       group by month, year
       order by year;
