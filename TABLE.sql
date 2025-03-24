USE mehtab;



CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender CHAR(1),
    birth_date DATE,
    city VARCHAR(30),
    province_id CHAR(2),
    allergies VARCHAR(80),
    height DECIMAL(3,0),
    weight DECIMAL(4,0),
    FOREIGN KEY (province_id) REFERENCES province_names(province_id)
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    specialty VARCHAR(25)
);

CREATE TABLE admissions (
    patient_id INT,
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(50),
    attending_doctor_id INT,
    PRIMARY KEY (patient_id, admission_date),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (attending_doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE province_names (
    province_id CHAR(2) PRIMARY KEY,
    province_name VARCHAR(30)
);

SELECT * FROM province_names;
SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM admissions;
