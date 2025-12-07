# 🛣️ Phase 7 – Triggers, Restriction Function & Auditing  
**Student:** Mutinda Collins Mumo  
**ID:** 27842  
**Project:** Smart Toll & Traffic Monitoring System  
**PDB:** WED_27842_Collins_smarttoll_db  
**Schema:** TOLL_OWNER  

---

## ✅ Overview
Phase 7 focuses on **data integrity, restriction enforcement, and auditing** in the Smart Toll & Traffic Monitoring System.  

Created objects include:  
- Holiday table  
- Audit table  
- Restriction function  
- BEFORE INSERT / UPDATE / DELETE triggers  
- Compound trigger  
- Audit trigger  
- Testing scripts  

These objects ensure the system is **secure, controlled, and properly monitored** for changes.  

---

## 1️⃣ Holiday Table
- Stores all **national holidays**  
- Used to **block operations** on restricted days  

---

## 2️⃣ Audit Table
Captures **all DML operations** (INSERT, UPDATE, DELETE) with:  
- Table name  
- Operation performed  
- User  
- Timestamp  
- Old values  
- New values  

**Purpose:** Accountability and security checks for government toll data.  

---

## 3️⃣ Restriction Function  
**File:** `13_restriction_function.sql`  

- Returns `FALSE` on **weekends or holidays**, `TRUE` on normal working days  
- Used inside **authorization triggers** to prevent unauthorized data modification  

**Logic:**  
- Detects Saturday/Sunday using `TO_CHAR(SYSDATE, 'DY')`  
- Checks current date against **HOLIDAYS** table  
- Prevents INSERT, UPDATE, DELETE when not allowed  

Ensures toll data is only modified on **approved working days**.  

---

## 4️⃣ Implemented Triggers

### BEFORE INSERT Trigger – `trg_vehicle_insert_control`
- Prevents **new vehicle registration** on weekends/holidays  
- Uses `is_operation_allowed` function  
- Blocks operation with `RAISE_APPLICATION_ERROR(-20050)`  

### BEFORE UPDATE Trigger – `trg_vehiclefine_update_control`
- Prevents modifying **fine records** on restricted days  
- Protects **financial integrity**  

### BEFORE DELETE Trigger – `trg_payments_delete_control`
- Prevents deletion of **financial transactions**  
- Any attempt raises an error  

---

## 5️⃣ Compound Trigger – `trg_toll_logs_compound`
- Combines **BEFORE STATEMENT**, **BEFORE EACH ROW**, and **AFTER STATEMENT** actions  
- Counts how many rows were inserted, updated, or deleted  
- Prints a summary using `DBMS_OUTPUT`  
- Helps **monitor traffic activity changes**  

---

## 6️⃣ Audit Trigger – `trg_vehicle_audit`
- Automatically logs all operations on **VEHICLES** table  
  - INSERT → stores new data  
  - UPDATE → stores old + new values  
  - DELETE → stores deleted values  
- Records written to **AUDIT_LOG** table  
- Satisfies **mandatory activity tracking requirements**  

---

## 7️⃣ Testing – `16_phase7_test.sql`
**Tests performed:**  

### Insert Test
- Attempts to insert a vehicle  
- Validates:  
  - Allowed on weekdays  
  - Blocked on weekends/holidays  

### Audit Test
- Queries **AUDIT_LOG** to confirm:  
  - Inserts, Updates, Deletes are captured correctly  

### Compound Trigger Test
- Updates **TOLL_LOGS**  
- Confirms row counts printed via `DBMS_OUTPUT`  

---

**Outcome:**  
Phase 7 ensures the Smart Toll & Traffic Monitoring System is **secure, compliant, and auditable**, with enforced restrictions and full change tracking.
