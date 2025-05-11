Key Entities & Their Attributes
User

id (PK)

name

email

password_hash

role (guest/host/admin)

profile_photo

phone_number

created_at

updated_at

Property

id (PK)

user_id (FK - Host)

title

description

location

price_per_night

amenities

availability_start

availability_end

image_url

created_at

updated_at

Booking

id (PK)

user_id (FK - Guest)

property_id (FK)

start_date

end_date

total_price

status (pending/confirmed/canceled/completed)

created_at

updated_at

Payment

id (PK)

booking_id (FK)

payment_method

amount

currency

status

created_at

updated_at

Review

id (PK)

booking_id (FK)

user_id (FK - Guest)

property_id (FK)

rating

comment

created_at

Notification

id (PK)

user_id (FK)

type (booking, cancellation, payment, etc.)

message

is_read (boolean)

created_at

Admin (Optional - or as part of User role)

   Relationships
A User can be a Guest, Host, or Admin (role-based).

A User (Host) can list multiple Properties (1:N).

A User (Guest) can make multiple Bookings (1:N).

A Property can have many Bookings, one per guest per date (1:N).

A Booking can have one Payment (1:1).

A Booking can have one Review (1:1).

A Property can have many Reviews (1:N).

A User can receive many Notifications (1:N).



file:///C:/Users/Vincent/Downloads/airbnb_clone_erd.pdf
