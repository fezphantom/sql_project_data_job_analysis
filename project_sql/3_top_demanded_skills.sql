-- What are the Most in-demand skills for Data Scientist


SELECT
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
GROUP BY
    indemand_skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
Key Takeaways:
Programming & Data Manipulation: Python and SQL dominate, highlighting the importance of coding and database skills.
Statistical & Analytical Skills: R and SAS emphasize the need for strong statistical and analytical expertise.
Visualization & Business Intelligence: Tableau is essential for presenting data insights effectively to stakeholders.

[
  {
    "indemand_skills": "python",
    "demand_count": "114016"
  },
  {
    "indemand_skills": "sql",
    "demand_count": "79174"
  },
  {
    "indemand_skills": "r",
    "demand_count": "59754"
  },
  {
    "indemand_skills": "sas",
    "demand_count": "29642"
  },
  {
    "indemand_skills": "tableau",
    "demand_count": "29513"
  }
]
 
*/