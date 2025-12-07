# 🛣️ Phase 5 – Table Implementation & Data Verification  
**Student:** Mutinda Collins Mumo  
**ID:** 27842  
**PDB:** WED_27842_Collins_smarttoll_db  

---

## ✅ Completed Tasks
- Created all **5 tables** successfully  
- Added **constraints** (PK, FK, CHECK, UNIQUE)  
- Inserted **realistic sample data**  
- Executed **validation queries**  
- Performed **integrity checks**  
- Ran **test queries** including joins, aggregations, and subqueries  

---

## 📊 Validation Summary

### 1️⃣ Table Existence
Confirmed that all tables exist:  
- `VEHICLES`  
- `TOLL_GATES`  
- `TOLL_LOGS`  
- `VEHICLE_FINE`  
- `PAYMENTS`  

### 2️⃣ Row Count Validation
All tables contain the **expected number of rows**.  

### 3️⃣ Foreign Key Integrity
- Every toll log, fine, and payment is linked to an existing vehicle  
- No orphan records exist  

### 4️⃣ Data Quality
- No `NULL` values in mandatory fields  
- Plate numbers are **unique**  
- Referential integrity **maintained across all tables**  

---

## 🧪 Test Queries Executed

### 🔗 JOIN Queries
- Vehicles with toll activity  
- Vehicles with unpaid fines  

### 📈 Aggregation Queries
- Total toll revenue  
- Gate usage ranking  

### 🔍 Subqueries
- Vehicles with more than 2 violations  

### 📂 Grouping
- Violations grouped by vehicle  

---

This phase confirms that the database **structure, constraints, and data integrity** are correctly implemented and ready for the BI and reporting layers.
