-- What are the top 10 paying Data Scientist roles available in Canada
SELECT 
    job_id,
    company_dim.name AS company_name,
    job_postings_fact.job_title,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_posted_date
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
LIMIT 10;

/*
🏁 Takeaway
If you're targeting top-tier Data Science roles in Canada, aim for:

- Leadership or Staff-level titles
- Strong industry context (FinTech, EdTech, SaaS, etc.)
- Full-stack data skills with the ability to manage both people and pipelines
- Roles offering remote flexibility are increasingly lucrative

[
  {
    "job_id": 377672,
    "company_name": "Mercury",
    "job_title": "Head of Data",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "350000.0",
    "job_posted_date": "2023-03-15 09:16:26"
  },
  {
    "job_id": 1499100,
    "company_name": "Course Hero",
    "job_title": "Staff Strategic Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "224000.0",
    "job_posted_date": "2023-03-11 01:27:48"
  },
  {
    "job_id": 1505300,
    "company_name": "Secureframe",
    "job_title": "Data and Analytics Lead",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-01-12 22:39:39"
  },
  {
    "job_id": 1232291,
    "company_name": "Figma",
    "job_title": "Data Scientist, Product",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "200000.0",
    "job_posted_date": "2023-12-03 21:05:50"
  },
  {
    "job_id": 276555,
    "company_name": "MongoDB",
    "job_title": "Staff Analytics Engineer",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "197500.0",
    "job_posted_date": "2023-11-28 18:16:00"
  },
  {
    "job_id": 746652,
    "company_name": "Wish",
    "job_title": "Data Scientist",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "180000.0",
    "job_posted_date": "2023-04-12 09:31:20"
  },
  {
    "job_id": 539196,
    "company_name": "Citigroup, Inc",
    "job_title": "Big Data Development Lead",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "175000.0",
    "job_posted_date": "2023-04-08 08:29:15"
  },
  {
    "job_id": 13447,
    "company_name": "Autodesk, Inc",
    "job_title": "Lead Data Scientist, Product Insights",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "175000.0",
    "job_posted_date": "2023-03-14 06:27:47"
  },
  {
    "job_id": 288504,
    "company_name": "Zynga",
    "job_title": "Data Scientist (Full Stack) - Marketing",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "172000.0",
    "job_posted_date": "2023-10-11 12:18:30"
  },
  {
    "job_id": 935101,
    "company_name": "Very",
    "job_title": "Principal Data Scientist - Canada - Remote",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "161250.0",
    "job_posted_date": "2023-10-02 15:42:26"
  }
]

*/