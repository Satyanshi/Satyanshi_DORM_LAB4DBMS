create database eCommerce;
use eCommerce;

CREATE TABLE supplier (
    SUPP_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);

CREATE TABLE customer (
    CUS_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);

CREATE TABLE category (
    CAT_ID INTEGER PRIMARY KEY AUTO_INCREMENT,
    CAT_NAME VARCHAR(20) NOT NULL
);
  
CREATE TABLE product (
    PRO_ID INT PRIMARY KEY AUTO_INCREMENT,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INTEGER,
    FOREIGN KEY (CAT_ID)
        REFERENCES category (CAT_ID)
        ON DELETE CASCADE
);

CREATE TABLE supplier_pricing (
    PRICING_ID INT PRIMARY KEY AUTO_INCREMENT,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID)
        REFERENCES product (PRO_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (SUPP_ID)
        REFERENCES supplier (SUPP_ID)
        ON DELETE CASCADE
);

CREATE TABLE orders (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID)
        REFERENCES customer (CUS_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (PRICING_ID)
        REFERENCES supplier_pricing (PRICING_ID)
        ON DELETE CASCADE
);


CREATE TABLE rating (
    RAT_ID INT PRIMARY KEY AUTO_INCREMENT,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID)
        REFERENCES orders (ORD_ID)
        ON DELETE CASCADE
);

-- supplier Table insert 
INSERT INTO supplier (SUPP_NAME, SUPP_CITY, SUPP_PHONE) 
VALUES ('Rajesh Retails','Delhi','1234567890'),('Appario Ltd.','Mumbai','2589631470'),('Knome products','Banglore','9785462315'),
('Bansal Retails','Kochi','8975463285'),
('Mittal Ltd.','Lucknow','7898456532');

-- customer Table insert 
INSERT INTO customer (CUS_NAME,CUS_PHONE,CUS_CITY, CUS_GENDER) 
VALUES ('AAKASH', '9999999999', 'DELHI', 'M' ),('AMAN', '9785463215', 'NOIDA', 'M'),
	('NEHA', '9999999999', 'MUMBAI', 'F'),
	('MEGHA', '9994562399', 'KOLKATA','F'),
	('PULKIT', '7895999999', 'LUCKNOW', 'M'); 
    
-- category Table insert     
INSERT INTO category (CAT_NAME ) VALUES
	('BOOKS '),
	('GAMES '),
	('GROCERIES '),
	('ELECTRONICS '),
	('CLOTHES ');
  -- product Table insert   
    INSERT INTO product (PRO_NAME, PRO_DESC, CAT_ID ) VALUES
	('GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
	('TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
	('ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
	('OATS', 'Highly Nutritious from Nestle', 3),
	('HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
	('MILK', '1L Toned MIlk', 3),
	('Boat Earphones', '1.5Meter long Dolby Atmos', 4),
	('Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
	('Project IGI', 'compatible with windows 7 and above', 2),
	('Hoodie', 'Black GUCCI for 13 yrs and above', 5),
	('Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
	('Train Your Brain', 'By Shireen Stephen',1);
    
-- orders Table insert     
    INSERT INTO orders (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PRICING_ID ) VALUES
	('101', '1500', '2021-10-06', 2, 1),
	('102', '1000', '2021-10-12', 3, 5),
	('103', '30000', '2021-09-16', 5, 2),
	('104', '1500', '2021-10-05', 1, 1),
	('105', '3000', '2021-08-16', 4, 3),
	('106', '1450', '2021-08-18', 1, 9),
	('107', '789', '2021-09-01', 3, 7),
	('108', '780', '2021-09-07', 5, 6),
	('109', '3000', '2021-00-10', 5, 3),
	('110', '2500', '2021-09-10', 2, 4),
	('111', '1000', '2021-09-15', 4, 5),
	('112', '789', '2021-09-16', 4, 7),
	('113', '31000', '2021-09-16', 1, 8),
	('114', '1000', '2021-09-16', 3, 5),
	('115', '3000', '2021-09-16', 5, 3),
    ('116', '99', '2021-09-17', 2, 14);

-- Supplier Pricing Table insert    
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO rating (ORD_ID, RAT_RATSTARS) VALUES
	(101, 4),
	(102, 3),
	(103, 1),
	(104, 2),
	(105, 4),
	(106, 3),
	(107, 4),
	(108,4 ),
	(109, 3),
	(110, 5),
	(111, 3),
	(112, 4),
	(113, 2),
	(114, 1),
	(115, 1),
	(116, 0);
