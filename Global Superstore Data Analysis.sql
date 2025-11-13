USE indexing;

-- Global Superstore Data Analysis using SQL

-- 1.FIND THE TOTAL REVENUE GENERATED
SELECT 
SUM(Quantity) AS TOtal_Quantity,
ROUND(SUM(sales), 2) AS Total_Revenue,
ROUND(SUM(profit), 2)  AS Total_Profit
FROM superstore;

-- Find the segment wise distribution of the sales
SELECT Segment, ROUND(SUM(sales), 2) AS Total_sales
FROM superstore
GROUP BY Segment
ORDER BY Total_sales;

-- Find the top 3 most profitable Products.
SELECT `Product Name` AS Product_Name, Profit
FROM `superstore`
ORDER BY profit DESC
limit 3;

-- 4. How many orders are placed after January 2016.
SELECT COUNT(`Order ID`) AS Orders_After_Jan2016
FROM Superstore
WHERE STR_TO_DATE(`Order Date`, '%d-%m-%Y') > '2016-01-31';

-- 5. How many states from Mexico are under the roof of business?
SELECT COUNT(DISTINCT `State`) AS num_states
FROM Superstore
WHERE Country = 'Australia';

-- 6. which products and subcategories are most and least profitable ?
-- Most profitable products
SELECT `Product Name`, ROUND(SUM(Profit), 2) AS Total_Profit
FROM Superstore
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 5;


-- 7. Which customer segment contributes the most to the total revenue?
SELECT segment,ROUND(SUM(sales), 2) AS Total_sales
FROM superstore
GROUP BY segment
ORDER BY Total_sales desc;

-- 8. What is the year-over-year growth in sales and Profit?
SELECT YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Year,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Year
ORDER BY Year;

-- 9. Which countries and cities are driving the highest sales?
-- Top countries
SELECT Country,ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore
GROUP BY Country
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top cities
SELECT Country, City, ROUND(SUM(Sales), 2) AS Total_Revenue
FROM superstore
GROUP BY Country, City
ORDER BY Total_Revenue DESC
LIMIT 20;

-- 10. What is the average delivery time from order to ship date across regions?
SELECT Region, COUNT(*) AS n_orders,
AVG(DATEDIFF(STR_TO_DATE(`Ship Date`,'%d-%m-%Y'),
STR_TO_DATE(`Order Date`,'%d-%m-%Y'))) AS avg_delivery_days
FROM Superstore
GROUP BY Region
ORDER BY avg_delivery_days desc;

-- 11. what is the profit distribution across order priority?
SELECT `Order Priority`,
COUNT(*) AS Num_Orders,
ROUND(SUM(Profit), 2) AS Total_Profit,
ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM superstore
GROUP BY `Order Priority`
ORDER BY Total_Profit DESC;
