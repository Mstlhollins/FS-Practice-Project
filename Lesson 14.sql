Create table patients(
date int,
pid varchar(10) primary key,
p_name varchar(20),
age int,
weight int,
gender varchar(15),
location varchar (25),
phone_no int,
disease varchar (20),
doctor_name varchar(25),
doctor_id int);

Insert into patients(date,pid,p_name,age,weight,gender,location,phone_no,disease,doctor_name,doctor_id)
VALUES 
('6/15/2019','AP2021','Sarath','67','76','Male','chennai','5462829','Cardiac','Mohan','21'),
('2/13/2019','AP2022','John','62','80','Male','banglore','1234731','Cancer','Suraj','22'),
('8/1/2018','AP2023','Henry','43','65','Male','Kerala','9028230','Liver','Mehta','23'),
('4/2/2020','AP2024','Carl','56','72','Female','Mumbai','9293829','Asthma','Karthik','24'),
('9/15/2017','AP2025','Shikar','55','71','Male','Delhi','7821281','Cardiac','Mohan','21'),
('7/22/2018','AP2026','Piysuh','47','59','Male','Haryana','8912819','Cancer','Suraj','22'),
('3/25/2017','AP2027','Stephen','69','55','Male','Gujarat','8888211','Liver','Mehta','23'),
('4/22/2019','AP2028','Aaron','75','53','Male','Banglore','9012192','Asrhma','Karthik','24');



Select Count(*) AS total_patients 
From patients;


Select pid,
p_name,
 current_date AS current_date
 From patients;


Select
    UPPER(p_name) AS upper_old_name, 
    UPPER(p_name) AS upper_new_name
From  patients;


Select
    p_name, 
    Length(p_name) AS name_character_count
From 
    patients;



Select p_name || ' - ' || doctor_name AS patient_and_doctor
FROM patients;


Select extract(YEAR FROM date) AS patient_year
From patients;





Select doctor_name, COUNT(*) AS count
From patients
Group by doctor_name
Having COUNT(*) > 1;






