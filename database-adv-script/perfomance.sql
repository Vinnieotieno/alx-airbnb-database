-- 1. Initial Query (complex join)
-- This query fetches booking details with user, property, and payment information

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    p.id AS property_id,
    p.title AS property_title,
    pay.amount AS payment_amount,
    pay.payment_date
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;

-- 2. Optimized Version (with indexing and leaner SELECT)
-- Ensure indexes exist on bookings.user_id, bookings.property_id, payments.booking_id

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.name AS user_name,
    p.title AS property_title,
    pay.amount,
    pay.payment_date
FROM 
    bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;
