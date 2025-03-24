# SQL-Problem-Solving
# Hospital Database SQL Solutions

This repository contains SQL solutions to various problems based on a hospital database schema. The database tracks patients, doctors, admissions, and province information.

## Database Schema

### Tables

#### `patients`
- `patient_id` (INT, PK): Unique identifier for patients (auto-incremented)
- `first_name` (VARCHAR(30)): Patient's first name
- `last_name` (VARCHAR(30)): Patient's last name
- `gender` (CHAR(1)): Patient's gender
- `birth_date` (DATE): Patient's date of birth
- `city` (VARCHAR(30)): City of residence
- `province_id` (CHAR(2), FK): Province identifier (references province_names)
- `allergies` (VARCHAR(80)): Patient's known allergies
- `height` (DECIMAL(3,0)): Height in cm
- `weight` (DECIMAL(4,0)): Weight in kg

#### `doctors`
- `doctor_id` (INT, PK): Unique identifier for doctors (auto-incremented)
- `first_name` (VARCHAR(30)): Doctor's first name
- `last_name` (VARCHAR(30)): Doctor's last name
- `specialty` (VARCHAR(25)): Medical specialty

#### `admissions`
- `patient_id` (INT, FK): References patients table
- `admission_date` (DATE): Date of hospital admission
- `discharge_date` (DATE): Date of discharge
- `diagnosis` (VARCHAR(50)): Medical diagnosis
- `attending_doctor_id` (INT, FK): References doctors table
- Primary Key: Composite of (patient_id, admission_date)

#### `province_names`
- `province_id` (CHAR(2), PK): 2-character province code
- `province_name` (VARCHAR(30)): Full province name
