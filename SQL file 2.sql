-- Retrieve the total number of orders placed.

use pizzahut;
select count(order_id) as total_orders
from orders;