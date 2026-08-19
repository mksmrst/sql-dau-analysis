CREATE TABLE IF NOT EXISTS userentry (
    user_id INT,
    entry_at TIMESTAMP
);

-- Пример тестовых данных
INSERT INTO userentry (user_id, entry_at) VALUES 
(1, '2022-01-01 10:00:00'),
(2, '2022-01-01 12:30:00'),
(1, '2022-01-03 15:00:00');
