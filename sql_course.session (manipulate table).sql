CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN, 
    resume_file_name varchar(250),
    cover_letter_sent boolean,
    cover_letter_file_name varchar(250),
    status varchar(50)
);
SELECT *
FROM job_applied

insert into job_applied(
    job_id,
    application_sent_date,
    custom_resume, 
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
values (1,
    '13-10-2026',
    true,
    'resume_1.pdf',
    true,
    'cover_file_1.pdf',
    'submitted'
),
(2,
'14-10-2026',
'false',
'resume_2.pdf',
'false',
null,
'interview_scheduled')

ALTER TABLE job_applied
add contact varchar(50)

alter table job_applied
rename column job_id to s_no

alter table job_applied
alter column status type text

update job_applied
set contact = 'mugunth'
where s_no = 1;

update job_applied
set contact = 'krishna'
where s_no = 2;

alter table job_applied
drop column custom_resume

alter table job_applied
drop column cover_letter_sent

drop table job_applied