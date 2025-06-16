*-------------------------------------------------
*CASE Statement
*-------------------------------------------------
*Example 1 -
*-------------------------------------------------
DATA: lv_grade TYPE c.
lv_grade = 'B'.

CASE lv_grade.
    WHEN'A'.
        WRITE: 'Excellent'.
    WHEN'B'.
        WRITE: 'GOOD'.
    WHEN'C'.
        WRITE: 'AVERAGE'.
    WHEN OTHERS.
        WRITE: 'INVALID GRADE'.
    ENDCASE.

*Example 2 -
*-------------------------------------------------
DATA: lv_day TYPE i VALUE 3.
CASE lv_day.

WHEN 1.
    WRITE: 'MONDAY'.
WHEN 2.
    WRITE: 'TUEDAY'.
WHEN 3.
    WRITE: 'WEDNESDAY'.
WHEN OTHERS.
    WRITE: 'INVALID'.

ENDCASE.
