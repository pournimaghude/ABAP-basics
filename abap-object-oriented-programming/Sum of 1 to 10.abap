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

    DATA(lv_sum) = 0.
    DATA(lv_count) = 1.

    DO 10 TIMES.
      lv_sum = lv_sum + lv_count.
      lv_count = lv_count + 1.
    ENDDO.

    out->write( |total sum is { lv_sum }| ).
  ENDMETHOD.

ENDCLASS.
