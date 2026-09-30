USE HR_Analytics;

-- 1. Department performance
SELECT
    Department,
    COUNT(*) AS employees,
    ROUND(AVG(Performance_Rating),2) AS avg_performance,
    ROUND(AVG(Job_Satisfaction),2) AS avg_satisfaction,
    ROUND(AVG(Years_at_Company),2) AS avg_tenure,
    ROUND(AVG(Monthly_Salary),2) AS avg_salary
FROM employee_attrition
GROUP BY Department
ORDER BY employees DESC;

-- 2. Job-role headcount
SELECT Department, Job_Role, COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Department, Job_Role
ORDER BY Department, employee_count DESC;

-- 3. Average training hours by department
SELECT Department, ROUND(AVG(Training_Hours),2) AS avg_training_hours
FROM employee_attrition
GROUP BY Department
ORDER BY avg_training_hours DESC;
