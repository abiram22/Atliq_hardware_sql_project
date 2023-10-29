

with cte as (select c.channel,
sum(round((m.sold_quantity * p.gross_price)/100000, 2))
 as gross_sales_mln
from fact_sales_monthly m
left join fact_gross_price p
on m.product_code = p.product_code

left join dim_customer c
on c.customer_code = m.customer_code
where m.fiscal_year = '2021'
group by c.channel)
select *, 
round( gross_sales_mln*100 / (select sum(gross_sales_mln) from cte), 2) 
as percentage
from cte
order by gross_sales_mln desc

