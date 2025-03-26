create database BOOK_SHOP;
use BOOK_SHOP;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Admin BOOLEAN
);

CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    CustomerID INT,
    Street VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(20),
    Country VARCHAR(100),
    AddressType VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderTable (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)
);

CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Price DECIMAL(10,2),
    Title VARCHAR(255),
    Description varchar(1000),
    StockQuantity INT
);

CREATE TABLE OrderDetail (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    BookID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255),
    Biography TEXT
);

CREATE TABLE AuthorBook (
    AuthorID INT,
    BookID INT,
    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

CREATE TABLE CategoryBook (
    CategoryID INT,
    BookID INT,
    PRIMARY KEY (CategoryID, BookID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

CREATE TABLE Discount (
    DiscountID INT PRIMARY KEY,
    DiscountCode VARCHAR(50) UNIQUE,
    Description TEXT,
    DiscountPercentage DECIMAL(5,2),
    StartDate DATE,COLLATION_CHARACTER_SET_APPLICABILITY
    EndDate DATE,
    MinimumPurchaseAmount DECIMAL(10,2)
);

CREATE TABLE BookDiscount (
    BookID INT,
    DiscountID INT,
    PRIMARY KEY (BookID, DiscountID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (DiscountID) REFERENCES Discount(DiscountID)
);
