
-- 1). Count the number of patients in each province.

SELECT province_id, COUNT(*) AS patient_count
FROM patients
GROUP BY province_id;

-- 2). Calculate the average weight of male vs. female patients.

SELECT gender, AVG(weight) AS avg_weight
FROM patients
GROUP BY gender;

-- 3). Find the tallest patient in each city.

SELECT city, MAX(height) AS tallest
FROM patients
GROUP BY city;

-- 4). Count how many admissions each doctor has attended, showing only those with more than 10 admissions.

SELECT attending_doctor_id, COUNT(*)
FROM admissions 
GROUP BY attending_doctor_id
HAVING COUNT(*) > 10;

-- 5). Calculate the average length of stay (discharge_date - admission_date) by diagnosis.

SELECT diagnosis, AVG(discharge_date - admission_date) AS avg_length_of_stay
FROM admissions
GROUP BY diagnosis;


-- 6). Find the most common allergy among patients.

SELECT  allergies, COUNT(*) AS allergies_count
FROM patients
GROUP BY  allergies
ORDER BY allergies_count DESC
LIMIT 1;


-- 7). Calculate the total number of patients by gender and province.

SELECT gender, province_id, COUNT(*) AS patient_count
FROM patients
GROUP BY gender, province_id;

-- 8). Find diagnoses that have more than 5 admissions.

SELECT diagnosis, COUNT(*) AS admission_count
FROM admissions
GROUP BY diagnosis
HAVING COUNT(*) > 5;

-- 9). Calculate the average height and weight by decade of birth.

SELECT (YEAR(birth_date) DIV 10) * 10 AS birth_decade,
AVG(height) AS avg_height,
AVG(weight) AS avg_weight
FROM patients
GROUP BY birth_decade;


-- 10). Count how many patients have no allergies in each city.

SELECT city, COUNT(*) AS no_allergy_count
FROM patients
WHERE allergies IS NULL OR allergies = ''
GROUP BY city;


-- 11). Find doctors who have attended admissions for more than 3 different diagnoses.

SELECT attending_doctor_id, COUNT(DISTINCT diagnosis) AS unique_diagnoses
FROM admissions
GROUP BY    attending_doctor_id
HAVING COUNT(DISTINCT diagnosis) > 3;

-- 12). Calculate the maximum and minimum weight by height range (grouped by 10cm intervals).

SELECT (height DIV 10) * 10 AS height_range,
       MAX(weight) AS max_weight,
       MIN(weight) AS min_weight
FROM patients
GROUP BY height_range;

-- 13). Find provinces with more than 100 patients.

SELECT province_id, COUNT(*) AS patient_count
FROM patients
GROUP BY province_id
HAVING COUNT(*) > 100;

-- 14). Calculate the average number of admissions per patient.

SELECT AVG(admission_count) AS avg_admissions_per_patient
FROM (
    SELECT patient_id, COUNT(*) AS admission_count
    FROM admissions
    GROUP BY patient_id
) AS subquery;

-- 15). Find diagnoses where the average patient age is over 50 years.

SELECT diagnosis, AVG(YEAR(CURRENT_DATE) - YEAR(birth_date)) AS avg_age
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
GROUP BY diagnosis
HAVING avg_age > 50;


-- 16). Count how many patients were admitted each month in 2023.

SELECT MONTH(admission_date) AS month, COUNT(*) AS admission_count
FROM admissions
WHERE YEAR(admission_date) = 2023
GROUP BY month
ORDER BY month;

-- 17). Find cities where the average patient weight is above the overall average.

SELECT city, AVG(weight) AS avg_city_weight
FROM patients
GROUP BY city
HAVING AVG(weight) > (SELECT AVG(weight) FROM patients);

-- 18). Identify doctors who have the highest number of unique patient admissions.

SELECT attending_doctor_id, COUNT(DISTINCT patient_id) AS unique_patients
FROM admissions
GROUP BY attending_doctor_id
ORDER BY unique_patients DESC
LIMIT 1;
