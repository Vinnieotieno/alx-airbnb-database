1. Write a query usin INNER JOIN to retrieve all bookings and respective users who made the booking SELECT * FROM Booking INNER JOIN User ON User.user_id = Booking.user_id;

2. Write query using LEFT JOIN to retrieve all properties and their reviews including properties with no Reviews SELECT * FROM Property LEFT JOIN Review ON Property.property_id = Review.property_id;

3. Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user. SELECT * FROM User FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;

4. Write a query to find all properties where the average rating is greater than 4.0 using a subquery. SELECT * FROM Property WHERE property_id IN ( SELECT property_id FROM Review WHERE rating > 4.0 );

5. Write a correlated subquery to find users who have made more than 3 bookings. SELECT _ FROM User WHERE user_id IN ( SELECT user_id FROM Booking GROUP BY user_id HAVING COUNT(_) > 3 );

1. Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause. -- SELECT -- user_id, -- COUNT(*) AS total_bookings -- FROM -- Booking -- GROUP BY -- user_id; SELECT u.user_id, COUNT(b.booking_id) AS total_bookings FROM User u LEFT JOIN Booking b ON u.user_id = b.user_id GROUP BY u.user_id;

2a. Use a window function RANK to rank properties based on the total number of bookings they have received. SELECT property_id, COUNT() AS total_bookings, RANK() OVER ( ORDER BY COUNT() DESC ) AS booking_rank FROM Booking GROUP BY property_id;

2b. Use a window function ROW_NUMBER to rank properties based on the total WITH property_booking_counts AS ( SELECT property_id, COUNT(*) AS total_bookings FROM Booking GROUP BY property_id ) SELECT property_id, total_bookings, ROW_NUMBER() OVER ( ORDER BY total_bookings DESC ) AS booking_rank FROM property_booking_counts;
