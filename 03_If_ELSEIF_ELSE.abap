*------------------------------------------
*Description : IF, ELSEIF, ELSE Statements
*------------------------------------------
*Example -1
*------------------------------------------

DATA marks TYPE i VALUE 75.
IF marks >= 90.
  WRITE: 'Grade: A'.
ELSEIF marks >= 70.
  WRITE: 'Grade: B'.
ELSE.
  WRITE: 'Grade: C or below'.
ENDIF.

*Example -2
*-------------------------------------------

DATA: l_age TYPE i.
l_age = 16.
IF l_age < 18.
    WRITE: 'Minor person'.
ELSEIF l_age >= 18 AND l_age < 60.
    WRITE: 'Adult person'.
ELSE.
    WRITE: 'Senior Citizen'.
ENDIF.
