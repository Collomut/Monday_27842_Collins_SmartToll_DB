---------------------------------------------------------
-- 09_test_scripts.sql
-- FULL TEST SUITE FOR SMART TOLL SYSTEM
-- Author: Mutinda Collins (27842)
-- PDB: WED_27842_Collins_smarttoll_db
---------------------------------------------------------

SET SERVEROUTPUT ON;

---------------------------------------------------------
-- 1. BASIC INSERT TESTS
---------------------------------------------------------

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- BASIC INSERT TESTS ---');
END;
/

-- Insert test vehicle
INSERT INTO vehicles (plate_number, owner_name, vehicle_type)
VALUES ('TST001A', 'Test User', 'SUV');

-- Insert test toll gate
INSERT INTO toll_gates (location, road_name, lane_count)
VALUES ('Test Toll Gate', 'Test Highway', 3);

-- Insert test fine
INSERT INTO vehicle_fine (vehicle_id, fine_amount, violation_type, fine_status)
VALUES (
    (SELECT vehicle_id FROM vehicles WHERE plate_number = 'TST001A'),
    5000,
    'Overspeeding',
    'UNPAID'
);

-- Insert test payment
INSERT INTO payments (vehicle_id, amount, payment_type, reference_no)
VALUES (
    (SELECT vehicle_id FROM vehicles WHERE plate_number = 'TST001A'),
    1200,
    'TOLL',
    'TESTREF-2025'
);

COMMIT;

---------------------------------------------------------
-- 2. TEST FUNCTIONS
---------------------------------------------------------

DECLARE
    v_count NUMBER;
    v_allowed BOOLEAN;
    v_last_gate VARCHAR2(100);
    v_monthly NUMBER;
    v_revenue NUMBER;
    v_exists BOOLEAN;
    v_summary VARCHAR2(300);
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- FUNCTION TESTS ---');

    -- Get violation count
    SELECT get_violation_count((SELECT vehicle_id FROM vehicles WHERE plate_number='TST001A'))
    INTO v_count FROM dual;
    DBMS_OUTPUT.PUT_LINE('Violation Count: ' || v_count);

    -- Operation allowed?
    v_allowed := is_operation_allowed;
    DBMS_OUTPUT.PUT_LINE('Operation Allowed Today: ' || CASE WHEN v_allowed THEN 'YES' ELSE 'NO' END);

    -- Last gate visited
    v_last_gate := last_gate_visited((SELECT vehicle_id FROM vehicles WHERE plate_number='TST001A'));
    DBMS_OUTPUT.PUT_LINE('Last Gate Visited: ' || v_last_gate);

    -- Monthly fine total
    v_monthly := monthly_fine_total(EXTRACT(YEAR FROM SYSDATE), EXTRACT(MONTH FROM SYSDATE));
    DBMS_OUTPUT.PUT_LINE('Monthly Fine Total: ' || v_monthly);

    -- Total revenue
    v_revenue := total_revenue;
    DBMS_OUTPUT.PUT_LINE('Total Revenue: ' || v_revenue);

    -- Vehicle exists?
    v_exists := vehicle_exists('TST001A');
    DBMS_OUTPUT.PUT_LINE('Vehicle Exists: ' || CASE WHEN v_exists THEN 'YES' ELSE 'NO' END);

    -- Vehicle summary
    v_summary := vehicle_summary((SELECT vehicle_id FROM vehicles WHERE plate_number='TST001A'));
    DBMS_OUTPUT.PUT_LINE('Vehicle Summary: ' || v_summary);
END;
/

---------------------------------------------------------
-- 3. TEST PROCEDURES (PACKAGE)
---------------------------------------------------------

DECLARE
    v_log_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- PACKAGE PROCEDURE TESTS ---');

    -- Record toll entry
    toll_pkg.record_toll_entry('TST001A', 
        (SELECT gate_id FROM toll_gates WHERE ROWNUM = 1),
        v_log_id
    );
    DBMS_OUTPUT.PUT_LINE('Toll Entry Created. Log ID: ' || v_log_id);

    -- Process toll payment
    toll_pkg.process_toll_payment('TST001A', v_log_id);
    DBMS_OUTPUT.PUT_LINE('Payment Processing Completed.');
END;
/

---------------------------------------------------------
-- 4. TEST TRIGGERS
---------------------------------------------------------

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TRIGGER TESTS ---');
END;
/

-- Test BEFORE UPDATE trigger
UPDATE vehicle_fine
SET fine_amount = fine_amount + 200
WHERE fine_id = (SELECT MIN(fine_id) FROM vehicle_fine);

-- Test BEFORE DELETE on payments (should block on weekend/holiday)
BEGIN
    DELETE FROM payments WHERE reference_no = 'TESTREF-2025';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('DELETE BLOCKED BY TRIGGER: ' || SQLERRM);
END;
/

---------------------------------------------------------
-- 5. TEST VIEWS
---------------------------------------------------------

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- VIEW TESTS ---');
END;
/

SELECT * FROM vw_daily_traffic_summary FETCH FIRST 5 ROWS ONLY;
SELECT * FROM vw_toll_activity FETCH FIRST 5 ROWS ONLY;
SELECT * FROM vw_unpaid_fines FETCH FIRST 5 ROWS ONLY;
SELECT * FROM vw_gate_usage FETCH FIRST 5 ROWS ONLY;
SELECT * FROM vw_violation_summary FETCH FIRST 5 ROWS ONLY;

---------------------------------------------------------
-- 6. TEST REPORTS
---------------------------------------------------------

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- REPORT TESTS ---');
END;
/

-- Revenue report
SELECT SUM(amount) AS total_revenue FROM payments;

-- Vehicles with highest fines
SELECT * FROM vw_violation_summary ORDER BY total_fine_amount DESC FETCH FIRST 5 ROWS ONLY;

-- Full history
SELECT * FROM vw_toll_activity WHERE plate_number='TST001A';

---------------------------------------------------------
-- END OF TEST SUITE
---------------------------------------------------------

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- TEST SUITE COMPLETED SUCCESSFULLY ---');
END;
/
