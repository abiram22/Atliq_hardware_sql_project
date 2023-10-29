

with cte as (
select m.product_code, p.product, 
p.division, m.sold_quantity
from fact_sales_monthly m
left join dim_product p
on p.product_code = m.product_code
where fiscal_year = '2021'
limit 30000000),

cte2 as (
select product_code, product, division, 
sum(sold_quantity) as total_sold_quanity,
row_number() 
over(partition by division order by sum(sold_quantity) desc)
as rank_order 
from cte 
group by product_code, product, division)

select * from cte2
where rank_order <=3






-- with cte as (select m.product_code, p.product, p.division,
-- m.sold_quantity
-- -- row_number() over(partition by p.division order by m.sold_quantity desc) as rank_order
-- from fact_sales_monthly m
-- left join dim_product p
-- on p.product_code = m.product_code
-- where fiscal_year = '2021'
-- limit 30000000)

-- select * from cte;
