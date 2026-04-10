USE [Cancer_risk_factory]
GO

SELECT *
  FROM [dbo].[cancer_risk_factors]

GO
-- 1) How many total records have family history with lung tybe?
SELECT COUNT(*) AS Total_Records
FROM cancer_risk_factors
WHERE Family_History = 1 AND Cancer_Type = 'Lung';
--------------------------------------------------------------

-- 2) What are the total number of cases for each Cancer Type?
SELECT Cancer_Type, COUNT(*) AS Case_Count
FROM cancer_risk_factors
GROUP BY Cancer_Type;
--------------------------------------------------------------

-- 3) What is the average cancer risk score for males vs females?
SELECT Gender, AVG(CAST(Overall_Risk_Score AS FLOAT)) AS Avg_Risk_Score
FROM cancer_risk_factors
GROUP BY Gender;

--------------------------------------------------------------

-- 4) How many patients are smokers vs non-smokers?
SELECT Smoking, COUNT(*) AS People_Count
FROM cancer_risk_factors
GROUP BY Smoking;
--------------------------------------------------------------

-- 5) List all patients categorized as High Risk.
SELECT *
FROM cancer_risk_factors
WHERE Risk_Level = 'High';
--------------------------------------------------------------

-- 6) What is the average BMI for each Cancer Type?
SELECT Cancer_Type, AVG(Cast (BMI AS float)) AS Average_BMI
FROM cancer_risk_factors
GROUP BY Cancer_Type;
--------------------------------------------------------------

-- 7) How many patients have a BRCA mutation?
SELECT COUNT(*) AS BRCA_Positive_Count
FROM cancer_risk_factors
WHERE BRCA_Mutation = '1';
--------------------------------------------------------------

-- 8) How many individuals smoke and consume alcohol at the same time?
SELECT COUNT(*) AS High_Lifestyle_Risk
FROM cancer_risk_factors
WHERE Smoking > 6 AND Alcohol_Use > 6;
--------------------------------------------------------------

-- 9) Show the records of patients with Low physical activity levels.
SELECT *
FROM cancer_risk_factors
WHERE Physical_Activity_Level BETWEEN 0 AND 4 ;
--------------------------------------------------------------

-- 10) How many obese individuals are classified as High Risk?
SELECT COUNT(*) AS Obese_High_Risk_Patients
FROM cancer_risk_factors
WHERE Obesity > 6
  AND Risk_Level = 'High';
--------------------------------------------------------------
