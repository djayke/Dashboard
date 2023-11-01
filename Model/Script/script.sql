CREATE DATABASE NorthWindStore;

USE NorthWindStore;


CREATE TABLE Customer (
    id int,
    FirstName nvarchar(40),
    LastName nvarchar(40),
    City nvarchar(40),
    Country nvarchar(40),
    Phone nvarchar(20),
    Primary Key(id)
);


CREATE TABLE Supplier (
    id int,
    CompanyName nvarchar(40),
    ContactName nvarchar(50),
    ContactTitle nvarchar(40),
    City nvarchar(40),
    Country nvarchar(20),
    Phone nvarchar(30),
    Fax nvarchar(30),
    Primary Key(id)
);


CREATE TABLE Orders (
    id int,
    OrderDate datetime,
    OrderNumber nvarchar(10),
    CustomerID int,
    TotalAmount decimal(12,2),
    Primary key(id),
    Foreign Key(CustomerID) REFERENCES Customer(id)
);

CREATE TABLE Product (
    id int,
    ProductName nvarchar(50),
    SupplierId  int,
    UnitPrice   decimal(12,2),
    Package     nvarchar(30),
    IsDiscontinued bit,
    Stock		int,
    Primary Key (id), 
    Foreign Key (SupplierId) REFERENCES Supplier(id)
);

CREATE TABLE OrderItem (
    id int,
    OrderId int,
    ProductId int,
    UnitPrice decimal(12,2),
    Quantity  int,
    Primary Key(id),
    Foreign Key (OrderId) REFERENCES Orders(id),
    Foreign Key (ProductId) REFERENCES Product(id)
);

INSERT INTO `northwindstore`.`customer`(`id`,`FirstName`,`LastName`,`City`,`Country`,`Phone`)
VALUES(1,"Jerome","Boucher","Qc","Canada","4185649931");
INSERT INTO `northwindstore`.`customer`(`id`,`FirstName`,`LastName`,`City`,`Country`,`Phone`)
VALUES(2,"Jerome","Veilleux","Qc","Canada","4185649931");

INSERT INTO `northwindstore`.`supplier`(`id`,`CompanyName`,`ContactName`,`ContactTitle`,`City`,`Country`,`Phone`,`Fax`)
VALUES(1,"EBI","JayJay","Developper","St-GG","Canada","4185649931","4185649932");

INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(1,DATE(NOW()),100,1,1024.99);
INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(2,DATE(NOW()),10,1,512.99);
INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(3,DATE(NOW()),1,1,256.99);
INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(4,DATE(NOW()),100,2,100349.99);
INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(5,DATE(NOW()),22,2,24064.99);
INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(6,DATE(NOW()),40,2,1924.99);


INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(7,DATE(NOW()),60,2,1019.99);
INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(8,DATE(NOW()),20,2,2074.99);
INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(9,DATE(NOW()),30,2,1924.99);
INSERT INTO `northwindstore`.`orders`(`id`,`OrderDate`,`OrderNumber`,`CustomerID`,`TotalAmount`)
VALUES(10,DATE(NOW()),40,2,999.99);

INSERT INTO `northwindstore`.`product`(`id`,`ProductName`,`SupplierId`,`UnitPrice`,`Package`,`IsDiscontinued`,`Stock`)
VALUES(1,"MX400",1,239.00,2,false,100);
INSERT INTO `northwindstore`.`product`(`id`,`ProductName`,`SupplierId`,`UnitPrice`,`Package`,`IsDiscontinued`,`Stock`)
VALUES(2,"MX600P",1,539.00,2,false,50);
INSERT INTO `northwindstore`.`product`(`id`,`ProductName`,`SupplierId`,`UnitPrice`,`Package`,`IsDiscontinued`,`Stock`)
VALUES(3,"SE22XP",1,1219.89,2,false,10);
INSERT INTO `northwindstore`.`product`(`id`,`ProductName`,`SupplierId`,`UnitPrice`,`Package`,`IsDiscontinued`,`Stock`)
VALUES(4,"Z200E",1,2049.99,2,false,80);

INSERT INTO `northwindstore`.`orderitem`(`id`,`OrderId`,`ProductId`,`UnitPrice`,`Quantity`)
VALUES(1,1,1,199.99,50);
INSERT INTO `northwindstore`.`orderitem`(`id`,`OrderId`,`ProductId`,`UnitPrice`,`Quantity`)
VALUES(2,2,2,79.99,100);
INSERT INTO `northwindstore`.`orderitem`(`id`,`OrderId`,`ProductId`,`UnitPrice`,`Quantity`)
VALUES(3,2,3,19.99,300);