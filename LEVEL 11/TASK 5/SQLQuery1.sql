-- Bonus: Example with multiple months showing monthly running totals
INSERT INTO sales VALUES
(5, '2023-11-01', 250),
(6, '2023-11-02', 175);

WITH monthly_sales AS (
    SELECT 
        sale_date,
        amount,
        (sale_date) AS month
    FROM sales
)
SELECT 
    sale_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY month 
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS monthly_running_total,
    SUM(amount) OVER (
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS overall_running_total
FROM monthly_sales
ORDER BY sale_date;