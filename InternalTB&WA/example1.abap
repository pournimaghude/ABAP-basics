
REPORT zar_calling_usual_abap_class.

TYPES: BEGIN OF ty_employee,
         emp_id      TYPE char10,
         empname     TYPE char30,
         salary      TYPE p DECIMALS 2,
         designation TYPE char20,
       END OF ty_employee.


DATA: lt_employees TYPE TABLE OF ty_employee,
      ls_employee  TYPE ty_employee.

START-OF-SELECTION.

  CLEAR ls_employee.
  ls_employee-emp_id = '1001'.
  ls_employee-empname = 'Pournima'.
  ls_employee-salary = '2000.0'.
  ls_employee-designation = 'Software Developer'.
  APPEND ls_employee TO lt_employees.


  CLEAR ls_employee.
  ls_employee-emp_id = '1002'.
  ls_employee-empname = 'abc'.
  ls_employee-salary = '80000.0'.
  ls_employee-designation = 'Senior Software Developer'.
  APPEND ls_employee TO lt_employees.


  CLEAR ls_employee.
  ls_employee-emp_id = '1003'.
  ls_employee-empname = 'AJ'.
  ls_employee-salary = '7000'.
  ls_employee-designation = 'Sales Manager'.
  APPEND ls_employee TO lt_employees.

  CLEAR ls_employee.
  READ TABLE lt_employees INTO ls_employee WITH KEY emp_id = '1001'.

  IF sy-subrc = 0.
    WRITE: / 'READ RESULT: ', ls_employee-emp_id, ls_employee-empname, ls_employee-salary, ls_employee-designation.
  ELSE.
    WRITE: / 'Employee not found'.
  ENDIF.
  WRITE : / '------------------------------------------------------------------------------------------------------------------------'.
  WRITE : / 'All Employees:'.

  LOOP AT lt_employees INTO ls_employee.
    WRITE: / ls_employee-emp_id, ls_employee-empname, ls_employee-salary, ls_employee-designation.
  ENDLOOP.
  WRITE : / '------------------------------------------------------------------------------------------------------------------------'.

*   MODIFY: Update a record using work area
  CLEAR ls_employee.
  ls_employee-emp_id = '1002'.
  ls_employee-empname = 'Jane Wilson'.
  ls_employee-salary = '6500.00'.
  MODIFY lt_employees FROM ls_employee TRANSPORTING empname salary WHERE emp_id = '1002'.
  WRITE: / 'After MODIFY for emp id 1002:'.
  READ TABLE lt_employees INTO ls_employee WITH KEY emp_id = '1002'.

  WRITE: ls_employee-emp_id, ls_employee-empname, ls_employee-salary, ls_employee-designation.
  WRITE : / '-------------------------------------------------------------------------------------------------------------------------'.


*DELETE: Remove a record
  DELETE lt_employees WHERE emp_id = '1003'.
  WRITE: / 'After DELETE for emp id 1003:'.
  LOOP AT lt_employees INTO ls_employee.
    WRITE: /
    ls_employee-emp_id, ls_employee-empname, ls_employee-salary, ls_employee-designation.
  ENDLOOP.
  
  
