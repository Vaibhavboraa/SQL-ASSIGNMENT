CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price int
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount int,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

 Data Manipulation Language (DML):
a. Insert at least 10 sample records into each of the following tables.
• Customers
• Products
• Orders
• OrderDetails 
• Inventory
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210', '456 Oak Ave'),
    (3, 'Bob', 'Johnson', 'bob.johnson@example.com', '5551234567', '789 Pine St'),
    (4, 'Alice', 'Williams', 'alice.williams@example.com', '7778889999', '321 Elm St'),
    (5, 'Charlie', 'Brown', 'charlie.brown@example.com', '4445556666', '654 Birch Ave'),
    (6, 'Eva', 'Miller', 'eva.miller@example.com', '111222333', '987 Cedar St'),
    (7, 'David', 'Jones', 'david.jones@example.com', '9990001111', '234 Oak St'),
    (8, 'Grace', 'Taylor', 'grace.taylor@example.com', '6667778888', '876 Maple Ave'),
    (9, 'Frank', 'White', 'frank.white@example.com', '2223334444', '543 Pine St'),
    (10, 'Olivia', 'Davis', 'olivia.davis@example.com', '3334445555', '765 Birch Ave');
	INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
    (1, 'Widget A', 'High-quality widget', 19.99),
    (2, 'Gadget B', 'Feature-rich gadget', 29.99),
    (3, 'Tool X', 'Versatile tool for various tasks', 39.99),
    (4, 'Appliance Y', 'Efficient home appliance', 49.99),
    (5, 'Accessory Z', 'Useful accessory for everyday use', 9.99),
    (6, 'Tech Gizmo', 'Cutting-edge technology gizmo', 79.99),
    (7, 'Outdoor Gear', 'Durable outdoor gear for adventures', 59.99),
    (8, 'Home Decor', 'Stylish home decor item', 14.99),
    (9, 'Kitchen Utensil', 'Essential kitchen utensil', 8.99),
    (10, 'Fitness Equipment', 'Effective fitness equipment', 99.99);
	INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-01-01', 39.98),
    (2, 2, '2023-02-01', 59.98),
    (3, 3, '2023-03-01', 79.97),
    (4, 4, '2023-04-01', 99.96),
    (5, 5, '2023-05-01', 119.95),
    (6, 6, '2023-06-01', 139.94),
    (7, 7, '2023-07-01', 159.93),
    (8, 8, '2023-08-01', 179.92),
    (9, 9, '2023-09-01', 199.91),
    (10, 10, '2023-10-01', 219.90);
	INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 1),
    (3, 2, 3, 3),
    (4, 2, 4, 1),
    (5, 3, 5, 2),
    (6, 3, 6, 1),
    (7, 4, 7, 3),
    (8, 4, 8, 1),
    (9, 5, 9, 2),
    (10, 5, 10, 1);
	INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
    (1, 1, 100, '2023-01-01 12:00:00'),
    (2, 2, 50, '2023-02-01 10:30:00'),
    (3, 3, 75, '2023-03-01 15:45:00'),
    (4, 4, 30, '2023-04-01 08:20:00'),
    (5, 5, 60, '2023-05-01 14:10:00'),
    (6, 6, 25, '2023-06-01 11:55:00'),
    (7, 7, 40, '2023-07-01 09:30:00'),
    (8, 8, 90, '2023-08-01 13:25:00'),
    (9, 9, 55, '2023-09-01 16:05:00'),
    (10, 10, 20, '2023-10-01 07:40:00');
	Write SQL queries for the following tasks: 
--1. Write an SQL query to retrieve the names and emails of all customers. 
names.
SELECT FirstName, LastName, Email
FROM Customers;

--2. Write an SQL query to list all orders with their order dates and corresponding customer 

SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--3 Write an SQL query to insert a new customer record into the "Customers" table. Include 
customer information such as name, email, and address.

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (11, 'NewFirstName', 'NewLastName', 'new.email@example.com', 'NewAddress');

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

ALTER TABLE Products
ADD Category VARCHAR(50);

UPDATE Products
SET Category = CAST(Description AS VARCHAR(50));

ALTER TABLE Products

UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Effective fitness equipment';

---5. Write an SQL query to delete a specific order and its associated order details from the 
"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

DECLARE @OrderIDToDelete INT = 1;

DELETE FROM OrderDetails WHERE OrderID = @OrderIDToDelete;
DELETE FROM Orders WHERE OrderID = @OrderIDToDelete;


----6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
order date, and any other necessary information.

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2023-01-01', 39.98)

---7. Write an SQL query to update the contact information (e.g., email and address) of a specific 
customer in the "Customers" table. Allow users to input the customer ID and new contact 
information.

DECLARE @CustomerIDToUpdate INT = 4;

UPDATE Customers
SET Email = 'new.email@example.com', Address = 'New Address'
WHERE CustomerID = @CustomerIDToUpdate;




---8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
table based on the prices and quantities in the "OrderDetails" table.

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Quantity * Products.Price)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);

---9. Write an SQL query to delete all orders and their associated order details for a specific 
customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID 
as a parameter.

DECLARE @CustomerIDToDelete INT = 5;

DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerIDToDelete);
DELETE FROM Orders WHERE CustomerID = @CustomerIDToDelete;

---10. Write an SQL query to insert a new electronic gadget product into the "Products" table, 
including product name, category, price, and any other relevant details.

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES (11, 'NewGadget', 'Cutting-edge electronic gadget', 49.99);

---11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
"Pending" to "Shipped"). Allow users to input the order ID and the new status.

ALTER TABLE Orders
ADD Status NVARCHAR(50) DEFAULT 'Pending'; 

UPDATE Orders
SET Status = 'Pending'
WHERE Status IS NULL;


DECLARE @OrderIDToUpdate INT = 2;  
DECLARE @NewStatus NVARCHAR(50) = 'Shipped'; 

---12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.

alter table CUSTOMERS add TotalOrders int
update CUSTOMERS set TotalOrders = 
(select count(OrderID) from ORDERS where CUSTOMERS.CustomerID = ORDERS.CustomerID)




---aggregate functions

---1.Write an SQL query to find out which customers have not placed any orders.

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName
FROM Customers
left JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;


---2. Write an SQL query to find the total number of products available for sale.

SELECT COUNT(*) AS TotalProducts
FROM Products;

---3. Write an SQL query to calculate the total revenue generated by TechShop. 

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

----4. Write an SQL query to calculate the average quantity ordered for products in a specific category. 
Allow users to input the category name as a parameter.

DECLARE @CategoryName NVARCHAR(50) = 'Versatile tool for various tasks';  

SELECT AVG(Quantity) AS AverageQuantity
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = @CategoryName;

Select * from Products;
select * from OrderDetails

---5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users 
to input the customer ID as a parameter.

DECLARE @CustomerID INT = 2;  

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE CustomerID = @CustomerID;

---6. Write an SQL query to find the customers who have placed the most orders. List their names 
and the number of orders theyve placed.

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, COUNT(*) AS OrderCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY OrderCount DESC;

---7. Write an SQL query to find the most popular product category, which is the one with the highest 
total quantity ordered across all orders.

SELECT  Products.Category, sum(Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Category
ORDER BY TotalQuantityOrdered DESC;

---8. Write an SQL query to find the customer who has spent the most money (highest total revenue) 
on electronic gadgets. List their name and total spending.

SELECT c.FirstName,SUM(o.TotalAmount) AS total_spending
FROM customers c
JOIN orders o ON c.customerid = o.customerid
JOIN orderdetails od ON o.orderid = od.orderid
JOIN products p ON od.productid = p.productid
WHERE p.category = 'Efficient home appliance'
GROUP BY c.customerid, c.FirstName
ORDER BY total_spending DESC;



---9. Write an SQL query to calculate the average order value (total revenue divided by the number of 
orders) for all customers.

SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

---10. Write an SQL query to find the total number of orders placed by each customer and list their 
names along with the order count.

SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
left JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

----JOINS

---1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
customer name) for each order.

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerID, Customers.FirstName, Customers.LastName
FROM Orders
JOIN 
Customers ON Orders.CustomerID = Customers.CustomerID;

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. 
Include the product name and the total revenue.

Select Products.ProductName,
SUM(OrderDetails.Quantity*Products.Price) AS total_revenue
FROM Products 
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.Category = 'Stylish home decor item' GROUP BY Products.ProductName;


---3. Write an SQL query to list all customers who have made at least one purchase. Include their 
names and contact information.

SELECT
Customers.CustomerID, Customers.FirstName,Customers.LastName
FROM Customers
JOIN
Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY
Customers.CustomerID, Customers.FirstName,Customers.LastName;


---4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
total quantity ordered. Include the product name and the total quantity ordered.

SELECT P.ProductName,
SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products AS P
JOIN
OrderDetails AS OD ON P.ProductID = OD.ProductID
WHERE
P.Category = 'Efficient home appliance'
GROUP BY P.ProductID, P.ProductName
ORDER BY
TotalQuantityOrdered DESC;



---5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
categories.

SELECT Products.ProductName,Products.Category
FROM Products where Category='Versatile tool for various tasks'



--6. Write an SQL query to calculate the average order value for each customer. Include the 
customers name and their average order value.

SELECT Customers.CustomerID,Customers.FirstName,Customers.LastName,
AVG(Orders.TotalAmount) AS average_order_value
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID,Customers.FirstName,Customers.LastName;

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, 
customer information, and the total revenue.

SELECT Orders.OrderID,Customers.CustomerID,Customers.FirstName,Customers.LastName,
SUM(Orders.TotalAmount) AS total_revenue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID,Customers.CustomerID,Customers.FirstName,Customers.LastName
ORDER BY total_revenue DESC;



---8. Write an SQL query to list electronic gadgets and the number of times each product has been 
ordered.




SELECT p.productid,p.productname,COUNT(od.orderid) AS order_count
FROM Products p
left JOIN
OrderDetails od ON p.productid = od.productid
WHERE p.category = 'Feature-rich gadget'
GROUP BY p.productid, p.productname
ORDER BY order_count DESC;





---9. Write an SQL query to find customers who have purchased a specific electronic gadget product. 
Allow users to input the product name as a parameter.

DECLARE @ProductName VARCHAR(20)= 'Tool X';
SELECT Customers.CustomerID,Customers.FirstName,Customers.LastName
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.OrderID
JOIN Products ON Orders.OrderID = Products.ProductID
WHERE Products.ProductName = @ProductName ;


---10. Write an SQL query to calculate the total revenue generated by all orders placed within a 
specific time period. Allow users to input the start and end dates as parameters.

DECLARE @StartDate DATE;
DECLARE @EndDate DATE;

SET @StartDate = '2023-01-01'; 
SET @EndDate = '2023-12-31';  

SELECT SUM(TotalAmount) AS total_revenue
FROM Orders
WHERE OrderDate BETWEEN @StartDate AND @EndDate;





















