-- 1. Get all patients who live in the city of 'Hyderabad'.

SELECT * FROM patients WHERE city = 'Hyderabad';

-- 2. Retrieve the names of all female patients (gender = 'F').

SELECT * FROM patients WHERE gender IN ('F');

-- 3. Find patients who are allergic to 'Penicillin'.

SELECT * FROM patients WHERE allergies = 'Penicillin';

-- 4. List all patients whose weight is more than 75 kg.

SELECT * FROM patients WHERE weight >= 75;

-- 5. Get patients whose height is between 150 and 180 cm.

SELECT height FROM patients WHERE height BETWEEN 150 AND 180;

-- 6. Find patients whose first name starts with 'A'.

SELECT first_name FROM patients WHERE first_name LIKE 'A%';

-- 7. Show all patients from the province with ID 'MH'.

SELECT * FROM patients WHERE province_id = 'MH';

-- 8. Retrieve patients whose birth date is before '2000-01-01'.

SELECT * FROM patients WHERE birth_date < '2000-01-01';

-- 9. Find patients whose allergy information is not known (i.e., allergies is NULL or '').

SELECT * FROM patients WHERE allergies IS NULL;

SELECT * FROM patients WHERE allergies IS NULL OR allergies = '';

-- 10. List patients whose weight is either 60, 70, or 80.

SELECT * FROM patients WHERE weight IN (60, 70, 80);
 
-- 11. Get patient names along with province names who are from the province 'Karnataka'.

SELECT 
      p.first_name,
	  p.last_name,
	  pn.province_name
FROM patients p
LEFT JOIN province_names pn
ON p.province_id = pn.province_id
WHERE pn.province_name = 'Karnataka';

-- 12. List patients who have been admitted at least once.

SELECT DISTINCT
      p.patient_id, 
      p.first_name, 
      p.last_name, 
      a.admission_date
FROM patients AS p
INNER JOIN admissions AS a
ON p.patient_id = a.patient_id;

-- 13. Show patients who have never been admitted.

SELECT 
    p.patient_id, 
    p.first_name, 
    p.last_name
FROM 
    patients p
LEFT JOIN admissions a 
ON p.patient_id = a.patient_id
WHERE a.admission_date IS NULL;

-- 14. Find all admissions with a diagnosis containing the word 'fever'.

SELECT * FROM admissions WHERE diagnosis LIKE '%fever%';

-- 15. Retrieve admissions between '2024-01-01' and '2024-12-31'.

SELECT * FROM admissions WHERE admission_date BETWEEN '2024-01-01' AND '2024-12-31';
