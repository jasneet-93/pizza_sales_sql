--Determine the distribution of orders by hour of the day.
SELECT DATEPART(HOUR,orders.time) AS timehour , COUNT(orders.order_id) AS count  from pizzahut..orders
GROUP BY DATEPART(HOUR,orders.time)
ORDER BY DATEPART(HOUR,orders.time) ASC;

