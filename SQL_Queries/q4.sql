with outside as
(select p.product_code, 
p.segment, f.fiscal_year
from dim_product p 
left join fact_gross_price f 
on p.product_code = f.product_code),

product_count_2020 as
(select segment, 
count(product_code) as product_count_2020
from outside
where fiscal_year = '2020'
group by segment),

product_count_2021 as
(select segment, 
count(product_code) as product_count_2021
from outside
where fiscal_year = '2021'
group by segment)

select s.segment, 
s.product_count_2020 as product_count_2020, 
q.product_count_2021, 
q.product_count_2021 - s.product_count_2020 as difference
from product_count_2020 s 
left join product_count_2021 q
on s.segment = q.segment
