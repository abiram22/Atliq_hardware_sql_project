


select MONTHNAME(m.date) as month, 
year(m.date) as year, 
round(sum(p.gross_price), 2) as gross_price
from fact_sales_monthly m
left join dim_customer c 
on c.customer_code = m.customer_code
left join fact_gross_price p
on p.product_code = m.product_code
where c.customer = 'Atliq Exclusive'
group by month, year, month(m.date)
order by year, month(m.date)
