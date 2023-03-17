/*****************************************************************************************************************
NAME: W6.2 - Adventure Works Create Answers   
PURPOSE: My script purpose...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/07/2023   VMOYO       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
Built for W6.2 - Adventure Works: Create Answers
 
******************************************************************************************************************/

-- Q1: Business User question - Marginal complexity: What are our top ten most expensive products in terms of unit price? Michael McEvoy
-- A1: 

Select top 10 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%products%'
Where c.COLUMN_NAME LIKE '%products%'

select top 10 eph.ProductID, Name , StandardCost
from [Production].[Product] as eph
order by StandardCost desc





--Q1) Business User question - Marginal complexity: How many cultures are in Production for AventureWorks 2019? Jacoc Erickson
--A1)
Select top 10 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%cultures%'
Where c.COLUMN_NAME LIKE '%culture%'

select eph.CultureID
, count(1) AS rec_count
From Production.Culture as eph
Group by eph.CultureID 
Order by 2 desc;


--Q2) Business User question - Marginal complexity: What was TaxRate for Canadian GST + Alberta Proviincial Tax? Jacob Erickson
--A2)

Select top 10 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%tax%'
Where c.COLUMN_NAME LIKE '%tax%'

select eph.TaxRate, Name
from Sales.SalesTaxRate as eph
where Name = 'Canadian GST + Alberta Provincial Tax'





--Q4) Business User question - Moderate complexity: Which categories of products have been the least frequently purchased in AdventureWorks? How many units of each category were sold in total?
--Jacob Erickson

--A)
Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%sales%'
Where c.COLUMN_NAME LIKE '%purchase%'

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%sales%'
Where c.COLUMN_NAME LIKE '%order%'

select [ProductID], [OrderQty]
from [Sales].[SalesOrderDetail]
order by [OrderQty]

select [ProductID], [OrderQty]
from [Production].[WorkOrder]
order by [OrderQty]


--Q5) Business User question - Increased complexity: I need to understand and know more about Purchasing and ShipRates during the last five years.
--Can you create a list that will tell me each different shipping rate per month? I need to know how much money was spent on each shipping method.
--Jacob Erickson

--A) 
Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%ShipRate%'


select*
from [Purchasing].[ShipMethod]
 --there are 5 Ship Method IDs, each having unique Ship Rates. 

--Q6) Business User question - Increased complexity: The company wants who the top sales people and who are the lowest sales people. What is the difference in AdventureWorks between these two groups of people in the year 2022 with total sales? What is the median or average sales in the company for AdventureWorks? 

--A6)
Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%sales%'

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%year%'

select top 10 [BusinessEntityID] as SalesPersonID_TopSalesPeople,[SalesLastYear] as TotalSalesFor2022_Top10
from [Sales].[SalesPerson]
order by [SalesLastYear] desc


select top 10 [BusinessEntityID] as SalesPersonID_LowestSalesPeople,[SalesLastYear] as TotalSalesFor2022_Lowest10
from [Sales].[SalesPerson]
order by [SalesLastYear] asc

select top 10 avg([SalesLastYear]) as Average_For_TotalSalesFor2022_Top10
from [Sales].[SalesPerson]
group by [SalesLastYear] 

select AVG(TotalSalesFor2022_Top10) as  AverageTopSales2022
from (select top 10 [BusinessEntityID] as SalesPersonID_TopSalesPeople , [SalesLastYear] as TotalSalesFor2022_Top10
from [Sales].[SalesPerson]
order by [SalesLastYear] desc)

select avg(TotalSalesFor2022_Lowest10) as AverageLowest10Sales
from (select top 10 [BusinessEntityID] as SalesPersonID_LowestSalesPeople,[SalesLastYear] as TotalSalesFor2022_Lowest10
from [Sales].[SalesPerson]
order by [SalesLastYear] asc)





--Q7) Metadata question: Can you create a list of tables in AdventureWorks that contain a column with one of these names: BusinessEntityID or AnnualRevenue? 
-- Author by Jacob Erickson
--A7)

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%Revenue%'

-- the above is not defined
--there are plenty tables with column name BusinessEntityID, the code is below

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%BusinessEntityID%'


--Q8) Metadata question: Can you create a list of tables in AdventureWorks that contain a column with one of these names: SalesPersonID or Sales Territory?
--Author by Jacoc Erickson

--A)
Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%sales%'
Where c.COLUMN_NAME LIKE '%SalesPersonID%'

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%sales%'
Where c.COLUMN_NAME LIKE '%Territory%'

select [SalesPersonID]     --SalesPersonID     
from [Sales].[Store]

select SalesTerritory			--This cannot be defined
from vSalesPersonSalesByFiscalYears



--Q2 - Business User question - Marginal complexity:What are the top 3 heavy items on the product list? Author: Jorge Elizondo Santos

--A2 Top 3 weights are below
Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%weight%'

select top  3 [Weight]
from [Production].[Product] 
order by weight desc


--Vez Q6 - Business User question - Increased complexity: How many bicycle accessories incurred in the making of the 2018 Q1 batch, that were colored green and were reserved for para-Olympics.


--Vez A6  

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%color%'

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%batch%'

select [Color]
from [Production].[Product]
where [Color] = 'Green'

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%game%'

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%product%'

-- Green is not listed in the colors of bicycles in the AdventureWorks2019 and there are no dedicated bicycles for sport like Para Olympics


--Vez Q5 - Business User question - Increased complexity: What is the customer found in more than one state, who bought more than other customers

-- A5
Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%Customer%'

select * 
from [Sales].[Customer]

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
Where c.COLUMN_NAME LIKE '%state%'


  select [CustomerID], [TotalDue]
  from [Sales].[SalesOrderHeader]
  order by [TotalDue] desc

  -- A customer cannot live in different states at once, CustomerID 29641 will pay more. 

  Select top 10 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE ‘%cultures%’
Where c.COLUMN_NAME LIKE '%pay%'

select eph.BusinessEntityID
, count(1) AS rec_count
From HumanResources.EmployeePayHistory as eph
Group by eph.BusinessEntityID 
Having count(1) > 1
Order by 2 desc;

--Jacob Erickson

--Q3) Business User question - Moderate complexity: How many sales were completed by the salesperson named “Michael G Blythe” in the 2004? What was the total value of these sales?

--A3

Select top 100 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%%'
Where c.COLUMN_NAME LIKE '%2004%'

Select top 10 c.*
From INFORMATION_SCHEMA.columns as c
--Where c.COLUMN_NAME LIKE '%sales%'
Where c.COLUMN_NAME LIKE '%sales%'

select eph.BusinessEntityID, [SalesQuota]
from [Sales].[SalesPerson] as eph
where column name = 2004
order by SalesQuota desc

SELECT GETDATE() AS my_date;