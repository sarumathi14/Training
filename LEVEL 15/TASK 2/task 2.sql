SELECT 
    customer_id,
    COUNT(DISTINCT invoice_no) AS order_count,
    SUM(amount) AS total_spent
FROM 
    orders
GROUP BY 
    customer_id
HAVING 
    COUNT(DISTINCT invoice_no) >= 5
ORDER BY 
    total_spent DESC
LIMIT 1;