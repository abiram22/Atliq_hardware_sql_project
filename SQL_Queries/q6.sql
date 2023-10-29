


select d.customer_code, 
c.customer, 
d.pre_invoice_discount_pct as average_discount_percentage
from fact_pre_invoice_deductions d
left join dim_customer c 
on d.customer_code = c.customer_code
where c.market = 'India' and fiscal_year = '2021'
order by d.pre_invoice_discount_pct desc
limit 5
