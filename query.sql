create table cyclists.year_data as
SELECT * FROM `cyclists.tripdata_202501`
UNION ALL
SELECT * from `cyclists.tripdata_202505`
union all
select * FROM `cyclists.tripdata_202506`
union all
select * FROM `cyclists.tripdata_202507`
union all
select * from `cyclists.tripdata_202508`
union all
select * from `cyclists.tripdata_202509`
union all
select * from `cyclists.tripdata_202510`
union all
select * from `cyclists.tripdata_202511`
union all
select * from `cyclists.tripdata_202512`
union all
select * from `cyclists.tripdata_202602`
union all
select * from `cyclists.tripdata_202603`
union all
select * from `cyclists.tripdata_202604`

SELECT member_casual,
count (*) as total_rides
FROM `project-85122fde-713f-4159-960.cyclists.year_data`
group by member_casual;

SELECT
member_casual,
COUNT (*) as total_rides,
avg(round(timestamp_diff(ended_at, started_at, MINUTE),2)) as avg_ride_lenght
FROM `project-85122fde-713f-4159-960.cyclists.year_data`
group by member_casual

SELECT
ride_id,
rideable_type,
case
when extract (DAYOFWEEK from started_at) in (1,7) then 'Weekend'
else 'Weekday'
end as day_type,
count (ride_id) as number_of_rides,
from `project-85122fde-713f-4159-960.cyclists.year_data`
group by ride_id, day_type, rideable_type;

SELECT
case
when (extract (HOUR from started_at) between 6 and 12) then 'Morning'
when (extract (HOUR from started_at) between 12 and 18) then 'Afternoon'
when (extract (HOUR from started_at) between 18 and 24) then 'Night'
else 'Night'
end as time_of_the_day,
COUNT (*) as total_rides,
FROM `project-85122fde-713f-4159-960.cyclists.year_data`
group by time_of_the_day
order by time_of_the_day;

SELECT
member_casual,
COUNT (*) as total_rides,
extract (MONTH from (started_at)) as month
FROM `project-85122fde-713f-4159-960.cyclists.year_data`
group by member_casual, month
order by month;