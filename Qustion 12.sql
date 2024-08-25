-- Analyze the cumulative revenue generated over time.
select order_date,
round(sum(revanue)over(order by order_date),2) as cum_revanue
from
(select orders.order_date , round(sum(orders_details.quantity*pizzas.price),2) as revanue
from orders_details join pizzas
on orders_details.pizza_id = pizzas.pizza_id
join orders 
on orders.order_id = orders_details.order_id
group by orders.order_date) as sales;
