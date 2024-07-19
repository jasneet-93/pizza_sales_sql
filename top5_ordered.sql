--List the top 5 most ordered pizza types along with their quantities.

SELECT TOP 5 pizza_types.name, SUM(order_details.quantity) AS quantity
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id=pizzas.pizza_id
GROUP BY name
ORDER BY quantity DESC;