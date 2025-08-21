REPORT z_alv_basic_mara.


* Tables declaration 
TABLES: mara.

* Define an internal structure (TY_MARA) to hold selected MARA fields
TYPES: BEGIN OF ty_mara,
         matnr TYPE mara-matnr,     "Material Number
         mtart TYPE mara-mtart,     "Material Type
         matkl TYPE mara-matkl,     "Material Group
         ersda TYPE mara-ersda,     "Created On (date)
         ernam TYPE mara-ernam,     "Created By (user)
         laeda TYPE mara-laeda,     "Last Changed On
         lvorm TYPE mara-lvorm,     "Deletion Flag
       END OF ty_mara.


* Work areas & internal tables
DATA: it_mara TYPE STANDARD TABLE OF ty_mara,   "Internal table
      wa_mara TYPE ty_mara.                     "Work area

DATA: it_fcat TYPE slis_t_fieldcat_alv,         "Field catalog table
      wa_fcat TYPE slis_fieldcat_alv.           "Field catalog work area


* Select data from MARA
SELECT matnr mtart matkl ersda ernam laeda lvorm
  FROM mara
  INTO TABLE it_mara
  UP TO 100 ROWS.   "Limit for practice, to avoid huge output


* Build field catalog (defines how columns appear in ALV)
" 1 - Material Number
wa_fcat-col_pos = 1.              " Column position
wa_fcat-fieldname = 'MATNR'.      " Field name in internal table
wa_fcat-seltext_m = 'Material No'. " Column header
wa_fcat-key = 'X'.                " Mark as key field
APPEND wa_fcat TO it_fcat.

" 2 - Material Type
CLEAR wa_fcat.
wa_fcat-col_pos = 2.
wa_fcat-fieldname = 'MTART'.
wa_fcat-seltext_m = 'Material Type'.
APPEND wa_fcat TO it_fcat.

" 3 - Material Group
CLEAR wa_fcat.
wa_fcat-col_pos = 3.
wa_fcat-fieldname = 'MATKL'.
wa_fcat-seltext_m = 'Material Group'.
APPEND wa_fcat TO it_fcat.

" 4 - Created On
CLEAR wa_fcat.
wa_fcat-col_pos = 4.
wa_fcat-fieldname = 'ERSDA'.
wa_fcat-seltext_m = 'Created On'.
wa_fcat-datatype = 'DATS'.   " Force date format
APPEND wa_fcat TO it_fcat.

" 5 - Created By
CLEAR wa_fcat.
wa_fcat-col_pos = 5.
wa_fcat-fieldname = 'ERNAM'.
wa_fcat-seltext_m = 'Created By'.
APPEND wa_fcat TO it_fcat.

" 6 - Last Changed On
CLEAR wa_fcat.
wa_fcat-col_pos = 6.
wa_fcat-fieldname = 'LAEDA'.
wa_fcat-seltext_m = 'Changed On'.
wa_fcat-datatype = 'DATS'.
APPEND wa_fcat TO it_fcat.

" 7 - Deletion Flag
CLEAR wa_fcat.
wa_fcat-col_pos = 7.
wa_fcat-fieldname = 'LVORM'.
wa_fcat-seltext_m = 'Deletion Flag'.
APPEND wa_fcat TO it_fcat.


* Display ALV Grid
CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    it_fieldcat = it_fcat          " Field catalog
    i_save      = 'A'              " Allow layout save
  TABLES
    t_outtab    = it_mara.         " Internal table data
