WITH customer_totals AS (
	SELECT
		customers.customer_id,
		customers.name,
		coalesce(SUM(products.price * order_items.quantity), 0) as total_spent
	FROM customers
	LEFT JOIN orders ON customers.customer_id = orders.customer_id
	LEFT JOIN order_items ON orders.order_id = order_items.order_id
	LEFT JOIN products ON order_items.product_id = products.product_id
	GROUP BY customers.customer_id
)
SELECT
	name,
	total_spent,
	CASE
		WHEN total_spent > 2000 THEN 'HIGH VALUE'
		WHEN total_spent >= 1000 THEN 'MEDIUM VALUE'
		WHEN total_spent = 0 THEN 'No Orders'
		ELSE 'Low Value'
	END as customer_segement
FROM customer_totals
ORDER BY total_spent DESC;
