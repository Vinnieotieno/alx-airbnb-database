-- Dropping old bookings table 
DROP TABLE IF EXISTS bookings CASCADE;

-- 1. Create partitioned bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions
CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 3. (Optional) Insert sample data
INSERT INTO bookings (user_id, property_id, start_date, end_date, status)
VALUES 
(1, 2, '2023-04-15', '2023-04-20', 'confirmed'),
(2, 4, '2024-06-01', '2024-06-10', 'confirmed'),
(3, 5, '2025-03-20', '2025-03-25', 'cancelled');

-- 4. Analyze query performance
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
