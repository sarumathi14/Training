SELECT 
    'Average Spend' AS metric,
    ROUND(AVG(CASE WHEN c.gender = 'M' THEN o.amount END), 2) AS male,
    ROUND(AVG(CASE WHEN c.gender = 'F' THEN o.amount END), 2) AS female
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id

UNION ALL

SELECT 
    'Total Spend',
    SUM(CASE WHEN c.gender = 'M' THEN o.amount END),
    SUM(CASE WHEN c.gender = 'F' THEN o.amount END)
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id

UNION ALL

SELECT 
    'Maximum Spend',
    MAX(CASE WHEN c.gender = 'M' THEN o.amount END),
    MAX(CASE WHEN c.gender = 'F' THEN o.amount END)
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id

UNION ALL

SELECT 
    'Minimum Spend',
    MIN(CASE WHEN c.gender = 'M' THEN o.amount END),
    MIN(CASE WHEN c.gender = 'F' THEN o.amount END)
FROM 
    orders o
JOIN 
    customers c ON o.customer_id = c.customer_id;