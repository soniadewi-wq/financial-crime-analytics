-- Baseline average transaction
SELECT user_id, AVG(amount) AS avg_amount, STDDEV(amount) AS std_amount
FROM transactions
GROUP BY user_id;

-- Flag outliers
SELECT user_id, amount
FROM transactions t
JOIN baseline b USING (user_id)
WHERE amount > b.avg_amount + 3*b.std_amount;
