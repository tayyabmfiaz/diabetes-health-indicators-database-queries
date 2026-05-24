USE diabetes_health_indicators_db;
DROP VIEW IF EXISTS diabetes_by_income;
CREATE VIEW diabetes_by_income AS
SELECT Income, COUNT(Patient_id) AS total_people, SUM(Diabetes = 2) AS diabetes_count, ROUND(100.0 * SUM(Diabetes = 2) / COUNT(Patient_id), 2) AS diabetes_percentage
FROM Patient
JOIN Demographics 
USING(Demographics_id)
WHERE Diabetes = 0 OR Diabetes = 1 OR Diabetes = 2
GROUP BY Income
HAVING COUNT(Patient_id) > 0
ORDER BY Income ASC;
