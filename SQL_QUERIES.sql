--SQL DB QUERIES 
--Total Amount Paid with Respect to Payment Method
SELECT count(Payment_Method) AS Total_Customers, Payment.Payment_Method, SUM(Billing.Amount)
AS Total_Amount FROM ProjectDB.Payment INNER JOIN ProjectDB.Billing ON Payment.Payment_ID = 
Billing.Payment_ID GROUP BY Payment_Method;


--List all Payment IDs with their Billing Method and above 3 dollars
SELECT Payment.Payment_ID, Payment.Payment_Method FROM Billing, Payment
WHERE Payment.Payment_ID = Billing.Payment_ID AND Billing.Amount > 3;


--List Product Names and pair them with their Category
SELECT Category, Product_Name FROM Product_Grouping INNER JOIN Product ON 
Product_Grouping.Grouping_ID = Product.Grouping_ID ORDER BY Category;


--List Product names with their Rating in Descending order
SELECT Product_Name, Rating FROM Product INNER JOIN Reviews ON Reviews.Product_ID 
= Product.Product_ID ORDER BY Rating DESC;


--Lists Employees With their Monthly Income, job role, and department
SELECT Monthly_Income, Job_Role, Department, Employee_Number FROM Employee ORDER BY Monthly_Income DESC;


--Lists Employees that Earn more than 6000 listing their Job_Role and Department
SELECT DISTINCT Employee.Job_Role, Employee.Employee_Number, Employee.Department FROM Employee
WHERE Employee.Monthly_Income > 6000 LIMIT 6;


--Find Max Monthly Income Paided Out for Each Employee Type
SELECT MAX (Monthly_Income), Employee_Type FROM Employee GROUP BY Employee_Type;


--Total Amount Paid out for Each Employee Type
SELECT SUM(Monthly_Income), Employee_Type FROM Employee GROUP BY Employee_Type;