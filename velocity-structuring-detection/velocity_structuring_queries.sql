-- ----------------------------------------------------
-- 1. Rapid consecutive transaction bursts (velocity)
-- ----------------------------------------------------
SELECT 
    user_id,
    COUNT(*) AS txn_count,
    SUM(amount) AS total_amount,
    MIN(txn_time) AS first_txn,
    MAX(txn_time) AS last_txn,
    EXTRACT(EPOCH FROM (MAX(txn_time) - MIN(txn_time))) / 60 AS activity_minutes
FROM transactions
WHERE txn_time >= NOW() - INTERVAL '24 hours'
GROUP BY user_id
HAVING COUNT(*) > 15
   AND (MAX(txn_time) - MIN(txn_time)) <= INTERVAL '30 minutes';

-- ----------------------------------------------------
-- 2. Structuring (smurfing) below reporting thresholds
-- ----------------------------------------------------
SELECT 
    user_id,
    COUNT(*) AS txn_count,
    SUM(amount) AS total_amount
FROM transactions
WHERE amount BETWEEN 100 AND 2000
GROUP BY user_id
HAVING SUM(amount) > 15000;

-- ----------------------------------------------------
-- 3. Circular movement: self-transfer loops
-- ----------------------------------------------------
SELECT 
    t1.user_id AS sender,
    t2.user_id AS receiver,
    COUNT(*) AS loop_count
FROM transactions t1
JOIN transactions t2
      ON t1.receiver_id = t2.user_id
     AND t2.receiver_id = t1.user_id
WHERE t1.txn_time >= NOW() - INTERVAL '7 days'
GROUP BY sender, receiver
HAVING COUNT(*) > 3;

-- ----------------------------------------------------
-- 4. High-frequency micro-deposits from many sources
-- ----------------------------------------------------
SELECT 
    receiver_id,
    COUNT(*) AS incoming_count,
    COUNT(DISTINCT sender_id) AS unique_senders
FROM transactions
WHERE amount < 20
GROUP BY receiver_id
HAVING COUNT(DISTINCT sender_id) > 10;
