/*
create tables from other tables
-create table for jan, feb, mar
*/

CREATE table jan_job AS
SELECT *
FROM job_postings_fact
WHERE
EXTRACT(MONTH FROM job_posted_date)=1;

CREATE table feb_job AS
SELECT *
FROM job_postings_fact
WHERE
EXTRACT(MONTH FROM job_posted_date)=2;

CREATE table mar_job AS
SELECT *
FROM job_postings_fact
WHERE
EXTRACT(MONTH FROM job_posted_date)=3;

SELECT job_posted_date
FROM mar_job


/*
CASE Expression
label new column as follows:
-'Anywhere' job as 'Remote'
-'New York, NY' as 'Local'
-otherwise 'Onsite'
*/

SELECT 
job_title_short,
job_location,
case 
when job_location= 'Anywhere' then 'Remote'
when job_location= 'New York, NY' then 'Local'
else 'Onsite'
END AS location_category
FROM job_postings_fact

/*
we can further analyze it by counting the no of jobs for each category
*/

SELECT 
count(job_id),
case 
when job_location= 'Anywhere' then 'Remote'
when job_location= 'New York, NY' then 'Local'
else 'Onsite'
END AS location_category
FROM job_postings_fact
WHERE job_title_short= 'Business Analyst'
GROUP BY location_category