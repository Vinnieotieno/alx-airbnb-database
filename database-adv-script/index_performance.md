-- 1. Create indexes on frequently queried columns

-- User table: index on email (commonly used in WHERE clauses for authentication)
CREATE INDEX idx_users_email ON users(email);

-- Booking table: index on user_id and property_id (commonly used in JOINs)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Property table: index on location (used for search filters) and owner_id (JOINs)
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_owner_id ON properties(owner_id);

-- 2. Measure performance before and after indexes

-- Example: Without Index (run before index creation)
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
WHERE location = 'Nakuru';

-- Example: After Index
EXPLAIN ANALYZE
SELECT * FROM properties
WHERE location = 'New York';
