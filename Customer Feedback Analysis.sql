select feedback_id, feedback_text, source_channel, comment_category 
from customer_feedback
where source_channel = 'social_media' and comment_category != 'short_comments' ;
