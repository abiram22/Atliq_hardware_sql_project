with cte_20 as
(select count(1) from fact_gross_price
where fiscal_year = '2020'),
cte_21 as 
(select count(1) from fact_gross_price
where fiscal_year = '2021')
select (select * from cte_20) as unique_products_2020, 
(select * from cte_21) as unique_products_2021,
round(
((select * from cte_21) - 
(select * from cte_20))*100/(select * from cte_20) , 2
) 
as percentage_change
from fact_gross_price
group by (select * from cte_20), (select * from cte_21)


