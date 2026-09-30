USE HR_Analytics;

-- 1. Average salary by department
SELECT Department, ROUND(AVG(Monthly_Salary),2) AS avg_salary
FROM employee_attrition
GROUP BY Department
ORDER BY avg_salary DESC;

-- 2. Highest-paid employees
SELECT Employee_ID, Department, Job_Role, Monthly_Salary
FROM employee_attrition
ORDER BY Monthly_Salary DESC
LIMIT 10;

-- 3. Employees above company average salary
SELECT Employee_ID, Department, Job_Role, Monthly_Salary
FROM employee_attrition
WHERE Monthly_Salary > (SELECT AVG(Monthly_Salary) FROM employee_attrition)
ORDER BY Monthly_Salary DESC;

-- 4. Salary by attrition status
SELECT Attrition, ROUND(AVG(Monthly_Salary),2) AS avg_salary
FROM employee_attrition
GROUP BY Attrition;

-- 5. High performers with below-average salary
SELECT Employee_ID, Department, Job_Role, Performance_Rating, Monthly_Salary
FROM employee_attrition
WHERE Performance_Rating >= 4
  AND Monthly_Salary < (SELECT AVG(Monthly_Salary) FROM employee_attrition)
ORDER BY Performance_Rating DESC, Monthly_Salary;
