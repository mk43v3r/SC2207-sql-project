DELETE FROM Publication;
DELETE FROM Employees;
DELETE FROM Bookstore;
DELETE FROM Customers;

-- Publication test data insertion
INSERT INTO Publication
VALUES(1, 'p_a', 2001);

INSERT INTO Publication
VALUES(2, 'p_b', 2002);

INSERT INTO Publication
VALUES(3, 'p_c', 2003);

INSERT INTO Publication
VALUES(4, 'Nanyang Publisher Company', 2004);


-- Employees test data insertion
INSERT INTO Employees
VALUES(1, 'e_a' , 1000);

INSERT INTO Employees
VALUES(2, 'e_b' , 2000);

INSERT INTO Employees
VALUES(3, 'e_c' , 1000);

INSERT INTO Employees
VALUES(4, 'e_d' , 4000);


-- Bookstore test data insertion
INSERT INTO Bookstore
VALUES(1);

INSERT INTO Bookstore
VALUES(2);

INSERT INTO Bookstore
VALUES(3);

INSERT INTO Bookstore
VALUES(4);


-- Customers test data insertion
INSERT INTO Customers
VALUES(1, 'c_a')

INSERT INTO Customers
VALUES(2, 'c_b')

INSERT INTO Customers
VALUES(3, 'c_c')

INSERT INTO Customers
VALUES(4, 'c_d')
