create table Customer(
c_id int primary key,
c_name varchar(20),
c_location varchar(50),
c_phoneno int
);


create table Product(
p_code int primary key,
p_name varchar(20),
price int,
stock int,
category varchar(30)
);


create table Sales(
order_date int,
order_no varchar(20) primary key,
c_id int,
c_name varchar(30),
s_code int,
p_name varchar(30),
qty int,
price int
);



Insert into Customer(c_id,c_name,c_location,c_phoneno)
Values  
(1111,"Nisha",'kerala',8392320),
(1212,"Oliver",'kerala',4353891),
(1216,"Nila",'delhi',3323242),
(1246,"Vignesh",'chennai',1111212),
(1313,"shiny",'Maharastra',5454543),
(1910,"Mohan",'mumbai',9023941),
(2123,"Biyush",'Bombay',1253358),
(3452,"Alexander",'West Beng',1212134),
(3921,"Mukesh",'Manipur',4232121),
(5334,"Christy",'pakistan',2311111),
(9021,"Rithika",'Kashmir',1121344),
(9212,"Jessica",'banglore',1233435),
(9878,"Stephen",'chennai',1212133);


Select order_no,c_id,order_date,price,qty
from Sales;


Select*
from Product 
where category="Stationary";

Select distinct category
from Product;


Select *
from Product
Group by price
order by price desc;




