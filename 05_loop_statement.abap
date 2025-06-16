*-----------------------------
*Description - LOOP AT Internal Table
*-----------------------------

DATA: lt_names TYPE TABLE OF string,
      lv_name TYPE String.

APPEND 'Riya' to lt_names.
APPEND 'Gayatri' to lt_names.

LOOP at lt_names INTO lv_name.
    WRITE: / lv_name.

ENDLOOP.


*---------------------------------------------------------------------
*Description -  Example 2: Display product details using internal table
*---------------------------------------------------------------------

TYPES: BEGIN OF ty_product,
         id    TYPE i,
         name  TYPE string,
         price TYPE p DECIMALS 2,
       END OF ty_product.

DATA: lt_products TYPE TABLE OF ty_product,
      wa_product  TYPE ty_product.

" Add products
wa_product-id = 1.
wa_product-name = 'Notebook'.
wa_product-price = 55.50.
APPEND wa_product TO lt_products.

wa_product-id = 2.
wa_product-name = 'Pen'.
wa_product-price = 10.00.
APPEND wa_product TO lt_products.

wa_product-id = 3.
wa_product-name = 'Bag'.
wa_product-price = 450.75.
APPEND wa_product TO lt_products.

" Display product list
LOOP AT lt_products INTO wa_product.
  WRITE: / 'Product ID:', wa_product-id,
           'Name:', wa_product-name,
           'Price:', wa_product-price.
ENDLOOP.
