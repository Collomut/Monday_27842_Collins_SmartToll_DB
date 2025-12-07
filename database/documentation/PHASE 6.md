# 🛣️ Phase 6 – PL/SQL Development Documentation  
**Student:** Mutinda Collins Mumo  
**ID:** 27842  
**Project:** Smart Toll & Traffic Monitoring System  
**PDB:** WED_27842_Collins_smarttoll_db  
**Schema:** TOLL_OWNER  

---

## ✅ Development Overview
This phase focuses on **PL/SQL package development** for toll and fine management, reporting, and analytics. All code is implemented inside the **`TOLL_PKG`** package.  

Included components:  
- Full **PL/SQL Package** (Specification + Body)  
- Procedures for **inserting, updating, and processing** toll & fine data  
- Functions for **calculations, validation, and reporting**  
- Cursors for **iterative reporting**  
- Window functions for **advanced analytics**  
- Testing scripts using **DBMS_OUTPUT**  

---

## 1️⃣ Package Specification  
**File:** `06_toll_pkg_spec.sql`  

Contains declarations for:  
- 10+ **business logic functions**  
- 10+ **supporting procedures**  
- **Custom application exceptions**  
- **Daily revenue reporting procedure**  

---

## 2️⃣ Package Body  
**File:** `07_toll_pkg_body.sql`  

Implements:  
- Fine management (**add, pay, settle**)  
- Toll **entry/exit processing**  
- Dynamic **toll fee calculation**  
- Vehicle **validation** (plate rules)  
- **Revenue reporting**  
- Error handling using `RAISE_APPLICATION_ERROR`  
- Utility computations (**balances, last visit date**)  

✅ Package body compiled successfully and is **VALID** inside the PDB.  

---

## 3️⃣ Cursor-Based Reporting  
**File:** `08_cursors.sql`  

Two main cursors implemented:  
1. **Top unpaid vehicles** – Aggregates total unpaid fines and displays ranking via `DBMS_OUTPUT`  
2. **Last 24-hour traffic** – Shows recent toll usage by vehicles, joining `toll_gates` and `vehicles`  

Demonstrates **explicit and implicit cursor loops** for iterative reporting.  

---

## 4️⃣ Window Functions  
**File:** `09_window_functions.sql`  

Implemented advanced analytics using:  
- `RANK()` → Rank vehicles by **total fines**  
- `LAG()` → Detect **repeated violations**  
- `OVER(PARTITION BY...)` → Partition data by **vehicle** for reporting  

---

## 5️⃣ Testing Scripts  
**File:** `10_test_plsql.sql`  

Testing includes:  
- Function testing (`get_vehicle_profile`, `get_total_unpaid_fines`, etc.)  
- Adding and paying fines  
- Recording toll **entries & exits**  
- Verifying automatic creation of **payments**  
- DBMS_OUTPUT screenshots required for verification  

---

This phase demonstrates **robust PL/SQL implementation** with proper encapsulation of business logic, iterative reporting, analytics, and automated testing for the Smart Toll & Traffic Monitoring System.
