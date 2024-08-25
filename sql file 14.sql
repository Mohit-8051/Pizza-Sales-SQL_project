-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
 
select name ,category,revanue from
 (select category, name , revanue,
 rank() over(partition by category order by revanue desc ) as rnk
 from
(select pizza_types.category,pizza_types.name , sum(orders_details.quantity*pizzas.price) as revanue
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.category,pizza_types.name) as a) as b
where rnk<=3;
