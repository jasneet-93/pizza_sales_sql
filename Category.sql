--Join the necessary tables to find the total quantity
--of each pizza category ordered.
SELECT pizza_types.category, SUM(order_details.quantity) AS quantity
FROM pizzahut..pizza_types
JOIN pizzahut..pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
JOIN pizzahut..order_details
ON order_details.pizza_id=pizzas.pizza_id
GROUP BY pizza_types.category 
ORDER BY quantity DESC;