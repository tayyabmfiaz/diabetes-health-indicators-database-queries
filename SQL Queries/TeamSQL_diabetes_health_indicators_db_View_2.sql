USE diabetes_health_indicators_db;
DROP VIEW IF EXISTS average_bmi;
CREATE VIEW average_bmi AS
SELECT ROUND(AVG(Body_Mass_Index), 2) AS average_overall_bmi,
    (
		SELECT ROUND(AVG(Body_Mass_Index), 2)
		FROM Patient
		JOIN Vitals
		USING(Vitals_id)
		WHERE Diabetes = 2
    ) AS avg_bmi_diabetic
FROM Patient
JOIN Vitals
USING(Vitals_id)
WHERE Diabetes = 0 OR Diabetes = 1 OR Diabetes = 2;
