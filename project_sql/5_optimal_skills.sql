/*
What are the optimal indemand skills for a remote Data scientist role
Optimal skills:

1. High demand
2. High salaries

*/
WITH skills_demand AS (

    SELECT
        skills_dim.skill_id,
        skills_dim.skills AS indemand_skills,
        COUNT(skills_job_dim.job_id) AS demand_count
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
        AND job_postings_fact.job_location = 'Anywhere'
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_dim.skill_id,
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
        AND job_postings_fact.job_location = 'Anywhere'
    GROUP BY
        skills_dim.skill_id
)


SELECT
    skills_demand.skill_id,
    skills_demand.indemand_skills,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN
    average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    skills_demand.demand_count > 10
ORDER BY
    average_salary.avg_salary DESC,
    skills_demand.demand_count DESC
    
LIMIT 25;

SELECT
    skills_dim.skill_id,
    skills_dim.skills AS skill_name,
    COUNT(skills_job_dim.job_id) AS demand_count,
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
    AND job_postings_fact.job_location = 'Anywhere'
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
    
LIMIT 25; 

/*

Insights for Remote Data Scientists

1. For maximum job opportunities: Python, AWS, Tableau, Spark, and 
SQL-based cloud tools (BigQuery, Redshift).

2. For high salaries: Specialized BI tools (Qlik, Looker), niche programming (Go, C), and
 ML/AI frameworks (PyTorch, TensorFlow).

3. For future-proofing: Kubernetes, Airflow, and Snowflake show a blend of automation,
 workflow, and cloud data handling—essential for modern data science workflows.

[
  {
    "skill_id": 26,
    "skill_name": "c",
    "demand_count": "48",
    "avg_salary": "164865"
  },
  {
    "skill_id": 8,
    "skill_name": "go",
    "demand_count": "57",
    "avg_salary": "164691"
  },
  {
    "skill_id": 187,
    "skill_name": "qlik",
    "demand_count": "15",
    "avg_salary": "164485"
  },
  {
    "skill_id": 185,
    "skill_name": "looker",
    "demand_count": "57",
    "avg_salary": "158715"
  },
  {
    "skill_id": 96,
    "skill_name": "airflow",
    "demand_count": "23",
    "avg_salary": "157414"
  },
  {
    "skill_id": 77,
    "skill_name": "bigquery",
    "demand_count": "36",
    "avg_salary": "157142"
  },
  {
    "skill_id": 3,
    "skill_name": "scala",
    "demand_count": "56",
    "avg_salary": "156702"
  },
  {
    "skill_id": 81,
    "skill_name": "gcp",
    "demand_count": "59",
    "avg_salary": "155811"
  },
  {
    "skill_id": 80,
    "skill_name": "snowflake",
    "demand_count": "72",
    "avg_salary": "152687"
  },
  {
    "skill_id": 101,
    "skill_name": "pytorch",
    "demand_count": "115",
    "avg_salary": "152603"
  },
  {
    "skill_id": 78,
    "skill_name": "redshift",
    "demand_count": "36",
    "avg_salary": "151708"
  },
  {
    "skill_id": 99,
    "skill_name": "tensorflow",
    "demand_count": "126",
    "avg_salary": "151536"
  },
  {
    "skill_id": 233,
    "skill_name": "jira",
    "demand_count": "22",
    "avg_salary": "151165"
  },
  {
    "skill_id": 92,
    "skill_name": "spark",
    "demand_count": "149",
    "avg_salary": "150188"
  },
  {
    "skill_id": 76,
    "skill_name": "aws",
    "demand_count": "217",
    "avg_salary": "149630"
  },
  {
    "skill_id": 94,
    "skill_name": "numpy",
    "demand_count": "73",
    "avg_salary": "149089"
  },
  {
    "skill_id": 106,
    "skill_name": "scikit-learn",
    "demand_count": "81",
    "avg_salary": "148964"
  },
  {
    "skill_id": 95,
    "skill_name": "pyspark",
    "demand_count": "34",
    "avg_salary": "147544"
  },
  {
    "skill_id": 182,
    "skill_name": "tableau",
    "demand_count": "219",
    "avg_salary": "146970"
  },
  {
    "skill_id": 2,
    "skill_name": "nosql",
    "demand_count": "31",
    "avg_salary": "146110"
  },
  {
    "skill_id": 4,
    "skill_name": "java",
    "demand_count": "64",
    "avg_salary": "145706"
  },
  {
    "skill_id": 196,
    "skill_name": "powerpoint",
    "demand_count": "23",
    "avg_salary": "145139"
  },
  {
    "skill_id": 93,
    "skill_name": "pandas",
    "demand_count": "113",
    "avg_salary": "144816"
  },
  {
    "skill_id": 213,
    "skill_name": "kubernetes",
    "demand_count": "25",
    "avg_salary": "144498"
  },
  {
    "skill_id": 1,
    "skill_name": "python",
    "demand_count": "763",
    "avg_salary": "143828"
  }
]
*/