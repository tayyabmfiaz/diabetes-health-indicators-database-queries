USE diabetes_health_indicators_db;
DROP FUNCTION IF EXISTS fruit_veg_diabetes_percentage;
DELIMITER //
CREATE FUNCTION fruit_veg_diabetes_percentage()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE diabetes_percentage DECIMAL(10,2);
    SELECT ROUND(100.0 * SUM(Diabetes = 2) / COUNT(Patient_id),2)
    INTO diabetes_percentage
    FROM Patient
    JOIN Health_Behaviors USING (Health_Behavior_id)
    WHERE Eating_Fruits_Daily = 1 AND Eating_Veggies_Daily = 1 AND (Diabetes = 0 OR Diabetes = 1 OR Diabetes = 2);
    RETURN diabetes_percentage;
END //
DELIMITER ;
SELECT fruit_veg_diabetes_percentage() AS diabetes_percentage;
