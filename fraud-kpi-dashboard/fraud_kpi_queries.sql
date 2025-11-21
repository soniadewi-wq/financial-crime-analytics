-- Fraud loss trend
SELECT DATE(txn_time) AS day, SUM(amount) AS fraud_loss
FROM transactions
WHERE fraud_label = 'fraud'
GROUP BY DATE(txn_time)
ORDER BY day;

-- Alert volume
SELECT rule_name, COUNT(*) AS alerts
FROM alerts
GROUP BY rule_name;
