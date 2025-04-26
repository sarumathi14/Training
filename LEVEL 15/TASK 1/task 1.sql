SELECT 
    COUNT(DISTINCT invoice_no) AS total_orders,
    SUM(amount) AS total_revenue,
    ROUND(SUM(amount) / COUNT(DISTINCT invoice_no), 2) AS average_order_value
FROM 
    orders;