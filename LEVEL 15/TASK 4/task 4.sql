-- Rank customers by total spend and select top 5
WITH CustomerSpending AS (
    SELECT 
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(t.amount) AS total_spend,
        RANK() OVER (ORDER BY SUM(t.amount) DESC) AS spend_rank
    FROM 
        customers c
    JOIN 
        transactions t ON c.customer_id = t.customer_id
    GROUP BY 
        c.customer_id, c.first_name, c.last_name
)
SELECT 
    customer_id,
    customer_name,
    total_spend,
    spend_rank
FROM 
    CustomerSpending
WHERE 
    spend_rank <= 5
ORDER BY 
    spend_rank;