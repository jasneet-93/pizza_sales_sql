--Calculate the percentage contribution of 
--each pizza type to total revenue.

Select pizza_types.category,
ROUND(SUM(order_details.quantity* pizzas.price) /
	(SELECT 
	ROUND(SUM(order_details.quantity*pizzas.price),2) as total_revenue
	FROM pizzahut..order_details 
	JOIN pizzahut..pizzas 
	ON pizzas.pizza_id=order_details.pizza_id)*100,2)
	AS revenue
FROM pizzahut..pizza_types
JOIN pizzahut..pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id

JOIN pizzahut..order_details
ON order_details.pizza_id=pizzas.pizza_id
GROUP  BY category 
ORDER BY revenue DESC;