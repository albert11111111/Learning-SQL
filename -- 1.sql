-- 加上 IF NOT EXISTS，就算运行 100 次也不会报错
CREATE TABLE IF NOT EXISTS stocks (
    id INTEGER PRIMARY KEY,
    ticker TEXT,
    company_name TEXT,
    price REAL
);
-- 2. 往表里插入几行数据
INSERT INTO stocks (ticker, company_name, price) VALUES 
('AAPL', 'Apple Inc', 185.20),
('NVDA', 'NVIDIA Corp', 890.50),
('600519', 'Kweichow Moutai', 1650.00);

-- 3. 查询一下看看
SELECT * FROM stocks;