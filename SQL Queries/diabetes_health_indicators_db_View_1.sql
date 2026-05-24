USE diabetes_health_indicators_db;
DROP VIEW IF EXISTS diabetes_population;
CREATE VIEW diabetes_population AS
SELECT
    COUNT(Patient_id) AS total_population,
    (
        SELECT AVG(Diabetes = 2) * 100
        FROM Patient
		WHERE Diabetes = 0 OR Diabetes = 1 OR Diabetes = 2
    ) AS diabetes_percentage
FROM Patient
WHERE Diabetes = 2;
