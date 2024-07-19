--Identify the highest-priced pizza
SELECT TOP 1 pizza_types.name,ROUND(pizzas.price,2) AS price
FROM pizza_types 
JOIN pizzas
ON pizza_types.pizza_type_id=pizzas.pizza_type_id
ORDER BY pizzas.price DESC;