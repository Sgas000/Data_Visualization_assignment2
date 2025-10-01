-- 1) Pie Chart: Distribution of Clients by Payment Type
-- Shows how clients are distributed by their chosen payment methods
SELECT COUNT(c.customer_id) AS number_of_clients, op.payment_type
FROM olist_customers_dataset AS c 
JOIN olist_orders_dataset AS o ON c.customer_id = o.customer_id 
JOIN olist_order_payments_dataset AS op ON o.order_id = op.order_id
GROUP BY op.payment_type;


-- 2) Bar Chart: Top 10 Cities by Number of Customers with Orders
-- Shows the top 10 cities with the highest number of unique customers who placed orders
SELECT c.customer_city, COUNT(DISTINCT o.customer_id) AS customers_with_orders
FROM olist_orders_dataset o
JOIN olist_customers_dataset c ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
GROUP BY c.customer_city
ORDER BY customers_with_orders DESC
LIMIT 10;


-- 3) Horizontal Bar Chart: Top 10 Sellers by Revenue
-- Shows the top 10 sellers ranked by total revenue (based on ordered product prices)
SELECT s.seller_id, s.seller_city, ROUND(SUM(oi.price)::numeric,2) AS revenue
FROM olist_order_items_dataset oi
JOIN olist_sellers_dataset s ON oi.seller_id = s.seller_id
JOIN olist_orders_dataset o ON oi.order_id = o.order_id
GROUP BY s.seller_id, s.seller_city
ORDER BY revenue DESC
LIMIT 10;


-- 4) Line Chart: Monthly Total Sales
-- Shows the trend of total sales aggregated by month
SELECT to_char(DATE_TRUNC('month', o.order_purchase_timestamp), 'YYYY-MM') AS month,
       ROUND(SUM(oi.price)::numeric,2) AS total_sales
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;


-- 5) Histogram: Distribution of Product Description Length
-- Shows the distribution of product description lengths for sold products
SELECT p.product_description_length
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p ON oi.product_id = p.product_id
JOIN olist_orders_dataset o ON oi.order_id = o.order_id
WHERE p.product_description_length IS NOT NULL;


-- 6) Scatter Plot: Price vs Freight Value by Product Category
-- Shows the relationship between product price and freight value, colored by product category
SELECT oi.price, oi.freight_value, p.product_category_name
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p ON oi.product_id = p.product_id
JOIN olist_orders_dataset o ON oi.order_id = o.order_id
WHERE oi.price IS NOT NULL AND oi.freight_value IS NOT NULL
LIMIT 500;


-- 7) Line Chart (Plotly): Monthly Sales by Top 5 Product Categories
-- Shows the monthly sales trend for the top 5 product categories
SELECT to_char(DATE_TRUNC('month', o.order_purchase_timestamp), 'YYYY-MM') AS month,
       p.product_category_name,
       ROUND(SUM(oi.price)::numeric, 2) AS sales
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi ON o.order_id = oi.order_id
JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY month, p.product_category_name
ORDER BY month;
