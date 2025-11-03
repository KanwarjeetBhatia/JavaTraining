use FDTP;

/* a. Display all customers from Mumbai */
SELECT first_name, last_name, city
FROM Customer
WHERE city = 'Mumbai';

/*Show menu items that take more than 20 minutes to prepare*/
SELECT item_name, prep_time_minutes
FROM Menu_Item
WHERE prep_time_minutes > 20;

/*List all orders with total amount greater than ₹200*/
SELECT order_id, total_amount, status
FROM `Order`
WHERE total_amount > 200;

/*JOIN Queries*/

/*Show customer names with their restaurant and total order amount*/

SELECT c.first_name, c.last_name, r.name AS restaurant_name, o.total_amount
FROM Customer c
JOIN `Order` o ON c.customer_id = o.customer_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id;


/*Find all order items with restaurant and item details*/

SELECT oi.order_item_id, r.name AS restaurant, mi.item_name, oi.quantity
FROM Order_Item oi
JOIN `Order` o ON oi.order_id = o.order_id
JOIN Restaurant r ON o.restaurant_id = r.restaurant_id
JOIN Menu_Item mi ON oi.item_id = mi.item_id;


/*Subqueries*/

/*Show customers who placed orders totaling more than ₹250*/

SELECT first_name, last_name
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM `Order`
    WHERE total_amount > 250
);


/*Find the most popular menu item (ordered the most) */


SELECT mi.item_name, COUNT(oi.order_item_id) AS times_ordered
FROM Order_Item oi
JOIN Menu_Item mi ON oi.item_id = mi.item_id
GROUP BY mi.item_name
ORDER BY times_ordered DESC
LIMIT 1;








