SELECT
    company_id,
    job_title_short
FROM
    jan_job
UNION ALL
SELECT
    company_id,
    job_title_short
FROM
    feb_job
UNION ALL
SELECT
    company_id,
    job_title_short
FROM
    mar_job

/*
find job postings from the first quarter that have salary greater than $70K
- combine job posting tables from the first quarter of 2023(jan-mar)
- get job postings with an average yearly salary > $70K
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_posted_date,
    salary_year_avg
FROM(
SELECT *
from jan_job
UNION ALL
SELECT *
FROM feb_job
UNION ALL
SELECT *
FROM mar_job
) AS first_quater_job
WHERE
    salary_year_avg > 70000
ORDER BY salary_year_avg DESC



