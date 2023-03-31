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
	(1, 1, '2021-04-01', 'address_1', 0),
	(2, 2, '2021-05-07', 'address_2', 50.0),
	(3, 3, '2023-02-22', 'address_3', 25.0),
	(4, 4, '2021-09-17', 'address_4', 15.0),
	(5, 1, '2021-12-19', 'address_5', 30.0),
	(6, 2, '2022-04-03', 'address_6', 0);


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