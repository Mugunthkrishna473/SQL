/*
Question: what are the top paying business analyst jobs?
- Identify the top 10 highest paying Business Analyst roles that are available remotely,
- Focuses on job postings with specified salaries (remove nulls),
- why? Highlight the top paying opportunities for Business Analysts
*/

SELECT 
    job_id,
    job_title,
    job_schedule_type,
    job_posted_date,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE AND
    job_schedule_type = 'Full-time' AND
    salary_year_avg is NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
