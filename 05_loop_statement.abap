*-----------------------------------
*Description - creation of structure
*-----------------------------------

REPORT zStructure.

"define structure
TYPES : BEGIN OF ty_students,
        roll_no TYPE i,
        name TYPE string,
        age TYPE i,
        END OF ty_students.

"Create a variable of that structure
DATA : l_student TYPE ty_students.

"put value inside
l_student-ROLL_NO = 101.
l_student-name = 'Pournima'.
l_student-AGE = 21.

"show result
WRITE: / 'ROLLNO : ', L_STUDENT-ROLL_NO,
       / 'Name : ', l_student-name,
       / 'AGE : ', l_student-age.


