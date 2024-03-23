-- Find the number of apartments per nationality that are owned by people under 30 years old.
-- Output the nationality along with the number of apartments.
-- Sort records by the apartments count in descending order.

select h.nationality, count(distinct u.unit_id) as no_of_apartments
from airbnb_hosts h
join airbnb_units u
on h.host_id = u.host_id
where h.age < 30 and unit_type = 'Apartment'
group by 1;


