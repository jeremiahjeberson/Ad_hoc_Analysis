/*4. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost*/

SELECT fact_manufacturing_cost.product_code, dim_product.product as product, fact_manufacturing_cost.manufacturing_cost 
FROM fact_manufacturing_cost inner join dim_product
on fact_manufacturing_cost.product_code = dim_product.product_code
where fact_manufacturing_cost.manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost)
union
SELECT fact_manufacturing_cost.product_code, dim_product.product as product, fact_manufacturing_cost.manufacturing_cost 
FROM fact_manufacturing_cost inner join dim_product
on fact_manufacturing_cost.product_code = dim_product.product_code
where fact_manufacturing_cost.manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost);
