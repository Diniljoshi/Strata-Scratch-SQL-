--Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning 
--active users.



select distinct(a1.user_id) as user_id
from amazon_transactions a1 
inner join amazon_transactions a2 
on 
a1.user_id = a2.user_id and a1.id <> a2.id 
where  datediff(a2.created_at,a1.created_at) between 0 and 7 
order by a1.user_id;
