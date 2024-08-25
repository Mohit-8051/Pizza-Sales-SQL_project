-- Determine the top 3 most ordered pizza types based on revenue.

select pizza_types.name , sum(orders_details.quantity*pizzas.price) as revanue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by revanue desc limit 3;
