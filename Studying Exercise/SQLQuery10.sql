
-- Inner Join
Select * 
From Customers 
INNER Join Orders 
On Customers.CustomerID = Orders.CustomerID ;

-- Left(outer) Join 

Select * 
From Customers ; -- Left Table 

Select * 
From Customers 
Left outer Join Orders
ON Customers.CustomerID = Orders.CustomerID ; 

--Show each customer and the average amount of their orders 
--(include customers with no orders).

--📊 Output columns:

--CustomerID
--Name
--AvgOrderAmount

Select Customers.CustomerID,
Customers.Name , 
Avg(Orders.Amount)
From Customers 
Left OUTER JOIN Orders 
ON 
Customers.CustomerID = Orders.CustomerID 
Group by 
Customers.CustomerID,
Customers.Name; 


--Show each customer and the smallest order 
--amount they ever made (include customers with no orders).

-- Output columns:

--CustomerID
--Name
--MinAmount

Select Customers.Name , 
Customers.CustomerID , 
Min(Orders.Amount) As MinOrderAmount 
From Customers 
Left Outer Join Orders 
ON Customers.CustomerID = Orders.OrderID 
Group by 
Customers.Name , 
Customers.CustomerID;


--Show each customer and the total amount of orders, 
--but only display customers whose total is less than 300 OR have no orders.

--📊 Output columns:

--CustomerID
--Name
--TotalAmount

Select Customers.CustomerID
,Customers.Name , 
Sum(Orders.Amount) As TotalAmount
From Customers 
Left Outer Join Orders On 
Customers.CustomerId = Orders.CustomerId 
Group by 
Customers.CustomerID
,Customers.Name 
Having Sum(Orders.Amount)<300 or 
Sum(Orders.Amount) is Null ;


Select Customers.CustomerID , 
Customers.Name , 
Orders.OrderID
From Orders 
Left Join Customers On
Customers.CustomerID = Orders.CustomerID ; 

Select * From Orders ;

Select * From Customers ;

------------ Right & Full Join 
 -- Left : Customers 
 -- Right : Orders 
 Select Customers.CustomerID , Customers.Name , OrderID 
 From Customers
 Right outer join Orders 
 On Customers.CustomerID = Orders.CustomerID ; 

 Select Customers.CustomerID , Customers.Name , OrderID 
 From Orders
 Left outer join  Customers 
 On Customers.CustomerID = Orders.CustomerID ; 

 Select * 
 From Orders 
 FULL OUTER JOIN Customers 
 On Customers.CustomerID = Orders.CustomerID; 


-- Question 1
--Show all orders and the customer name if it exists.
--(Some orders might not be linked to a customer → still show them)

Select Orders.OrderID ,
Customers.Name 
From Orders 
Left Outer Join Customers 
On Orders.CustomerID = Customers.CustomerID ; 

--Question 2
--Show all customers and all orders, and classify each row as:
--"Match" → customer has an order
--"Customer Only" → customer with no orders
--"Order Only" → order with no customer

Select Customers.CustomerID , 
Orders.OrderID 
From Customers 
FULL OUTER Join Orders 
On Customers.CustomerID = Orders.CustomerID 
order by OrderID asc ; 


