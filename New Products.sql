--You are given a table of product launches by company by year. Write a query to count the net difference between the number of products companies launched in 2020 with the number of products companies launched
-- in the previous year. Output the name of the companies and a net difference of net products released for 2020 compared to the previous year.



select company_name, no_of_products2020-no_of_products2019
from(
select company_name, 
sum(case when year = 2020 then 1 else 0 end) as 'no_of_products2020'
,
sum(case when year = 2019 then 1 else 0 end) as 'no_of_products2019'
from car_launches
group by 1) as c;
