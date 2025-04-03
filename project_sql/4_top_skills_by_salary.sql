-- What are the Top skills based on Salary?
SELECT
    skills_dim.skills AS skill_name,
    ROUND(AVG(job_postings_fact.salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN
    skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Scientist'
    AND job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skill_name
ORDER BY
    avg_salary DESC
LIMIT 25;

/*

Insight:
Data science salaries are not just driven by Python, SQL, and ML models—project management, cloud, 
and niche programming skills can significantly boost pay.

AI and big data frameworks like Hugging Face, Airflow, and BigQuery are becoming more critical for 
high-earning data scientists.

Diversifying skills beyond traditional analytics—especially in cloud computing, automation, and 
specialized programming languages—can lead to higher salaries.

[
  {
    "skill_name": "asana",
    "avg_salary": "215477"
  },
  {
    "skill_name": "airtable",
    "avg_salary": "201143"
  },
  {
    "skill_name": "redhat",
    "avg_salary": "189500"
  },
  {
    "skill_name": "watson",
    "avg_salary": "187417"
  },
  {
    "skill_name": "elixir",
    "avg_salary": "170824"
  },
  {
    "skill_name": "lua",
    "avg_salary": "170500"
  },
  {
    "skill_name": "slack",
    "avg_salary": "168219"
  },
  {
    "skill_name": "solidity",
    "avg_salary": "166980"
  },
  {
    "skill_name": "ruby on rails",
    "avg_salary": "166500"
  },
  {
    "skill_name": "rshiny",
    "avg_salary": "166436"
  },
  {
    "skill_name": "notion",
    "avg_salary": "165636"
  },
  {
    "skill_name": "objective-c",
    "avg_salary": "164500"
  },
  {
    "skill_name": "neo4j",
    "avg_salary": "163971"
  },
  {
    "skill_name": "dplyr",
    "avg_salary": "163111"
  },
  {
    "skill_name": "hugging face",
    "avg_salary": "160868"
  },
  {
    "skill_name": "dynamodb",
    "avg_salary": "160581"
  },
  {
    "skill_name": "haskell",
    "avg_salary": "157500"
  },
  {
    "skill_name": "unity",
    "avg_salary": "156881"
  },
  {
    "skill_name": "airflow",
    "avg_salary": "155878"
  },
  {
    "skill_name": "codecommit",
    "avg_salary": "154684"
  },
  {
    "skill_name": "unreal",
    "avg_salary": "153278"
  },
  {
    "skill_name": "theano",
    "avg_salary": "153133"
  },
  {
    "skill_name": "zoom",
    "avg_salary": "151677"
  },
  {
    "skill_name": "bigquery",
    "avg_salary": "149292"
  },
  {
    "skill_name": "atlassian",
    "avg_salary": "148715"
  }
]

*/