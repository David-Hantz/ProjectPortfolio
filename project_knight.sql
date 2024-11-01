/* Smartphone Usage and Behavioral Dataset - exploration */ 
select * from mu_behave;


/* Users ranked by total app usage (hours) */
select 
    user_ID,
    total_app_usage_hours,
    rank() over (order by total_app_usage_hours desc) as total_app_usage_rank,
    social_media_usage_hours,
    rank() over (order by social_media_usage_hours desc) as social_media_Rank,
    productivity_app_usage_hours,
    rank() over (order by productivity_app_usage_hours desc) as productivity_rank,
    gaming_app_usage_hours,
    rank() over (order by gaming_app_usage_hours desc) as gaming_rank
from mu_behave;


/* Average total app usage per city (location) */
select 
    location,
    round(avg(total_app_usage_hours), 2) as avg_total_app_usage,
    round(avg(daily_screen_time_hours), 2) as avg_daily_screen_time,
    round(avg(social_media_usage_hours), 2) as avg_social_media_usage,
    round(avg(productivity_app_usage_hours), 2) as avg_productivity_app_usage,
    round(avg(gaming_app_usage_hours), 2) as avg_gaming_app_usage
from mu_behave
group by location
order by location;


/* User behavior analyzed by age group */
select 
    case 
        when age < 18 then 'under 18'
        when age between 18 and 25 then '18-25'
        when age between 26 and 35 then '26-35'
        when age between 36 and 45 then '36-45'
        when age between 46 and 60 then '46-60'
        else '60+'
    end as age_group,
    count(*) as user_count,
    round(avg(total_app_usage_hours), 2) as avg_total_app_usage,
    round(avg(daily_screen_time_hours), 2) as avg_daily_screen_time,
    round(avg(social_media_usage_hours), 2) as avg_social_media_usage,
    round(avg(productivity_app_usage_hours), 2) as avg_productivity_app_usage,
    round(avg(gaming_app_usage_hours), 2) as avg_gaming_app_usage
from mu_behave
group by age_group
order by age_group;


/* User behavior analyzed by gender */
select 
    gender,
    count(*) as user_count,
    round(avg(total_app_usage_hours), 2) as avg_total_app_usage,
    round(avg(daily_screen_time_hours), 2) as avg_daily_screen_time,
    round(avg(social_media_usage_hours), 2) as avg_social_media_usage,
    round(avg(productivity_app_usage_hours), 2) as avg_productivity_app_usage,
    round(avg(gaming_app_usage_hours), 2) as avg_gaming_app_usage
from mu_behave
group by gender
order by gender;


/* Descriptive stats on app usage */
select 
    avg(total_app_usage_hours) as avg_total_app_usage,
    min(total_app_usage_hours) as min_total_app_usage,
    max(total_app_usage_hours) as max_total_app_usage,
    avg(daily_screen_time_hours) as avg_daily_screen_time,
    min(daily_screen_time_hours) as min_daily_screen_time,
    max(daily_screen_time_hours) as max_daily_screen_time,
    avg(social_media_usage_hours) as avg_social_media_usage,
    avg(productivity_app_usage_hours) as avg_productivity_app_usage,
    avg(gaming_app_usage_hours) as avg_gaming_app_usage
from mu_behave;


/* Analyze the standard deviation of app usage metrics 
segmented by age group and gender */
select 
    case 
        when age < 18 then 'under 18'
        when age between 18 and 25 then '18-25'
        when age between 26 and 35 then '26-35'
        when age between 36 and 45 then '36-45'
        when age between 46 and 60 then '46-60'
        else '60+'
    end as age_group,
    gender,
    round(stddev(total_app_usage_hours), 2) as stddev_total_app_usage,
    round(stddev(daily_screen_time_hours), 2) as stddev_daily_screen_time,
    round(stddev(social_media_usage_hours), 2) as stddev_social_media_usage,
    round(stddev(productivity_app_usage_hours), 2) as stddev_productivity_app_usage,
    round(stddev(gaming_app_usage_hours), 2) as stddev_gaming_app_usage
from mu_behave
group by age_group, gender
order by age_group, gender;


/* Segmented users based on total app usage (hours) */
select 
    case 
        when total_app_usage_hours > 10 then 'Heavy User'
        when total_app_usage_hours between 5 and 10 then 'Moderate User'
        else 'Light User'
    end as user_segment,
    count(*) as user_count,
    round(avg(daily_screen_time_hours), 2) as avg_daily_screen_time,
    round(avg(social_media_usage_hours), 2) as avg_social_media_usage
from mu_behave
group by user_segment
order by user_segment;


/* Comparing average app usage in different cities (locations) */
select 
    location,
    round(avg(total_app_usage_hours), 2) as avg_total_app_usage,
    round(avg(daily_screen_time_hours), 2) as avg_daily_screen_time,
	round(avg(social_media_usage_hours), 2) as avg_social_media_usage_hours,
	round(avg(productivity_app_usage_hours), 2) as avg_productivity_app_usage_hours
from mu_behave
group by location
order by avg_total_app_usage desc;

