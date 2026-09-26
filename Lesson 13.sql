create table students(
s_id int primary key not null,
s_fname varchar(20) not null,
s_lname varchar (20) not null,
student_c int,
age int);


create table marksheets(
score int,
year int, 
class int,
ranking int,
s_id);


Insert into students(s_id,s_fname,s_lname,student_c,age) 
Values
(1,"krishna","gee",10,18),
(2,"Stephen","Christ",10,17),
(3,"Kailash","kumar",10,18),
(4,"ashish","jain",10,16),
(5,"khusbu","jain",10,17),
(6,"madhan","lal",10,16),
(7,"saurab","kothari",10,15),
(8,"vinesh","roy",10,14),
(9,"rishika","r",10,15),
(10,"sara","rayan",10,16),
(11,"rosy","kumar",10,16);


Insert into marksheets(score,year,class,ranking,s_id)
VALUES 
(989,2014,10,1,1),
(454,2014,10,10,2),
(880,2014,10,4,3),
(870,2014,10,5,4),
(720,2014,10,7,5),
(670,2014,10,8,6),
(900,2014,10,3,7),
(540,2014,10,9,8),
(801,2014,10,6,9),
(420,2014,10,11,10),
(970,2014,10,2,11),
(720,2014,10,12,12);


Select s_id,s_fname
From students
Where age >= 16 
And s_lname = 'Kumar';


Select * 
From marksheets
Where score between 800 and 1000;



Select score, score + 5 AS new_score 
from marksheets;


Select * 
From marksheets 
Order by score desc;

Select *
From students
Where s_fname like "A%";



