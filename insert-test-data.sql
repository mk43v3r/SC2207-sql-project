DELETE FROM Magazines;
DELETE FROM Books;
DELETE FROM Publication;
DELETE FROM Employees;
DELETE FROM Bookstore;
DELETE FROM Customers;

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