/*****************************************************************************************************************
NAME:    Kuol Lual Wol
PURPOSE: Translate user questions into SQL statements

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     05/23/2022   JJAUSSI       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

-- Q1: 1.	From production.Product table write a query in SQL
--to return only the rows for product that have a sellstartdate that
--is not NULL and a productline of 'T'. Return productid, productnumber, 
--and name. Arranged the output in ascending order on name.
-- A1: 
SELECT productid, productnumber, name as producName
FROM production.product
WHERE sellstartdate IS NOT NULL
AND production.product.productline= 'T'
ORDER BY name;

/*Q2: 2.	 From sales.salesorderheader table write a query
in SQL to return all rows from the salesorderheader table
in Adventureworks database and calculate the percentage of tax on 
the subtotal have decided. Return salesorderid, customerid, orderdate,
subtotal, percentage of tax column.
Arranged the result set in ascending order on subtotal.*/

--A2:
SELECT salesorderid,customerid,orderdate,subtotal,
(taxamt*100)/subtotal AS Tax_percent
FROM sales.salesorderheader
ORDER BY subtotal desc;

/* Q3: From sales.salesorderheader table write a 
query in SQL to calculate the total freight paid by 
each customer. Return customerid and total freight.
Sort the output in ascending order on customerid.*/

--A3
SELECT customerid,sum(freight) as total_freight 
FROM sales.salesorderheader
group by customerid
ORDER BY customerid ASC;

/*Q4: 4.	From production.productinventory table write a query
in SQL to retrieve total quantity of each productid which are 
in shelf of 'A' or 'C' or 'H'. Filter the results for sum quantity 
is more than 500. Return productid and sum of the quantity.
Sort the results according to the productid in ascending order.*/

--A4:
SELECT productid, sum(quantity) AS total_quantity
FROM production.productinventory
WHERE shelf IN ('A','C','H')
GROUP BY productid
HAVING SUM(quantity)>500
ORDER BY productid;

/*Q5:
From Sales.SalesOrderHeader table write a query
in SQL to retrieve the total sales for each year.
Filter the result set for those orders where order
year is on or before 2016. Return the year part of 
orderdate and total due amount.
Sort the result in ascending order on year part of order date.
*/


/*Q6:
From  Person.BusinessEntityContact tables write a query in SQL
to make a list of contacts who are designated as 'Purchasing Manager'.
Return BusinessEntityID, LastName, and FirstName
columns. Sort the result set in ascending order of LastName, and FirstName.*/

--A6:
SELECT pp.BusinessEntityID, LastName, FirstName
    FROM Person.BusinessEntityContact AS pb 
        INNER JOIN Person.ContactType AS pc
            ON pc.ContactTypeID = pb.ContactTypeID
        INNER JOIN Person.Person AS pp
            ON pp.BusinessEntityID = pb.PersonID
    WHERE pc.Name = 'Purchasing Manager'
    ORDER BY LastName, FirstName;


/*Q7
7.	From the Salesorder table write a query in SQL to find the
sum, average, count, minimum, and maximum order quentity for
those orders whose id are 43659 and 43664. Return SalesOrderID,
ProductID, OrderQty, sum, average, count, max, and min order quantity.
*/

--A7:


--*Q8:Determine the overall sales in each sales quota


--A8:
SELECT SalesQuota, SUM(SalesYTD) as "TotalSalesYTD" , 
GROUPING(SalesQuota) as "Grouping" 
FROM Sales.SalesPerson  
GROUP BY rollup(SalesQuota);







SELECT GETDATE() AS my_date;

