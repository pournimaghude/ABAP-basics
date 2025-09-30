REPORT z_crud_employee_radio.

"==== Type Definitions ====
TYPES: BEGIN OF ty_employee,
         emp_id      TYPE char10,
         empname     TYPE char30,
         salary      TYPE p DECIMALS 2,
         designation TYPE char20,
       END OF ty_employee.

DATA: lt_employees TYPE TABLE OF ty_employee,
      ls_employee  TYPE ty_employee.

"==== Selection Screen ====
PARAMETERS: rb_disp TYPE abap_bool RADIOBUTTON GROUP rad1 DEFAULT 'X' USER-COMMAND rad,
            rb_crea  TYPE abap_bool RADIOBUTTON GROUP rad1,
            rb_upd  TYPE abap_bool RADIOBUTTON GROUP rad1,
            rb_del TYPE abap_bool RADIOBUTTON GROUP rad1.

PARAMETERS: p_empid  TYPE char10,
            p_name   TYPE char30,
            p_salary TYPE p DECIMALS 2,
            p_desig  TYPE char20.

"==== START-OF-SELECTION ====
START-OF-SELECTION.

  " Pre-fill table with some data
  PERFORM fill_initial_data.

  " Determine which action was selected
  IF rb_disp = 'X'.
    PERFORM display_employees.

  ELSEIF rb_crea = 'X'.
    PERFORM create_employee USING p_empid p_name p_salary p_desig.

  ELSEIF rb_upd = 'X'.
    PERFORM update_employee USING p_empid p_name p_salary p_desig.

  ELSEIF rb_del = 'X'.
    PERFORM delete_employee USING p_empid.

  ENDIF.

"==== FORM Routines ====

FORM fill_initial_data.
  " Only fill if table is empty
  IF lt_employees IS INITIAL.
    APPEND VALUE #( emp_id = '1001' empname = 'Alice' salary = 3000 designation = 'Developer' ) TO lt_employees.
    APPEND VALUE #( emp_id = '1002' empname = 'Bob' salary = 5000 designation = 'Manager' ) TO lt_employees.
    APPEND VALUE #( emp_id = '1003' empname = 'Charlie' salary = 2000 designation = 'Sales' ) TO lt_employees.
  ENDIF.
ENDFORM.

FORM display_employees.
  IF lt_employees IS INITIAL.
    WRITE: / 'No employees to display.'.
    RETURN.
  ENDIF.

  WRITE: / 'EMP_ID', 10 'EMP_NAME', 30 'SALARY', 50 'DESIGNATION'.
  LOOP AT lt_employees INTO ls_employee.
    WRITE: / ls_employee-emp_id, 10 ls_employee-empname, 30 ls_employee-salary, 50 ls_employee-designation.
  ENDLOOP.
ENDFORM.

FORM create_employee USING iv_id iv_name iv_salary iv_desig.
  READ TABLE lt_employees WITH KEY emp_id = iv_id TRANSPORTING NO FIELDS.
  IF sy-subrc = 0.
    WRITE: / 'Employee already exists!'.
    RETURN.
  ENDIF.

  APPEND VALUE #( emp_id = iv_id empname = iv_name salary = iv_salary designation = iv_desig ) TO lt_employees.
  WRITE: / 'Employee created successfully!'.
  PERFORM display_employees.
ENDFORM.

FORM update_employee USING iv_id iv_name iv_salary iv_desig.
  READ TABLE lt_employees INTO ls_employee WITH KEY emp_id = iv_id.
  IF sy-subrc <> 0.
    WRITE: / 'Employee not found!'.
    RETURN.
  ENDIF.

  MODIFY lt_employees FROM VALUE #( emp_id = iv_id empname = iv_name salary = iv_salary designation = iv_desig )
          TRANSPORTING empname salary designation
          WHERE emp_id = iv_id.
  WRITE: / 'Employee updated successfully!'.
  PERFORM display_employees.
ENDFORM.

FORM delete_employee USING iv_id.
  DELETE lt_employees WHERE emp_id = iv_id.
  IF sy-subrc = 0.
    WRITE: / 'Employee deleted successfully!'.
  ELSE.
    WRITE: / 'Employee not found!'.
  ENDIF.
  PERFORM display_employees.
ENDFORM.
