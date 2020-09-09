-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName
, c.categoryName 
FROM Product AS p
JOIN category as c on c.Id = p.categoryId;

        
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.ID, s.CompanyName 
FROM [Order] AS o
INNER JOIN Shipper AS s on o.ShipVia = s.Id
WHERE o.orderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT o.Id as ID, 
o.orderDate as OrderedOn
, p.productName
, od.quantity
from orderDetail as od
join [order] as o on od.orderId = o.ID
join product as p on od.productID = p.Id
where od.orderID = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id as Id
    , c.companyName as CustomerCompanyName
    , e.LastName
from [order] as o
join employee as e on o.EmployeeId = e.Id
join customer as c on o.customerId = c.Id;