SELECT
     job_title_short AS title,
     job_location AS location,
     job_posted_date::DATE AS date
FROM job_postings_fact;



-- Converting time zones from UTC to EST
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
    job_postings_fact
LIMIT 5;

-- Extracting portion from a date using EXTRACT key word on date object
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
    job_postings_fact
LIMIT 5;


-- Using EXTRACT to analyze monthly job posting trend 
SELECT
    COUNT(job_id) AS job_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Scientist'
GROUP BY
    month
ORDER BY
    job_count DESC;

SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS avg_yearly_salary,
    AVG(salary_hour_avg) AS avg_hourly_salary
FROM
    job_postings_fact
WHERE
    job_posted_date::DATE > '2023-06-01'
GROUP BY
    job_schedule_type
-- HAVING
--     ( AVG(salary_year_avg) IS NOT NULL) AND (AVG(salary_hour_avg) IS NOT NULL)


SELECT
    job_schedule_type,
    job_posted_date::DATE AS date,
    salary_year_avg,
    salary_hour_avg
FROM
    job_postings_fact
WHERE
    job_posted_date::DATE > '2023-06-01';