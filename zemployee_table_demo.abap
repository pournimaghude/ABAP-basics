
*************************************************************
* Example: Internal Table with Employee Details
*************************************************************
REPORT zemployee_table_demo.

TYPES: BEGIN OF ty_employee,
         emp_id   TYPE i,
         emp_name TYPE string,
         salary   TYPE p DECIMALS 2,
       END OF ty_employee.

DATA: lt_employees TYPE TABLE OF ty_employee,
      wa_employee  TYPE ty_employee.

" Append 3 employees
wa_employee-emp_id = 101.
wa_employee-emp_name = 'Pournima'.
wa_employee-salary = 35000.
APPEND wa_employee TO lt_employees.

wa_employee-emp_id = 102.
wa_employee-emp_name = 'Gayatri'.
wa_employee-salary = 32000.
APPEND wa_employee TO lt_employees.

wa_employee-emp_id = 103.
wa_employee-emp_name = 'Riya'.
wa_employee-salary = 30000.
APPEND wa_employee TO lt_employees.

" Read employee with ID = 102
READ TABLE lt_employees INTO wa_employee WITH KEY emp_id = 102.
IF sy-subrc = 0.
  WRITE: / 'Before Update ->', wa_employee-emp_name, wa_employee-salary.
  
  " Modify salary
  wa_employee-salary = 35000.
  MODIFY lt_employees FROM wa_employee.
ENDIF.

" Delete employee with ID = 103
DELETE lt_employees WHERE emp_id = 103.

" Loop through all employees
LOOP AT lt_employees INTO wa_employee.
  WRITE: / 'ID:', wa_employee-emp_id,
           'Name:', wa_employee-emp_name,
           'Salary:', wa_employee-salary.
ENDLOOP.
