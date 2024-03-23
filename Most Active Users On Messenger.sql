-- Meta/Facebook Messenger stores the number of messages between users in a table named 'fb_messages'. In this table 'user1' is the sender, 'user2' is the receiver, and 'msg_count' is the number of messages exchanged 
--between them.
-- Find the top 10 most active users on Meta/Facebook Messenger by counting their total number of messages sent and received. Your solution should output usernames and the count of the total messages they sent or 
-- received


with tmp_tab as
(
SELECT user1, msg_count FROM fb_messages
UNION ALL
SELECT user2 as user1, msg_count FROM fb_messages
) 
select user1, sum(msg_count) as total_msg_sent_or_received
from tmp_tab
group by 1
order by 2 desc;
