
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 123;

-- Example: After Index
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE user_id = 123;

-- Example: Without Index
EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'New York';

-- Example: After Index
EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'Nakuru';
