
Create table Products( 
product_id int,
product_name varchar(20),
category varchar(25)
);

Insert into Products(product_id,product_name,category)
VALUES 
('1','Latop','Electronics'),
('2','Smartphone','Electronics'),
('3','Coffee Maker','Appliances'),
('4','Running Shoes','Apparel')
;


Create table Sales( 
sale_id int ,
product_id int,
sale_date int,
quantity_sold int 
);

INSERT INTO Sales (sale_id, product_id, sale_date, quantity_sold)
VALUES
(1, 1, '2023-01-05', 10),
(2, 2, '2023-01-10', 15),
(3, 3, '2023-01-15', 8),
(4, 4, '2023-01-20', 12),
(5, 1, '2023-02-05', 14),
(6, 2, '2023-02-12', 18),
(7, 3, '2023-02-18', 9),
(8, 4, '2023-02-25', 16),
(9, 1, '2023-03-06', 20),
(10, 2, '2023-03-11', 22),
(11, 3, '2023-03-16', 13),
(12, 4, '2023-03-24', 18),
(13, 1, '2023-04-05', 16),
(14, 2, '2023-04-10', 24),
(15, 3, '2023-04-18', 11),
(16, 4, '2023-04-28', 19),
(17, 1, '2023-05-07', 21),
(18, 2, '2023-05-12', 28),
(19, 3, '2023-05-19', 15),
(20, 4, '2023-05-26', 22),
(21, 1, '2023-06-04', 18),
(22, 2, '2023-06-13', 26),
(23, 3, '2023-06-21', 14),
(24, 4, '2023-06-29', 20),
(25, 1, '2024-01-06', 24),
(26, 2, '2024-01-11', 30),
(27, 3, '2024-01-17', 16),
(28, 4, '2024-01-23', 25),
(29, 1, '2024-02-04', 26),
(30, 2, '2024-02-09', 32),
(31, 3, '2024-02-15', 18),
(32, 4, '2024-02-21', 27),
(33, 1, '2024-03-03', 28),
(34, 2, '2024-03-10', 35),
(35, 3, '2024-03-18', 20),
(36, 4, '2024-03-26', 29),
(37, 1, '2024-04-05', 25),
(38, 2, '2024-04-13', 34),
(39, 3, '2024-04-19', 19),
(40, 4, '2024-04-27', 31),
(41, 1, '2024-05-06', 30),
(42, 2, '2024-05-14', 38),
(43, 3, '2024-05-20', 22),
(44, 4, '2024-05-29', 33),
(45, 1, '2024-06-04', 27),
(46, 2, '2024-06-12', 36),
(47, 3, '2024-06-18', 21),
(48, 4, '2024-06-25', 32),
(49, 1, '2024-06-28', 29),
(50, 2, '2024-06-30', 40);


SELECT 
    product_id,
    sale_date,
    quantity_sold ,
    SUM(quantity_sold) OVER (PARTITION BY product_id) AS total_product_sales
FROM Sales ;





WITH monthly_sales AS (
    SELECT 
        SUBSTR(sale_date, 1, 7) AS sales_month,
        SUM(quantity_sold ) AS monthly_total
    FROM sales
    GROUP BY SUBSTR(sale_date, 1, 7)
)
SELECT 
    sales_month,
    monthly_total,
    SUM(monthly_total) OVER (
        ORDER BY sales_month 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_sales
FROM monthly_sales
ORDER BY sales_month;




WITH RankedProducts AS (
    SELECT 
        p.product_id,
        p.product_name,
        SUM(quantity_sold ) AS total_sales,
        RANK() OVER (ORDER BY SUM(quantity_sold) DESC) AS sales_rank
    FROM 
        products p
    INNER JOIN 
        sales s ON p.product_id = s.product_id
    GROUP BY 
        p.product_id, 
        p.product_name
)
SELECT 
    product_id,
    product_name,
    total_sales,
    sales_rank
FROM 
    RankedProducts
WHERE 
    'sales_rank <= :N';

