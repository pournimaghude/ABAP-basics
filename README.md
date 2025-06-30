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

## 🔹 SAP Modules Overview: MM, SD, FI, etc.
SAP is made of multiple functional modules, each handling a business area. ABAP developers write code that supports these modules.
| Module | Description                                      |
| ------ | ------------------------------------------------ |
| **MM** | Materials Management (e.g., inventory, purchase) |
| **SD** | Sales & Distribution (e.g., orders, billing)     |
| **FI** | Financial Accounting                             |
| **PP** | Production Planning                              |
| **HR** | Human Resources                                  |

- Example use: An MM consultant requests a report on purchase orders → ABAP developer writes code using tables like EKKO, EKPO.
  
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
## 🔹 Important TCodes for ABAP Development
| TCode     | Use                                                |
| --------- | -------------------------------------------------- |
| **SE11**  | Data Dictionary (create tables, views, structures) |
| **SE38**  | Create/execute ABAP reports                        |
| **SE80**  | Object Navigator (full ABAP development)           |
| **SE16N** | Display table contents (read-only)                 |
##### Try This Example in SAP:
- Go to SE16N, enter table MARA, and execute → you’ll see material master data.
  
## 🔹Simple Example

Here’s a very basic ABAP program:
```abap
REPORT zhello_world.

WRITE 'Hello, SAP World!'.
```
# Data Dictionary (DDIC)
The Data Dictionary (DDIC) is like the blueprint or design of all the data used in SAP. It defines the structure, types, and relationships of data.
- **Real-World Example:**
Think of a table like an Excel sheet that stores product data. For example, MARA stores material master data.
- **Coding Example**

``` abap
DATA: lt_mara TYPE TABLE OF mara,
      wa_mara TYPE mara.

SELECT * FROM mara INTO TABLE lt_mara UP TO 10 ROWS.

LOOP AT lt_mara INTO wa_mara.
  WRITE: / wa_mara-matnr, wa_mara-mtart.
ENDLOOP.
```
### 1. Structure
- A Structure is like a template or blueprint that groups related fields.
- It does not store any data in the database, Used in programs or function modules to temporarily hold data.
- **example :**  hold material number, description, and unit in one variable group without storing it permanently.
  ```abap
  
  TYPES: BEGIN OF ty_material,
         matnr TYPE mara-matnr,
         maktx TYPE makt-maktx,
         meins TYPE mara-meins,
       END OF ty_material.

  DATA: wa_material TYPE ty_material.

   wa_material-matnr = 'MAT123'.
   wa_material-maktx = 'Test Material'.
   wa_material-meins = 'PC'.

    WRITE: / wa_material-matnr,
           / wa_material-maktx,
          / wa_material-meins.
  ```
  
### 2. Tables
- A table is an object in the SAP Data Dictionary that stores data in the database.
- Each row in a table is a record, each column is a field.
- Example: MARA, VBAK, KNA1.

**Example Table: MARA (Material Master General Data)**
| MATNR  | ERNAM   | ERDAT      |
| ------ | ------- | ---------- |
| MAT123 | PADMIN  | 23.06.2025 |
| MAT124 | TESTUSR | 21.06.2025 |

**read this data in ABAP like:**
``` abap
DATA: wa_mara TYPE mara.
SELECT SINGLE * INTO wa_mara FROM mara WHERE matnr = 'MAT123'.
WRITE: / wa_mara-ernam, wa_mara-erdat.
```

### 3. Views
- A view is a virtual table, created by joining multiple real tables.
- It does not store data itself, but pulls data dynamically when accessed.
- Used to simplify access to related data across tables.

** Example View: V_MARA_MAKT**
```abap
  DATA: BEGIN OF wa_view,
        matnr TYPE mara-matnr,
        maktx TYPE makt-maktx,
      END OF wa_view.

   SELECT SINGLE matnr maktx INTO wa_view FROM v_mara_makt WHERE matnr = 'MAT123'.

    WRITE: / wa_view-matnr, wa_view-maktx.
```
### 4. Data Elements 
  - A Data Element gives meaning to a field.
    
      - Defines the field’s label (like "Material Number"), Connects to documentation/help Can link to a search help.
        
- **Real-World Example:**
   -  Label: “Mobile Number” → this is a data element.
     
   -  It tells the user: this 10-digit number is a mobile number.
     
   -  So the label/meaning is added on top of the domain.
     
- **SAP Example (Data Element):**
    - Data Element: MATNR
    - Label: "Material Number"
    - Linked Domain: MATNR_D (NUMC 18)
    - Used in tables like MARA, VBAP, etc.
      
### 5. Domains
- A Domain defines the technical characteristics of a field, such as:
   - Data type (e.g., CHAR, NUMC, DEC)
   - Length (e.g., 10 characters, 18 digits)
   - Allowed values (value range or fixed values)
- **Real-World Example:**
   -  Form field: "Enter 10-digit number", That’s a domain: NUMC 10 – it tells you to type only numbers, max 10 digits.
     
   -  You don’t know what the number is for (ID? Phone? etc.), just the technical rule.
 - **SAP Example (Domain):**
    - Domain: MATNR_D
    - Type: NUMC
    - Length: 18
    - No decimals
    - Used for many material number fields
      
| **Concept**      | **Explanation**                                         | **Stores Data?** | **Use Case**                           | **Real Example**           |
| ---------------- | ------------------------------------------------------- | ---------------- | -------------------------------------- | -------------------------- |
| **Structure**    | Like a group of fields (but no data stored)             | ❌ No             | Temporary data format in ABAP programs | `ty_material` in code      |
| **Table**        | Physically stores data in the database                  | ✅ Yes            | Actual database storage                | `MARA`, `VBAK`, `KNA1`     |
| **View**         | Virtual table used to read joined or filtered data      | ❌ No (virtual)   | Join of tables for simplified access   | Custom view: `V_MARA_MAKT` |
| **Domain**       | Defines technical data type and value range (CHAR, INT) | ❌ No             | Controls input format, length, limits  | `MATNR` domain (length 18) |
| **Data Element** | Describes meaning and labels of fields                  | ❌ No             | Provides field labels, documentation   | `MATNR` (Material Number)  |

# Open SQL
### What is Open SQL?
 - **Open SQL** is a simplified version of SQL used in ABAP programs to communicate with SAP database tables.
 - It hides database-specific details and lets you access transparent tables, views, or pool/cluster tables using simple syntax.
   
  #### Why “Open” SQL??
  - “Open” means platform-independent.
  - SAP systems run on different databases (Oracle, HANA, MSSQL...), but you don’t need to change your SQL — SAP handles the conversion behind the scenes.
  - example,
    
| Statement | Purpose                       | Example                                   |
| --------- | ----------------------------- | ----------------------------------------- |
| `SELECT`  | Read data from database table | `SELECT * FROM mara INTO TABLE lt_mara.`  |
| `INSERT`  | Add new records               | `INSERT mara FROM wa_mara.`               |
| `UPDATE`  | Modify existing records       | `UPDATE mara SET mtart = 'HALB'.`         |
| `DELETE`  | Remove records                | `DELETE FROM mara WHERE matnr = '10001'.` |
|`INTO TABLE`| Put all records in an internal table | Like filling a basket             |
|` INTO wa`| One record into a work area    | Hold one item in your hand               |
| `WHERE `  | Filter your data               | Only FERT-type materials                 |
| `JOIN`   | Combine multiple tables        | Get both material number + description   |



| Rule                | Explanation                                                              |
| ------------------- | ------------------------------------------------------------------------ |
| Always use `INTO`   | Store results into internal table or work area                           |
| Use `WHERE` clause  | Avoid reading full table – it's performance-friendly                     |
| Use `SELECT SINGLE` | Only when expecting **one record**                                       |
| Use `INNER JOIN`    | To combine data from multiple tables                                     |
| Use `SY-LANGU`      | To get user-specific language data from text tables like `MAKT`, `T001T` |


 ### Real-Life Example 
  **Imagine you have an Excel sheet with all customer details:**
|Customer No|Name|	City|
|-----------|-----|------|
|1001|	Ramesh	|Pune|
|1002|	Suresh|	Mumbai|
|1003|	Priya|	Delhi|
  - In SAP, this customer data is stored in a table like KNA1.
  - You can use Open SQL in ABAP to get this data and show it in your program.

   **SAP Table: KNA1**
   - It stores Customer Master data.

|Field Name|	Meaning| 
|-----------|-----|
|KUNNR|	Customer Number|
|NAME1	|Customer Name|
|ORT01	|City|
### Example - Program
```abap
REPORT zopen_sql_kna1_demo.

* Step 1: Define structure
TYPES: BEGIN OF ty_customer,
         kunnr TYPE kna1-kunnr,  " Customer Number
         name1 TYPE kna1-name1,  " Name
         ort01 TYPE kna1-ort01,  " City
       END OF ty_customer.

* Step 2: Declare internal table and work area
DATA: lt_customers TYPE TABLE OF ty_customer,  " List of customers
      ls_customer  TYPE ty_customer.           " Single customer

* Step 3: Fetch data using Open SQL
SELECT kunnr name1 ort01
  FROM kna1
  INTO TABLE lt_customers
  UP TO 5 ROWS.

* Step 4: Display data
LOOP AT lt_customers INTO ls_customer.
  WRITE: / 'Customer No:', ls_customer-kunnr,
         'Name:', ls_customer-name1,
         'City:', ls_customer-ort01.
ENDLOOP.
```
#### Open SQL Explanation

| Keyword        | Meaning                                   |
| -------------- | ----------------------------------------- |
| `SELECT`       | I want to get data from the table         |
| `INTO TABLE`   | Put that data into my ABAP internal table |
| `WHERE`        | Filter the data based on a condition      |
| `ORDER BY`     | Sort the data (e.g., by name or city)     |
| `UP TO 5 ROWS` | Limit the number of rows you want         |

## 🔹Data Types in ABAP

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

## 🔹Constants and Parameters

### 3.1 What are Constants

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

## 🔹 Control Structures in ABAP

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
```
abap

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
---
# Structure 
- A structure is a group of fields (data items) combined together under one name.
- e.g., one row of a table or one form filled with multiple details.
  
- #### Real life example :-
- Imagine a student form with:
  - Roll Number
  - Name
  - Age
- this is a structure,
  ``` abap
  Roll No: 101  
  Name: Pournima  
  Age: 21
  ```
### How to Create Structure ?
follow given steps,
#### 1. Define the structure:
```abap
TYPES: BEGIN OF ty_student,
         rollno TYPE i,
         name   TYPE string,
         age    TYPE i,
       END OF ty_student.
```
 I have created a structure ty_student with 3 fields: roll number, name, and age.

####  2. Create a variable of that structure:
``` abap
DATA: lv_student TYPE ty_student.
```
Now I have one student (1 row) where I can store data.


####  3. Put values inside:
```abap
lv_student-rollno = 101.
lv_student-name   = 'Priya'.
lv_student-age    = 21.
```
I am filling student details.

####  4. Show the result:
```abap
WRITE: / 'Roll No:', lv_student-rollno,
       / 'Name:',    lv_student-name,
       / 'Age:',     lv_student-age.
```
- Variable	Stores one value only
- Structure	Stores many related values

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
|Roll No	| Name|	Marks|                                     
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

###🔹 READ, MODIFY, DELETE Internal Table

#### 🔸READ TABLE
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

#### 🔸MODIFY TABLE
- Update data in a specific row:

```abap
READ TABLE lt_students INTO wa_student WITH KEY name = 'Pournima'.

IF sy-subrc = 0.
  wa_student-age = 25.
  MODIFY lt_students FROM wa_student.
  WRITE: / 'Age updated to 25'.
ENDIF.
```
#### 🔸 DELETE FROM TABLE
- Remove an entry:

```abap
DELETE lt_students WHERE name = 'Riya'.

LOOP AT lt_students INTO wa_student.
  WRITE: / wa_student-name.
ENDLOOP.
```
---
# Database Integration


  
# Field Symbols
- A field symbol is like a pointer in ABAP.
- It does not store data, but refers to (points to) another variable or table row, so you can use or change that data directly.
- Field symbol is like a nickname or shortcut that points to the original data.
  
- **example,** Imagine you're working on a notebook:
  - Normally, you write directly on Page 1, Page 2, etc.
  - A field symbol is like a bookmark, it can point to Page 1 now, and later point to Page 5, etc.
  - So instead of creating multiple variables or work areas, you can use a field symbol to point to whatever you need at runtime.
  ###  How to Declare and Use a Field Symbol
   ```abap
   REPORT zfield_symbol_demo.

   DATA: lt_names TYPE TABLE OF string,
      lv_name  TYPE string.

   FIELD-SYMBOLS: <fs_name> TYPE string.

   * Add values to the table
   APPEND 'Priya' TO lt_names.
   APPEND 'Ajay' TO lt_names.
   APPEND 'Ramesh' TO lt_names.

  * Loop using field symbol
   LOOP AT lt_names ASSIGNING <fs_name>.
     WRITE: / 'Name:', <fs_name>.
   ENDLOOP.

   ```
   
  - `FIELD-SYMBOLS` → We declare a pointer called `<fs_name>`
  - ` ASSIGNING <fs_name>` → During loop, `<fs_name>` points to each row.
  - `<fs_name>` behaves like the row itself, we can read or change the value.
    
  |Without Field Symbol|	With Field Symbol|
  |--------------------|------------------|
  |LOOP AT lt_names INTO lv_name.|	LOOP AT lt_names ASSIGNING <fs_name>.|
  |Use copy of data	|Work on actual memory (no copy)|
  |Slower for big data	|Faster and more flexible|

# Modularization Techniques
- ### Includes : subroutines
- ### function modules
- ### includes
- ### macros

# Reports
- ### Classical Reports
- ### Interactive Reports
- ### ALV Reports (List Viewer)

# Dialog Programming
- ### Screen programming (Module Pool)
  

- ### Search Helps
- ### Lock Objects

