
REPORT zar_calling_usual_class.

TABLES: kna1, knb1.

SELECT-OPTIONS: s_kunnr FOR kna1-kunnr.

TYPES: BEGIN OF ty_customer,
         kunnr TYPE kna1-kunnr,
         name1 TYPE kna1-name1,
         ort01 TYPE kna1-ort01,
         pstlz TYPE kna1-pstlz,
         regio TYPE kna1-regio,
         sortl TYPE kna1-sortl,
         adrnr TYPE kna1-adrnr,
         mcod1 TYPE kna1-mcod1,
         bukrs TYPE knb1-bukrs,
       END OF ty_customer.

DATA: wa_customer TYPE ty_customer,
      lt_customer TYPE TABLE OF ty_customer.

DATA: lt_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv.

START-OF-SELECTION.

  SELECT a~kunnr, a~name1, a~ort01, a~pstlz, a~regio, a~sortl, a~adrnr, a~mcod1, b~bukrs
    FROM kna1 AS a
    INNER JOIN knb1 AS b
    ON a~kunnr = b~kunnr
  INTO TABLE @lt_customer
  WHERE a~land1 = 'IN'
  AND a~kunnr IN @s_kunnr.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'KUNNR'.
  wa_fieldcat-seltext_m = 'Customer No'.
  APPEND wa_fieldcat TO lt_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'NAME1'.
  wa_fieldcat-seltext_m = 'Name '.
  APPEND wa_fieldcat TO lt_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'ORT01'.
  wa_fieldcat-seltext_m = 'City'.
  APPEND wa_fieldcat TO lt_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'PSTLZ'.
  wa_fieldcat-seltext_m = 'Postal Code'.
  APPEND wa_fieldcat TO lt_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'REGIO'.
  wa_fieldcat-seltext_m = 'Region'.
  APPEND wa_fieldcat TO lt_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'SORTL'.
  wa_fieldcat-seltext_m = 'Sort field'.
  APPEND wa_fieldcat TO lt_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'ADRNR'.
  wa_fieldcat-seltext_m = 'Address'.
  APPEND wa_fieldcat TO lt_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'MCOD1'.
  wa_fieldcat-seltext_m = 'Search term'.
  APPEND wa_fieldcat TO lt_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'BUKRS'.
  wa_fieldcat-seltext_m = 'COMPANY CODE'.
  APPEND wa_fieldcat TO lt_fieldcat.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      i_grid_title       = 'Customer Table Data'
      it_fieldcat        = lt_fieldcat
    TABLES
      t_outtab           = lt_customer
    EXCEPTIONS
      program_error      = 1
      OTHERS             = 2.

  IF sy-subrc <> 0.
    WRITE: 'Error Displaying ALV.'.
  ENDIF.
