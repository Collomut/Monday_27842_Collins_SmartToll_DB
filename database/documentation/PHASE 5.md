# Phase 5 – Table Implementation & Data Verification  
**Student:** Mutinda Collins Mumo  
**ID:** 27842  
**PDB:** WED_27842_Collins_smarttoll_db  

---

The following tasks were completed:

- All 5 tables created successfully  
- Constraints added (PK, FK, CHECK, UNIQUE)  
- Realistic sample data inserted  
- Validation queries executed  
- Integrity checking performed  
- Test queries (joins, aggregations, subqueries) executed  
---
# Validation Summary

## **1. Table existence**
Confirmed all tables exist:
- VEHICLES  
- TOLL_GATES  
- TOLL_LOGS  
- VEHICLE_FINE  
- PAYMENTS  

## **2. Row Count Validation**
All tables contain expected data.

## **3. Foreign Key Integrity**
Every toll log, fine, and payment is linked to an existing vehicle.

## **4. Data Quality**
- No NULL values in mandatory fields  
- Plate numbers are unique  
- No orphan records  

---

# Test Queries Executed  
The following categories of queries were successfully executed:

###  JOIN Queries  
- Vehicles with toll activity  
- Vehicles with unpaid fines  

###  Aggregation Queries  
- Total toll revenue  
- Gate usage ranking  

###  Subqueries  
- Vehicles with more than 2 violations  

###  Grouping  
- Violations grouped by vehicle  

