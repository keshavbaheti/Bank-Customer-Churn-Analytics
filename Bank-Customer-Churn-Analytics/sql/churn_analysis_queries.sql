
-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customer_churn;

-- Churn Rate
SELECT 
    ROUND(
        SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn;

-- Geography Wise Churn
SELECT 
    geography,
    COUNT(*) AS customers,
    SUM(exited) AS churned_customers
FROM customer_churn
GROUP BY geography
ORDER BY churned_customers DESC;

-- Average Balance By Churn
SELECT
    exited,
    ROUND(AVG(balance),2) AS avg_balance
FROM customer_churn
GROUP BY exited;

-- Age Group Churn
SELECT
    age,
    COUNT(*) AS total_customers,
    SUM(exited) AS churned
FROM customer_churn
GROUP BY age
ORDER BY churned DESC
LIMIT 10;
