INNER JOIN

SELECT
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email
FROM
    bookings
INNER JOIN users
    ON bookings.user_id = users.id;




-- 2. Write query using LEFT JOIN to retrieve all properties and their reviews including properties with no Reviews
SELECT
    Property.property_id,
    Property.host_id,
    Property.name,
    Property.description,
    Property.location,
    Property.pricepernight,
    Property.created_at,
    Property.updated_at,
    Review.review_id,
    Review.property_id,
    Review.user_id,
    Review.rating
FROM
    Property
    LEFT JOIN Review ON Property.property_id = Review.property_id
ORDER BY
    Property.property_id DESC;






FULL OUTER JOIN
SELECT
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM
    users
FULL OUTER JOIN bookings
    ON users.id = bookings.user_id;
