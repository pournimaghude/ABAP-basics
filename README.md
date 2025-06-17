# Introduction to ABAP 

## 🔹 What is ABAP?

**ABAP** stands “**A**dvanced **B**usiness **A**pplication **P**rogramming”. it is a high-level programming language Created by German Software Company **SAP**. It is used to develop business applications in the SAP ecosystem, especially in SAP S/4HANA systems. 

## 🔹SAP R/3 Architecture and ABAP
- SAP R/3 is based on Client Server Architecture and the model is based on three-tier
hierarchy. 

![image](https://github.com/user-attachments/assets/68c8364d-a802-4d7c-b528-4788a369869a)

- The presentation layer - User Interface (users interact with the system with help of SAP
 GUI or through web-GUI)
- The Application layer - All the programs related to business applications written in ABAP
 are executed here.
- The Database layer - Data is stored in this layer in a RDBMS
  
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

## 🔹 2. Data Types in ABAP

### What are Data Types?

Data types define **what kind of data** a variable can hold — like numbers, text, dates, etc.

In ABAP, you can use **predefined** or **custom** data types to declare variables.


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

### 🔸 Declaring Variables

```abap
DATA: v_name TYPE c LENGTH 10,
      v_age TYPE i,
      v_salary TYPE p DECIMALS 2.
```

## 🔹 3. Constants and Parameters

### 3.1 What are Constants?

- A **constant** is a fixed value that **never changes** during program execution.
- It is declared using the keyword `CONSTANTS`.

#### 🔸 Syntax:
```abap
CONSTANTS: <const_name> TYPE <type> VALUE <value>.
```

### 3.2 What are Parameters?
- **PARAMETERS** are input fields shown to the user when the program runs.
- Useful for interactive reports or user input-based logic.

#### 🔸 Syntax:
```abap
PARAMETERS: <param_name> TYPE <type> [DEFAULT <value>].
```

## 🔹 4. Control Structures in ABAP

Control structures help you control the **flow of your program**.  
They allow you to make decisions (`IF`, `CASE`) and repeat actions (`DO`, `WHILE`, `LOOP`).


###  4.1 IF / ELSEIF / ELSE

#### 🔸 Syntax:
```abap
IF <condition>.
  " Code if true
ELSEIF <another_condition>.
  " Code if second condition is true
ELSE.
  " Code if none are true
ENDIF.
```

###  4.2 CASE Statement
#### 🔸 Syntax:
``` abap
CASE <value>.
  WHEN <value1>.
    " Code
  WHEN <value2>.
    " Code
  WHEN OTHERS.
    " Default
ENDCASE.
```

### 4.3 DO Loop (Fixed Iteration)
Repeats code a specific number of times.

#### 🔸Syntax:
```abap
DO <number> TIMES.
  " Code
ENDDO.
```

### 🔸 4.4 WHILE Loop (Condition-Based)
- Repeats code while a condition is true.

#### 🔸Syntax:
```abap

WHILE <condition>.
  " Code
ENDWHILE.
```

|Statement	|Use|
|-----------|----|
|IF	|Check multiple conditions|
|CASE	|Compare a single value against options|
|DO	|Loop fixed number of times|
|WHILE	|Loop until condition is false|
|LOOP AT	|Read internal tables (covered later)|


## 🔸 4.5 LOOP AT Internal Table

### What is an Internal Table?

- Internal tables are temporary memory tables in ABAP used to store multiple rows of structured data. like an Excel sheet in memory.
- An **internal table** in ABAP is like an **array or list** in other languages.  
- You can store multiple rows of data in it and process them using loops.

- Use `APPEND` to add values.
- Use `LOOP AT` to read each row one by one.

#### 🔸 Syntax: LOOP AT Internal Table

```abap
LOOP AT <internal_table> INTO <work_area_or_variable>.
  " Your logic here
ENDLOOP.
```

## 🔹 5. Internal Tables with Work Areas

### What is a Work Area?

- A **work area** is a single row of structure.
-  like one row of the internal table, used for inserting or reading one row at a time.

We use it:
- To hold temporary data
- While reading/writing to internal tables.
#### Simple Real-Life Example:
|Roll| No	Name|	Marks|                                     
|----|--------|------|
|101	|Pooja	|88|                                                      
|102	|Ajay	|92|

In ABAP:
 - Internal Table → Whole list of students
 - Work Area → One student’s data (one row)

### 🔸 5.1 Defining Internal Table with Structure

```abap
TYPES: BEGIN OF ty_student,
         name TYPE string,
         age  TYPE i,
       END OF ty_student.

DATA: lt_students TYPE TABLE OF ty_student,
      wa_student TYPE ty_student.
```

`ty_student` → custom structure for student

`lt_students` → internal table of student records

`wa_student` → single student (work area)

### 🔸5.2 APPEND Data to Internal Table
```abap

wa_student-name = 'Pournima'.
wa_student-age  = 24.
APPEND wa_student TO lt_students.

wa_student-name = 'Riya'.
wa_student-age  = 22.
APPEND wa_student TO lt_students.
```

### 🔸5.3 LOOP with Work Area
```abap

LOOP AT lt_students INTO wa_student.
  WRITE: / 'Name:', wa_student-name,
         'Age:', wa_student-age.
ENDLOOP.
```
#### Example for understanding :
``` abap
TYPES: BEGIN OF ty_student,
         rollno TYPE i,
         name   TYPE string,
         marks  TYPE i,
       END OF ty_student.

DATA: lt_students TYPE TABLE OF ty_student,  " Internal table
      ls_student TYPE ty_student.            " Work area

* Add student 1
ls_student-rollno = 101.
ls_student-name   = 'Pooja'.
ls_student-marks  = 88.
APPEND ls_student TO lt_students.

* Add student 2
ls_student-rollno = 102.
ls_student-name   = 'Ajay'.
ls_student-marks  = 92.
APPEND ls_student TO lt_students.

* Display data
LOOP AT lt_students INTO ls_student.
  WRITE: / ls_student-rollno, ls_student-name, ls_student-marks.
ENDLOOP.
```
###### Key Points:
- `TYPES ... END OF` → `define custom structure`
- `lt_students` → `list (internal table)`
- `ls_student` → `one row (work area)`
- `APPEND` → `add work area to internal table`
- `LOOP AT` → `read each row one by one`

## 🔹6. READ, MODIFY, DELETE Internal Table

### 🔸 6.1 READ TABLE
- Find a row by condition:

```abap
READ TABLE lt_students INTO wa_student WITH KEY name = 'Pournima'.

IF sy-subrc = 0.
  WRITE: / 'Found:', wa_student-name.
ELSE.
  WRITE: / 'Not found'.
ENDIF.
sy-subrc = 0 → means match found

````

### 🔸6.2 MODIFY TABLE
- Update data in a specific row:

```abap
READ TABLE lt_students INTO wa_student WITH KEY name = 'Pournima'.

IF sy-subrc = 0.
  wa_student-age = 25.
  MODIFY lt_students FROM wa_student.
  WRITE: / 'Age updated to 25'.
ENDIF.
```
### 🔸6.3 DELETE FROM TABLE
- Remove an entry:

```abap
DELETE lt_students WHERE name = 'Riya'.

LOOP AT lt_students INTO wa_student.
  WRITE: / wa_student-name.
ENDLOOP.
```

## 🧠 What is Open SQL?
