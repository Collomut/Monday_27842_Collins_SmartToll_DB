# 🏗️ Smart Toll Management System – System Architecture  
**Student:** Mutinda Collins  
**Student ID:** 27842  
**Database:** WED_27842_Collins_smarttoll_db  
**Institution:** Adventist University of Central Africa (AUCA)  
**Course:** Database Development with PL/SQL (INSY 8311)  

---

## 📌 1. Architecture Overview

The **Smart Toll Management System** is built on a **three-tier database-centric architecture** designed to ensure:
- High data integrity
- Strong security and auditing
- Efficient transaction processing
- Business Intelligence (BI) readiness

The system uses **Oracle Database with PL/SQL** as the primary processing engine, where all business logic is enforced at the database layer using:
- Tables & constraints  
- Views  
- Functions & procedures  
- Packages  
- Triggers & auditing  

This ensures **data consistency, automation of operations, and centralized control**.

---

## 🏛️ 2. High-Level Architectural Layers

┌───────────────────────────────┐
│ USER INTERACTION │
│ (Admins, Toll Officers, BI) │
└───────────────▲───────────────┘
│ SQL / PL/SQL
┌───────────────┴───────────────┐
│ APPLICATION & BUSINESS LOGIC │
│ (Packages, Procedures, Rules)│
└───────────────▲───────────────┘
│ Transactions
┌───────────────┴───────────────┐
│ DATA & STORAGE LAYER │
│ (Tables, Indexes, Views, Logs) │
└───────────────────────────────┘


---

## 🗂️ 3. Data Layer Architecture

This layer stores all persistent information and is fully normalized to **Third Normal Form (3NF)**.

### Core Tables
- `vehicles` – Registered vehicles
- `toll_gates` – Toll gate locations
- `toll_logs` – Vehicle movement records
- `vehicle_fine` – Traffic and toll violations
- `payments` – Toll & fine transactions

### Support Tables
- `holidays` – Public holidays for operation restrictions
- `audit_log` – Tracks all sensitive operations

### Storage Strategy
- **Data Tablespace:** `toll_data`
- **Index Tablespace:** `toll_index`
- **Temporary Tablespace:** `toll_temp`

This separation improves:
- Performance
- Scalability
- Fault isolation

---

## ⚙️ 4. Business Logic Architecture (PL/SQL Layer)

All system intelligence is implemented at the database level.

### ✅ Functions
Used for:
- Validation (`vehicle_exists`)
- Calculations (`monthly_fine_total`, `total_revenue`)
- Lookups (`last_gate_visited`)
- Business decisions (`is_operation_allowed`)

### ✅ Procedures
Used for:
- CRUD operations
- Fine management
- Payment processing
- Reporting output via `DBMS_OUTPUT`

### ✅ Package: `toll_pkg`
This package acts as the **core service layer**, handling:
- Toll entry & exit processing
- Fine management & payment settlement
- Vehicle registration & updates
- Revenue report generation
- Business rule enforcement
- Error handling using `RAISE_APPLICATION_ERROR`

This design improves:
- Code reusability  
- Maintainability  
- Encapsulation  
- Security  

---

## 🔐 5. Security & Access Control Architecture

### User Roles
- `toll_admin` – Full DBA & system control
- `toll_owner` – Application schema owner with controlled privileges

### Privilege Control
- Only authorized users can:
  - Create tables
  - Modify data
  - Execute PL/SQL code
- Sensitive operations are protected using:
  - Triggers
  - Role-based access
  - Database constraints

---

## 🧾 6. Auditing & Compliance Architecture

Auditing is handled using **database triggers** and the `audit_log` table.

### Operations Tracked
- INSERT on vehicles
- UPDATE on vehicles
- DELETE on vehicles

Each audit entry records:
- Table name
- Operation type
- Old values
- New values
- Database user responsible
- Timestamp

This supports:
- Regulatory compliance
- Fraud detection
- Accountability
- Digital forensics

---

## ⛔ 7. Business Rule Enforcement Architecture

The system enforces **strict operational restrictions** using:

### ✅ Restriction Rule:
> Employees **CANNOT INSERT, UPDATE, or DELETE** on:
- Weekdays (Monday – Friday)
- Public holidays

### Enforcement Mechanism:
- `is_operation_allowed` function
- BEFORE INSERT / UPDATE / DELETE triggers

This guarantees:
- Data protection during restricted periods
- Controlled system access
- Reduced fraud risks

---

## 📊 8. Business Intelligence (BI) Architecture

BI is enabled using:
- Analytical Views
- Aggregation Queries
- Revenue & violation trend tracking

### BI-Ready Views:
- `vw_daily_traffic_summary`
- `vw_gate_usage`
- `vw_violation_summary`
- `vw_payments_summary`
- `vw_revenue_full`

These feed:
- Executive dashboards
- Revenue performance reports
- Compliance monitoring systems
- Traffic optimization analytics

---

## 🧪 9. Testing & Validation Architecture

A **full automated SQL test suite** validates:
- Data insertion
- Procedure execution
- Function accuracy
- Trigger blocking behavior
- View accuracy
- Report correctness

Testing ensures:
- System reliability
- Functional correctness
- Production readiness

---

## ✅ 10. Architecture Strengths

- ✅ Strong data integrity via constraints
- ✅ Full automation with PL/SQL
- ✅ High security with triggers & audit logs
- ✅ BI-ready analytics layer
- ✅ Modular and scalable design
- ✅ Centralized business rules enforcement

---

## 📌 Conclusion

The **Smart Toll Management System Architecture** is a **robust, secure, transactional, and analytics-ready design** that aligns with **enterprise-grade database systems**. It fully satisfies all **AUCA Capstone Phase IV–VIII technical requirements** and is suitable for real-world deployment with minimal enhancement.

---

✅ **Document Status:** Complete  
✅ **Security Architecture:** Implemented  
✅ **BI Architecture:** Implemented  
✅ **Audit Architecture:** Implemented  
✅ **Capstone Ready:** Yes  

---


