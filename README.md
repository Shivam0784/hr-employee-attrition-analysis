# hr-attrition-analysis

## Project Overview
An end-to-end data analytics project analysing 1,470 employee records to uncover why employees leave, identify high-risk roles and departments, and simulate the impact of salary increases on attrition — using Excel, SQL, Python and Power BI.

## Tools Used
- Excel — data cleaning, pivot tables, charts
- SQL Server (SSMS) — 13+ queries including CTEs, window functions (DENSE_RANK), and PIVOT analysis
- Python — pandas, matplotlib, seaborn for EDA and correlation analysis
- Power BI — interactive 2-page dashboard with DAX measures, conditional formatting and a What-If salary simulator

## Problem Statement
- What is the overall employee attrition rate?
- Which department and job role lose the most employees?
- Does overtime, salary or job satisfaction affect attrition?
- Which age group is most likely to leave?
- Can we simulate the impact of a salary increase on attrition?

## Key Findings
- Overall attrition rate is 16.12% — above industry average
- Sales Representatives have the highest attrition at 39.76% — nearly 4x the company average
- Overtime workers leave at 30.53% vs only 10.44% for non-overtime employees
- Employees under 25 have a 35.77% attrition rate — the highest of any age group
- Low salary employees (below $3K) leave at 28.61% vs just 3.76% for top earners
- New joiners are 3.67x more likely to leave than veteran employees
- A simulated 5% salary increase projects to reduce attrition from 16.12% to 15.72%

## Files in this Repository
- HR_Attrition_Analysis.xlsx — cleaned dataset with pivot tables
- hr_analysis.ipynb — Python EDA with 8 charts and correlation heatmap
- hr_attrition_queries.sql — all SQL queries including advanced window functions
- HR_Attrition_Dashboard.pbix — Power BI dashboard file
- Attrition Overview screenshots
- Salary Impact Simulator screenshots

## Dashboard Preview

### Page 1 — Attrition Overview
<img width="782" height="444" alt="Dashboard_OverView" src="https://github.com/user-attachments/assets/266096f2-a91a-44b8-a93e-aed0a61d5686" />


### Page 2 — Salary Impact Simulator
<img width="783" height="441" alt="Salary_Simulation" src="https://github.com/user-attachments/assets/5e404fa3-b4a8-406f-b3ed-bd4c9241ea51" />


<iframe title="Hr_Analysis_Dashboard" width="600" height="373.5" src="https://app.powerbi.com/view?r=eyJrIjoiY2VhZDExNzctZWE2Mi00YjZhLWE1NTQtNjhmYzAwOGExNDhkIiwidCI6IjhiNjU2MjhkLWYxOTctNGE3My1iMzkwLTgyNjRlMDg1MjZlNiJ9" frameborder="0" allowFullScreen="true"></iframe>

