# 🏗️ Smart Toll Management System – System Architecture

**Student:** Mutinda Collins

**Student ID:** 27842

**Database:** `WED_27842_Collins_smarttoll_db`

**Course:** Database Development with PL/SQL (INSY 8311)

**Institution:** Adventist University of Central Africa (AUCA)

---

## 📌 1. Architecture Overview

The **Smart Toll Management System** uses a **three-tier, database-centric architecture** designed for stability, scalability, and high data integrity. Oracle Database and PL/SQL act as the core engine where all business rules and processing logic are enforced.

This ensures:

* Strong data consistency
* Automated processing
* Secure access control
* BI-ready analytic views

---

## 🏛️ 2. High-Level Architectural Layers

```
┌───────────────────────────────┐
│         USER INTERFACE         │
│  (Admins, Toll Officers, BI)   │
└───────────────▲───────────────┘
                │ SQL / PL/SQL
┌───────────────┴───────────────┐
│    APPLICATION BUSINESS LOGIC  │
│ (Packages, Procedures, Rules)  │
└───────────────▲───────────────┘
                │ Transactions
┌───────────────┴───────────────┐
│        DATA STORAGE LAYER      │
│ (Tables, Indexes, Views, Logs) │
└───────────────────────────────┘
```

---

## 🗂️ 3. Data Layer Architecture

The data layer stores all system information following **Third Normal Form (3NF)** design standards.

### **Core Operational Tables**

* `vehicles` – Registered vehicle data
* `toll_gates` – Toll gate records
* `toll_logs` – Entry/exit logs
* `vehicle_fine` – Violations and fines
* `payments` – Fine & toll payments

### **Supporting Tables**

* `holidays` – Restricted operational dates
* `audit_log` – Activity logging for auditing

### **Tablespace Strategy**

* `toll_data` – Main table data
* `toll_index` – Indexes
* `toll_temp` – Temporary operations

This structure improves performance, organization, and maintainability.

---

## ⚙️ 4. Business Logic Architecture (PL/SQL Layer)

### **Functions**

Used for validation, calculations, and core business checks:

* `vehicle_exists`
* `monthly_fine_total`
* `total_revenue`
* `last_gate_visited`
* `is_operation_allowed`

### **Procedures**

Handle critical operations such as:

* Payment processing
* Vehicle updates
* Toll entry logging

### **Package: `toll_pkg`**

Acts as the main service layer performing:

* Toll entry & exit automation
* Fine enforcement
* Payment settlement
* Revenue processing
* Error handling

Benefits:

* Encapsulation
* Reusability
* Organized logic

---

## 🔐 5. Security & Access Control Architecture

### **User Roles**

* **toll_admin** → DBA rights
* **toll_owner** → Application-level rights

### **Security Controls**

* Role-based access
* Privilege restrictions
* Validation functions
* DML-blocking triggers

---

## 🧾 6. Auditing & Compliance Architecture

Auditing uses triggers + `audit_log` table.

### **Audit Records Capture:**

* User performing action
* Operation type
* Old and new values
* Timestamp

Supports:

* Fraud detection
* Traceability
* Regulatory compliance

---

## ⛔ 7. Business Rule Enforcement Architecture

### **Operational Restriction Rule**

No `INSERT`, `UPDATE`, or `DELETE` allowed:

* During weekends
* During public holidays

### **Enforced Using:**

* `is_operation_allowed` function
* BEFORE DML triggers

This protects data and enforces policy compliance.

---

## 📊 8. Business Intelligence (BI) Architecture

BI support is achieved using analytical SQL and reporting views.

### **Key BI Views**

* `vw_daily_traffic_summary`
* `vw_gate_usage`
* `vw_violation_summary`
* `vw_payments_summary`
* `vw_revenue_full`

Used for:

* Dashboards
* Revenue analytics
* Policy decision support
* Traffic management

---

## 🧪 9. Testing & Validation Architecture

Testing is carried out using the automated script:
**`09_test_scripts.sql`**

### **Covers:**

* Data insertion
* Procedure execution
* Trigger restrictions
* Function accuracy
* View correctness
* Payment workflow
* Auditing behavior

Ensures reliability and correctness.

---

## ✅ 10. Architecture Strengths

* Centralized business logic
* BI-ready design
* Strong auditing and tracking
* High data integrity
* Trigger-based protection
* Modular and scalable
* Minimal human error

---

## 🏁 Conclusion

The **Smart Toll Management System** architecture is a secure, scalable, and analytics-ready design suitable for real-world deployment. It satisfies all AUCA Capstone requirements and demonstrates strong use of Oracle PL/SQL and database engineering principles.


### **Testing Architecture:** ✔ Implemented
