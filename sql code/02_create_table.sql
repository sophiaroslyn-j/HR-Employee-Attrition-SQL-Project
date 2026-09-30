USE HR_Analytics;

CREATE TABLE employee_attrition (
    Employee_ID VARCHAR(10) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(20),
    Department VARCHAR(50),
    Job_Role VARCHAR(100),
    City VARCHAR(50),
    Education_Level VARCHAR(50),
    Employment_Type VARCHAR(30),
    Years_at_Company INT,
    Monthly_Salary DECIMAL(10,2),
    Job_Satisfaction INT,
    Performance_Rating INT,
    Work_Mode VARCHAR(20),
    Overtime VARCHAR(10),
    Training_Hours INT,
    Promotion_Last_3Yrs VARCHAR(10),
    Attrition VARCHAR(10)
);

-- Import employee_attrition.csv using your MySQL client's CSV import feature.
