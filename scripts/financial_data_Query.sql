DESCRIBE processed;

# Top 10 transactions:
SELECT *
FROM processed
LIMIT 10;

# Top 5 high-value transactions:
SELECT *  
FROM processed  
ORDER BY amount DESC  
LIMIT 5;

#Client wise total transactions:
SELECT client_id, COUNT(*) AS total_transactions  
FROM processed  
GROUP BY client_id  
ORDER BY total_transactions DESC  
LIMIT 10;

# State-wise transaction amount:
SELECT merchant_state, SUM(TRY_CAST(amount AS DECIMAL(10,2))) AS total_amount  
FROM processed  
WHERE TRY_CAST(amount AS DECIMAL(10,2)) IS NOT NULL  
GROUP BY merchant_state  
ORDER BY total_amount DESC;

# Monthly transaction count:
SELECT DATE_FORMAT(TRY_CAST(date AS DATE), '%Y-%m') AS month, COUNT(*) AS total_transactions  
FROM processed  
GROUP BY DATE_FORMAT(TRY_CAST(date AS DATE), '%Y-%m')  
ORDER BY month;