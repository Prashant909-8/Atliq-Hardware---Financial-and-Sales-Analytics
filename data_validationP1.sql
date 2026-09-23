
use gdb0041;



# finding nulls fact_gross_price table
select count(*),sum(case when product_code is null then 1 else 0 end) as null_product_code,
sum(case when fiscal_year is null then 1 else 0 end) as null_fiscal_year,
sum(case when gross_price is null then 1 else 0 end) as null_gross_price
from fact_gross_price;

#finding duplicates in gross sales table
select product_code,fiscal_year,count(*)as duplicate_count
from fact_gross_price
group by product_code,fiscal_year
having count(*)>1;

# finding nulls in fact_pre_invoice_deductions
select count(*)as total_rows,sum(case when customer_code is null then 1 else 0 end) as null_customer_code,
sum(case when fiscal_year is null then 1 else 0 end) as null_fiscal_year,
sum(case when pre_invoice_discount_pct  is null then 1 else 0 end) as null_pre_invoice_discount_pct
from fact_pre_invoice_deductions;

#finding duplicates in  fact_pre_invoice_deductions table
select customer_code,fiscal_year,count(*)as duplicate_count
from fact_pre_invoice_deductions
group by customer_code,fiscal_year
having count(*)>1;

# finding nulls in fact_post_invoice_deductions
select count(*)as total_rows,sum(case when customer_code is null then 1 else 0 end) as null_customer_code,
sum(case when date is null then 1 else 0 end) as null_date,
sum(case when discounts_pct  is null then 1 else 0 end) as null_discount_pct ,
sum(case when other_deductions_pct  is null then 1 else 0 end) as null_other_discount_pct,
sum(case when product_code is null then 1 else 0 end) as null_product_code
from fact_post_invoice_deductions;

# finding duplicates in fact_post_invoice_deductions
select customer_code,product_code,date,count(*)as duplicate_count
from fact_post_invoice_deductions
group by customer_code,product_code,date
having count(*)>1;

# finding nulls in fact_manufacturing
select count(*) as total_rows,sum(case when product_code is null then 1 else 0 end)as null_product_code,
sum(case when cost_year is null then 1 else 0 end)as null_cost_year,
sum(case when  manufacturing_cost is null then 1 else 0 end)as null_manufacturing_cost
from fact_manufacturing_cost;

## finding duplicates in fact_manufacturing
select product_code,cost_year,count(*)as duplicate_count
from fact_manufacturing_cost
group by product_code,cost_year
having count(*)>1;

# finding nulls in fact_freight
select count(*) as total_rows,sum(case when market is null then 1 else 0 end)as null_market,
sum(case when fiscal_year is null then 1 else 0 end)as null_fiscal_year,
sum(case when  freight_pct is null then 1 else 0 end)as null_freight_pct,
sum(case when  other_cost_pct is null then 1 else 0 end)as null_other_cost_pct
from fact_freight_cost;

# finding duplicates in fact_freight
select market,fiscal_year,count(*)as duplicate_count
from fact_freight_cost
group by market,fiscal_year
having count(*)>1;

## finding nulls in fact_sales
select count(*) as total_rows,sum(case when date is null then 1 else 0 end)as null_date,
sum(case when product_code is null then 1 else 0 end)as null_product_code,
sum(case when customer_code is null then 1 else 0 end)as null_customer_code,
sum(case when  sold_quantity is null then 1 else 0 end)as null_sold_qty
from fact_sales_monthly;

### finding duplicates in fact_sales
select date,product_code,customer_code,count(*)as duplicate_count
from fact_sales_monthly
group by date,product_code,customer_code
having count(*)>1;

### finding duplicates in dim_cust
select customer_code,count(*)as duplicate_count
from dim_customer
group by customer_code
having count(*)>1;








    
    


    
   
  







