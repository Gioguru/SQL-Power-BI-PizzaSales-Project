Select *
from Pizza_sales


SELECT ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales


SELECT ROUND(SUM(total_price)/COUNT(Distinct(order_id)),2) AS Average_orderValue
FROM pizza_sales


SELECT SUM(quantity) AS Totalpizzasold
FROM pizza_sales

SELECT COUNT(DISTINCT(order_id)) AS Total_orders
FROM pizza_sales


SELECT SUM(quantity)/COUNT(DISTINCT(order_id)) AS Avg_pizzaperorder
FROM pizza_sales

SELECT DATENAME(DW,order_date) As Weekdays, COUNT(Distinct(order_id)) AS numberof_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY numberof_orders DESC


SELECT DATENAME(M,order_date) AS Month, COUNT(DISTINCT(order_id)) AS numberof_orders
FROM pizza_sales
GROUP BY DATENAME(M,order_date)
ORDER BY numberof_orders DESC


SELECT pizza_category,ROUND(SUM(total_price),3) as Total_sales, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales),2) AS Percentage
FROM pizza_sales
WHERE MONTH(order_date) =1
GROUP BY pizza_category
ORDER BY Percentage DESC


SELECT pizza_size,ROUND(SUM(total_price),3) as Total_sales, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales),2) AS Percentage
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) =1
GROUP BY pizza_size
ORDER BY Percentage DESC

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


SELECT top 5 pizza_name, ROUND(SUM(total_price),2) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT TOP 5 pizza_name, ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC


SELECT TOP 5 pizza_name,SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC