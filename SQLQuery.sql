
--first step
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']) 

select 
arrival_date_year,
hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue 
from hotels
group by arrival_date_year, hotel;

--increasing by year
--we can say that our revenue is growing

--second step
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']) 

select * from hotels
left join dbo.market_segment$ 
on hotels.market_segment=market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal=hotels.meal

/*
--NOTE:
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']) 
select
(stays_in_week_nights+stays_in_weekend_nights)*adr as revenue 
from hotels

--(stays_in_week_nights+stays_in_weekend_nights)*adr - cost of revenue. adr - daily rate 
*/

/*
with hotels as (
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$']) 
select 
arrival_date_year,
round(sum((stays_in_week_nights+stays_in_weekend_nights)*adr),2) as revenue 
from hotels
group by arrival_date_year

--increasing by year
--we can say that our revenue is growing
*/






