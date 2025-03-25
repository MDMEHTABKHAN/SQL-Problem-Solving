-- 1).  Show all patients ordered by first name ascending

SELECT * FROM patients ORDER BY first_name;

-- 2). Show all patients ordered by birth date descending

SELECT * FROM patients ORDER BY birth_date DESC;

-- 3). Show only first names of all patients (no duplicates)

SELECT DISTINCT first_name FROM patients WHERE first_name IS NOT NULL;

-- 4). Show first name and last name concatenated as "full_name"

SELECT first_name, last_name , CONCAT(first_name, ' ', last_name) AS full_name FROM patients;

-- 5). Show first name, last name, and province name for each patient

SELECT PA.first_name, PA.last_name, P.province_name
FROM patients AS PA
INNER JOIN province_names AS P
ON PA.province_id = P.province_id;

-- 6). Show how many patients have a birth_date after 2010

SELECT COUNT(*) FROM patients WHERE YEAR(birth_date) > 2010;

-- 7). Show the first name, last name, and height of the tallest patient

SELECT first_name, last_name, height
FROM patients
WHERE height = (SELECT MAX(height) FROM patients) LIMIT 1;

-- 8). Show all columns for patients who have one of these allergies: 'allergies', 'Morphine'

SELECT * FROM patients WHERE allergies IN ('Penicillin', 'Morphine');

-- 9). Show patient first and last name with allergies (NULL if none)

SELECT first_name, last_name, allergies
FROM patients;

-- 10). Show patient_id, first_name, last_name from patients whose first name starts with 'C'

SELECT patient_id, first_name, last_name FROM patients WHERE first_name LIKE 'C%';

-- 11). Show unique birth years from patients

SELECT DISTINCT YEAR(birth_date) AS birth_year FROM patients ORDER BY birth_year;

-- 12). Show patient_id and weight for patients with weight between 60-80

SELECT patient_id, weight FROM patients 
WHERE weight BETWEEN 60 AND 80;

-- 13). Show patients born in the 1990s

SELECT * FROM patients 
WHERE birth_date BETWEEN '1990-01-01' AND '1999-12-31';

SELECT * FROM patients WHERE birth_date = 1990;

-- 14). Show the minimum and maximum weight for patients with last name 'Smith'

SELECT 
    MIN(weight) AS min_weight,
    MAX(weight) AS max_weight
FROM patients
WHERE last_name = 'Smith';

-- 15). Show all patient columns and province names for Ontario residents

SELECT p.*, pr.province_name
FROM patients  AS p
JOIN province_names  AS pr ON p.province_id = pr.province_id
WHERE pr.province_name = 'Ontario';

-- 16). Count how many patients were born in each year (group by year)

SELECT 
YEAR(birth_date) AS birth_year,
COUNT(*) AS patient_count
FROM patients
GROUP BY birth_year
ORDER BY birth_year;

-- 17). Show all allergies ordered by frequency (most common first)

SELECT allergies,
COUNT(*) AS frequency
FROM patients
WHERE allergies IS NOT NULL
GROUP BY allergies
ORDER BY frequency DESC;

-- 18). Show patient first name and last name with their doctor's last name

SELECT 
    p.first_name AS patient_first,
    p.last_name AS patient_last,
    d.last_name AS doctor_last
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.attending_doctor_id = d.doctor_id;

-- 19). Show patients who don't have any allergies

SELECT * FROM patients WHERE allergies IS NULL;

-- 20). Show the number of male and female patients
SELECT gender, COUNT(*) AS patient_count
FROM patients
GROUP BY gender;