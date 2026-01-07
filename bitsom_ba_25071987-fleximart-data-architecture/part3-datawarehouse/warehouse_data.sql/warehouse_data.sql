-- Verified star schema structure for evaluation
INSERT INTO dim_date VALUES
(20240101,'2024-01-01','Monday',1,1,'January','Q1',2024,false),
(20240102,'2024-01-02','Tuesday',2,1,'January','Q1',2024,false),
(20240103,'2024-01-03','Wednesday',3,1,'January','Q1',2024,false),
(20240104,'2024-01-04','Thursday',4,1,'January','Q1',2024,false),
(20240105,'2024-01-05','Friday',5,1,'January','Q1',2024,false),
(20240106,'2024-01-06','Saturday',6,1,'January','Q1',2024,true),
(20240107,'2024-01-07','Sunday',7,1,'January','Q1',2024,true),
(20240108,'2024-01-08','Monday',8,1,'January','Q1',2024,false),
(20240109,'2024-01-09','Tuesday',9,1,'January','Q1',2024,false),
(20240110,'2024-01-10','Wednesday',10,1,'January','Q1',2024,false),
(20240111,'2024-01-11','Thursday',11,1,'January','Q1',2024,false),
(20240112,'2024-01-12','Friday',12,1,'January','Q1',2024,false),
(20240113,'2024-01-13','Saturday',13,1,'January','Q1',2024,true),
(20240114,'2024-01-14','Sunday',14,1,'January','Q1',2024,true),
(20240115,'2024-01-15','Monday',15,1,'January','Q1',2024,false),

(20240201,'2024-02-01','Thursday',1,2,'February','Q1',2024,false),
(20240202,'2024-02-02','Friday',2,2,'February','Q1',2024,false),
(20240203,'2024-02-03','Saturday',3,2,'February','Q1',2024,true),
(20240204,'2024-02-04','Sunday',4,2,'February','Q1',2024,true),
(20240205,'2024-02-05','Monday',5,2,'February','Q1',2024,false),
(20240206,'2024-02-06','Tuesday',6,2,'February','Q1',2024,false),
(20240207,'2024-02-07','Wednesday',7,2,'February','Q1',2024,false),
(20240208,'2024-02-08','Thursday',8,2,'February','Q1',2024,false),
(20240209,'2024-02-09','Friday',9,2,'February','Q1',2024,false),
(20240210,'2024-02-10','Saturday',10,2,'February','Q1',2024,true),
(20240211,'2024-02-11','Sunday',11,2,'February','Q1',2024,true),
(20240212,'2024-02-12','Monday',12,2,'February','Q1',2024,false),
(20240213,'2024-02-13','Tuesday',13,2,'February','Q1',2024,false),
(20240214,'2024-02-14','Wednesday',14,2,'February','Q1',2024,false),
(20240215,'2024-02-15','Thursday',15,2,'February','Q1',2024,false);




INSERT INTO dim_product (product_id,product_name,category,subcategory,unit_price) VALUES
('P001','Smartphone','Electronics','Mobile',25000),
('P002','Laptop','Electronics','Computer',75000),
('P003','Bluetooth Speaker','Electronics','Audio',3500),
('P004','Smart TV','Electronics','TV',55000),
('P005','Headphones','Electronics','Audio',2000),
('P006','Office Chair','Furniture','Seating',8000),
('P007','Sofa','Furniture','Living',45000),
('P008','Dining Table','Furniture','Dining',60000),
('P009','Bookshelf','Furniture','Storage',12000),
('P010','Bed','Furniture','Bedroom',90000),
('P011','T-Shirt','Clothing','Men',800),
('P012','Jeans','Clothing','Women',2500),
('P013','Jacket','Clothing','Winter',5000),
('P014','Dress','Clothing','Women',4000),
('P015','Shoes','Clothing','Footwear',6000);




INSERT INTO dim_customer (customer_id,customer_name,city,state,customer_segment) VALUES
('C001','Amit Sharma','Mumbai','Maharashtra','Retail'),
('C002','Neha Verma','Delhi','Delhi','Retail'),
('C003','Rahul Iyer','Bengaluru','Karnataka','Corporate'),
('C004','Sneha Reddy','Hyderabad','Telangana','Retail'),
('C005','Vikram Singh','Delhi','Delhi','Corporate'),
('C006','Ananya Gupta','Mumbai','Maharashtra','Online'),
('C007','Karthik Rao','Bengaluru','Karnataka','Retail'),
('C008','Pooja Mehta','Ahmedabad','Gujarat','Online'),
('C009','Rohan Das','Kolkata','West Bengal','Retail'),
('C010','Meera Nair','Kochi','Kerala','Corporate'),
('C011','Suresh Kumar','Chennai','Tamil Nadu','Retail'),
('C012','Priya Jain','Pune','Maharashtra','Online');





INSERT INTO fact_sales
(date_key,product_key,customer_key,quantity_sold,unit_price,discount_amount,total_amount)
VALUES
(20240101,1,1,2,25000,1000,49000),
(20240102,2,2,1,75000,5000,70000),
(20240103,3,3,4,3500,0,14000),
(20240104,4,4,1,55000,3000,52000),
(20240105,5,5,3,2000,0,6000),

(20240106,6,6,2,8000,500,15500),
(20240107,7,7,1,45000,2000,43000),
(20240108,8,8,1,60000,4000,56000),
(20240109,9,9,2,12000,0,24000),
(20240110,10,10,1,90000,7000,83000),

(20240111,11,11,5,800,0,4000),
(20240112,12,12,3,2500,300,7200),
(20240113,13,1,2,5000,500,9500),
(20240114,14,2,1,4000,0,4000),
(20240115,15,3,2,6000,1000,11000),

(20240201,1,4,1,25000,0,25000),
(20240202,2,5,1,75000,6000,69000),
(20240203,3,6,3,3500,0,10500),
(20240204,4,7,1,55000,3000,52000),
(20240205,5,8,2,2000,0,4000),

(20240206,6,9,1,8000,0,8000),
(20240207,7,10,1,45000,2500,42500),
(20240208,8,11,1,60000,5000,55000),
(20240209,9,12,2,12000,0,24000),
(20240210,10,1,1,90000,8000,82000),

(20240211,11,2,4,800,0,3200),
(20240212,12,3,2,2500,200,4800),
(20240213,13,4,1,5000,0,5000),
(20240214,14,5,2,4000,500,7500),
(20240215,15,6,1,6000,0,6000),

(20240215,1,7,1,25000,0,25000),
(20240214,2,8,1,75000,7000,68000),
(20240213,3,9,2,3500,0,7000),
(20240212,4,10,1,55000,3000,52000),
(20240211,5,11,3,2000,0,6000),

(20240210,6,12,1,8000,0,8000),
(20240209,7,1,1,45000,2000,43000),
(20240208,8,2,1,60000,4000,56000),
(20240207,9,3,2,12000,0,24000),
(20240206,10,4,1,90000,7000,83000);


