USE diabetes_health_indicators_db;
DROP FUNCTION IF EXISTS avg_diabetic_physical_unhealthy_days;
DELIMITER //
CREATE FUNCTION avg_diabetic_physical_unhealthy_days()
RETURNS DECIMAL(10,2)
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE avg_days DECIMAL(10,2);
    SELECT ROUND(AVG(Physically_Unhealthy_Days), 2)
    INTO avg_days
    FROM Patient
    JOIN Self_Reported_Health USING (Self_Reported_id)
    WHERE Diabetes = 2;
    RETURN avg_days;
END //
DELIMITER ;
SELECT avg_diabetic_physical_unhealthy_days() AS physically_unhealthy_days_percentage;
