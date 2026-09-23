use gdb0041;

# top N customers in indian market
with market_star_cust as(
select c.customer , sum(sold_quantity)as sold_qty,dense_rank() over( order by sum(sold_quantity) desc)as _Rank
 from fact_sales_monthly as f 
join dim_customer as c
on f.customer_code=c.customer_code
where c.market like "india"
group by c.customer
)
select * from market_star_cust
where _Rank=2;


#calculating pre invoice discount and total post discounts
 create view calculated_discounts as
 select s.date,s.product_code,s.customer_code,s.sold_quantity,g.fiscal_year,g.gross_price,(gross_price*sold_quantity) as gross_sales,(g.gross_price*pid.pre_invoice_discount_pct)*sold_quantity as total_pre_discount,
coalesce(discounts_pct,0)+coalesce(other_deductions_pct,0) as total_post_deductions_pct from
 fact_sales_monthly as s 
 join fact_gross_price g
 on s.product_code=g.product_code and get_fiscal_year(s.date)=g.fiscal_year
 join fact_pre_invoice_deductions as pid
 on g.fiscal_year=pid.fiscal_year and
 s.customer_code=pid.customer_code 
 left join fact_post_invoice_deductions as poid
 on poid.customer_code=s.customer_code 
 and s.product_code=poid.product_code
 and s.date=poid.date;
 
 #creating Netsales view
 create view netsales as
 select date,customer_code,product_code, fiscal_year,gross_price,gross_sales,total_pre_discount,net_invoice_sales,
 (net_invoice_sales*total_post_deductions_pct)as total_post_deductions,sold_quantity,net_sales from(
 select *,round((net_invoice_sales-(net_invoice_sales*total_post_deductions_pct)),2) as net_sales from (
 select *,(gross_sales-total_pre_discount) as net_invoice_sales
 from calculated_discounts)m
 )n;

 ## indian market yoy% analysis
 select *,ifnull(total_NS/previous_year_NS,"NOT_AVAILABLE") from (
 select c.market,n.fiscal_year,round(sum(n.net_sales),2)as total_NS,
 lag(sum(n.net_sales)) over(order by n.fiscal_year asc) as previous_year_NS
 from netsales as n 
 join dim_customer as c 
 on n.customer_code=c.customer_code
 where market like "india"
 group by market,n.fiscal_year) m;
 
 
-- 2. After gross price - 1 thousand + rows lost because we did not give post discount for some products and Customers
SELECT COUNT(*)
FROM fact_sales_monthly s
JOIN  fact_post_invoice_deductions post
  ON s.customer_code = post.customer_code
  and s.product_code=post.product_code
 AND s.date=post.date


 
 