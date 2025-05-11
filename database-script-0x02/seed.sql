-- USERS
INSERT INTO users (full_name, email, password, role, profile_photo, contact_info)
VALUES 
('Vincent Otieno', 'vincent@otieno.com', 'hashed_password1', 'guest', 'https://example.com/photo1.jpg', 'vincent_contact'),
('Steve Bico', 'steve@bico.com', 'hashed_password2', 'host', 'https://example.com/photo2.jpg', 'steve_contact'),
('Charlie Admin', 'admin@example.com', 'hashed_password3', 'admin', 'https://example.com/photo3.jpg', 'admin_contact');

-- LOCATIONS
INSERT INTO locations (city, country)
VALUES 
('Nairobi', 'Kenya'),
('Cape Town', 'South Africa'),
('Lagos', 'Nigeria');

-- ADMINS
INSERT INTO admins (user_id, permissions)
VALUES (3, 'all');

-- PROPERTIES
INSERT INTO properties (host_id, title, description, price, amenities, availability_start, availability_end, location_id)
VALUES 
(2, 'Modern Apartment in Nairobi', 'Spacious 2-bedroom apartment with a view', 65.00, ARRAY['Wi-Fi', 'Pool', 'Balcony'], '2025-05-01', '2025-12-31', 1),
(2, 'Cozy Cottage in Cape Town', 'Rustic charm with modern amenities', 80.00, ARRAY['Wi-Fi', 'Fireplace', 'Pet-friendly'], '2025-06-01', '2025-09-30', 2);

-- BOOKINGS
INSERT INTO bookings (guest_id, property_id, status, start_date, end_date)
VALUES 
(1, 1, 'confirmed', '2025-06-10', '2025-06-15'),
(1, 2, 'pending', '2025-07-05', '2025-07-10');

-- PAYMENTS
INSERT INTO payments (booking_id, amount, currency, payment_status)
VALUES 
(1, 325.00, 'USD', 'paid'),
(2, 400.00, 'USD', 'pending');

-- REVIEWS
INSERT INTO reviews (booking_id, rating, comment)
VALUES 
(1, 5, 'Excellent place! Very clean and quiet.'),
(2, 4, 'Nice location, a few maintenance issues.');

-- NOTIFICATIONS
INSERT INTO notifications (user_id, message, type)
VALUES 
(1, 'Your booking has been confirmed.', 'booking'),
(2, 'You received a new booking request.', 'host'),
(1, 'Your payment is being processed.', 'payment');

