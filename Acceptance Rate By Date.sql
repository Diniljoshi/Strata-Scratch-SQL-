-- What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.
-- Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'. If the request is 
-- accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

WITH tmp AS (
select user_id_sender, user_id_receiver, MIN(date) AS date,
SUM(case when action = 'accepted' THEN 1 ELSE 0 END) AS accepted_cnt,
SUM(case when action = 'sent' THEN 1 ELSE 0 END) AS sent_cnt
from fb_friend_requests
GROUP BY 1,2
)
SELECT date, SUM(accepted_cnt)/SUM(sent_cnt) AS acceptance_rate
FROM tmp
GROUP BY date;
