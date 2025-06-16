# Introduction to ABAP

## 🔹 What is ABAP?

**ABAP (Advanced Business Application Programming)** is a high-level programming language created by **SAP**. It is used to develop business applications in the SAP ecosystem, especially in SAP S/4HANA systems.

## 🔹 Main Purpose of ABAP

ABAP is mainly used for:
- Customizing SAP standard applications
- Creating reports, forms, and data entry screens
- Handling business logic inside SAP systems
- Building interfaces with other systems

## 🔹 What Can We Do Using ABAP?

Here are some important things you can build using ABAP:

|  Task |  Description |
|--------|----------------|
| Reports | Create custom reports like sales summary, stock reports, etc. |
| Forms | Design output forms like invoices and purchase orders |
| Data Upload/Download | Upload data using BDC, LSMW, or download to Excel |
| ALV Reports | Interactive, formatted reports for end users |
| Enhancements | Add new features to existing SAP programs |
| Custom Programs | Write your own logic to handle business processes |
| Interfaces | Connect SAP to other systems using IDocs, BAPIs, RFCs |
| CDS Views | Define reusable database views for analytics (SAP HANA) |
| OData Services | Create services for SAP Fiori or mobile apps |



## 🔹 Benefits of ABAP

-  **Powerful**: Handles large business processes in real-time
-  **Integrated**: Works tightly with SAP database and UI
-  **Stable**: Used by major enterprises worldwide
-  **Secure**: SAP ensures role-based access and control
-  **Scalable**: Supports both small and large business applications
-  **Modern**: Supports object-oriented and modular programming


## 🔹 Where is ABAP Used?

ABAP is mainly used in:
- **SAP ERP** (like SAP ECC, SAP S/4HANA)
- **SAP BW** (Business Warehouse)
- **SAP CRM**, **SAP HR**, and other modules
- **SAP Fiori Backend** (via OData services)


## 🔹 Why Should You Learn ABAP?

-  You want to become a **SAP Technical Consultant or Developer**
-  You’re working in a company using SAP
-  You enjoy solving real business problems with code
-  There is a strong career demand in ABAP + SAP S/4HANA


## 🔹 1. Simple Example

Here’s a very basic ABAP program:
```abap
REPORT zhello_world.

WRITE 'Hello, SAP World!'.
```
---

## 🔹 2. Data Types in ABAP

### What are Data Types?

Data types define **what kind of data** a variable can hold — like numbers, text, dates, etc.

In ABAP, you can use **predefined** or **custom** data types to declare variables.

---

### 🔸 Common Predefined Data Types

| Data Type | Meaning | Example |
|-----------|---------|---------|
| `I`       | Integer (whole number) | `DATA count TYPE i.` |
| `P`       | Packed number (for decimals) | `DATA price TYPE p DECIMALS 2.` |
| `C`       | Character (fixed-length text) | `DATA name TYPE c LENGTH 10.` |
| `N`       | Numeric text (digits as string) | `DATA id TYPE n LENGTH 5.` |
| `D`       | Date (YYYYMMDD) | `DATA today TYPE d.` |
| `T`       | Time (HHMMSS) | `DATA now TYPE t.` |
| `F`       | Floating-point number | `DATA value TYPE f.` |
| `STRING`  | Variable-length text | `DATA note TYPE string.` |

---

### 🔸 Declaring Variables

```abap
DATA: v_name TYPE c LENGTH 10,
      v_age TYPE i,
      v_salary TYPE p DECIMALS 2.
```
---

## 🔹 3. Constants and Parameters

###  What are Constants?

- A **constant** is a fixed value that **never changes** during program execution.
- It is declared using the keyword `CONSTANTS`.

#### 🔸 Syntax:
```abap
CONSTANTS: <const_name> TYPE <type> VALUE <value>.
```

### What are Parameters?
- **PARAMETERS** are input fields shown to the user when the program runs.
- Useful for interactive reports or user input-based logic.

#### 🔸 Syntax:
```abap
PARAMETERS: <param_name> TYPE <type> [DEFAULT <value>].
```
