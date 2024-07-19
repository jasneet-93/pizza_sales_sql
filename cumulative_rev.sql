--Analyze the cumulative revenue generated over time.
SELECT date,
SUM(revenue) OVER(order by date) AS cumulative_rev
FROM
(SELECT orders.date,
SUM(order_details.quantity*pizzas.price) AS revenue
FROM pizzahut..orders
JOIN pizzahut..order_details
ON orders.order_id=order_details.order_id
JOIN pizzahut..pizzas
ON pizzas.pizza_id=order_details.pizza_id
GROUP BY date
) AS sales;