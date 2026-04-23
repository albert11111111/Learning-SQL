SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

SELECT * FROM track LIMIT 10;

SELECT * FROM track WHERE unit_price > 1;

SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'track';

SELECT genre_id, count(*) AS times
FROM track 
GROUP BY genre_id
ORDER BY times DESC
LIMIT 10;

SELECT 
    genre_id, 
    count(*) AS total_songs,                -- 算出数量
    ROUND(AVG(unit_price), 2) AS avg_price   -- 算出平均价并保留两位小数
FROM track 
GROUP BY genre_id
ORDER BY total_songs DESC, avg_price DESC;                 -- 按数量从多到少排

SELECT * FROM invoice 
WHERE customer_id >= 10 AND total >= 5
ORDER BY customer_id, total DESC
LIMIT 10;

SELECT 
    i.invoice_id, 
    c.first_name, 
    c.last_name, 
    i.total
FROM invoice AS i
JOIN customer AS c ON i.customer_id = c.customer_id
WHERE i.total > 15
ORDER BY i.total DESC;

SELECT count(*) AS num, count(composer) as num_composer,
count(*) - count(composer) AS no_name
FROM track;

UPDATE track
SET composer = 'Unknown'
WHERE composer IS NULL;

SELECT 
    count(*) AS num, 
    count(composer) AS num_composer,
    count(*) - count(composer) AS no_name
FROM track;

-- 1. 开启事务
BEGIN;

-- 2. 尝试涨价（假设我们想把 0.99 的歌涨到 1.09）
UPDATE track 
SET unit_price = 1.09 
WHERE unit_price = 0.99;

-- 3. 检查一下改了多少行（看看有没有手滑）
SELECT count(*) FROM track WHERE unit_price = 1.09;

-- 4. 如果你觉得刚才改错了（比如想改成 1.19），运行这一行：
ROLLBACK;


SELECT 
    i.invoice_id AS "订单号", 
    e.first_name AS "姓"
FROM invoice AS i
JOIN customer AS c ON i.customer_id = c.customer_id   -- 第一座桥：连专辑
JOIN employee AS e ON c.support_rep_id = e.employee_id;  -- 第二座桥：连流派


SELECT 
    i.invoice_id, 
    i.total,
    e.first_name || ' ' || e.last_name AS "负责员工"
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id
JOIN employee e ON c.support_rep_id = e.employee_id
ORDER BY i.total DESC;