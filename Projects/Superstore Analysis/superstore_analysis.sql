--Orders the items by price

SELECT item_name, price
FROM superstore
ORDER BY price ASC
;


--Different aggregations showing sum, average, minimum, maximum, or count of item prices

SELECT SUM(price)
FROM superstore
;
SELECT AVG(price)
FROM superstore
;
SELECT MIN(price)
FROM superstore
;
SELECT MAX(price)
FROM superstore
;
SELECT COUNT(price)
FROM superstore
;

--Average price for items in the category of "Kitchen Supplies".

SELECT category, AVG(price)
FROM superstore
WHERE category = "Kitchen Supplies"
;

--The descending average price of all categories of items in the database to find out which category is the most expensive


SELECT category AS Category, AVG(price) AS Average_Price
FROM superstore
GROUP BY category
ORDER BY Average_Price DESC
;

