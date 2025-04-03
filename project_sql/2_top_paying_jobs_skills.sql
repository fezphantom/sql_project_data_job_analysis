-- What skills are required for the top-paying Data scientist jobs

WITH top_paying_jobs AS (
    SELECT 
        job_id,
        company_dim.name AS company_name,
        job_postings_fact.job_title,
        job_postings_fact.salary_year_avg
    FROM 
        job_postings_fact
    LEFT JOIN
        company_dim
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Scientist'
        AND job_country = 'Canada'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN
    skills_job_dim
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*

Key Findings:

Skill Frequency:
sql: 6
python: 6
tableau: 5
looker: 4
r: 3
mongodb: 3
airflow: 3
aws: 3
bigquery: 2
redshift: 2
snowflake: 2
scala: 2
gcp: 2
react: 1
spark: 1
go: 1
php: 1
java: 1
no-sql: 1
kafka: 1
flow: 1
databricks: 1
c++

Core Programming and Database Skills Remain Essential:
    - SQL and Python are the most frequently requested skills, highlighting their fundamental importance in data manipulation, analysis, and processing.
    This reinforces that a strong foundation in these languages is crucial for any aspiring Data Scientist.
Data Visualization Tools are Highly Valued:
    - Tableau and Looker appear frequently, indicating the growing need for Data Scientists to effectively communicate insights through visualizations.
    The ability to present complex data in a clear and understandable manner is a critical skill.
Cloud Computing and Big Data Technologies:
    - Skills like AWS, BigQuery, Redshift, Snowflake, and Spark are in demand, reflecting the increasing reliance on cloud platforms and big data processing.
    Companies are seeking Data Scientists who can work with large datasets and leverage cloud-based tools.

[
  {
    "job_id": 377672,
    "company_name": "Mercury",
    "job_title": "Head of Data",
    "salary_year_avg": "350000.0",
    "skills": "react"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "salary_year_avg": "224000.0",
    "skills": "sql"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "salary_year_avg": "224000.0",
    "skills": "python"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "salary_year_avg": "224000.0",
    "skills": "r"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "salary_year_avg": "224000.0",
    "skills": "aws"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "salary_year_avg": "224000.0",
    "skills": "bigquery"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "salary_year_avg": "224000.0",
    "skills": "spark"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "salary_year_avg": "224000.0",
    "skills": "airflow"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "salary_year_avg": "224000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1505300,
    "company_name": "Secureframe",
    "job_title": "Data and Analytics Lead",
    "salary_year_avg": "205000.0",
    "skills": "redshift"
  },
  {
    "job_id": 1505300,
    "company_name": "Secureframe",
    "job_title": "Data and Analytics Lead",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1505300,
    "company_name": "Secureframe",
    "job_title": "Data and Analytics Lead",
    "salary_year_avg": "205000.0",
    "skills": "tableau"
  },
  {
    "job_id": 1505300,
    "company_name": "Secureframe",
    "job_title": "Data and Analytics Lead",
    "salary_year_avg": "205000.0",
    "skills": "looker"
  },
  {
    "job_id": 1232291,
    "company_name": "Figma",
    "job_title": "Data Scientist, Product",
    "salary_year_avg": "200000.0",
    "skills": "sql"
  },
  {
    "job_id": 1232291,
    "company_name": "Figma",
    "job_title": "Data Scientist, Product",
    "salary_year_avg": "200000.0",
    "skills": "python"
  },
  {
    "job_id": 1232291,
    "company_name": "Figma",
    "job_title": "Data Scientist, Product",
    "salary_year_avg": "200000.0",
    "skills": "r"
  },
  {
    "job_id": 1232291,
    "company_name": "Figma",
    "job_title": "Data Scientist, Product",
    "salary_year_avg": "200000.0",
    "skills": "go"
  },
  {
    "job_id": 1232291,
    "company_name": "Figma",
    "job_title": "Data Scientist, Product",
    "salary_year_avg": "200000.0",
    "skills": "redshift"
  },
  {
    "job_id": 1232291,
    "company_name": "Figma",
    "job_title": "Data Scientist, Product",
    "salary_year_avg": "200000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "salary_year_avg": "197500.0",
    "skills": "sql"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "salary_year_avg": "197500.0",
    "skills": "python"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "salary_year_avg": "197500.0",
    "skills": "scala"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "salary_year_avg": "197500.0",
    "skills": "r"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "salary_year_avg": "197500.0",
    "skills": "mongodb"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "salary_year_avg": "197500.0",
    "skills": "mongodb"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "salary_year_avg": "197500.0",
    "skills": "tableau"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "salary_year_avg": "197500.0",
    "skills": "looker"
  },
  {
    "job_id": 746652,
    "company_name": "Wish",
    "job_title": "Data Scientist",
    "salary_year_avg": "180000.0",
    "skills": "sql"
  },
  {
    "job_id": 746652,
    "company_name": "Wish",
    "job_title": "Data Scientist",
    "salary_year_avg": "180000.0",
    "skills": "python"
  },
  {
    "job_id": 746652,
    "company_name": "Wish",
    "job_title": "Data Scientist",
    "salary_year_avg": "180000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 746652,
    "company_name": "Wish",
    "job_title": "Data Scientist",
    "salary_year_avg": "180000.0",
    "skills": "php"
  },
  {
    "job_id": 746652,
    "company_name": "Wish",
    "job_title": "Data Scientist",
    "salary_year_avg": "180000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 746652,
    "company_name": "Wish",
    "job_title": "Data Scientist",
    "salary_year_avg": "180000.0",
    "skills": "airflow"
  },
  {
    "job_id": 746652,
    "company_name": "Wish",
    "job_title": "Data Scientist",
    "salary_year_avg": "180000.0",
    "skills": "tableau"
  },
  {
    "job_id": 539196,
    "company_name": "Citigroup, Inc",
    "job_title": "Big Data Development Lead",
    "salary_year_avg": "175000.0",
    "skills": "scala"
  },
  {
    "job_id": 539196,
    "company_name": "Citigroup, Inc",
    "job_title": "Big Data Development Lead",
    "salary_year_avg": "175000.0",
    "skills": "java"
  },
  {
    "job_id": 539196,
    "company_name": "Citigroup, Inc",
    "job_title": "Big Data Development Lead",
    "salary_year_avg": "175000.0",
    "skills": "no-sql"
  },
  {
    "job_id": 539196,
    "company_name": "Citigroup, Inc",
    "job_title": "Big Data Development Lead",
    "salary_year_avg": "175000.0",
    "skills": "kafka"
  },
  {
    "job_id": 539196,
    "company_name": "Citigroup, Inc",
    "job_title": "Big Data Development Lead",
    "salary_year_avg": "175000.0",
    "skills": "flow"
  },
  {
    "job_id": 13447,
    "company_name": "Autodesk, Inc",
    "job_title": "Lead Data Scientist, Product Insights",
    "salary_year_avg": "175000.0",
    "skills": "sql"
  },
  {
    "job_id": 13447,
    "company_name": "Autodesk, Inc",
    "job_title": "Lead Data Scientist, Product Insights",
    "salary_year_avg": "175000.0",
    "skills": "python"
  },
  {
    "job_id": 13447,
    "company_name": "Autodesk, Inc",
    "job_title": "Lead Data Scientist, Product Insights",
    "salary_year_avg": "175000.0",
    "skills": "looker"
  },
  {
    "job_id": 288504,
    "company_name": "Zynga",
    "job_title": "Data Scientist (Full Stack) - Marketing",
    "salary_year_avg": "172000.0",
    "skills": "sql"
  },
  {
    "job_id": 288504,
    "company_name": "Zynga",
    "job_title": "Data Scientist (Full Stack) - Marketing",
    "salary_year_avg": "172000.0",
    "skills": "python"
  },
  {
    "job_id": 288504,
    "company_name": "Zynga",
    "job_title": "Data Scientist (Full Stack) - Marketing",
    "salary_year_avg": "172000.0",
    "skills": "databricks"
  },
  {
    "job_id": 288504,
    "company_name": "Zynga",
    "job_title": "Data Scientist (Full Stack) - Marketing",
    "salary_year_avg": "172000.0",
    "skills": "aws"
  },
  {
    "job_id": 288504,
    "company_name": "Zynga",
    "job_title": "Data Scientist (Full Stack) - Marketing",
    "salary_year_avg": "172000.0",
    "skills": "gcp"
  },
  {
    "job_id": 288504,
    "company_name": "Zynga",
    "job_title": "Data Scientist (Full Stack) - Marketing",
    "salary_year_avg": "172000.0",
    "skills": "airflow"
  },
  {
    "job_id": 288504,
    "company_name": "Zynga",
    "job_title": "Data Scientist (Full Stack) - Marketing",
    "salary_year_avg": "172000.0",
    "skills": "tableau"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "sql"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "python"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "c++"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "c"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "rust"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "elixir"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "azure"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "aws"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "bigquery"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "gcp"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "pandas"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "numpy"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "pyspark"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "pytorch"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "jupyter"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "scikit-learn"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "matplotlib"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "phoenix"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "linux"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "looker"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "git"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "terraform"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "docker"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "github"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "slack"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "salary_year_avg": "161250.0",
    "skills": "zoom"
  }
]
*/

