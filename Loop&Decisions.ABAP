*&---------------------------------------------------------------------*
*& Report z_practice_prgrm
*&---------------------------------------------------------------------*

REPORT z_practice_prgrm.

"1) Fixed Loop
"---------------------------------------------------------------
DATA: d_name TYPE i.

DO 5 TIMES.
  d_name = sy-index.
  WRITE: /'This is LOOP number', d_name.
ENDDO.

WRITE: / '-----------------------------------------------------'.

"------------------------------------------------------------------------------
"Output - This is LOOP number          1
"This is LOOP number                   2
"This is LOOP number                   3
"This is LOOP number                   4
"This is LOOP number                   5
"------------------------------------------------------------------------------


"2) Loop at Internal Table
"---------------------------------------------------------------
DATA: lt_name TYPE TABLE OF string,
      lv_name type string.

APPEND 'Pournima ' TO lt_name.
APPENd 'Priya' TO lt_name.
APPEND 'Sona' TO lt_name.

LOOP at lt_name into lv_name.
WRITE: / 'Hello', lv_name.
ENDLOOP.

WRITE: / '-----------------------------------------------------'.

"------------------------------------------------------------------------------
"Output - Hello Pournima
"Hello Priya
"Hello Sona
"------------------------------------------------------------------------------


"3)Conditional Logic
"---------------------------------------------------------------
PARAMETERS:  l_age TYPE i.

IF l_age < 13.
  WRITE: /'Your Child'.
ELSEIF l_age < 20.
  WRITE: / 'Teenage'.
ELSEIF l_age < 60.
  WRITE: /' Adult'.
ELSE.
  WRITE: / 'Your Senior Citizen'.
ENDIF.
WRITE: / '-----------------------------------------------------'.

"------------------------------------------------------------------------------
"Input - 21
"Output - Adult
"------------------------------------------------------------------------------



"4) Multi-option Decision
"---------------------------------------------------------------
PARAMETERS: p_grade TYPE c LENGTH 1.

CASE p_grade.

  WHEN 'A'.
    WRITE: / 'EXELLENT Performance'.
  WHEN 'B'.
    WRITE: / 'Good job'.
  WHEN 'C'.
    WRITE: / 'Needs improvement'.
  WHEN OTHERS.
    WRITE: / 'Invalid Grade Entered'.
ENDCASE.

WRITE: / '-----------------------------------------------------'.

"------------------------------------------------------------------------------
"Input - A
"Output - Excellent Performance
"------------------------------------------------------------------------------
