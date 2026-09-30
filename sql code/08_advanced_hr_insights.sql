USE HR_Analytics;

-- 1. Salary rank within each department
SELECT
    Employee_ID, Department, Job_Role, Monthly_Salary,
    DENSE_RANK() OVER (PARTITION BY Department ORDER BY Monthly_Salary DESC) AS salary_rank
FROM employee_attrition;

-- 2. Top 3 paid employees in each department
WITH ranked AS (
    SELECT
        Employee_ID, Department, Job_Role, Monthly_Salary,
        DENSE_RANK() OVER (PARTITION BY Department ORDER BY Monthly_Salary DESC) AS rnk
    FROM employee_attrition
)
SELECT *
FROM ranked
WHERE rnk <= 3
ORDER BY Department, rnk;

-- 3. Satisfaction classification
SELECT
    Employee_ID, Job_Satisfaction,
    CASE
        WHEN Job_Satisfaction <= 2 THEN 'Low'
        WHEN Job_Satisfaction = 3 THEN 'Medium'
        ELSE 'High'
    END AS satisfaction_level
FROM employee_attrition;

-- 4. High-risk employee profile
SELECT
    Employee_ID, Department, Job_Role, Monthly_Salary,
    Job_Satisfaction, Overtime, Years_at_Company, Attrition
FROM employee_attrition
WHERE Job_Satisfaction <= 2
  AND Overtime = 'Yes';

-- 5. Compare salary with department average
SELECT
    Employee_ID, Department, Job_Role, Monthly_Salary,
    ROUND(AVG(Monthly_Salary) OVER (PARTITION BY Department),2) AS department_avg_salary,
    ROUND(Monthly_Salary - AVG(Monthly_Salary) OVER (PARTITION BY Department),2) AS salary_difference
FROM employee_attrition;
