-- ecommerce SQL queries (20 queries)
-- Dataset: customers, products, orders, order_items

-- 1) Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 2) Total active customers (
SELECT COUNT(DISTINCT customer_id) AS active_customers
FROM orders;

-- 3) Total revenue
SELECT SUM(total_price) AS total_revenue
FROM order_items;

-- 4) Average Order Value (AOV)
SELECT ROUND(SUM(total_price)*1.0 / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM order_items;

-- 5) Top 10 products by units sold
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC
LIMIT 10;

-- 6) Top 10 customers by spending
SELECT c.customer_id, c.customer_name, SUM(oi.total_price) AS total_spent
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- 7) Orders per month
SELECT SUBSTR(order_date,1,7) AS month,
       COUNT(*) AS orders_count
FROM orders
GROUP BY SUBSTR(order_date,1,7)
ORDER BY month;

-- 8) Revenue by category
SELECT p.category, SUM(oi.total_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 9) Number of repeat customers
SELECT COUNT(*) AS repeat_customers
FROM (
    SELECT customer_id, COUNT(*) AS orders_count
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) t;

-- 10) Customer with highest single order value
SELECT o.order_id, o.customer_id, c.customer_name,
       SUM(oi.total_price) AS order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY o.order_id, o.customer_id, c.customer_name
ORDER BY order_value DESC
LIMIT 1;

-- 11) Best-selling category
SELECT p.category, SUM(oi.total_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC
LIMIT 1;

-- 12) Monthly revenue trend
SELECT SUBSTR(o.order_date,1,7) AS month,
       SUM(oi.total_price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY SUBSTR(o.order_date,1,7)
ORDER BY month;

-- 13) Returning customer percentage
WITH cust_orders AS (
    SELECT customer_id, COUNT(*) AS cnt
    FROM orders
    GROUP BY customer_id
)
SELECT ROUND(
          SUM(CASE WHEN cnt > 1 THEN 1 ELSE 0 END) * 100.0
          / COUNT(*), 2
       ) AS returning_customers_pct
FROM cust_orders;

-- 14) Top products ranked with RANK()
SELECT product_id, product_name, units_sold, rk
FROM (
    SELECT p.product_id, p.product_name,
           SUM(oi.quantity) AS units_sold,
           RANK() OVER (ORDER BY SUM(oi.quantity) DESC) AS rk
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.product_id, p.product_name
)
WHERE rk <= 10
ORDER BY rk;

1-- 5) Category revenue % contribution
WITH category_rev AS (
    SELECT p.category, SUM(oi.total_price) AS revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.category
),
total_rev AS (
    SELECT SUM(revenue) AS total_revenue FROM category_rev
)
SELECT cr.category, cr.revenue,
       ROUND(cr.revenue * 100.0 / tr.total_revenue, 2) AS pct_of_total
FROM category_rev cr, total_rev tr
ORDER BY cr.revenue DESC;

-- 16) Total orders per customer
WITH orders_per_customer AS (
    SELECT customer_id, COUNT(*) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT c.customer_id, c.customer_name, opc.total_orders
FROM orders_per_customer opc
JOIN customers c ON opc.customer_id = c.customer_id
ORDER BY opc.total_orders DESC
LIMIT 20;

-- 17) Products above average revenue
WITH prod_rev AS (
    SELECT product_id, SUM(total_price) AS revenue
    FROM order_items
    GROUP BY product_id
),
avg_rev AS (
    SELECT AVG(revenue) AS avg_revenue FROM prod_rev
)
SELECT p.product_id, p.product_name, pr.revenue
FROM prod_rev pr
JOIN avg_rev ar ON 1=1
JOIN products p ON pr.product_id = p.product_id
WHERE pr.revenue > ar.avg_revenue
ORDER BY pr.revenue DESC;

-- 18) Top 3 products per category
SELECT product_id, product_name, category, revenue, rank_in_category
FROM (
    SELECT p.product_id, p.product_name, p.category,
           SUM(oi.total_price) AS revenue,
           DENSE_RANK() OVER (
               PARTITION BY p.category
               ORDER BY SUM(oi.total_price) DESC
           ) AS rank_in_category
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY p.product_id, p.product_name, p.category
)
WHERE rank_in_category <= 3
ORDER BY category, rank_in_category;

-- 19) Customer Lifetime Value (LTV) 
WITH cust_rev AS (
    SELECT o.customer_id,
           SUM(oi.total_price) AS lifetime_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.customer_id
),
cust_orders AS (
    SELECT customer_id,
           COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT cr.customer_id,
       c.customer_name,
       cr.lifetime_value,
       co.order_count
FROM cust_rev cr
LEFT JOIN cust_orders co ON cr.customer_id = co.customer_id
JOIN customers c ON cr.customer_id = c.customer_id
ORDER BY cr.lifetime_value DESC
LIMIT 20;

-- 20) Executive KPI Summary 
SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM orders) AS total_orders,
    (SELECT ROUND(SUM(total_price),2) FROM order_items) AS total_revenue,
    (SELECT ROUND(SUM(total_price)*1.0 / COUNT(DISTINCT order_id), 2)
       FROM order_items) AS avg_order_value;
