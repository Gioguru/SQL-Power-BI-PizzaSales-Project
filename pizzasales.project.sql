Select *
from Pizza_sales

-- Total Revenue
SELECT ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales

--Average Order Value
SELECT ROUND(SUM(total_price)/COUNT(Distinct(order_id)),2) AS Average_orderValue
FROM pizza_sales

--Total number of orders
SELECT SUM(quantity) AS Totalpizzasold
FROM pizza_sales

SELECT COUNT(DISTINCT(order_id)) AS Total_orders
FROM pizza_sales

--Avg pizza per order
SELECT SUM(quantity)/COUNT(DISTINCT(order_id)) AS Avg_pizzaperorder
FROM pizza_sales

--Number of Orders by Weekdays
SELECT DATENAME(DW,order_date) As Weekdays, COUNT(Distinct(order_id)) AS numberof_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY numberof_orders DESC

-- total orders by months
SELECT DATENAME(M,order_date) AS Month, COUNT(DISTINCT(order_id)) AS numberof_orders
FROM pizza_sales
GROUP BY DATENAME(M,order_date)
ORDER BY numberof_orders DESC

--Total Sales by pizza Category
SELECT pizza_category,ROUND(SUM(total_price),3) as Total_sales, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales),2) AS Percentage
FROM pizza_sales
WHERE MONTH(order_date) =1
GROUP BY pizza_category
ORDER BY Percentage DESC

--Total Sales By Pizza Size 
SELECT pizza_size,ROUND(SUM(total_price),3) as Total_sales, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price)
FROM pizza_sales),2) AS Percentage
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) =1
GROUP BY pizza_size
ORDER BY Percentage DESC
--Total Quantity Sold by pizza category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 most Sold Pizza
SELECT top 5 pizza_name, ROUND(SUM(total_price),2) AS Total_Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Bottom 5 most sold Pizza
SELECT TOP 5 pizza_name, ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--Bottom 5 Pizza by total orders
SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders ASC

--Top 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_orders DESC

--Top 5 Pizzas by total quantity
SELECT TOP 5 pizza_name,SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity DESC

--Bottom 5 Pizzas by total quantity
SELECT TOP 5 pizza_name,SUM(quantity) AS Total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_quantity ASC