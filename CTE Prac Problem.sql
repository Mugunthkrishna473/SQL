/*
find the count of no of remote job posting per skill
--display the top 5 skills based on their demand in remote jobs
--include the skill id, name and counts of posting requiring the skill
*/
WITH remote_job_skills AS ( 
SELECT
    skill_id,
    count(*) AS job_count
FROM skills_job_dim AS skills_to_job
INNER JOIN job_postings_fact as job_postings ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = TRUE AND
    job_postings.job_title_short = 'Business Analyst'
GROUP BY
    skill_id
)
SELECT 
    skills.skill_id,
    skills as skill_name,
    job_count
FROM 
    remote_job_skills
INNER JOIN skills_dim as skills ON skills.skill_id=remote_job_skills.skill_id
ORDER BY 
    job_count DESC
LIMIT 5

