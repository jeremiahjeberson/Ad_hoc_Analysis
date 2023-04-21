/*5. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

SELECT distinct dim_product.segment, 
	   count(distinct case when fact_sales_monthly.fiscal_year = 2020 then dim_product.product_code end) as product_count_2020,
	   count(distinct case when fact_sales_monthly.fiscal_year = 2021 then dim_product.product_code end) as product_count_2021,
       count(distinct case when fact_sales_monthly.fiscal_year = 2021 then dim_product.product_code end) - count(distinct case when fact_sales_monthly.fiscal_year = 2020 then dim_product.product_code end) as differemcs
       from dim_product join fact_sales_monthly
       on dim_product.product_code = fact_sales_monthly.product_code
       group by dim_product.segment;
