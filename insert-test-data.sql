DELETE FROM Items_In_Order_Status;
DELETE FROM Price_History;
DELETE FROM Items_In_Order;
DELETE FROM Stocks_In_Bookstore;
DELETE FROM Complaints_On_Bookstore;
DELETE FROM Complaints_On_Order;
DELETE FROM Orders;
DELETE FROM Complaints_Status;
DELETE FROM Complaints;
DELETE FROM Customers;
DELETE FROM Bookstore;
DELETE FROM Employees;
DELETE FROM Books;
DELETE FROM Magazines;
DELETE FROM Publication;

-- Publication test data insertion
INSERT INTO Publication
VALUES
	(1, 'p_a', 2001),
	(2, 'p_b', 2002),
	(3, 'p_c', 2003),
	(4, 'Nanyang Publisher Company', 2004),
	(5, 'Nanyang Publisher Company', 2004),
	(6, 'Nanyang Publisher Company', 2004);


-- Magazines test data insertion
INSERT INTO Magazines
VALUES
	(2, 'm_a', 1),
	(3, 'm_b', 2),
	(6, 'm_c', 3);


-- Books test data insertion
INSERT INTO Books
VALUES
	(1, 'Harry Porter Finale'),
	(4, 'b_a'),
	(5, 'b_b');

-- Employees test data insertion
INSERT INTO Employees
VALUES
	(1, 'e_a' , 1000),
	(2, 'e_b' , 2000),
	(3, 'e_c' , 1000),
	(4, 'e_d' , 4000);


-- Bookstore test data insertion
INSERT INTO Bookstore
VALUES
	(1),
	(2),
	(3),
	(4);


-- Customers test data insertion
INSERT INTO Customers
VALUES
	(1, 'c_a'),
	(2, 'c_b'),
	(3, 'c_c'),
	(4, 'c_d');


INSERT INTO Complaints(ComplaintID, CustomerID, Text, Filed_Date_Time, EmployeeID, Handled_Date_Time)
VALUES
	(1, 1, 'text_a', '2021-05-14', 1, '2021-08-08'),
	(2, 2, 'text_b', '2021-06-10', 3, '2021-07-18'),
	(3, 3, 'text_c', '2021-07-08', 4, NULL),
	(4, 4, 'text_d', '2021-07-19', 2, '2021-09-12'),
	(5, 1, 'text_e', '2021-08-06', 3, NULL),
	(6, 2, 'text_f', '2021-11-13', 4, '2022-02-03'),
	(7, 3, 'text_g', '2022-01-09', 1, '2022-03-05'),
	(8, 1, 'text_h', '2022-03-20', 4, '2022-04-06'),
	(9, 3, 'text_i', '2022-05-03', 4, '2022-07-08'),
	(10, 4, 'text_j', '2022-05-12', 2, '2022-08-23');


INSERT INTO Complaints_Status(ComplaintID, Date, State)
VALUES
	(1, '2021-05-14', 'Pending'),
	(1, '2021-08-08', 'Addressed'),
	(2, '2021-06-10', 'Pending'),
	(2, '2021-07-18', 'Addressed'),
	(3, '2021-07-08', 'Pending'),
	(4, '2021-07-19', 'Pending'),
	(4, '2021-09-12', 'Addressed'),
	(5, '2021-08-06', 'Pending'),
	(6, '2021-11-13', 'Pending'),
	(6, '2022-02-03', 'Addressed'),
	(7, '2022-01-09', 'Pending'),
	(7, '2022-03-05', 'Addressed'),
	(8, '2022-03-20', 'Pending'),
	(8, '2022-04-06', 'Addressed'),
	(9, '2022-05-03', 'Pending'),
	(9, '2022-07-08', 'Addressed'),
	(10, '2022-05-12', 'Pending'),
	(10, '2022-08-23', 'Addressed');


Insert INTO Orders(OrderID, CustomerID, Order_Date_time, Shipping_address, Shipping_cost)
VALUES
	(1, 1, '2022-06-01', 'address_1', 0),
	(2, 2, '2022-08-25', 'address_2', 50.0),
	(3, 3, '2023-02-22', 'address_3', 25.0),
	(4, 4, '2022-07-17', 'address_4', 15.0),
	(5, 1, '2022-06-19', 'address_5', 30.0),
	(6, 2, '2022-08-03', 'address_6', 0);


INSERT INTO Complaints_On_Order(ComplaintID, OrderID)
VALUES
	(1, 1),
	(3, 2),
	(5, 3),
	(7, 4),
	(9, 1);


INSERT INTO Complaints_On_Bookstore(ComplaintID, BookstoreID)
VALUES
	(2, 1),
	(4, 2),
	(6, 3),
	(8, 4),
	(10, 1);

INSERT INTO Stocks_In_Bookstore(StockID, Stock_Price, Stock_Qty, PubID, BookstoreID)
VALUES
	(1, 1.0, 7, 1, 1),
	(2, 2.0, 10, 1, 2),
	(3, 13.0, 0, 1, 3),
	(4, 13.0, 4, 6, 4),
	(5, 2.0, 5, 4, 4),
	(6, 34.0, 20, 2, 1),
	(7, 1.0, 2, 5, 3),
	(8, 23.0, 18, 5, 4),
	(9, 13.0, 25, 4, 1),
	(10, 10.0, 1, 3, 2),
	(11, 1.0, 7, 2, 4),
	(12, 20.0, 10, 3, 3),
	(13, 3.0, 0, 4, 3),
	(14, 11.0, 4, 6, 2),
	(15, 2.0, 5, 3, 4),
	(16, 3.0, 20, 2, 2);

INSERT INTO Items_In_Order(ItemID, StockID, OrderID, Item_Price, Item_Qty,
							Delivery_Date, Feedback_Date_Time, Feedback_Comment,
							Feedback_Rating)
VALUES
	(1, 1, 1, 3.0, 3, NULL, NULL, NULL, NULL),
	(2, 2, 3, 5.0, 6, '2023-03-23', '2023-03-25', 'comment', 3),
	(3, 3, 4, 27.0, 2, '2022-11-11', '2022-12-20', NULL, NULL),
	(4, 4, 5, 28.0, 2, '2022-10-06', '2022-10-18', 'comment', 5),
	(5, 5, 6, 15.0, 3, NULL, NULL, NULL, NULL),
	(6, 6, 1, 1.0, 4, '2022-08-23', '2022-09-22', 'comment', 1),
	(7, 7, 2, 28.0, 2, '2022-11-11', '2022-12-20', NULL, NULL),
	(8, 8, 1, 3.0, 3, '2022-06-06', '2022-07-18', 'comment', 4),
	(9, 11, 3, 5.0, 2, NULL, NULL, NULL, NULL),
	(10, 12, 4, 15.0, 1, '2022-01-23', '2022-02-22', 'comment', 5),
	(11, 7, 4, 5.0, 5, '2022-11-11', '2022-12-20', NULL, NULL),
	(12, 13, 6, 13.0, 7, '2022-09-06', '2022-10-18', 'comment', 3),
	(13, 15, 1, 28.0, 3, NULL, NULL, NULL, NULL),
	(14, 16, 2, 15.0, 1, '2022-08-27', '2022-09-22', 'comment', 2),
	(15, 14, 6, 27.0, 2, '2022-11-11', '2022-12-20', NULL, NULL),
	(16, 9, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(17, 9, 5, 28.0, 2, '2022-07-06', '2022-08-18', 'comment', 5),
	(18, 9, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(19, 9, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(20, 9, 5, 28.0, 3, '2022-07-06', '2022-08-18', 'comment', 5),
	(21, 9, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(22, 9, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(23, 9, 5, 28.0, 2, '2022-07-06', '2022-08-18', 'comment', 5),
	(24, 9, 5, 28.0, 4, '2022-07-06', '2022-08-18', 'comment', 5),
	(25, 9, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(26, 9, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),

	(27, 10, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(28, 10, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(29, 10, 5, 28.0, 2, '2022-07-06', '2022-08-18', 'comment', 5),
	(30, 10, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(31, 10, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(32, 10, 5, 28.0, 3, '2022-07-06', '2022-08-18', 'comment', 5),
	(33, 10, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5),
	(34, 10, 5, 28.0, 4, '2022-07-06', '2022-08-18', 'comment', 5),
	(35, 10, 5, 28.0, 5, '2022-07-06', '2022-08-18', 'comment', 5),
	(36, 10, 5, 28.0, 1, '2022-07-06', '2022-08-18', 'comment', 5);


INSERT INTO Price_History(StockID, Price, Start_date, End_date)
VALUES

	(1, 1.0, '2023-03-01', '2023-03-31'),
	(1, 3.0, '2022-08-01', '2023-02-28'),
	(1, 5.0, '2022-07-01', '2022-07-30'),

	(2, 2.0, '2023-03-01', '2023-03-31'),
	(2, 1.0, '2022-08-01', '2023-02-28'),
	(2, 2.0, '2022-07-01', '2022-07-30'),

	(3, 13.0, '2023-03-01', '2023-03-31'),
	(3, 15.0, '2022-08-01', '2023-02-28'),
	(3, 17.0, '2022-07-01', '2022-07-30'),

	(4, 13.0, '2023-03-01', '2023-03-31'),
	(4, 12.0, '2022-08-01', '2023-02-28'),
	(4, 11.0, '2022-07-01', '2022-07-30'),

	(5, 2.0, '2023-03-01', '2023-03-31'),
	(5, 1.0, '2022-08-01', '2023-02-28'),
	(5, 3.0, '2022-07-01', '2022-07-30'),

	(6, 34.0, '2023-03-01', '2023-03-31'),
	(6, 34.0, '2022-08-01', '2023-02-28'),
	(6, 34.0, '2022-07-01', '2022-07-30'),

	(7, 1.0, '2023-03-01', '2023-03-31'),
	(7, 1.0, '2022-08-01', '2023-02-28'),
	(7, 1.0, '2022-07-01', '2022-07-30'),

	(8, 23.0, '2023-03-01', '2023-03-31'),
	(8, 13.0, '2022-08-01', '2023-02-28'),
	(8, 13.0, '2022-07-01', '2022-07-30'),

	(9, 13.0, '2023-03-01', '2023-03-31'),
	(9, 15.0, '2022-08-01', '2023-02-28'),
	(9, 7.0, '2022-07-01', '2022-07-30'),

	(10, 10.0, '2023-03-01', '2023-03-31'),
	(10, 13.0, '2022-08-01', '2023-02-28'),
	(10, 7.0, '2022-07-01', '2022-07-30'),

	(11, 1.0, '2023-03-01', '2023-03-31'),
	(11, 1.0, '2022-08-01', '2023-02-28'),
	(11, 11.0, '2022-07-01', '2022-07-30'),

	(12, 20.0, '2023-03-01', '2023-03-31'),
	(12, 13.0, '2022-08-01', '2023-02-28'),
	(12, 7.0, '2022-07-01', '2022-07-30'),

	(13, 3.0, '2023-03-01', '2023-03-31'),
	(13, 3.0, '2022-08-01', '2023-02-28'),
	(13, 6.0, '2022-07-01', '2022-07-30'),

	(14, 11.0, '2023-03-01', '2023-03-31'),
	(14, 13.0, '2022-08-01', '2023-02-28'),
	(14, 13.0, '2022-07-01', '2022-07-30'),

	(15, 2.0, '2023-03-01', '2023-03-31'),
	(15, 2.0, '2022-08-01', '2023-02-28'),
	(15, 2.0, '2022-07-01', '2022-07-30'),

	(16, 3.0, '2023-03-01', '2023-03-31'),
	(16, 3.0, '2022-08-01', '2023-02-28'),
	(16, 1.0, '2022-07-01', '2022-07-30');

INSERT INTO Items_In_Order_Status(Date, ItemID, State)
((SELECT CAST(O.Order_Date_Time AS DATE), ItemID, 'Shipped'
  FROM Items_In_Order AS I
  JOIN Orders AS O ON I.OrderID = O.OrderID)
  UNION
  (SELECT Delivery_date, ItemID, 'Delivered'
  FROM Items_In_Order
  WHERE Delivery_date IS NOT NULL))