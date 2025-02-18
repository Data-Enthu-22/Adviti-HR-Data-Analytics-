select * from adviti_hr_analysis

-- 1. Based on Age:

select age_group,count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from (
select Employee_ID,attrition,Position_updated,
case 
when age between 18 and 20 then '18-20'
when age between 21 and 30 then '21-30'
when age between 31 and 40 then '31-40'
when age between 41 and 50 then '41-55'
else 'unknown'
end as age_group
from adviti_hr_analysis) a
where Position_updated not like'%intern%' 
group by age_group 
order by age_group;

-- con: age_group under 41-55 has high attrition 0f 54%

-- 2. Based on Years_of_Service:

select Years_of_Service,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Years_of_Service
order by Years_of_Service,Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 Desc ;

-- con: where 1 & 5 - 71% and 56% years of exp has high
-- intern 71% 

-- 3.Based on Position:

select Position_updated,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Position_updated
order by Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 Desc;

-- con: SD1 has high 83% and dataengineer has low 20%

-- 4 Based on Gender_updated:
select Gender_updated,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Gender_updated

-- con: not much diff m & F - 49% and 48%

-- 5 Based on Department:

select Department,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Department
order by Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 Desc;

-- con: Sales has 57% and HR  55%

-- 6: Based on Salary:

select salary_group,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from (
select Salary,Employee_ID,attrition,Position_updated,
case 
when Salary <= 500000 then '<=500000'
when Salary <= 1000000 then '<=1000000'
when Salary <= 1500000 then '<=1500000'
when Salary <= 2500000 then '<=2500000'
when Salary <= 3500000 then '<=3500000'
when Salary <= 4500000 then '<=4500000'
when Salary <= 5500000 then '<=5500000'
when Salary <= 6500000 then '<=6500000'
when Salary <= 7500000 then '<=7500000'
else 'above 7500000' end as salary_group
from
adviti_hr_analysis) a
where Position_updated not like'%intern%' 
group by salary_group
order by salary_group;

-- con: <=25lpa is 53%

 -- 7.Based on Performance_Rating
 
 select Performance_Rating,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Performance_Rating

-- con : 5 PR has 53% 

-- 8.Based on Work_Hours

select Work_Hours,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Work_Hours 

-- con: 40 hrs has 57%

---- 9.Based on Promotion
select Promotion,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Promotion ;

-- con : No promotion has 51%

-- 10.Based on Training_Hours:

select Training_Hours_grp,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from (
select Employee_ID,attrition,Position_updated,
case 
when Training_Hours between 0 and 10 then '<=10hrs'
when Training_Hours between 11 and 20 then '<=20hrs'
when Training_Hours between 21 and 30 then '<=30hrs'
when Training_Hours between 31 and 40 then '<=40hrs'
when Training_Hours between 41 and 50 then '<=50hrs'
else 'above 50' end as Training_Hours_grp
from
adviti_hr_analysis) a
where Position_updated not like'%intern%' 
group by Training_Hours_grp;

-- Con: between 31 and 40 hrs has 60%


-- 11.Based on Satisfaction_Score:

select Satisfaction_Score,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Satisfaction_Score ; 

-- con: 4,5,3 has high 52%,51%,51%

-- 12.Based on Education_Level:

select Education_Level,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Education_Level ; 

-- con: Phd has 53% high

13.Based on Employee_Engagement_Score

select Employee_Engagement_Score,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by Employee_Engagement_Score ;

-- con: 1,2 has high attrition rate 100% and 100%

-- 14.Based on Distance_from_Work:

select Distance_group,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%" 
from (
select Distance_from_Work,Employee_ID,attrition,Position_updated,
case 
when Distance_from_Work between 1 and 10 then ' <= 10km'
when Distance_from_Work  between 11 and 20 then '<=20km'
when Distance_from_Work  between 21 and 30 then '<=30km'
when Distance_from_Work  between 31 and 40 then '<=40km'
when Distance_from_Work  between 41 and 50 then  '<= 50km'
else 'above 51km'
end as Distance_group
from adviti_hr_analysis) a
where Position_updated not like'%intern%' 
group by Distance_group;

-- con: between 41 and 50 has high 59%

15.Based on JobSatisfaction_PeerRelationship:

select JobSatisfaction_PeerRelationship,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by JobSatisfaction_PeerRelationship;

-- con: not much difference

-- 16.Based on JobSatisfaction_WorkLifeBalance

select JobSatisfaction_WorkLifeBalance,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by JobSatisfaction_WorkLifeBalance ;

-- con: 0 wlb has high 51%


-- 17.Based on JobSatisfaction_Compensation

select JobSatisfaction_Compensation,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by JobSatisfaction_Compensation ;

-- 0 comp has high 50%

-- 18.Based on JobSatisfaction_Management

select JobSatisfaction_Management,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by JobSatisfaction_Management ;

-- con: 0 satisfaction has high 50%

-- 19.Based on JobSatisfaction_JobSecurity

select JobSatisfaction_JobSecurity,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by JobSatisfaction_JobSecurity ; 

-- con: 0 has high 53%

-- 20.Based on EmployeeBenefit_HealthInsurance

select EmployeeBenefit_HealthInsurance,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by EmployeeBenefit_HealthInsurance ;

-- con: 1 has high 51%

-- 21.Based on EmployeeBenefit_PaidLeave

select EmployeeBenefit_PaidLeave,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by EmployeeBenefit_PaidLeave ;

-- 1 has high 50%

-- 22.Based on EmployeeBenefit_RetirementPlan

select EmployeeBenefit_RetirementPlan,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by EmployeeBenefit_RetirementPlan ;


-- con: 52%  for 0 


-- 23.Based on EmployeeBenefit_GymMembership

select EmployeeBenefit_GymMembership,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by EmployeeBenefit_GymMembership ;

-- con: 0 has high 50%

-- 24.Based on EmployeeBenefit_ChildCare

select EmployeeBenefit_ChildCare,
count(Employee_ID) as total_emp_count,
sum(case when attrition ='Yes' then 1 else 0 end ) as attrition_yes,
sum(case when attrition ='No' then 1 else 0 end ) as attrition_no,
Round(sum(case when attrition ='Yes' then 1 else 0 end ) /count(Employee_ID),2 )*100 as "attrition_yes%",
Round(sum(case when attrition ='No' then 1 else 0 end ) /count(Employee_ID) ,2)*100 as "attrition_no%"
from adviti_hr_analysis
where Position_updated not like'%intern%' 
group by EmployeeBenefit_ChildCare ;

-- con: 1: has high 50% 


-- Avg of the Total Analysis:


  select
  count(Employee_ID) as total_emp,
  Avg(Age),
  Avg(Salary),
  Avg(Performance_Rating),
  Avg(Work_Hours),
  Avg(Promotion),
  Avg(Training_Hours),
  Avg(Satisfaction_Score),
  Avg(Employee_Engagement_Score),
  Avg(Distance_from_Work),
  Avg(JobSatisfaction_PeerRelationship),
  Avg(JobSatisfaction_WorkLifeBalance),
  Avg(JobSatisfaction_Compensation),
  Avg(JobSatisfaction_Management),
  Avg(JobSatisfaction_JobSecurity),
  Avg(EmployeeBenefit_HealthInsurance),
  Avg(EmployeeBenefit_PaidLeave),
  Avg(EmployeeBenefit_RetirementPlan),
  Avg(EmployeeBenefit_GymMembership),
  Avg(EmployeeBenefit_ChildCare)
  from adviti_hr_analysis
  where Position_updated not like'%intern%'
  group by attrition;

----- 




