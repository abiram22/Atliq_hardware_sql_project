

with cte as 
(
select p.product_code, p.product,
m.manufacturing_cost
from dim_product p 
left join fact_manufacturing_cost m
on p.product_code= m.product_code
)
select product_code, product, 
manufacturing_cost from cte
where manufacturing_cost = (select max(manufacturing_cost) from cte)
union
select product_code, product, manufacturing_cost
from cte
where manufacturing_cost = (select min(manufacturing_cost) from cte)
