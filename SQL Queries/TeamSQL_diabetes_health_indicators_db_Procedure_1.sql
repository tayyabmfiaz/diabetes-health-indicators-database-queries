USE diabetes_health_indicators_db;
DROP PROCEDURE IF EXISTS diabetes_by_age_range;
DELIMITER //
CREATE PROCEDURE diabetes_by_age_range (IN min_age INT, IN max_age INT)
BEGIN
    SELECT Age, COUNT(Patient_id) AS total_population, SUM(Diabetes = 2) AS diabetic_count, ROUND(100.0 * SUM(Diabetes = 2) / COUNT(Patient_id), 2) AS diabetic_percentage
    FROM Patient
    JOIN Demographics USING (Demographics_id)
    WHERE (Diabetes = 0 OR Diabetes = 1 OR Diabetes = 2) AND Age BETWEEN min_age AND max_age
    GROUP BY Age
    ORDER BY Age;
END //
DELIMITER ;
CALL diabetes_by_age_range(1, 13);
