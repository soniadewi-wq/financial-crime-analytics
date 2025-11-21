-- Detect rapid consecutive transactions
SELECT user_id, COUNT(*) AS txn_count, SUM(amount) AS total_amount
FROM transactions
WHERE txn_time >= NOW() - INTERVAL '1 day'
GROUP BY user_id
HAVING COUNT(*) > 10;

-- Structuring pattern
SELECT user_id, COUNT(*), SUM(amount)
FROM transactions
WHERE amount < 2000
GROUP BY user_id
HAVING SUM(amount) > 10000;
