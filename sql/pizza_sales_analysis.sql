USE pizza_sales;

CREATE TABLE pizza_sales (
	order_id INT,
    order_date DATE,
    order_time TIME,
    pizza_name VARCHAR(100),
    pizza_category VARCHAR(50),
    pizza_size VARCHAR(10),
    quantity INT,
    total_price DECIMAL (10,2)
);

SHOW TABLES;

select * from pizza_sales.pizza_sales;

1.
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales.pizza_sales;

2.
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_value FROM pizza_sales.pizza_sales;

3.
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales.pizza_sales;

4.
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales.pizza_sales;

5.
SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2))
 AS Avg_Pizza_Per_Order FROM pizza_sales.pizza_sales;


B.1
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales.pizza_sales
GROUP BY 
    DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')),
    DAYOFWEEK(STR_TO_DATE(order_date, '%Y-%m-%d'))
ORDER BY 
    DAYOFWEEK(STR_TO_DATE(order_date, '%Y-%m-%d'));

2. 
SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS month_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales.pizza_sales
GROUP BY 
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY 
    total_orders DESC;

3.
SELECT pizza_category, SUM(total_price)* 100 / (SELECT sum(total_price) FROM pizza_sales.pizza_sales)
AS Percentage FROM pizza_sales.pizza_sales
GROUP BY pizza_category

4. 
SELECT pizza_size, SUM(total_price) AS Total_sales, SUM(total_price) * 100 /  
(SELECT SUM(total_price) FROM pizza_sales.pizza_sales) AS Percentage
FROM pizza_sales.pizza_sales
GROUP BY pizza_size
ORDER BY PERCENTAGE DESC

5. 
SELECT  pizza_name, SUM(total_price) AS Total_REVENUE FROM pizza_sales.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue  DESC
LIMIT 5;

6.
SELECT  pizza_name, SUM(total_price) AS Total_REVENUE FROM pizza_sales.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue  asc
LIMIT 5;








