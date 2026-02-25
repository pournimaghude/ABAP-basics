CLASS zcl_sap_hello_world_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_sap_hello_world_demo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

      DATA(lv_number) = 7.

  IF lv_number MOD 2 = 0.
    out->write( |{ lv_number } is Even| ).
  ELSE.
    out->write( |{ lv_number } is Odd| ).
  ENDIF.

  ENDMETHOD.

ENDCLASS.
