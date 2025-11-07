*&---------------------------------------------------------------------*
*& Report z_practice_prgrm
*&---------------------------------------------------------------------*

REPORT z_practice_prgrm.

TYPES: BEGIN OF ty_student,
         roll_no TYPE i,
         name    TYPE string,
         marks   TYPE i,
       END OF ty_student.

DATA: it_students TYPE TABLE OF ty_student,
      it_uniques  TYPE TABLE OF ty_student,
      wa_student  TYPE ty_student.

wa_student-roll_no = 1.
wa_student-name = 'Pournima'.
wa_student-marks = 87.
APPEND wa_student TO it_students.

wa_student-roll_no = 2.
wa_student-name = 'Aarav'.
wa_student-marks = 91.
APPEND wa_student TO it_students.

wa_student-roll_no = 1.  "Duplicate
wa_student-name = 'Pournima'.
wa_student-marks = 87.
APPEND wa_student TO it_students.

wa_student-roll_no = 3.
wa_student-name = 'Isha'.
wa_student-marks = 85.
APPEND wa_student TO it_students.

"--- Sort & remove duplicates ---

SORT it_students BY roll_no.
" DELETE
DELETE ADJACENT DUPLICATES FROM it_students COMPARING roll_no.

"--- Display final list ---
LOOP AT it_students INTO wa_student.
  WRITE: / wa_student-roll_no, wa_student-name, wa_student-marks.
ENDLOOP.
