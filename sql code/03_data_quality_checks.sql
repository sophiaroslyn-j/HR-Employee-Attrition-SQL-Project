USE HR_Analytics;

-- 1. Row count
SELECT COUNT(*) AS total_rows FROM employee_attrition;

-- 2. Check duplicate employee IDs
SELECT Employee_ID, COUNT(*) AS cnt
FROM employee_attrition
GROUP BY Employee_ID
HAVING COUNT(*) > 1;

-- 3. Check missing values
SELECT
    SUM(Employee_ID IS NULL) AS missing_employee_id,
    SUM(Department IS NULL) AS missing_department,
    SUM(Monthly_Salary IS NULL) AS missing_salary,
    SUM(Attrition IS NULL) AS missing_attrition
FROM employee_attrition;

-- 4. Validate rating ranges
SELECT *
FROM employee_attrition
WHERE Job_Satisfaction NOT BETWEEN 1 AND 5
   OR Performance_Rating NOT BETWEEN 1 AND 5;
