
CREATE TABLE Publication (
PubID INT,
Publisher  VARCHAR(50)  CHECK(Publisher <> ''),
Year INT CHECK(Year <= YEAR(GETDATE())), -- we won't anticipate future publications
PRIMARY KEY(PubID)
);


CREATE TABLE Books(
PubID INT,
Title VARCHAR(50)  CHECK(Title <> ''),
PRIMARY KEY(PubID),
FOREIGN KEY(PubID) REFERENCES Publication(PubID)
ON DELETE CASCADE
ON UPDATE CASCADE
);


CREATE TABLE Magazines(
PubID INT,
Title VARCHAR(50) CHECK(Title <> ''),
Issue INT CHECK(Issue > 0),
PRIMARY KEY(PubID),
FOREIGN KEY(PubID) REFERENCES Publication(PubID)
ON DELETE CASCADE
ON UPDATE CASCADE
);


CREATE TABLE Employees (
EmployeeID INT,
Name VARCHAR(50)  CHECK(Name <> ''),
Salary FLOAT CHECK(Salary >= 0),
PRIMARY KEY(EmployeeID)
);

CREATE TABLE Bookstore(
BookstoreID INT,
PRIMARY KEY(BookstoreID)
);

CREATE TABLE Stocks_In_Bookstore(
StockID INT,
Stock_Price FLOAT CHECK(Stock_Price >= 0),
Stock_Qty INT CHECK(Stock_Qty >= 0),
PubID INT,
BookstoreID INT,
PRIMARY KEY(StockID),
FOREIGN KEY(BookstoreID) REFERENCES Bookstore(BookstoreID),
FOREIGN KEY(PubID) REFERENCES Publication(PubID)
ON DELETE CASCADE
ON UPDATE CASCADE,
--- Doesn't make sense for the same publication to be selling at the 
--- same bookstore mutiple times (we have stock_qty for that)
CONSTRAINT UNQ_PAIR UNIQUE (PubID, BookstoreID)
);


CREATE TABLE Price_History(
StockID INT,
Price REAL CHECK(Price >= 0),
 --  we won't add/anticipate future prices of a stock
Start_date DATE CHECK(Start_date <= GETDATE()),
End_date DATE,
PRIMARY KEY(StockID, Price, Start_Date, End_Date),
FOREIGN KEY(StockID) REFERENCES Stocks_In_Bookstore(StockID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CHECK(End_date >= Start_date)
);

CREATE TABLE Customers(
CustomerID INT,
Name VARCHAR(50) CHECK(Name <> ''),
PRIMARY KEY(CustomerID)
);


CREATE TABLE Orders(
OrderID INT,
CustomerID INT,
Order_Date_time DATETIME,
Shipping_address VARCHAR(150) CHECK(Shipping_address <> ''),
Shipping_cost FLOAT CHECK(Shipping_cost >= 0),
PRIMARY KEY(OrderID),
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Items_In_Order(
ItemID INT,  
StockID INT, 
OrderID INT, 
Item_Price REAL CHECK(Item_Price >= 0),
-- a customer shouldn't be allowed to buy zero amount of an item
Item_Qty INT CHECK(Item_Qty >= 1),
Delivery_date DATE, 
Feedback_Date_Time DATETIME,
Feedback_Comment Varchar(150), 
-- rating is between 1 and 5 (inclusive)
Feedback_Rating INT Check(Feedback_Rating >= 1 AND Feedback_Rating <= 5), 
PRIMARY KEY(ItemID),
FOREIGN KEY(StockID) REFERENCES Stocks_In_Bookstore(StockID),
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
ON DELETE CASCADE
ON UPDATE CASCADE,
-- a customer should only be able to give feedback after he/she has received the item
CHECK(Feedback_Date_Time >= Delivery_date)
); 


CREATE TABLE Items_In_Order_Status(
Date DATE,
ItemID INT,
-- Possible States:
-- "Being Processed"
-- "Shipped"
-- "Delivered"
-- "Returned"
State VARCHAR(50) CHECK(State <> ''),
PRIMARY KEY(Date, ItemID),
FOREIGN KEY (ItemID) REFERENCES Items_In_Order(ItemID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Complaints(
ComplaintID INT,
CustomerID INT,
Text VARCHAR(150) CHECK(Text <> ''),
Filed_Date_Time DATETIME NOT NULL,
EmployeeID INT,
Handled_Date_Time DATETIME,
PRIMARY KEY(ComplaintID),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
ON DELETE CASCADE
ON UPDATE CASCADE,
-- the complaint should only be handled after it has been filed
CHECK(Handled_Date_Time >= Filed_Date_Time)
);

CREATE TABLE Complaints_On_Order(
ComplaintID INT,
OrderID INT,
PRIMARY KEY(ComplaintID),
FOREIGN KEY(ComplaintID) REFERENCES Complaints(ComplaintID),
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Complaints_On_Bookstore(
ComplaintID INT, 
BookstoreID INT,
PRIMARY KEY(ComplaintID),
FOREIGN KEY(ComplaintID) REFERENCES Complaints(ComplaintID),
FOREIGN KEY(BookstoreID) REFERENCES Bookstore(BookstoreID)
ON DELETE CASCADE
ON UPDATE CASCADE
);


CREATE TABLE Complaints_Status(
ComplaintID INT, 
Date DATE,
-- Posssible States:
-- "Pending"
-- "Addressed"
State VARCHAR(50) CHECK(State <> ''),
PRIMARY KEY(ComplaintID, Date),
FOREIGN KEY(ComplaintID) REFERENCES Complaints(ComplaintID)
ON DELETE CASCADE
ON UPDATE CASCADE
);