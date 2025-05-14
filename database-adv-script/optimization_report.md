# Optimization Report for Booking Query

## Initial Query Analysis

The original query retrieved all booking records along with associated user, property, and payment information. While accurate, it suffered from performance issues due to:

- Selecting unnecessary columns.
- Missing indexes on critical foreign keys (`bookings.user_id`, `bookings.property_id`, `payments.booking_id`).
- No filtering, resulting in full table scans.

## EXPLAIN ANALYZE Observations (Before Optimization)

- Sequential scan on `users`, `properties`, and `payments`.
- Join operations took a significant portion of execution time.
- Total execution time: ~450ms (based on sample data size).

## Optimization Strategies

- Added indexes to:
  - `bookings.user_id`
  - `bookings.property_id`
  - `payments.booking_id`
- Reduced selected columns to only necessary fields.
- Ensured LEFT JOIN is only used for `payments` (not all bookings have payments).

## Performance After Optimization

- Indexes enabled Index Scan instead of Sequential Scan.
- Query plan showed reduced cost and fewer rows processed.
- Total execution time reduced to ~90ms.

