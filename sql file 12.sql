-- Calculate the percentage contribution of each pizza type to total revenue.

select pizza_types.category , (sum(orders_details.quantity*pizzas.price) / (select round(sum(pizzas.price*orders_details.quantity),2) as total_revanue
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id) ) * 100 as percent_revanue_contribution
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by percent_revanue_contribution desc;