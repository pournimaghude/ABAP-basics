
*************************************************************
* Example 1: Internal Table with Employee Details
*************************************************************
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


*************************************************************
* Example 2: Internal Table with Employee Details
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
