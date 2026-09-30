USE HR_Analytics;

-- 1. Overall attrition rate
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_rate
FROM employee_attrition;

-- 2. Attrition by department
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY Department
ORDER BY attrition_rate DESC;

-- 3. Attrition by overtime
SELECT
    Overtime,
    COUNT(*) AS total_employees,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY Overtime;

-- 4. Attrition by satisfaction
SELECT
    Job_Satisfaction,
    COUNT(*) AS total_employees,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY Job_Satisfaction
ORDER BY Job_Satisfaction;

-- 5. Attrition by employment type
SELECT
    Employment_Type,
    COUNT(*) AS total_employees,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS attrition_rate
FROM employee_attrition
GROUP BY Employment_Type;
