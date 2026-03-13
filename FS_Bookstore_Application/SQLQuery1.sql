-- creating database
CREATE DATABASE BookStoreDB
-- using database
USE BookStoreDB

-- creating tables
-- 1. Users
CREATE TABLE Users(
	UserId INT PRIMARY KEY IDENTITY(1,1),
	FullName VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Password VARCHAR(20) NOT NULL,
	CreatedAt DATETIME DEFAULT GETDATE()
)
SELECT * FROM Users;
-- 2. Books
CREATE TABLE Books(
	BookId INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(30) NOT NULL,
	Author VARCHAR(30) NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Stock INT NOT NULL
)
-- inserting some dummy data into books table
INSERT INTO Books (Title, Author, Price, Stock)
VALUES
('C# Basics', 'John Doe', 499, 10),
('ASP.NET WebForms', 'Jane Smith', 699, 15);


-- adding cart table
CREATE TABLE Cart(
	CartId INT PRIMARY KEY IDENTITY(1,1),
	UserId INT NOT NULL,
	BookId INT NOT NULL,
	Quantity INT NOT NULL DEFAULT 1,
	AddedAt DATETIME DEFAULT GETDATE(),

	FOREIGN KEY (UserId) REFERENCES Users(UserId),
	FOREIGN KEY (BookId) REFERENCES Books(BookId)
)

select * from Cart