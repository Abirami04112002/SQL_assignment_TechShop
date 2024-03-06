--Assignment no:1
--Task 1
--1.Create the database named "TechShop"
create database Techshop
--2.Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables 
--based on the provided schema.--4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.
create table Customer(
Customer_id int primary key,
First_name varchar(50),
Last_name varchar(50),
email varchar(100),
address_customer varchar(255),
mobile_no varchar(20));
EXEC sp_rename 'Customer','Customers'
alter table customers 
add NoOfOrdersPlaced int

create table Products(
Product_id int primary key,
Product_name varchar(100),
Description_P Text,
Price int not null);

create table Orders(
Order_id int primary key,
Customer_id int,
Order_date varchar(50),
Total_amt varchar(100),
foreign key(Customer_id) references Customers(Customer_id) );
alter table Orders
add Total_amt Decimal(10,2) 
 alter table Orders
 add OrderDate date


create table Orderdetails(
Orderdetails_id int primary key,
Order_id int not null,
Product_id int not null,
Quantity int not null,
foreign key(Order_id) references Orders(Order_id),
foreign key(Product_id) references Products(Product_id));

create table Inventory(
Inventor_id int primary key not null,
Product_id int not null,
Quantity_in_stock int,
last_stock_update date,
foreign key(Product_id) references Products(Product_id));


/*5. Insert at least 10 sample records into each of the following tables.
a. Customers
b. Products
c. Orders
d. OrderDetails*/

insert into Customers values(1,'Abirami','S','abi@gmail.com','lawspet,Pondicherry','7540056662')
insert into Customers values(2,'Aruljayasrija','A','srija@gmail.com','bus stand,Pondicherry','9790576043')
insert into Customers values(3,'Hemma','P S','pshema@gmail.com','Nainarmandabam,Pondicherry','934504771')
insert into Customers values(4,'Keerthana','M','mkdoss@gmail.com','Mudhaliarpet,Pondicherry','6374144021')
insert into Customers values(5,'Saanchitaasri','k','saanchi@gmail.com','White town,Pondicherry','9944615832')
insert into Customers values(6,'Shwetha','S','shwe@gmail.com','Mudhaliarpet,Pondicherry','7397661877')
insert into Customers values(7,'Pravin','R','pravin@gmail.com','lawspet,Pondicherry','9345898335')
insert into Customers values(8,'Yogesh','S N','yogesh@gmail.com','Ginger hotel,Pondicherry','6381591854')
insert into Customers values(9,'Vijaysaarathy','J','vii@gmail.com','Mudhaliarpet,Pondicherry','9003472982')
insert into Customers values(10,'Lirisha','S','lirish@gmail.com','lawspet,Pondicherry','6385811047')
select * from Customers
update Customers set mobile_no=9345304771 where Customer_id=3

insert into Products values(100,'Mouse','IPS:>200,Acc>20G,Polling rate>500hz',129)
insert into Products values(101,'Apple Airpods Max','Adaptive audio, Active Noise Cancellation',24900)
insert into Products values(102,'Laptop','16Gb RAM, core i9, top-end SSD Storage unit',60000)
insert into Products values(103,'Speaker','Frequency response: 40Hz-25KHz, greater sound',17401)
insert into Products values(104,'Microphone','good Amplification',1500)
insert into Products values(105,'Projector','True 4K, Projection dis: 13.7-23.5inches, Manual Focuse Adjustment',33200)
insert into Products values(106,'Wireless Keyboard','Durable material with good Battery life',1999)
insert into Products values(107,'Headphones','Noise Cancellation upto 25%-50%',8990)
insert into Products values(108,'Smartwatch','high sensitivity sensors and monitors',1499)
insert into Products values(109,'SmartPhone','Processor and 2Gb RAM, 16Gb ROM, upto 20Gbps 5G tech',24670)
Select * from Products

insert into Orders values(1000,2,'2024-11-02',33200)
insert into Orders values(1001,4,'2023-07-21',34802)
insert into Orders values(1002,9,'2024-06-08',129)
insert into Orders values(1003,10,'2023-01-14',1999)
insert into Orders values(1004,1,'2024-02-25',129)
insert into Orders values(1005,2,'2022-04-06',24900)
insert into Orders values(1006,3,'2024-12-17',17980)
insert into Orders values(1007,5,'2022-08-10',1499)
insert into Orders values(1008,6,'2024-01-28',33200)
insert into Orders values(1009,7,'2023-09-04',60000)
Select * from Orders

insert into Orderdetails values(10,1000,105,1)
insert into Orderdetails values(11,1001,103,2)
insert into Orderdetails values(12,1002,100,1)
insert into Orderdetails values(13,1003,106,1)
insert into Orderdetails values(14,1004,100,1)
insert into Orderdetails values(15,1005,101,1)
insert into Orderdetails values(16,1006,107,2)
insert into Orderdetails values(17,1007,108,1)
insert into Orderdetails values(18,1008,105,1)
insert into Orderdetails values(19,1009,102,1)
select * from Orderdetails

insert into Inventory values(00,100,100,'2024-01-24')
insert into Inventory values(01,101,65,'2023-12-05')
insert into Inventory values(02,102,87,'2023-11-28')
insert into Inventory values(03,103,50,'2023-12-07')
insert into Inventory values(04,104,150,'2023-12-07')
insert into Inventory values(05,105,162,'2024-02-08')
insert into Inventory values(06,106,75,'2023-12-24')
insert into Inventory values(07,107,59,'2023-12-26')
insert into Inventory values(08,108,36,'2024-01-16')
insert into Inventory values(09,109,94,'2023-11-04')
select * from Inventory

 insert into Orderdetails values (20,1010,106,1)
  insert into Orders values(1011,5,'2023-06-26',141,'Shipped')
  insert into Orderdetails values (21,1011,100,1)
  update Orders set Total_amt= 9889  where Total_amt=19778

--##Tasks 2: Select, Where, Between, AND, LIKE:

--1. Write an SQL query to retrieve the names and emails of all customers.

select First_name,Last_name,email from Customers

/*2. Write an SQL query to list all orders with their order dates and corresponding customer 
names.*/

SELECT  Orders.Order_id, Orders.OrderDate, Customers.First_name, Customers.last_name FROM Orders
JOIN Customers ON Orders.Customer_id = Customers.Customer_id;

/*3. Write an SQL query to insert a new customer record into the "Customers" table. Include 
customer information such as name, email, and address.*/

insert into Customers values(11,'Shalin','babu','shalin@gmail.com','Villianur,Puducherry',null)
select * from Customers

/*4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by 
increasing them by 10%.*/

update Products set Price=ceiling(Price+(Price*10/100))
select * from Products

/*5. Write an SQL query to delete a specific order and its associated order details from the 
"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.*/

declare @orderId int =1005
delete from Orders where(Order_id=@orderId)
select * from Orders
select* from Orderdetails

/*6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
order date, and any other necessary information.*/

insert into Orders values(1010,5,'2024-02-27',1999)
select* from Orders

/*7. Write an SQL query to update the contact information (e.g., email and address) of a specific 
customer in the "Customers" table. Allow users to input the customer ID and new contact 
information.*/

declare @customerId int =8
declare @newMail varchar(20)='yoge@gmail.com'
declare @newAddress varchar(50)='Ginger hotel, Pondicherry'
update Customers 
set  email= @newMail, address_customer= @newAddress 
where customer_id=@customerId;
select* from Customers

/*8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
table based on the prices and quantities in the "OrderDetails" table.*/

update Orders set 
Total_amt= (select Products.Price*Orderdetails.Quantity from Orderdetails
join Products
on Orderdetails.Product_id=Products.Product_id
where Orderdetails.Order_id=Orders.Order_id);

/*9. Write an SQL query to delete all orders and their associated order details for a specific 
customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID 
as a parameter.*/

declare @customer int=5
delete from Orders where (Customer_id =@customer);
select * from Orders
select * from Orderdetails
Select* from Customers

/*10. Write an SQL query to insert a new electronic gadget product into the "Products" table, 
including product name, category, price, and any other relevant details.*/

select * from Products
INSERT into Products values(11,'Modem','16×4 modem, download speed is at least 100Mbps, and a good upload speed is at least 10 Mbps',2819)
update Products set Product_id=110 where Product_id=11

/*11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
"Pending" to "Shipped"). Allow users to input the order ID and the new status.*/

select * from Orders
update Orders set StatusOfOrder = 'Pending' 

declare @order_Id int=1003
declare @Status varchar(10)='Shipped'
update Orders set StatusOfOrder=@Status where Order_id=@order_Id

/*12. Write an SQL query to calculate and update the number of orders placed by each customer 
in the "Customers" table based on the data in the "Orders" table.*/


insert into Orders values(1010,'10','2023-12.05',2198,'pending')
update Customers set NoOfOrdersPlaced = subquery.total_orders
FROM Customers
join (Select customer_id, Count(*) AS total_orders FROM Orders group by customer_id) AS subquery
ON Customers.customer_id = subquery.customer_id;


--##Task 3  Aggregate functions, Having, Order By, GroupBy and Joins

/*1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
customer name) for each order.*/

Select * from Orders
full outer join Customers
on Orders.Customer_id=Customers.Customer_id
order by First_name 

/*2. Write an SQL query to find the total revenue generated by each electronic gadget product. 
Include the product name and the total revenue*/

select Products.Product_name,(Products.Price*Orderdetails.Quantity)as total_revenue from Products
join Orderdetails
on Products.Product_id=Orderdetails.Product_id

/*3. Write an SQL query to list all customers who have made at least one purchase. Include their 
names and contact information.*/

select Customer_id,First_name,email,address_customer from Customers where NoOfOrdersPlaced>=1

/*4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
total quantity ordered. Include the product name and the total quantity ordered.*/
 
  alter table Products
  add TotalQuantityOrdered int

  select count(*) as total_orders,Product_id from Orderdetails
  group by Product_id
  Select *from Products
  select Product_name,TotalQuantityOrdered from Products
  group by Product_name,TotalQuantityOrdered
  having TotalQuantityOrdered= (select max(TotalQuantityOrdered) from Products)
 

  /*5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
categories.*/

alter table Products
add Categories Varchar(50)

Select*from Products

select Product_name,Categories from Products
group by Product_name,Categories
order by Product_name

/*6. Write an SQL query to calculate the average order value for each customer. Include the 
customer's name and their average order value*/

SELECT Customers.First_name, AVG(Orders.Total_amt) AS average_order_value
FROM Customers
JOIN Orders  ON Customers.customer_id = Orders.Customer_id
GROUP BY Customers.Customer_id,Customers.First_name;

/*7. Write an SQL query to find the order with the highest total revenue. Include the order ID, 
customer information, and the total revenue*/

select Customers.First_name,Customers.address_customer,Customers.mobile_no,Customers.email, Orders.Order_id,
Orders.Total_amt from Customers
join Orders
on Customers.Customer_id=Orders.Customer_id
where Orders.Total_amt=(select Max(Orders.Total_amt) from Orders) 

/*8. Write an SQL query to list electronic gadgets and the number of times each product has been 
ordered.*/
select Products.Product_name, Count(Orderdetails.Product_id) AS TotalQuantity_ordered  
 from Products 
join Orderdetails
on Products.Product_id=Orderdetails.Product_id 
group by Product_name,Products.Product_id
order by TotalQuantity_ordered desc

/*9. Write an SQL query to find customers who have purchased a specific electronic gadget product. 
Allow users to input the product name as a parameter.*/

declare @ProductName varchar(50)='Mouse'
select Customers.First_name,Customers.Last_name from Customers
join Orders
on Customers.Customer_id=Orders.Customer_id
join Orderdetails
on Orders.Order_id=Orderdetails.Order_id
join Products
on Orderdetails.Product_id=Products.Product_id
where Products.Product_name=@ProductName

/*10. Write an SQL query to calculate the total revenue generated by all orders placed within a 
specific time period. Allow users to input the start and end dates as parameters.*/

declare @startdate date='2020-01-01'
Declare @enddate date='2023-02-01'

select sum(Total_amt) as total_revenue_for_specific_time from Orders
where OrderDate between @startdate and @enddate

select*from Orders

--##Task 4  Subquery and its type

/*1. Write an SQL query to find out which customers have not placed any orders.*/

select*from Customers
select * from Customers where Customer_id not in (select distinct Customer_id from Orders )

/*2. Write an SQL query to find the total number of products available for sale.*/

Select*from Inventory
select*from Products
select * from (select Count(Product_id)as Product_id from Inventory where Quantity_in_stock>0) as TotalProduct

/*3. Write an SQL query to calculate the total revenue generated by TechShop.*/

Select sum(Total_amt) from Orders

/*4. Write an SQL query to calculate the average quantity ordered for products in a specific category. 
Allow users to input the category name as a parameter.*/

declare @category varchar(50)= 'Computer elecronics'
select AVG(Orderdetails.Quantity) AS AverageQuantityOrdered, Products.Categories FROM OrderDetails 
join Products  ON Orderdetails.Product_id = Products.Product_id WHERE Products.Categories = @category
GROUP BY Products.Categories

/*5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users 
to input the customer ID as a parameter.*/

select*from Customers
declare @CustId int=10
select sum(Orders.Total_amt) as totalRevenue from Orders where Customer_id=@CustId--10

/*6. Write an SQL query to find the customers who have placed the most orders. List their names 
and the number of orders they've placed.*/

select * from Customers where NoOfOrdersPlaced=(select Max(NoOfOrdersPlaced) from Customers)

/*7. Write an SQL query to find the most popular product category, which is the one with the highest 
total quantity ordered across all orders.*/
select*from Products
select Categories from Products where  TotalQuantityOrdered= (select MAx(TotalQuantityOrdered)  from Products)

/*8. Write an SQL query to find the customer who has spent the most money (highest total revenue) 
on electronic gadgets. List their name and total spending.*/

Select * from Customers 
join Orders
on Customers.Customer_id=Orders.Customer_id where Orders.Total_amt=any(select Max(sub1.Total_revenue) as MAxVAlue
from (select sum(Total_amt) as Total_revenue,Customer_id from Orders
group by Customer_id) as sub1)

/*9. Write an SQL query to calculate the average order value (total revenue divided by the number of 
orders) for all customers*/

select Customers.Customer_id,Customers.First_name,(sub1.Total/Customers.NoOfOrdersPlaced) as Average
from Customers 
join
(Select sum(Orders.Total_amt) as Total,Customer_id from Orders group by Customer_id) as sub1
on Customers.Customer_id=sub1.Customer_id
where Customers.Customer_id in(Select Customer_id from Orders group by Customer_id)

/*10. Write an SQL query to find the total number of orders placed by each customer and list their 
names along with the order count.
*/
Select Customers.Customer_id as CustomerId,
Customers.First_name as Customer, sub1.TotalOrder From Customers
join
(select count(Orders.Customer_id) as TotalOrder,Customer_id from Orders group by Customer_id) as sub1
on Customers.Customer_id=sub1.Customer_id
where Customers.Customer_id in (select Customer_id from Orders group by Customer_id)



