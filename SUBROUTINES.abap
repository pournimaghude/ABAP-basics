REPORT z_practice_prgrm.

"Basic Example
DATA: a_user TYPE String VALUE ' Pournima'.
PERFORM greeting_user.


FORM greeting_user.
  WRITE: / 'HELLO', a_user, 'Welocme to ABAP WORLD'.
ENDFORM.

*Example 1 - Pass_by_Ref - pass_by_ref both actual and formal parameter should be refering same memory location
" so if made any changes to Formal Parameter the actual Parameter also get change

DATA a TYPE i.
a = 10.

WRITE: / ' Before Calling SUbroutine value of A is: ', a.
PERFORM pass_by_ref USING a.
WRITE: / 'After Calling Subroutine Value A is: ', a.

FORM pass_by_ref USING f_a.
  f_a = f_a + 10.
ENDFORM.


*Example 2 - Pass_by_Value - it is both actual and formal parameter refering Separate memory location
" so if made any changes to Formal parameter it would not affect Actual parameter

DATA b TYPE i.
b = 10.

WRITE: / ' Before Calling SUbroutine value of B is: ', b.
PERFORM pass_by_value USING b."ACTUAL PARAMETER B "calling SUBROUTINE / IMPLEMENTATION paRt
WRITE: / 'After Calling Subroutine Value B is: ', b.

"Declaration PArt OF SUBROUTINE
FORM pass_by_value USING VALUE(F_b)."FORMAL PRAMETER
  f_b = f_b + 10.
ENDFORM.

**Example 3- Pass_by_value_and_Return - both actual and formal parameter separate memory space but,
*          "if any change made to formal parameter the actual parameter would change like pass_by_ref


DATA c TYPE i.
c = 20.

WRITE: / 'Before calling Subrotine value of c is:' ,c.
PERFORM pass_by_val_Return CHANGING c.
WRITE: / 'After calling Subrotine value of c is:' ,c.

FORM pass_by_val_Return CHANGING VALUE(f_c).
  f_c = f_c + 10.
ENDFORM.
