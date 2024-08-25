-- Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(pizzas.price * orders_details.quantity),
            2) AS total_revanue
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id;