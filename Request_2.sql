/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/

SELECT count(distinct case when fact_sales_monthly.fiscal_year = 2020 then dim_product.product_code end) as Unique_product_2020,
	   count(distinct case when fact_sales_monthly.fiscal_year = 2021 then dim_product.product_code end) as Unique_product_2021,
       (count(distinct case when fact_sales_monthly.fiscal_year = 2021 then dim_product.product_code end) - count(distinct case when fact_sales_monthly.fiscal_year = 2020 then dim_product.product_code end)) / count(distinct case when fact_sales_monthly.fiscal_year = 2020 then dim_product.product_code end) * 100 as percentag_chg
       from dim_product join fact_sales_monthly 
       on dim_product.product_code = fact_sales_monthly.product_code;
