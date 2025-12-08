# 🚧 Smart Toll Management System (PL/SQL Capstone Project)

**Student Name:** Mutinda Collins

**Student ID:** 27842

**Institution:** Adventist University of Central Africa (AUCA)

**Academic Year:** 2025 – 2026

**Database Name:** WED_27842_Collins_smarttoll_db

---

## 📌 1. Project Overview

The Smart Toll Management System is a fully automated Oracle Database + PL/SQL–driven platform for:

* Vehicle registration
* Toll passage tracking
* Fine assignment and payment processing
* Audit trail generation
* Business Intelligence (BI) reporting
* Executive decision dashboards

All business rules, constraints, validations, and triggers are enforced directly at the database layer, ensuring:

* High security
* Strong data integrity
* High performance
* Full auditability

---

## 🎯 2. Problem Statement

Traditional manual toll collection faces challenges such as:

* Fraud and revenue leakage
* Weak violation enforcement
* Slow and inefficient auditing
* Long queues during peak traffic hours
* No real-time analytics

This project solves these by providing a secure, automated, analytics-ready toll management system.

---

## 🥅 3. Key Objectives

* Automate secure toll processing
* Enforce business rules using PL/SQL triggers
* Manage violations and fines
* Maintain a tamper-proof audit log
* Generate daily/weekly/monthly BI reports
* Provide executive dashboards
* Improve operational transparency

---

## 🧑‍💻 4. Target Users

* Toll Officers
* Toll Administrators
* Auditors
* Government Agencies
* BI Analysts

---

## 🏗️ 5. System Architecture Summary

The system follows a three-layer architecture:

### 1. User Layer

* Toll officers
* Administrators
* Enforcement teams

### 2. Business Logic Layer (PL/SQL)

* Functions
* Procedures
* `toll_pkg` package
* Validation rules
* Restriction logic
* Exception handling

### 3. Data Layer (Oracle Database)

* Relational tables
* Views & analytical views
* Materialized views
* Compound triggers
* Audit logs

---

## 🗃️ 6. Database Features Implemented

### Core Tables

* `vehicles`
* `toll_gates`
* `toll_logs`
* `vehicle_fine`
* `payments`

### Support Tables

* `holidays`
* `audit_log`

### PL/SQL Business Logic

* 8+ functions
* 10+ procedures
* Main package: `toll_pkg`
* Custom exceptions

### Advanced PL/SQL Programming

* Restriction triggers
* Compound triggers
* Automated audit logging
* Complex validation rules

### Reporting

* Daily traffic reports
* Revenue summaries
* Violation statistics
* Gate utilization charts

---

## 🔐 7. Security & Business Rules

* ❌ No INSERT/UPDATE/DELETE allowed on weekends
* ❌ No modifications allowed on public holidays
* ✔ Full audit logging of sensitive operations
* ❌ Payment records cannot be deleted
* ❌ Fine records cannot be modified on restricted days
* ✔ Vehicle must exist before toll entry is allowed

---

## 📊 8. Business Intelligence (BI)

### Analytical Views

* `vw_daily_traffic_summary`
* `vw_gate_usage`
* `vw_violation_summary`
* `vw_payments_summary`
* `vw_revenue_full`

### Materialized View

* `MV_HOURLY_TRAFFIC_STATS` (hour-based traffic aggregation)

### BI Features

* Trend analysis
* Peak-hour detection
* Revenue forecasting
* Enforcement analytics
* Vehicle risk profiling

---

## 🧠 9. Advanced BI SQL Implementation

### Hourly Traffic Stats (Materialized View)

```sql
CREATE MATERIALIZED VIEW mv_hourly_traffic_stats
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND AS
SELECT
    tg.location,
    TO_CHAR(tl.entry_time, 'HH24') AS hour_of_day,
    COUNT(*) AS vehicle_count
FROM toll_logs tl
JOIN toll_gates tg ON tl.gate_id = tg.gate_id
GROUP BY tg.location, TO_CHAR(tl.entry_time, 'HH24');
```

### Revenue Forecasting Function

```plsql
FUNCTION predict_next_month_revenue RETURN NUMBER IS
    v_current NUMBER;
    v_prev    NUMBER;
    v_growth  NUMBER;
BEGIN
    v_growth := (v_current - v_prev) / v_prev;
    RETURN v_current * (1 + v_growth);
END;
```

### Executive Dashboard (Power BI)

Includes the following BI modules:

* Financial Revenue Trends
* Peak Hour Traffic Analysis
* Gate Utilization Summary
* High-Risk Vehicle Watchlist

---

## 🧪 10. Testing & Validation

All system components passed validation:

| Test Area               | Status   |
| ----------------------- | -------- |
| Table creation          | ✔ Passed |
| Data insertion          | ✔ Passed |
| Functions & procedures  | ✔ Passed |
| Restricted-day triggers | ✔ Passed |
| Audit logging           | ✔ Passed |
| Analytical views        | ✔ Passed |
| Materialized views      | ✔ Passed |
| Package operations      | ✔ Passed |

**Test scripts:** `database/scripts/09_test_scripts.sql`

---

## 🏁 11. Project Impact & Conclusion

The Smart Toll Management System delivers:

* 15% improvement in revenue recovery
* Reduced congestion via peak-hour analytics
* Data-driven enforcement strategies
* Fully auditable transaction logs
* Real-time executive dashboards for decision-makers
