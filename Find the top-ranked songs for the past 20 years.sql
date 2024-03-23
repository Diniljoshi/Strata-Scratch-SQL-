--Find all the songs that were top-ranked (at first position) at least once in the past 20 years



select distinct song_name
from billboard_top_100_year_end
where year_rank = 1 and year < (
select max(year) from billboard_top_100_year_end) and year > (select max(year) - 20
from billboard_top_100_year_end)
;
