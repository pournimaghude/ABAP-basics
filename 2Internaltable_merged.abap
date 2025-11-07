*&---------------------------------------------------------------------*
*& Report z_practice_prgrm
*&---------------------------------------------------------------------*

REPORT z_practice_prgrm.

TYPES: BEGIN OF ty_student,
         roll_no TYPE i,
         name    TYPE string,
         marks   TYPE i,
       END OF ty_student.

DATA: it_classA  TYPE TABLE OF ty_student,
      it_classB  TYPE TABLE OF ty_student,
      it_merged  TYPE TABLE OF ty_student,
      wa_student TYPE ty_student.

wa_student-roll_no = 1.
wa_student-name = 'Pournima'.
wa_student-marks = 89.
APPEND wa_student TO it_classA.

wa_student-roll_no = 2.
wa_student-name = 'sky'.
wa_student-marks = 97.
APPEND wa_student TO it_classA.

wa_student-roll_no = 3.
wa_student-name = 'Seeta'.
wa_student-marks = 78.
APPEND wa_student TO it_classB.

wa_student-roll_no = 4.
wa_student-name = 'skymoon'.
wa_student-marks = 84.
APPEND wa_student TO it_classB.

APPEND LINES OF it_classA TO it_merged.
APPEND LINES OF it_classB TO it_merged.

LOOP AT it_merged INTO wa_student.
  WRITE: / wa_student-roll_no, wa_student-name, wa_student-marks.
ENDLOOP.
