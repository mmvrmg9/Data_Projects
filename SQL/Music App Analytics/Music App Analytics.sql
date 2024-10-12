-- Show customers who are not in the US
SELECT * 

FROM customers
WHERE Country <> 'USA'
;

-- Brazil only customers
SELECT * 

FROM chinook.customers
WHERE Country = 'Brazil' 
;

-- Invoices from Brazillian customers
SELECT FirstName, LastName, Invoiceid, InvoiceDate, BillingCountry

FROM chinook.customers AS cust

LEFT JOIN chinook.invoices AS invoi
ON cust.Customerid = invoi.Customerid

WHERE Country = 'Brazil'
;

-- Employees who are Sales Agents
SELECT FirstName, LastName, Title

FROM chinook.employees AS employ
WHERE employ.Title LIKE '%Sales%'
;

-- Unique list of billing countries
SELECT DISTINCt BillingCountry

FROM chinook.invoices AS invoi
;

-- Invoices associated with each sales agents
SELECT employ.FirstName, employ.LastName, invoy.Invoiceid
FROM chinook.employees AS employ

LEFT JOIN chinook.customers AS cust
ON employ.EmployeeId = cust.CustomerId

LEFT JOIN chinook.invoices AS invoy
ON cust.CustomerId = invoy.CustomerId
;

-- Total spent by customers, the country they are from and the sales assistant related to the invoice
SELECT chinook.invoices.InvoiceId, chinook.customers.FirstName,
chinook.customers.LastName,
chinook.invoices.Total,
chinook.employees.FirstName, chinook.employees.LastName

FROM chinook.employees


LEFT JOIN chinook.customers
ON chinook.employees.EmployeeId = chinook.customers.SupportRepId

LEFT JOIN chinook.invoices
ON chinook.customers.CustomerId = chinook.invoices.CustomerId

WHERE chinook.invoices.InvoiceId IS NOT NULL

GROUP BY chinook.invoices.InvoiceId

;

-- Amount of invoices in 2009
SELECT COUNT(*) AS total_invoices

FROM chinook.invoices

WHERE InvoiceDate LIKE '%2009%'
;


-- Total sales in 2009
SELECT SUM(Total) AS total_sales
FROM chinook.Invoices
WHERE InvoiceDate LIKE '%2009%'
;


-- Invoice Line IDs and their respective track name

SELECT chinook.invoice_items.InvoiceLineId, chinook.tracks.Name 

FROM chinook.tracks

JOIN chinook.invoice_items
ON chinook.tracks.TrackId = chinook.invoice_items.TrackId  

;

-- Invoice Line IDs, artist name and their respective track name

SELECT chinook.artists.Name,  chinook.tracks.Name AS Track, chinook.invoice_items.InvoiceLineId

FROM chinook.invoice_items

LEFT JOIN chinook.tracks
ON chinook.invoice_items.TrackId = chinook.tracks.TrackId  

INNER JOIN chinook.albums
ON chinook.albums.AlbumId = chinook.tracks.AlbumId 

LEFT JOIN chinook.artists
ON chinook.artists.ArtistId = chinook.albums.ArtistId 

WHERE InvoiceLineId

;

-- Tracks, Album name, Media and Genre

SELECT track.Name AS 'Track Name', album.Title AS 'Album Title',
mediat.Name AS 'Media Type', genr.Name AS 'Genre'

FROM chinook.tracks track

JOIN chinook.Albums album 
on album.AlbumId = track.AlbumId

JOIN chinook.Media_Types mediat
on mediat.MediaTypeId = track.MediaTypeId

JOIN chinook.Genres genr
on genr.GenreId = track.GenreId
;


