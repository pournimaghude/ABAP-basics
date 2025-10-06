REPORT zar_calling_usual_abap_class.

TYPE-POOLS: slis.  " ✅ This is the magic line

TABLES: mara.

PARAMETERS: pmattype TYPE mara-mtart.         " Material Type
SELECT-OPTIONS: s_matkl FOR mara-matkl.       " Material Group

TYPES: BEGIN OF ty_mara,
         matnr TYPE mara-matnr,
         mtart TYPE mara-mtart,
         matkl TYPE mara-matkl,
         ersda TYPE mara-ersda,
       END OF ty_mara.

DATA: it_mara     TYPE TABLE OF ty_mara,
      wa_mara     TYPE ty_mara,
      it_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv.

SELECT matnr, mtart, matkl, ersda
  INTO TABLE @it_mara
  FROM mara
  WHERE mtart = @pmattype
    AND matkl IN @s_matkl.

" Building Field Catalog
wa_fieldcat-col_pos = 1.
wa_fieldcat-fieldname = 'MATNR'.
wa_fieldcat-seltext_m = 'Material Number'.
wa_fieldcat-key = 'X'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-col_pos = 2.
wa_fieldcat-fieldname = 'MTART'.
wa_fieldcat-seltext_m = 'Material Type'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-col_pos = 3.
wa_fieldcat-fieldname = 'MATKL'.
wa_fieldcat-seltext_m = 'Material Group'.
APPEND wa_fieldcat TO it_fieldcat.

CLEAR wa_fieldcat.
wa_fieldcat-col_pos = 4.
wa_fieldcat-fieldname = 'ERSDA'.
wa_fieldcat-seltext_m = 'Created Date'.
APPEND wa_fieldcat TO it_fieldcat.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
      i_callback_program = sy-repid
      i_grid_title       = 'Material Tab'
      it_fieldcat        = it_fieldcat
  TABLES
    t_outtab           = it_mara
  EXCEPTIONS
    program_error      = 1
    OTHERS             = 2.


  IF sy-subrc <> 0.
    WRITE: 'Error Displaying ALV.'.
  ENDIF.
