--Revenue and Customer Insights from Digital Sales — A SQL Analysis Using Chinook

--STEP 1: Create database and import tables from device

CREATE DATABASE CHINOOK;

-- STEP 2 : Define the Foreign Keys

ALTER TABLE Album
ADD CONSTRAINT FK_Album_Artist FOREIGN KEY(ArtistId)
REFERENCES artist(ArtistId);

ALTER TABLE Track
ADD CONSTRAINT FK_Track_Album FOREIGN KEY(AlbumId)
REFERENCES album(AlbumId);

ALTER TABLE Track
ADD CONSTRAINT FK_Track_Genre FOREIGN KEY(GenreId)
REFERENCES Genre(GenreId);

ALTER TABLE Invoice
ADD CONSTRAINT FK_Invoice_Customer FOREIGN KEY(CustomerId)
REFERENCES Customer(CustomerId);

ALTER TABLE InvoiceLine
ADD CONSTRAINT fk_invoiceline_invoice FOREIGN KEY(InvoiceId)
REFERENCES Invoice(InvoiceId);

ALTER TABLE InvoiceLine
ADD CONSTRAINT fk_invoiceline_track FOREIGN KEY(TrackId)
REFERENCES Track(TrackId);

-- Data Analysis
-- ARTIST & CATALOG PERFORMANCE
-- Which artists generate the most revenue across all sales?

Select
A.ArtistId,
A.Name,
SUM(IL.UnitPrice * IL.Quantity) AS Revenue
From Artist AS A
JOIN Album AL ON A.ArtistId = AL.ArtistId
JOIN Track T ON AL.AlbumId = T.AlbumId
JOIN InvoiceLine IL ON T.TrackId = IL.TrackId
Group By A.ArtistId, A.Name
Order by Revenue DESC;

--What are the top-performing music genres by total revenue and volume sold?
SELECT 
G.GenreId,
G.Name AS Genre_Name,
COUNT(IL.InvoiceLineId) AS Volume_Sold,
SUM(IL.UnitPrice * IL.Quantity) As Total_revenue
FROM Genre G
JOIN Track T ON G.GenreId = T.GenreId
JOIN InvoiceLine IL ON T.TrackId = IL.TrackId
GROUP BY G.Name, G.GenreId
ORDER BY Total_revenue DESC;

-- Which albums account for the highest sales?

Select 
A.Title AS Album,
SUM(IL.UnitPrice *IL.Quantity) AS Sales
From Album A
JOIN Track T ON A.AlbumId = T.AlbumId
JOIN InvoiceLine IL ON T.TrackId = IL.TrackId
Group BY A.Title
ORDER BY Sales DESC;

--CUSTOMER BEHAIVOR & VALUE
-- Who are the highest-value customers based on total spend and purchase frequency?

Select 
C.CustomerId,
C.FirstName,
C.LastName,
Sum(I.Total) As Total_Spend,
Count(InvoiceID) As Purchase_Frequency
From Customer C
Left Join Invoice I ON C.CustomerId = I.CustomerId
Group By C.CustomerId,C.FirstName, C.LastName
Order By Total_Spend Desc;
--What is the average order value per customer, and how does it vary by country or region?

Select 
C.CustomerId,
C.FirstName,
C.LastName,
C.Country,
Count(InvoiceID) As NumberofOrders,
AVG(I.Total) As Average_Order_Value
From Customer C
Left Join Invoice I ON C.CustomerId = I.CustomerId
Group By C.CustomerId,C.FirstName, C.LastName, C.Country
Order By C.Country, Average_Order_Value Desc;

-- Which countries generate the most revenue overall?

Select 
BillingCountry,
Count(InvoiceId) AS Number_of_orders,
SUM(Total) AS Total_Revenue
FROM Invoice
Group by BillingCountry
Order By Total_Revenue DESC;

--TIME & PURCHASE PATTERNS
--How does sales volume vary by year?
SELECT
DATEPART(Year, InvoiceDate) AS Yr,
SUM(Total) AS Sales
FROM Invoice
Group by DATEPART(Year, InvoiceDate)
Order by Yr;


--What are the peak purchase periods for customers (Weekday, Weekend)?
SELECT 
    DATENAME(WEEKDAY, InvoiceDate) AS DayOfWeek,
    COUNT(InvoiceId) AS TotalPurchases,
    SUM(Total) AS TotalRevenue
FROM Invoice
GROUP BY DATENAME(WEEKDAY, InvoiceDate)
ORDER BY TotalPurchases DESC;

--What are the seasonal revenue trends?
WITH SeasonCTE AS(
SELECT
CASE 
    WHEN DATEPART(Month, InvoiceDate) IN (3,4,5) THEN 'Spring'
    WHEN DATEPART(Month, InvoiceDate) IN (6,7,8) THEN 'Summer'
    WHEN DATEPART(Month, InvoiceDate) IN (9,10,11) THEN 'Fall'
    ELSE 'Winter'
END AS Season,
Total
FROM Invoice)

SELECT
Season,
SUM(Total) AS Total_Revenue
FROM SeasonCTE
GROUP by Season;


