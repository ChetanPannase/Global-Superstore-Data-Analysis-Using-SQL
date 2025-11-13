USE indexing;
-- 1.FIND TOTAL REVENUE, QUANTITIES AND PROFIT GENERATED.
SELECT
 sum(sales) as total_revenue,
 sum(Quantity) as total_Quantity,
 sum(profit) as total_profit
FROM SUPERSTORE;

-- 3.FIND THE TOP 3 MOST PROFITABLE PRODUCTS.
SELECT `Product Name` AS Product_Name, Profit
FROM `superstore`
ORDER BY profit DESC
limit 3;

-- 4.HOW MANY ORDERS ARE PLACED AFTER JANUARY 2016.
SELECT 
    COUNT(`Order ID`) AS Orders_After_Jan2016
FROM Superstore
WHERE STR_TO_DATE(`Order Date`, '%d-%m-%Y') > '2016-01-31';

-- 5.How many states from Mexico are under the roof of business.
SELECT 
    COUNT(DISTINCT State) AS States_From_Mexico
FROM SUPERSTORE
WHERE Country = 'Mexico';

 -- 6.which products and subcategories are most and least profitable ?
-- A) Most Profitable Product
SELECT `Product Name`, ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 5;

-- B)Least Profitable Product
SELECT `Product Name`, ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Profit  ASC
LIMIT 5;

-- 7.Which customer segment contributes the most to the total revenue?
SELECT segment,ROUND(SUM(sales), 2) AS Total_sales
FROM SUPERSTORE
GROUP BY segment
ORDER BY Total_sales desc;

-- 8.What is the year-over-year growth in sales and Profit?
SELECT YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Year,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit
FROM SUPERSTORE
GROUP BY Year
ORDER BY Year;

-- 9.Which countries and cities are driving the highest sales?
-- Country
SELECT
country,sum(sales) as total_sales
FROM superstore
GROUP BY country
ORDER BY total_sales desc;

-- cities
SELECT
city,sum(sales) as total_sales
FROM superstore
GROUP BY city
ORDER BY total_sales desc;

-- 10.What is the average delivery time from order to ship date across regions?
SELECT Region, COUNT(*) AS n_orders,
AVG(DATEDIFF(STR_TO_DATE(`Ship Date`,'%d-%m-%Y'),
STR_TO_DATE(`Order Date`,'%d-%m-%Y'))) AS avg_delivery_days
FROM Superstore
GROUP BY Region
ORDER BY avg_delivery_days desc;

-- 11.what is the profit distribution across order priority?
SELECT 
    'Order Priority',
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY 'Order Priority'
ORDER BY Total_Profit DESC;