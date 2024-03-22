-- Calculate each user's average session time. A session is defined as the time difference between a page_load and page_exit. For simplicity, assume a user has only 1 session per day and if there are multiple of the 
--same events on that day, consider only the latest page_load and earliest page_exit, with an obvious restriction that load time event should happen before exit time event . Output the user_id and their average session
-- time.


select user_id,
avg(timestampdiff(second,ltime,etime)) as avg_session
from(
select user_id,
max(case when action = 'page_load' then timestamp end) as ltime,
min(case when action = 'page_exit' then timestamp end) as etime
from facebook_web_log
group by user_id,date(timestamp)) as c
group by user_id
having avg(timestampdiff(second,ltime,etime)) is not null;
