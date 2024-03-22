-- Find the top 10 users that have traveled the greatest distance. Output their id, name and a total distance traveled.


select lr.user_id, lu.name,sum(lr.distance) as total_distance
from lyft_rides_log lr
join lyft_users lu
on lr.user_id = lu.id
group by 1
order by 3 desc
limit 10 ;
