-- Create tables for each month in a specific year
CREATE TABLE january_jobs AS
    SELECT * FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT * FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT * FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM january_jobs;


SELECT
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category,
    COUNT(job_id) AS number_of_jobs
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;

SELECT
    MIN(salary_year_avg) AS min_salary,
    AVG(salary_year_avg) AS avg_salary,
    MAX(salary_year_avg) AS max_salary
FROM
job_postings_fact;

SELECT
    job_title_short,
    job_location,
    salary_year_avg,
    CASE
        WHEN salary_year_avg < 60000 THEN 'Low'
        WHEN salary_year_avg BETWEEN 60000 AND 300000 THEN 'Standard'
        ELSE 'High'
    END AS salary_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC;

SELECT
    CASE
        WHEN salary_year_avg < 60000 THEN 'Low'
        WHEN salary_year_avg BETWEEN 60000 AND 300000 THEN 'Standard'
        ELSE 'High'
    END AS salary_category,
    COUNT(job_id) AS number_of_jobs
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
    salary_category
ORDER BY
    number_of_jobs DESC;

WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
FROM january_jobs;



WITH job_count AS (
    SELECT
        company_id,
        COUNT(job_id) AS number_of_jobs
    FROM
        job_postings_fact
    GROUP BY
        company_id
    ORDER BY
        number_of_jobs
)
SELECT
    name,
    number_of_jobs
FROM company_dim
LEFT JOIN job_count ON company_dim.company_id = job_count.company_id
WHERE number_of_jobs > 10
ORDER BY number_of_jobs DESC;

WITH top_skills AS (
    SELECT
        skill_id,
        COUNT(job_id) AS job_count
    FROM
        skills_job_dim
    GROUP BY
        skill_id
)
SELECT
    skills_dim.skills,
    top_skills.job_count
FROM
    skills_dim
LEFT JOIN top_skills
ON skills_dim.skill_id = top_skills.skill_id
ORDER BY top_skills.job_count DESC
LIMIT 5;


WITH job_posting AS (
    SELECT
        company_id,
        COUNT(job_id) AS job_count
    FROM
        job_postings_fact
    GROUP BY
        company_id
)

SELECT
    company_dim.name,
    job_posting.job_count,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS job_size
FROM
    company_dim
LEFT JOIN
    job_posting 
        ON company_dim.company_id = job_posting.company_id
WHERE
    company_dim.name IS NOT NULL

WITH num_jobs AS (
    SELECT
        job_id
    FROM
        job_postings_fact
    WHERE job_location = 'Anywhere' AND job_title_short = 'Data Analyst'
)

SELECT
    skills_job_dim.skill_id,
    skills_dim.skills AS skill_name,
    COUNT(num_jobs.job_id) AS job_counts
FROM 
    num_jobs
JOIN
    skills_job_dim ON num_jobs.job_id = skills_job_dim.job_id
JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
group BY
    skills_job_dim.skill_id, skills_dim.skills
ORDER BY
    job_counts DESC
LIMIT 5;


SELECT
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM(SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs) AS quater1_posting
WHERE
    salary_year_avg > 70000 AND job_title_short = 'Data Scientist'
ORDER BY
    salary_year_avg DESC;
 
