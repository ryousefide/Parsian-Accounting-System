# Parsian Accounting & Inventory System 📊

> **Note to Recruiters/Reviewers:** This repository showcases a legacy enterprise application developed in Delphi. It is presented here to demonstrate my ability to design and manage complex business logic, financial algorithms, and relational databases. 

## 📝 Overview
Parsian Accounting is a comprehensive ERP module built to manage inventory, invoicing, and automated accounting documents. The core strength of this system lies in its ability to handle complex, real-world financial scenarios such as multi-currency transactions, strict inventory validation, and automated ledger generation based on dynamic templates.

## 🛠️ Technology Stack
*   **Frontend & Logic:** Delphi 7 / Object Pascal
*   **Database:** MS SQL Server (via ADO/BDE)
*   **Reporting:** ReportBuilder (.rtm templates)

## 🚀 Key Business Features
1.  **Automated Accounting Documents:** The system dynamically generates general ledger entries (e.g., KJK for invoices, KDF for discounts) directly from inventory and billing events without manual data entry.
2.  **Multi-Currency Support:** Seamless handling of invoices with different currencies, calculating exchange rates in real-time to generate accurate local currency ledgers.
3.  **Strict Inventory Validation:** Real-time checking to prevent negative inventory balances (`DepotCheck`) before finalizing any outbound invoices.
4.  **Complex Invoice Apportionment:** Distributing extra costs (like Demurrage, LC costs, and Customs) accurately across invoice items based on item value or quantity.

## 📂 Repository Structure
*   `/src`: Contains the core Delphi source code (`.pas`), form definitions (`.dfm`), and project configurations.
*   `/database`: Contains the `Create_Tables_Script.sql` for the SQL Server database schema.
*   `/reports`: Contains the `.rtm` files for print layouts and reports.

## 🔄 Refactoring & Modernization Roadmap
While this system accurately solves complex business problems, it was written using legacy paradigms. My current engineering approach focuses on modernizing this codebase by applying **Clean Code** and **SOLID** principles. 

If I were to refactor or rebuild this today (in Delphi or Python), my focus areas would be:
*   **Separation of Concerns (SoC):** Decoupling the UI forms (like `Binvoice.pas`) from the business logic and database queries by introducing `Services` and `Repositories`.
*   **Replacing Magic Strings:** Converting hardcoded accounting templates (e.g., 'KJK', 'KNF') into strongly-typed `Enums` or Constants.
*   **ORM & Parameterized Queries:** Eliminating string-concatenated SQL queries to improve security against SQL Injection and boost database performance.
*   **Database Normalization:** Migrating from storing string values (like Product/Warehouse names) in document lines to utilizing strict Foreign Key relationships (e.g., `ProductId`, `WarehouseId`).

---
*Developed by Ramtin Yousefi*