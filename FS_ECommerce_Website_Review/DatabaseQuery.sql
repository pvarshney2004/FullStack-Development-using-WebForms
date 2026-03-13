-- creating a database for ECommerce website
CREATE DATABASE ECommerce_DB;
-- using database
USE ECommerce_DB

--  creating database tables
CREATE TABLE Users(
	UserId INT PRIMARY KEY IDENTITY(1,1),
	FullName VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Password VARCHAR(20) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE()
)

-- after adding data from visual code by ADO.net, verifying that data is added or not
SELECT * FROM Users --verified

-- creating categories table
CREATE TABLE Categories(
	CategoryId INT PRIMARY KEY IDENTITY(1,1),
	CategoryName VARCHAR(20)
)
INSERT INTO Categories VALUES ('Men'), ('Women'), ('Kids')
SELECT * FROM Categories


-- creating products table
CREATE TABLE Products(
	ProductId INT PRIMARY KEY IDENTITY(1,1),
	ProductName VARCHAR(30) NOT NULL,
	Description VARCHAR(50) NOT NULL,
	Price INT NOT NULL,
	Stock INT NOT NULL,
	CategoryId INT,
	FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
)

--inserting dummy product data
INSERT INTO Products (ProductName, Description, Price, Stock, CategoryId) VALUES

-- MEN (with CategoryId = 1)
('Men T-Shirt Blue', 'Cotton round neck t-shirt', 799, 50, 1),
('Men Jeans Slim Fit', 'Blue slim fit denim jeans', 1599, 40, 1),
('Men Casual Shirt', 'Full sleeve cotton shirt', 1299, 35, 1),
('Men Hoodie Black', 'Winter fleece hoodie', 1999, 25, 1),
('Men Formal Blazer', 'Slim fit office blazer', 3499, 15, 1),

-- WOMEN (with CategoryId = 2)
('Women Kurti Floral', 'Printed ethnic kurti', 999, 45, 2),
('Women Top White', 'Stylish summer top', 699, 60, 2),
('Women Jeans High Waist', 'Stretchable denim jeans', 1499, 30, 2),
('Women Saree Silk', 'Traditional silk saree', 2999, 20, 2),
('Women Jacket Pink', 'Winter padded jacket', 2499, 18, 2),

-- KIDS (with CategoryId = 3)
('Kids T-Shirt Cartoon', 'Cartoon printed t-shirt', 499, 70, 3),
('Kids Shorts Cotton', 'Comfortable cotton shorts', 399, 65, 3),
('Kids Hoodie Yellow', 'Warm hoodie for kids', 899, 40, 3),
('Kids Frock Partywear', 'Designer party frock', 1199, 25, 3),
('Kids Track Suit', 'Sports track suit set', 1499, 20, 3);

SELECT * FROM Products


--creating cart table
CREATE TABLE Cart(
	CartId INT PRIMARY KEY IDENTITY(1,1),
	UserId INT NOT NULL,
	ProductId INT NOT NULL,
	Quantity INT NOT NULL DEFAULT 1,
	FOREIGN KEY (UserId) REFERENCES Users(UserId),
	FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
)

--CHECKING items added or not in the cart
SELECT * FROM Cart


-- creating order table
CREATE TABLE Orders(
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount INT NOT NULL,
    Status VARCHAR(20) DEFAULT 'Placed',
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
)
SELECT * FROM Orders

--creating ordeer details table
CREATE TABLE OrderDetails(
    OrderDetailId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    Price INT NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
)

select * from OrderDetails
