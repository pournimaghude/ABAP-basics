
REPORT zar_calling_usual_abap_class.

TABLES: mara, makt, t002.

SELECT-OPTIONS: s_matnr FOR mara-matnr.

TYPES: BEGIN OF ty_mara,
         matnr           TYPE mara-matnr, "Material Number
         ersda           TYPE mara-ersda, "Material created on
         created_at_time TYPE mara-created_at_time,
         ernam           TYPE mara-ernam, "Material created by
         mtart           TYPE mara-mtart, "Material type
         spart           TYPE mara-spart, "Division
         matkl           TYPE mara-matkl, "Material Group
         maktx           TYPE makt-maktx, "material description
         laiso           TYPE t002-laiso, "2-char ISO Language Code
       END OF ty_mara.

DATA: it_mara TYPE TABLE OF ty_mara,
      wa_mara TYPE ty_mara.

*TYPE-POOLS: slis.

DATA: it_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv.

START-OF-SELECTION.

  SELECT a~matnr
         a~ersda
         a~created_at_time
         a~ernam
         a~mtart
         a~spart
         a~matkl
         b~maktx
         c~laiso  "<-- ISO code like EN, DE, FR
    INTO TABLE it_mara
    FROM mara AS a
    INNER JOIN makt AS b
      ON a~matnr = b~matnr
    INNER JOIN t002 AS c
      ON b~spras  = c~spras
    WHERE a~matnr IN s_matnr
     AND b~spras = sy-langu.


  "2. Build field catalog
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'MATNR'.
  wa_fieldcat-seltext_m = 'Material No.'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'ERSDA'.
  wa_fieldcat-seltext_m = 'Created On'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'CREATED_AT_TIME'.
  wa_fieldcat-seltext_m = 'Created At time'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'ERNAM'.
  wa_fieldcat-seltext_m = 'Created By'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'MTART'.
  wa_fieldcat-seltext_m = 'Material Type'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'SPART'.
  wa_fieldcat-seltext_m = 'Division'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'MATKL'.
  wa_fieldcat-seltext_m = 'Material Group'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'LAISO'.
  wa_fieldcat-seltext_m = 'Language (ISO)'.
  APPEND wa_fieldcat TO it_fieldcat.

  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'MAKTX'.
  wa_fieldcat-seltext_m = 'Material Description'.
  APPEND wa_fieldcat TO it_fieldcat.


  "3. Display with classic ALV Grid
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      it_fieldcat   = it_fieldcat
      i_grid_title  = 'MARA Material Data(mara +makt)'
    TABLES
      t_outtab      = it_mara
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
