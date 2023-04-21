/*10. Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,
division
product_code
product
total_sold_quantity
rank_order*/

WITH T1 AS (
  SELECT dim_product.division, dim_product.product_code, dim_product.product, SUM(fact_sales_monthly.sold_quantity) AS Total_sold_quantity
  FROM dim_product 
  JOIN fact_sales_monthly ON dim_product.product_code = fact_sales_monthly.product_code
  WHERE fiscal_year = 2021
  GROUP BY dim_product.division, dim_product.product_code, dim_product.product
),
T2 AS (
  SELECT division, product_code, product, RANK() OVER (PARTITION BY division ORDER BY Total_sold_quantity DESC) AS rank_order
  FROM T1
)
SELECT T1.division, T1.product_code, T1.product, T1.Total_sold_quantity, T2.rank_order
FROM T1 
JOIN T2 ON T1.division = T2.division AND T1.product_code = T2.product_code
WHERE T2.rank_order IN (1,2,3);
