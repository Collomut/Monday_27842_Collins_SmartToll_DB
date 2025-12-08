# 🚧 Smart Toll Management System (PL/SQL Capstone Project)

**Student Name:** Mutinda Collins  
**Student ID:** 27842  
**Course:** Database Development with PL/SQL (INSY 8311)  
**Institution:** Adventist University of Central Africa (AUCA)  
**Academic Year:** 2025 – 2026  
**Database Name:** WED_27842_Collins_smarttoll_db  

---

## 📌 1. Project Overview

The **Smart Toll Management System** is a **database-driven toll collection and monitoring system** designed to automate:
- Vehicle registration
- Toll gate usage tracking
- Fine management
- Payments processing
- Auditing and compliance
- Business Intelligence (BI) reporting

The system is fully implemented using **Oracle Database and PL/SQL**, with all business rules enforced at the database level.

---

## 🎯 2. Problem Statement

Manual toll operations are:
- Prone to fraud
- Difficult to audit
- Inefficient for revenue tracking
- Weak in violation enforcement

This project solves these challenges by providing a **secure, automated, auditable, and BI-ready toll management database system**.

---

## ✅ 3. Key Objectives

- Automate toll entry & exit tracking
- Enforce secure payment and fine management
- Restrict unauthorized data operations
- Track all sensitive changes using audit logs
- Support Business Intelligence reporting
- Provide real-time revenue and traffic analytics

---

## 🧑‍💻 4. Target Users

- Toll administrators  
- Toll officers  
- Revenue auditors  
- Government transport authorities  
- Business intelligence analysts  

---

## 🏗️ 5. System Architecture Summary

The system uses a **three-tier database-centric architecture**:

1. **User Layer** – Administrators & officers
2. **Business Logic Layer** – PL/SQL procedures, functions & packages
3. **Data Layer** – Oracle tables, indexes, views & audit logs

All processing and business rules are centralized inside the database for:
- High security
- Data integrity
- Performance
- Compliance

---

## 🗃️ 6. Database Features Implemented

### ✅ Core Tables
- `vehicles`
- `toll_gates`
- `toll_logs`
- `vehicle_fine`
- `payments`

### ✅ Support Tables
- `holidays`
- `audit_log`

### ✅ Business Logic
- 8+ Functions
- 10+ Procedures
- 1 Core Package (`toll_pkg`)

### ✅ Advanced Programming
- Restriction triggers
- Compound trigger
- Audit triggers
- Custom exception handling

### ✅ Reporting & BI
- Traffic analytics
- Revenue tracking
- Fine summaries
- Gate usage analytics
- Unpaid fine monitoring

---

## 🔐 7. Security & Business Rules

- Employees **cannot INSERT, UPDATE, or DELETE on weekdays and public holidays**
- All vehicle operations are fully audited
- Only authorized database users can modify data
- All transactions are validated using constraints and triggers

---

## 📊 8. Business Intelligence (BI)

The system supports BI using:
- Analytical views
- Aggregation queries
- Trend analysis
- KPI-ready structures

### BI Views Include:
- `vw_daily_traffic_summary`
- `vw_gate_usage`
- `vw_violation_summary`
- `vw_payments_summary`
- `vw_revenue_full`

---

## 🧪 9. Testing & Validation

A full SQL-based test suite validates:
- Table inserts
- Function accuracy
- Procedure execution
- Trigger restriction enforcement
- Report generation
- Audit record creation

All test scripts are located in:
database/scripts/09_test_scripts.sql
