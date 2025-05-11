# Airbnb Clone Database Normalization

## Objective
Normalize the Airbnb Clone database to Third Normal Form (3NF) to eliminate data redundancy and ensure data integrity.



# Third Normal Form (3NF)

**Requirements:**
- Must be in 2NF.
- No transitive dependency (non-key attributes must not depend on other non-key attributes).

**Applied:**

###Example: Properties Table

| property_id | host_id | location | city | country |
|-------------|---------|----------|------|---------|

**Issue:**
- `city` and `country` can be separated into a `Location` table to avoid duplication.

**Fix:**
- Created a `Locations` table:
  - `location_id (PK)`
  - `city`
  - `country`

- Updated `Properties` table to:
  - `property_id (PK)`
  - `host_id (FK)`
  - `location_id (FK)`

---

## Final Tables Overview (Simplified)

- `Users`: user_id, name, email, role, etc.
- `Properties`: property_id, host_id (FK), title, description, location_id (FK), price, etc.
- `Locations`: location_id, city, country
- `Bookings`: booking_id, user_id (FK), property_id (FK), status, start_date, end_date
- `Payments`: payment_id, booking_id (FK), amount, currency, payment_status
- `Reviews`: review_id, booking_id (FK), rating, comment
- `Notifications`: notification_id, user_id (FK), message, type
- `Admins`: admin_id, user_id (FK)

---

##Summary

By breaking down composite and transitive dependencies:
- Redundancy is reduced.
- Data integrity is improved.
- Schema is optimized for scalability.

