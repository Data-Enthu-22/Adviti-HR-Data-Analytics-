select age_group,salary_group,
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
else 'above 7500000' end as salary_group,
case 
when age between 18 and 20 then '18-20'
when age between 21 and 30 then '21-30'
when age between 31 and 40 then '31-40'
when age between 41 and 50 then '41-55'
else 'unknown'
end as age_group
from
adviti_hr_analysis) a
where Position_updated not like'%intern%' 
group by age_group,salary_group
order by age_group,salary_group DESC;

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