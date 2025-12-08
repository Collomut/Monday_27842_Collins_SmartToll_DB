## Procedures
##1.add_payment

create or replace PROCEDURE add_payment(
    p_vehicle_id NUMBER,
    p_amount NUMBER,
    p_type VARCHAR2,
    p_ref VARCHAR2
)
IS
BEGIN
    INSERT INTO payments(vehicle_id, amount, payment_type, payment_date, reference_no)
    VALUES(p_vehicle_id, p_amount, p_type, SYSDATE, p_ref);
END;

##2.add_toll_gate

create or replace PROCEDURE add_toll_gate(
    p_location VARCHAR2,
    p_road VARCHAR2,
    p_lanes NUMBER
)
IS
BEGIN
    INSERT INTO toll_gates(location, road_name, lane_count)
    VALUES(p_location, p_road, p_lanes);
END;

##3.change vehicle owner

create or replace PROCEDURE change_owner(
    p_vehicle_id NUMBER,
    p_new_owner  VARCHAR2
)
IS
BEGIN
    UPDATE vehicles
    SET owner_name = p_new_owner
    WHERE vehicle_id = p_vehicle_id;
END;

##4. clear vehicle logs 
create or replace PROCEDURE clear_vehicle_logs(p_vehicle_id NUMBER)
IS
BEGIN
    DELETE FROM toll_logs
    WHERE vehicle_id = p_vehicle_id;
END;

##5.Delete Vehicle

create or replace PROCEDURE delete_vehicle(p_plate VARCHAR2)
IS
BEGIN
    DELETE FROM vehicles
    WHERE UPPER(plate_number) = UPPER(p_plate);
END;

##6.mark fine as paid

create or replace PROCEDURE mark_fine_paid(p_fine_id NUMBER)
IS
BEGIN
    UPDATE vehicle_fine
    SET fine_status = 'PAID'
    WHERE fine_id = p_fine_id;
END;

##7.Show Payments

create or replace PROCEDURE show_payments(p_vehicle_id NUMBER)
IS
BEGIN
    FOR r IN (
        SELECT amount, payment_type, payment_date
        FROM payments
        WHERE vehicle_id = p_vehicle_id
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Amount: '||r.amount||' | Type: '||r.payment_type||' | Date: '||r.payment_date
        );
    END LOOP;
END;

##8.Show Unpaid Fines

create or replace PROCEDURE show_unpaid_fines(p_vehicle_id NUMBER)
IS
BEGIN
    FOR r IN (
        SELECT fine_amount, violation_type, violation_date
        FROM vehicle_fine
        WHERE vehicle_id = p_vehicle_id AND fine_status = 'UNPAID'
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Fine: '||r.fine_amount||' | '||r.violation_type||' | '||r.violation_date
        );
    END LOOP;
END;

















