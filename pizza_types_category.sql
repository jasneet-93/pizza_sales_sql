--Join relevant tables to find the category-wise distribution of pizzas.
SELECT pizza_types.category, COUNT(pizza_types.name) AS name
FROM pizzahut..pizza_types
GROUP BY category;