-- 1). Find all patients who are male and weight more than 75.

SELECT * FROM patients 
WHERE gender  = 'M' AND weight > 75;

-- 2). List female patients born after January 1, 1990, ordered by last name.

SELECT * FROM patients 
WHERE gender = 'F' AND birth_date > '1990-01-01' 
ORDER BY last_name;

-- 3). Show patients from 'Ontario' (province_id 'ON') with allergies, sorted by city.

SELECT * FROM patients  
WHERE province_id = 'ON'  
AND allergies IS NOT NULL  
ORDER BY city;

-- 4). Find doctors whose specialty is 'Cardiology' or 'Neurology'

SELECT * FROM doctors WHERE  specialty IN ('Cardiology' or 'Neurology');

-- 5). List patients whose height is between 150 and 170 cm, ordered by height descending

SELECT * FROM patients WHERE height BETWEEN 150 AND 170 ORDER BY height DESC; 

-- 6). Find admissions where the diagnosis contains the word 'infection'.

SELECT * FROM admissions WHERE  diagnosis LIKE "%infection%";


-- 7). Show patients whose last name starts with 'S' and have no allergies.

SELECT * FROM patients 
WHERE last_name LIKE 'S%' 
AND allergies IS NULL;

SELECT * FROM patients 
WHERE last_name LIKE 'S%' 
AND (allergies IS NULL OR allergies = '');

-- 8). List doctors whose first name is 'John' or 'Michael', ordered by specialty.

SELECT * FROM doctors WHERE first_name = 'John'  OR first_name = 'Michael' ORDER BY specialty;

-- 9). Find patients from 'Toronto' or 'Vancouver' who were born before 1980.

SELECT * FROM patients 
WHERE (city = 'Toronto' OR city = 'Vancouver') 
AND birth_date < '1980-01-01';

-- 10). Show admissions where the patient stayed more than 5 days (discharge_date - admission_date).

SELECT * FROM admissions 
WHERE discharge_date - admission_date > 5;

-- 11). List patients with NULL values in the allergies field.

SELECT * FROM patients WHERE allergies IS NULL;

-- 12). Find patients whose weight is greater than 80 and pounds or height is less than 160 cm.

SELECT * FROM patients WHERE weight > 80 AND height < 160;

-- 13). Show admissions for the month of January 2023, ordered by admission date.

SELECT * FROM admissions  
WHERE admission_date BETWEEN '2023-01-01' AND '2023-01-31'  
ORDER BY admission_date;

-- 14). List patients with allergies to 'Penicillin' or 'Sulfa'.

SELECT * FROM patients WHERE (allergies = 'Penicillin' OR allergies = 'Sulfa');
SELECT * FROM patients WHERE allergies IN ('Penicillin' 'Sulfa');

-- 15). Find doctors whose last name ends with 'son' and specialty is not 'General Practice'.

SELECT * FROM doctors WHERE last_name LIKE '%son' AND  specialty != 'General';

-- 16). Show patients from provinces 'BC', 'AB', or 'SK', ordered by province then last name

SELECT * FROM patients WHERE province_id IN ('BC', 'AB', 'SK')  
ORDER BY province, last_name;

-- 17). List admissions where diagnosis is not 'Hypertension' or 'Diabetes'.

SELECT * FROM admissions WHERE diagnosis != ('Hypertension' 'Diabetes');

-- 18). Find patients whose first name is exactly 5 letters long.

SELECT * FROM patients WHERE first_name LIKE '_____';


-- 19). Show patients born on a weekend (Saturday or Sunday).

SELECT * FROM patients WHERE DAYOFWEEK(birth_date) IN (1, 7);



-- 20). List admissions where the attending doctor's specialty is 'Surgery' and discharge date is NULL.

SELECT * FROM admissions  
WHERE attending_doctor_id IN (  
    SELECT doctor_id FROM doctors WHERE specialty = 'Surgery')  
AND discharge_date IS NULL;
