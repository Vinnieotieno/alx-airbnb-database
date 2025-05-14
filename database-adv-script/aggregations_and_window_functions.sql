-- 1. Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.
-- SELECT
--     user_id,
--     COUNT(*) AS total_bookings
-- FROM
--     Booking
-- GROUP BY
--     user_id;
SELECT
    u.user_id,
    COUNT(b.booking_id) AS total_bookings
FROM
    User u
    LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY
    u.user_id;

-- 2a. Use a window function RANK to rank properties based on the total number of bookings they have received.
SELECT
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (
        ORDER BY
            COUNT(*) DESC
    ) AS booking_rank
FROM
    Booking
GROUP BY
    property_id;

-- 2b. Use a window function ROW_NUMBER to rank properties based on the total
WITH property_booking_counts AS (
    SELECT
        property_id,
        COUNT(*) AS total_bookings
    FROM
        Booking
    GROUP BY
        property_id
)
SELECT
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (
        ORDER BY
            total_bookings DESC
    ) AS booking_rank
FROM
    property_booking_counts;


