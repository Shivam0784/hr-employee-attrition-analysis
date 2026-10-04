# HR EMPLOYEE ATTRITION ANALYSIS
### SQL Queries
### Dataset: IBM HR Analytics (1,470 employees)


Overall Attrition Rate
```
SELECT COUNT(*) AS Total_Rows,
sum(cast([Attrition] as Float)) as Employee_left,
Count(*)-sum(cast([Attrition] as Float))  as Employee_stayed,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
FROM [dbo].[HR-Employee-Attrition];
```
| Total Employees | Employees Left | Employees Stayed | Attrition Rate (%) |
|----------------|---------------|-----------------|-------------------|
| 1470 | 237 | 1233 | 16.12 |


Attrition Rate by Department
```
Select [Department],
count(*) as Total_Employees,
sum(cast([Attrition] as Float)) as Left_Count,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from [dbo].[HR-Employee-Attrition] 
group by [Department] Order by Attrition_Rate ;
```
| Department | Total Employees | Employees Left | Attrition Rate (%) |
|------------|---------------:|---------------:|-------------------:|
| Research & Development | 961 | 133 | 13.84 |
| Human Resources | 63 | 12 | 19.05 |
| Sales | 446 | 92 | 20.63 |


Attrition by Age Group
```
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
```
| Age Group | Total Employees | Employees Left | Attrition Rate (%) |
|-----------|---------------:|---------------:|-------------------:|
| Under 25 | 123 | 44 | 35.77 |
| 26-35 | 606 | 116 | 19.14 |
| Above 45 | 273 | 34 | 12.45 |
| 36-45 | 468 | 43 | 9.19 |



Attrition Rate by Over Time
```
Select case when [OverTime] = 1 then 'Yes' Else 'No' End as Over_Time,
count(*) Total_Employee,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
From [dbo].[HR-Employee-Attrition]
group by OverTime order by Attrition_Rate desc;
```
| Overtime | Total Employees | Employees Left | Attrition Rate (%) |
|----------|---------------:|---------------:|-------------------:|
| Yes | 416 | 127 | 30.53 |
| No | 1054 | 110 | 10.44 |



Attrition by Salary Band
```
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
```
| Salary Band | Total Employees | Employees Left | Attrition Rate (%) |
|-------------|---------------:|---------------:|-------------------:|
| Low (3K) | 395 | 113 | 28.61 |
| High (7K-15K) | 302 | 42 | 13.91 |
| Medium (3K-7K) | 640 | 77 | 12.03 |
| Very High (15K+) | 133 | 5 | 3.76 |



Attrition by Job Role
```
select [JobRole],
count(*) as Total_Employees,
sum(cast([Attrition] as Float)) as Left_Employee,
round(sum(cast([Attrition] as Float)) / count(*)*100 ,2)as Attrition_Rate
from [dbo].[HR-Employee-Attrition] 
Group by [JobRole] order by Attrition_Rate desc;
```
| Job Role | Total Employees | Employees Left | Attrition Rate (%) |
|-----------|---------------:|---------------:|-------------------:|
| Sales Representative | 83 | 33 | 39.76 |
| Laboratory Technician | 259 | 62 | 23.94 |
| Human Resources | 52 | 12 | 23.08 |
| Sales Executive | 326 | 57 | 17.48 |
| Research Scientist | 292 | 47 | 16.10 |
| Manufacturing Director | 145 | 10 | 6.90 |
| Healthcare Representative | 131 | 9 | 6.87 |
| Manager | 102 | 5 | 4.90 |
| Research Director | 80 | 2 | 2.50 |



Attrition by Job Satisfaction level
```
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
```
| Job Satisfaction | Satisfaction Level | Total Employees | Employees Left | Attrition Rate (%) |
|-----------------|-------------------|---------------:|---------------:|-------------------:|
| 1 | Low | 289 | 66 | 22.84 |
| 2 | Medium | 280 | 46 | 16.43 |
| 3 | High | 442 | 73 | 16.52 |
| 4 | Very High | 459 | 52 | 11.33 |

Attrition by Years at company
```
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
```
| Year_Group | Total_Employees | Employees_Left | Attrition_Rate (%) |
|------------------|---------------:|---------------:|-------------------:|
| 0-2 Years | 342 | 102 | 29.82 |
| 3-5 Years | 434 | 60 | 13.82 |
| 6-10 Years | 448 | 55 | 12.28 |
| 10+ Years | 246 | 20 | 8.13 |

Ranking Job Roles by Attrition Rate
```
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
```
| JobRole | Total_Employees | Left_Employee | Attrition_Rate | Attrition_Rank | Risk_Level |
|----------|----------------:|--------------:|---------------:|----------------:|------------|
| Sales Representative | 83 | 33 | 39.76 | 1 | High Risk |
| Laboratory Technician | 259 | 62 | 23.94 | 2 | Medium Risk |
| Human Resources | 52 | 12 | 23.08 | 3 | Medium Risk |
| Sales Executive | 326 | 57 | 17.48 | 4 | Medium Risk |
| Research Scientist | 292 | 47 | 16.10 | 5 | Medium Risk |
| Manufacturing Director | 145 | 10 | 6.90 | 6 | Low Risk |
| Healthcare Representative | 131 | 9 | 6.87 | 7 | Low Risk |
| Manager | 102 | 5 | 4.90 | 8 | Low Risk |
| Research Director | 80 | 2 | 2.50 | 9 | Low Risk |


Attrition by Department and gender
```
SELECT
[Department],
SUM(CASE WHEN [Gender] = 'Male' AND [Attrition] = 1 THEN 1 ELSE 0 END) AS Male_Left,
SUM(CASE WHEN [Gender] = 'Female' AND [Attrition] = 1 THEN 1 ELSE 0 END) AS Female_Left,
cast(ROUND(SUM(CASE WHEN [Gender] = 'Male' AND [Attrition] = 1 THEN 1.0 ELSE 0 END)/ COUNT(*) * 100,2) as decimal(10,2)) AS Male_Attrition_Rate,
cast(ROUND(SUM(CASE WHEN [Gender] = 'Female' AND [Attrition] = 1 THEN 1.0 ELSE 0 END)/ COUNT(*) * 100,2) as decimal(10,2)) AS Female_Attrition_Rate
FROM [dbo].[HR-Employee-Attrition]
GROUP BY [Department]
ORDER BY [Department];
```
| Department | Male_Left | Female_Left | Male_Attrition_Rate | Female_Attrition_Rate |
|------------|----------:|------------:|--------------------:|----------------------:|
| Human Resources | 6 | 6 | 9.52 | 9.52 |
| Research & Development | 90 | 43 | 9.37 | 4.47 |
| Sales | 54 | 38 | 12.11 | 8.52 |




