---------------------------------------------------------
-- 03_audit_queries.sql
-- Audit and monitoring queries for Smart Toll System
---------------------------------------------------------

-- 1. View audit log entries
SELECT * FROM audit_log ORDER BY timestamp DESC;

-- 2. Detect updates made to vehicles
SELECT *
FROM audit_log
WHERE table_name = 'VEHICLES'
ORDER BY timestamp DESC;

-- 3. Detect attempts to delete payments 
SELECT *
FROM audit_log
WHERE action_type = 'DELETE'
  AND table_name = 'PAYMENTS'
ORDER BY timestamp DESC;

-- 4. Detect operations done on weekends 
SELECT *
FROM audit_log
WHERE action_type = 'RESTRICTED_OPERATION'
ORDER BY timestamp DESC;

-- 5. View logs for unpaid fines
SELECT v.plate_number, f.violation_type, f.fine_amount
FROM vehicle_fine f
JOIN vehicles v ON f.vehicle_id = v.vehicle_id
WHERE fine_status = 'UNPAID';

-- 6. Identify vehicles with repeated violations
SELECT vehicle_id, COUNT(*) AS violation_count
FROM vehicle_fine
GROUP BY vehicle_id
HAVING COUNT(*) >= 2
ORDER BY violation_count DESC;

