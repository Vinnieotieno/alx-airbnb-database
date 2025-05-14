

Objective
Monitor and refine the performance of high-usage queries using `EXPLAIN ANALYZE` and schema optimization techniques.

Monitored Query
```sql
SELECT b.id, u.name, p.name AS property_name, b.start_date, b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.start_date >= '2024-01-01'
ORDER BY b.start_date;
