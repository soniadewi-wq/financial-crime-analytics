-- Incoming sources count
SELECT beneficiary_id, COUNT(DISTINCT sender_id) AS unique_sources
FROM transactions
GROUP BY beneficiary_id
HAVING COUNT(DISTINCT sender_id) > 5;

-- High-velocity outflow after receiving
SELECT t1.beneficiary_id, t1.amount AS inbound, t2.amount AS outbound, t2.txn_time - t1.txn_time AS time_diff
FROM transactions t1
JOIN transactions t2
    ON t1.beneficiary_id = t2.sender_id
    AND t2.txn_time BETWEEN t1.txn_time AND t1.txn_time + INTERVAL '1 hour';
