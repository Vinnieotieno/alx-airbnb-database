# Partition Performance Report

Objective
To improve query performance on the large `bookings` table by implementing **table partitioning** based on the `start_date` column.

Implementation
The `bookings` table was partitioned by `RANGE (start_date)` with the following child tables:

- bookings_2023`: For bookings in 2023
- bookings_2024`: For bookings in 2024
- bookings_2025`: For bookings in 2025

Performance Testing
A sample query was tested to fetch bookings between `'2024-01-01'` and `'2024-12-31'`.

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
