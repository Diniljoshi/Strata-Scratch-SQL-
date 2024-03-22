--Find the email activity rank for each user. Email activity rank is defined by the total number of emails sent. The user with the highest number of emails sent will have a rank of 1, and so on. 
--Output the user, total emails, and their activity rank. Order records by the total emails in descending order. Sort users with the same number of emails in alphabetical order.
--In your rankings, return a unique value (i.e., a unique rank) even if multiple users have the same number of emails. For tie breaker use alphabetical order of the user usernames.


select from_user, count(from_user) as total_emails, 
    row_number() over (order by count(from_user) desc, from_user ASC) as rank_1
from google_gmail_emails
group by 1
order by 2 desc, 1 asc;
