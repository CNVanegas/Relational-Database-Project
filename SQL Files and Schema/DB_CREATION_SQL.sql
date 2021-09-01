CREATE TABLE Employee
(
Department varchar(40), 
Age int, 
Employee_Number int NOT NULL, 
Employee_Type varchar(20),
Gender varchar(6),
Monthly_Income int, 
Job_Role varchar(40),
YearsAtCompany int,
PRIMARY KEY (Employee_Number)
);
CREATE INDEX idx_employee_emplnum ON Employee (Employee_Number);


CREATE TABLE Customer
(
Customer_ID varchar(12) NOT NULL, 
First_Name varchar(20), 
Last_Name varchar(20), 
Email_Address varchar(36),
PRIMARY KEY (Customer_ID)
);


CREATE TABLE Reviews
(
Rating int, 
Review_ID varchar(10) NOT NULL, 
Product_ID varchar(7) NOT NULL,
PRIMARY KEY (Review_ID)
);


CREATE TABLE Payment
(
Payment_ID varchar(10) NOT NULL, 
Payment_Method varchar(8), 
CCN int, 
Card_NAME varchar(35), 
Customer_ID varchar(12) NOT NULL,
PRIMARY KEY (Payment_ID),
CONSTRAINT `Creates` FOREIGN KEY (`Customer_ID`) REFERENCES 
`Customer` (`Customer_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_payment_customer ON Payment (Customer_ID);


CREATE TABLE Product_Grouping
(
Category varchar(10),
Grouping_ID varchar(15) NOT NULL,
PRIMARY KEY (Grouping_ID)
);


CREATE TABLE Orders
(
Order_ID varchar(50) NOT NULL,
Order_Date varchar(40),
Payment_ID varchar(10) NOT NULL,
Status varchar(20),
PRIMARY KEY (Order_ID),
CONSTRAINT `Orders` FOREIGN KEY (Payment_ID) REFERENCES 
`Payment` (Payment_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_orders_payment ON Orders (Payment_ID);


CREATE TABLE Product
(
Product_ID varchar(7) NOT NULL, 
Product_Name varchar(80), 
Price float, 
User_ID varchar(40), 
Review_ID varchar (10) NOT NULL, 
Order_ID varchar(50) NOT NULL, 
Grouping_ID int NOT NULL,
PRIMARY KEY (Product_ID)
FOREIGN KEY (Grouping_ID) REFERENCES 
`Product_Grouping` (Grouping_ID) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (Review_ID) REFERENCES 
`Reviews` (Review_ID) ON DELETE RESTRICT ON UPDATE RESTRICT,
FOREIGN KEY (Order_ID) REFERENCES
`Orders` (Order_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_product_grouping ON Product (Grouping_ID);
CREATE INDEX idx_product_reviewID ON Product (Review_ID);


CREATE TABLE Address
(
Address_Hash varchar(50) NOT NULL,
Customer_ID varchar(12) NOT NULL,
PRIMARY KEY (Address_Hash),
CONSTRAINT `has` FOREIGN KEY (Customer_ID) REFERENCES
`Customer` (Customer_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_address_customer ON Address (Customer_ID);


CREATE TABLE Billing
(
Billing_ID varchar(50) NOT NULL,
Product_ID varchar(7) NOT NULL,
Amount float,
Payment_ID varchar(10) NOT NULL,
Order_ID varchar(50) NOT NULL,
PRIMARY KEY (Billing_ID),
CONSTRAINT `Makes` FOREIGN KEY (Payment_ID) REFERENCES
`Payment` (Payment_ID) ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT `Is Billed` FOREIGN KEY (Order_ID) REFERENCES 
`Orders` (Order_ID) ON DELETE RESTRICT ON UPDATE RESTRICT
);
CREATE INDEX idx_billing_payment ON Billing (Payment_ID);
CREATE INDEX idx_billing_order ON Billing (Order_ID);






