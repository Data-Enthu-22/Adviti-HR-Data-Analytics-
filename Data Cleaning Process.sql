
 

 -- Data Cleaning: 
 
create table adviti_hr_analysis
like advitihranalysis;

 select * from adviti_hr_analysis;
 
 insert adviti_hr_analysis
 select * 
 from advitihranalysis; 
 
with cte as (select *,
Row_number() over(partition by 
Employee_Name  ,
Age  ,
Years_of_Service  ,
Position  ,
Gender  ,
Department  ,
Salary  ,
Performance_Rating  ,
Work_Hours  ,
Attrition  ,
Promotion  ,
Training_Hours  ,
Satisfaction_Score  ,
Education_Level  ,
Employee_Engagement_Score  ,
Absenteeism  ,
Distance_from_Work  ,
JobSatisfaction_PeerRelationship  ,
JobSatisfaction_WorkLifeBalance  ,
JobSatisfaction_Compensation  ,
JobSatisfaction_Management  ,
JobSatisfaction_JobSecurity  ,
EmployeeBenefit_HealthInsurance  ,
EmployeeBenefit_PaidLeave  ,
EmployeeBenefit_RetirementPlan  ,
EmployeeBenefit_GymMembership , 
EmployeeBenefit_ChildCare ) as Row_num
from adviti_hr_analysis)
select *
from cte 
where Row_num>1; 

-- 2. Standardization : 

select Employee_Name,Trim(Employee_Name),
Position,Trim(Position),
Gender , Trim(Gender),
 Department, Trim(Department),
 Education_Level , Trim(Education_Level)
from adviti_hr_analysis;

update adviti_hr_analysis
set Employee_Name = trim( Employee_Name),
Position = Trim(Position),
Gender = Trim(Gender),
 Department= Trim(Department),
 Education_Level = Trim(Education_Level);
 

update adviti_hr_analysis t1
join advitihranalysis t2
on t1.Employee_ID=t2.Employee_ID
set t1.Position =t2.position;

select *
from adviti_hr_analysis
where Years_of_Service is null;

select Distinct position
from adviti_hr_analysis
where position like'Data%'

select *
from adviti_hr_analysis
where Position like '%creator%' ;

update adviti_hr_analysis
set Department='Content Creator'
where Position_updated like'%Creator%' ; 

with cte as (
select employee_id,Gender,Gender_updated,
Row_number() over(Partition by Gender order by employee_id ) as rn
from adviti_hr_analysis
where Gender IN( 'M','F') 
)
select employee_id,Gender,Gender_updated
from cte 
where rn=1;

update adviti_hr_analysis
set Position_updated='Content Creator'
where Position like '%Creator%' ;

Alter table adviti_hr_analysis
Add column Position_updated text;


select employee_id,Position,Department
from advitihranalysis
where Position = 'CEO'

--- 
select   Distinct age
from advitihranalysis
order by 1 DESC;

select 
case 
when age between 18 and 20 then '18-20'
when age between 21 and 30 then '21-30'
when age between 31 and 40 then '31-40'
when age between 41 and 50 then '41-55'
else 'unknown'
end as age_group
from advitihranalysis
group by age_group ;



select *
from adviti_hr_analysis

select Position,Position_updated
from adviti_hr_analysis
order by 1; 


select  distinct Position_updated
from adviti_hr_analysis
where Position_updated like 'Acc%';
order by 1;

update adviti_hr_analysis
set Gender_updated = 'Male'
where Gender like 'M%';

Alter table adviti_hr_analysis
add column Gender_updated text
after Gender

update adviti_hr_analysis
set Position_updated=Position
where position_updated IS  NULL;