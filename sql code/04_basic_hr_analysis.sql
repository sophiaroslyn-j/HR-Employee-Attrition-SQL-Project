USE HR_Analytics;

-- 1. Total employees
SELECT COUNT(*) AS total_employees FROM employee_attrition;

-- 2. Employees by department
SELECT Department, COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Department
ORDER BY employee_count DESC;

-- 3. Gender distribution
SELECT Gender, COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Gender;

-- 4. Work mode distribution
SELECT Work_Mode, COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Work_Mode;

-- 5. Average age and salary
SELECT
    ROUND(AVG(Age),1) AS avg_age,
    ROUND(AVG(Monthly_Salary),2) AS avg_monthly_salary
FROM employee_attrition;

-- 6. Education distribution
SELECT Education_Level, COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Education_Level
ORDER BY employee_count DESC;
