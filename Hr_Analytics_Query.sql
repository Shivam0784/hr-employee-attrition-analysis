
-- ============================================
-- HR EMPLOYEE ATTRITION ANALYSIS
-- SQL Queries
-- Dataset: IBM HR Analytics (1,470 employees)
-- ============================================



create database Hr_Analytics;
use Hr_Analytics;


--Top 5 Rows
select top 5 * from [dbo].[HR-Employee-Attrition];



--Overall Attrition Rate
SELECT COUNT(*) AS Total_Rows,
sum(cast([Attrition] as Float)) as Employee_left,
Count(*)-sum(cast([Attrition] as Float))  as Employee_stayed,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
FROM [dbo].[HR-Employee-Attrition];



--Attrition Rate by Department
Select [Department],
count(*) as Total_Employees,
sum(cast([Attrition] as Float)) as Left_Count,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from [dbo].[HR-Employee-Attrition] 
group by [Department] Order by Attrition_Rate ;



--Attrition by Age Group
with temp as 
(Select  * , 
case when [Age] <= 25 then 'Under 25'
when [Age] <= 35 then '26-35'
when [Age] <= 45 then '36-45'
else 'Above 45' END as Age_Group 
from [dbo].[HR-Employee-Attrition]
)

Select temp.Age_Group ,
count(*) as Total ,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from temp 
group by temp.Age_Group order by Attrition_Rate desc;



--Attrition Rate by Over Time
Select case when [OverTime] = 1 then 'Yes' Else 'No' End as Over_Time,
count(*) Total_Employee,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
From [dbo].[HR-Employee-Attrition]
group by OverTime order by Attrition_Rate desc;



--Attrition by Salary Band
with temp2 as (
Select *,Case when [MonthlyIncome] <= 3000 then 'Low (Below 3k)'
when [MonthlyIncome] <= 7000 then 'Medium (3k-7k)'
when [MonthlyIncome] <= 15000 then 'High (7k-15k)'
Else 'Very High (15k+)' End as Salary_Band 
From  [dbo].[HR-Employee-Attrition]
)
select temp2.Salary_Band,
count(*) as Total ,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from temp2 group by temp2.Salary_Band order by Attrition_Rate desc;




--Attrition by Job Role
select [JobRole],
count(*) as Total_Employees,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from [dbo].[HR-Employee-Attrition] 
Group by [JobRole] order by Attrition_Rate desc;



--Attrition by Job Satisfaction level
select [JobSatisfaction],
case when [JobSatisfaction] = 1 then 'Low'
when [JobSatisfaction] = 2 then 'Medium'
when [JobSatisfaction] = 3 then 'High'
else 'Very High' End as Satisfaction_Label,
count(*) as Total_Employees,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from [dbo].[HR-Employee-Attrition] 
group by [JobSatisfaction] order by [JobSatisfaction];




--Attrition by Year 
with temp3 as(
Select *,case 
when [YearsAtCompany] <= 2 then '0-2 Years'
when [YearsAtCompany] <= 5 then '3-5 Years'
when [YearsAtCompany] <= 10 then '6-10 Years'
Else '10+ Years' End as Year_Group
From [dbo].[HR-Employee-Attrition] 
)
select temp3.Year_Group ,
count(*) as Total_Employees,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from temp3 
group by temp3.Year_Group order by Attrition_Rate desc;



--Ranking Job Roles by Attrition Rate
with JobRoleStats as (
select [JobRole] ,
count(*) as Total_Employees,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from [dbo].[HR-Employee-Attrition]
group by [JobRole]
)
select *,
DENSE_RANK() Over ( order by Attrition_Rate desc) as Attrition_Rank,
Case when Attrition_Rate >= 25 then 'High Risk'
when Attrition_Rate >= 15 then 'Medium Risk'
Else 'Low Risk' end as Risk_Level
from JobRoleStats Order by Attrition_Rank ;




--Attrition by Department and gender
SELECT
[Department],
SUM(CASE WHEN [Gender] = 'Male' AND [Attrition] = 1 THEN 1 ELSE 0 END) AS Male_Left,
SUM(CASE WHEN [Gender] = 'Female' AND [Attrition] = 1 THEN 1 ELSE 0 END) AS Female_Left,
cast(ROUND(SUM(CASE WHEN [Gender] = 'Male' AND [Attrition] = 1 THEN 1.0 ELSE 0 END)/ COUNT(*) * 100,2) as decimal(10,2)) AS Male_Attrition_Rate,
cast(ROUND(SUM(CASE WHEN [Gender] = 'Female' AND [Attrition] = 1 THEN 1.0 ELSE 0 END)/ COUNT(*) * 100,2) as decimal(10,2)) AS Female_Attrition_Rate
FROM [dbo].[HR-Employee-Attrition]
GROUP BY [Department]
ORDER BY [Department];