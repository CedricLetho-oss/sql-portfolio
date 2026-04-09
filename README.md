# sql-portfolio
Project Title
Customer Segmentation Analysis for E-commerce Business

1. Problem Statement
"The business wants to identify high-value customers for a loyalty program. They need to segment customers based on their total spending and identify who has never ordered."

2. Data Source
Sample e-commerce Mock data with 6 customers, 5 orders, and 5 products. 

3. Approach
Joined 4 tables: customers, orders, order_items, products

Used LEFT JOIN to keep customers with no orders

Calculated total spent per customer using SUM and multiplication

Used COALESCE to convert NULL to 0 for non-ordering customers

Applied CASE logic to create 4 customer segments

Ordered by total spend descending to highlight top customers
