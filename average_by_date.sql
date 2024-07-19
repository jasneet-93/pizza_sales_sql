--Group the orders by date and 
--calculate the average number of pizzas ordered per day.
SELECT AVG(total) AS average from 
(SELECT orders.date, SUM(order_details.quantity ) AS total
FROM pizzahut..orders
JOIN pizzahut..order_details
ON orders.order_id=order_details.order_id
GROUP BY date) AS order_quantity;