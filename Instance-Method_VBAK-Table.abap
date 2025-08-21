
REPORT ZAR_CALLING_USUAL_ABAP_CLASS.

PARAMETERS: P_VBELN TYPE VBELN_VA.

DATA: LV_ERDAT TYPE ERDAT,
      LV_ERZET TYPE ERZET,
      LV_ERNAM TYPE ERNAM,
      LV_ANGDT TYPE ANGDT_V,
      LV_BNDDT TYPE BNDDT,
      LV_AUDAT TYPE AUDAT,
      LV_VBTYP TYPE VBTYPL,
      LV_TRVOG TYPE TRVOG,
      LV_AUART TYPE AUART.

data(lo_object) = new ZUSUAL_ABAP_CLASS( ).
CALL METHOD LO_OBJECT->GET_VBAK_DETAILS
  EXPORTING
    PVBELN      =  P_VBELN
  IMPORTING
    PERDAT      = LV_ERDAT
    PERZET      = LV_ERZET
    PERNAM      = LV_ERNAM
    PANGDT      =  LV_ANGDT
    PBNDDT      = LV_BNDDT
    PAUDAT      =  LV_AUDAT
    PVBTYP      = LV_VBTYP
    PTRVOG      = LV_TRVOG
    PAUART      = LV_AUART
  EXCEPTIONS
    WRONG_INPUT = 1
    OTHERS      = 2
        .
IF SY-SUBRC <> 0.
* Implement suitable error handling here
ENDIF.


WRITE:/ LV_ERDAT, LV_ERZET, LV_ERNAM, LV_ANGDT, LV_BNDDT, LV_AUDAT, LV_VBTYP, LV_TRVOG, LV_AUART.

*-------------------------------------------------------------
"method  - GET_VBAK_DETAILS
*---------------------------------------------------------------
  method GET_VBAK_DETAILS.
    Select single erdat erzet ernam angdt bnddt audat vbtyp trvog auart
      from vbak
      into (perdat, perzet, pernam, pangdt, pbnddt, paudat, pvbtyp, ptrvog, pauart)
      where vbeln = pvbeln.

      if sy-subrc ne 0.
        RAISE WRONG_INPUT.
        endif.
  endmethod.
