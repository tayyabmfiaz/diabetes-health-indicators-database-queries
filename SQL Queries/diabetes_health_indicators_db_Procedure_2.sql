USE diabetes_health_indicators_db;
DROP PROCEDURE IF EXISTS no_healthcare_diabetes_summary;
DELIMITER //
CREATE PROCEDURE no_healthcare_diabetes_summary ()
BEGIN
    SELECT COUNT(Patient_id) AS no_healthcare_total, SUM(Diabetes = 2) AS diabetic_count, ROUND(100.0 * SUM(Diabetes = 2) / COUNT(Patient_id), 2) AS diabetic_percentage
    FROM Patient
    JOIN Healthcare_Access 
    USING(Healthcare_Access_id)
    WHERE Healthcare_Access.Any_Healthcare_Coverage = 0 AND (Diabetes = 0 OR Diabetes = 1 OR Diabetes = 2);
END //
DELIMITER ;
CALL no_healthcare_diabetes_summary();
