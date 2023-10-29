

select
case
	when month(date) between 9 and 11 then 'Q1'
    when month(date) between 3 and 5 then 'Q3'
    when month(date) between 6 and 8 then 'Q4'
    else 'Q2'
    end as 'Quarter',
sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly
where fiscal_year = '2020'
group by Quarter
order by total_sold_quantity desc



