
*&---------------------------------------------------------------------*
*& Report ZDemo_fetching_values
*&---------------------------------------------------------------------*
*& Description :- value fetching from three tables , MARA, MAKT, MARD.
*&---------------------------------------------------------------------*
REPORT zar_calling_usual_abap_class.


TYPE-POOLS: slis.

*------------------------------------------------------------
* 1. Selection screen - Input for Material Number
*------------------------------------------------------------
PARAMETERS: p_matnr TYPE mara-matnr.

*------------------------------------------------------------
* 2. Structure Definition
*------------------------------------------------------------
TYPES: BEGIN OF ty_mat,
         matnr TYPE mara-matnr,     "material
         mtart TYPE mara-mtart,     "Material type
         mbrsh TYPE mara-mbrsh,     "industry
         spras TYPE makt-spras,     "language
         maktx TYPE makt-maktx,     "description
         werks TYPE mard-werks,     "plant
         labst TYPE mard-labst,     "unrestricted
         lgort TYPE mard-lgort,      "location
       END OF ty_mat.

DATA: it_mat TYPE STANDARD TABLE OF ty_mat,
      wa_mat TYPE ty_mat.

DATA: it_fieldcat TYPE slis_t_fieldcat_alv,
      wa_fieldcat TYPE slis_fieldcat_alv.

*------------------------------------------------------------
* 3. Fetch Data from MARA and MAKT for given Material Number
*------------------------------------------------------------
START-OF-SELECTION.

  SELECT a~matnr, a~mtart, a~mbrsh,
         b~spras, b~maktx, c~werks, c~labst, c~lgort
    INTO TABLE @it_mat
    FROM mara AS a
    INNER JOIN makt AS b ON a~matnr = b~matnr
    INNER JOIN mard as c on a~matnr = c~matnr
    WHERE a~matnr = @p_matnr
      AND b~spras = @sy-langu.

  IF it_mat IS INITIAL.
    MESSAGE 'No data found for entered Material Number' TYPE 'I'.
    EXIT.
  ENDIF.

*------------------------------------------------------------
* 4. Prepare Field Catalog for ALV Display
*------------------------------------------------------------
  CLEAR wa_fieldcat.
  wa_fieldcat-fieldname = 'MATNR'.
  wa_fieldcat-seltext_m = 'Material No'.
  APPEND wa_fieldcat TO it_fieldcat.

  wa_fieldcat-fieldname = 'MTART'.
  wa_fieldcat-seltext_m = 'Material Type'.
  APPEND wa_fieldcat TO it_fieldcat.

  wa_fieldcat-fieldname = 'MBRSH'.
  wa_fieldcat-seltext_m = 'Industry Sector'.
  APPEND wa_fieldcat TO it_fieldcat.

  wa_fieldcat-fieldname = 'SPRAS'.
  wa_fieldcat-seltext_m = 'Language'.
  APPEND wa_fieldcat TO it_fieldcat.

  wa_fieldcat-fieldname = 'MAKTX'.
  wa_fieldcat-seltext_m = 'Material Desc'.
  APPEND wa_fieldcat TO it_fieldcat.

  wa_fieldcat-fieldname = 'WERKS'.
  wa_fieldcat-seltext_m = 'Plant'.
  APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LGORT'.
  wa_fieldcat-seltext_m = 'Location'.
  APPEND wa_fieldcat TO it_fieldcat.

    wa_fieldcat-fieldname = 'LABST'.
  wa_fieldcat-seltext_m = 'Unrestricted'.
  APPEND wa_fieldcat TO it_fieldcat.

*------------------------------------------------------------
* 5. Display ALV Grid
*------------------------------------------------------------
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program = sy-repid
      it_fieldcat        = it_fieldcat
    TABLES
      t_outtab           = it_mat.
