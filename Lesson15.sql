create TABLE employee_table(
emp_id int ,
f_name varchar(20),
l_name varchar (20),
job_id varchar (10),
salary int ,
manager_id int,
dept_id int 
);

Insert into employee_table(emp_id,f_name,l_name,job_id,salary,manager_id,dept_id)
VALUES 
('101','John','Smith','JP123','70000','02','30'),
('102','Emily','Johnson','EN456','80000','03','40'),
('103','Michael','Williams','MW789','90000','04','20'),
('104','Emma','Jones','EJ567','75000','75000','02','10'),
('105','Calvin','Miller','CM345','85000','03','30'),
('106','Sophia','Davis','SD678','95000','04','20'),
('107','Liam','Moore','LM901','72000','02','40'),
('108','Olivia','Anderson','OA234','87000','03','10'),
('109','William','Brown','WB567','92000','04','30'),
('110','Ava','Taylor','AT890','78000','02','20')
;


Select concat(l_name,',',f_name) as employee_name,
salary as employee_salary
from employee_table
inner join employee_name on employee_salary
where salary>'85000'
;




Select concat(l_name,',',f_name) as employee_name,
from employee_table
where salary>(Select avg(salary) from employee_table);



Select emp_id,f_name,salary
from employee_table
where salary > CAST(job_id AS 'MW789')
INTERSECT 
Select emp_id, f_name, salary 
From employee_table 
order by salary ASC;



Select
    e.f_name,
    e.emp_id,
    e.salary
from (
    Select emp_id, f_name, salary
    from employee_table
    order by salary DESC 
    limit 3
) AS top_earners
JOIN e.f_name  ON top_earners.emp_id = e.emp_id;






