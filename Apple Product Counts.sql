-- Find the number of Apple product users and the number of total users with a device and group the counts by language. Assume Apple products are only MacBook-Pro, iPhone 5s, and iPad-air. Output the language 
-- along with the total number of Apple users and users with any device. Order your results based on the number of total users in descending order.



select language_spoken, 
    sum(
        case when dev in ('macbook pro','iPhone 5s','ipad air') then 1 else 0 end) as apple_users,
    count(distinct user_id) as device_users
from(
select distinct e.user_id as user_id,e.device as dev,u.language as language_spoken
from playbook_events e
join playbook_users u
on e.user_id = u.user_id
) as c
group by 1
order by 3 desc;

-- Optimized and better solution

select u.language, 
    count(distinct case when e.device in ('macbook pro','iPhone 5s','ipad air') then e.user_id end) as apple_users,
    count(distinct e.user_id) as device_users
from playbook_events e
join playbook_users u
on e.user_id = u.user_id
group by 1
order by 3 desc;

;

