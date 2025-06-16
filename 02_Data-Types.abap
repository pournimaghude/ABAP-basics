**********************************************************************
*Description : ABAP data types
**********************************************************************
DATA: lv_age TYPE i VALUE 22,                                          "Integer
      lv_salary TYPE p DECIMALS 2 VALUE '10000.75',                    "Packed Decimals
      lv_name TYPE c LENGTH 10 VALUE 'POURNIMA',                       "Character
      lv_pan TYPE n LENGTH 10 VALUE '1234567890',                      "Number text
      lv_temp TYPE f VALUE '30.5',                                     "Floating point
      lv_birthday TYPE d VALUE '20030317',                             "Date
      lv_logintime TYPE t VALUE '143010',                              "time
      lv_address TYPE string VALUE 'Mumbai, India'.                    "String


      START-OF-SELECTION.

      WRITE: / 'Name: ', lv_name,
             / 'Age: ', lv_age,
             / 'Salary: ', lv_salary,
             / 'PAN Number: ', lv_pan,
             / 'Temperature: ', lv_temp,
             / 'Birthday: ', lv_birthday,
             / 'Login Time: ', lv_logintime,
             / 'Address: ', lv_address.
