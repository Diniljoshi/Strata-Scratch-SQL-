--You have access to Facebook's database which includes several tables relevant to user interactions. For this task, you are particularly interested in tables that store data about user posts, friendships, and likes.
-- Calculate the total number of likes made on friend posts on Friday.


The output should contain two different columns 'likes' and 'date'.
select count(l.post_id), date_liked
from user_posts u
join friendships f
on u.user_name = f.user_name1 or u.user_name = f.user_name2
join likes l
on u.post_id = l.post_id
where dayname(u.date_posted) = 'Friday'
group by u.date_posted;
