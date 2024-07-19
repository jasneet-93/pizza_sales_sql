--Determine the top 3 most ordered pizza types based on 
--revenue for each pizza category.
SELECT name,revenue
FROM
(SELECT category,name, revenue,
RANK() OVER (partition BY category ORDER BY  revenue DESC) 
AS rank
FROM
(SELECT pizza_types.category, pizza_types.name, 
SUM(order_details.quantity*pizzas.price) AS revenue
FROM pizzahut..pizza_types
JOIN pizzahut..pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
JOIN pizzahut..order_details
ON order_details.pizza_id=pizzas.pizza_id
GROUP BY pizza_types.category, pizza_types.name) 
AS a)  as b	
where rank<=3;
