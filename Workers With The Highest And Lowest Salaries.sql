-- You have been asked to find the employees with the highest and lowest salary.
-- Your output should include the employee's ID, salary, and department, as well as a column salary_type that categorizes the output by:
-- 'Highest Salary' represents the highest salary
-- 'Lowest Salary' represents the lowest salary

select *
from(
select worker_id, salary, department,
case 
    when salary = (select max(salary) from worker) then 'Highest Salary'
    when salary = (select min(salary) from worker) then 'Lowest Salary'
end as salary_type
from worker)
as c
where salary_type in('Highest Salary','Lowest Salary');
