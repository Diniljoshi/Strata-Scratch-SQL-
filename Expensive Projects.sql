-- Given a list of projects and employees mapped to each project, calculate by the amount of project budget allocated to each employee . The output should include the project title and the project budget rounded 
-- to the closest integer. Order your list by projects with the highest budget per employee first.


select title, sum(budget)/count(emp_id)
from 
ms_emp_projects e
join  ms_projects m
on e.project_id = m.id 
group by 1
order by 2 desc
;
