--You have been asked to find the job titles of the highest-paid employees.
--Your output should include the highest-paid title or multiple titles with the same salary.



SELECT t.worker_title AS worker_title
FROM worker w 
JOIN title t ON w.worker_id = t.worker_ref_id
GROUP BY 1 
having max(w.salary) = (select max(salary) from worker)
order by 1 
;
