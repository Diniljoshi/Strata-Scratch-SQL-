-- You are given a table containing assignment scores of students in a class. Write a query that identifies the largest difference in total score  of all assignments.
-- Output just the difference in total score (sum of all 3 assignments) between a student with the highest score and a student with the lowest score.

select max(total_score) - min(total_score)
from(
select student, sum(assignment1 + assignment2 + assignment1) as total_score 
from box_scores
group by 1) as c;
