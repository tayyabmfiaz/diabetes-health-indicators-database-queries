USE diabetes_health_indicators_db;
DROP VIEW IF EXISTS smoker_diabetes_distribution;
CREATE VIEW smoker_diabetes_distribution AS
SELECT COUNT(Patient_id) AS total_smokers, SUM(Diabetes = 1) AS prediabetic_smoker, SUM(Diabetes = 2) AS diabetic_smoker
FROM Patient
JOIN Health_Behaviors USING (Health_Behavior_id)
WHERE Health_Behaviors.Smoker = 1
  AND (Patient.Diabetes = 0 OR Patient.Diabetes = 1 OR Patient.Diabetes = 2);
