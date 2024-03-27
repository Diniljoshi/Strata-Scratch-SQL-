-- Find the top 5 cities with the most 5-star businesses. Output the city name along with the number of 5-star businesses. Include both open and closed businesses.
-- In the case of multiple cities having the same number of 5-star businesses, use the ranking function returning the lowest rank in the group and output cities with a rank smaller than or equal to 5.

select city, no_of_5_star_businesses, rank_city
from(
select rank() over (order by count(city) desc) as rank_city, city, count(city)  as no_of_5_star_businesses
from yelp_business
where stars = 5
group by 2
) as c
where rank_city <=5;
