CLASS zad163_cl_fill_products DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zad163_cl_fill_products IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA products TYPE STANDARD TABLE OF zad163_products WITH DEFAULT KEY.

    products = VALUE #(
          ( material = 'HT-1000' price = '700' currency = 'EUR' )
          ( material = 'HT-1001' price = '1000' currency = 'EUR' )
           ( material = 'HT-1002' price = '250' currency = 'EUR' )
          ( material = 'HT-1003' price = '1000' currency = 'EUR' )
          ).

    MODIFY zad163_products FROM TABLE @products.

    COMMIT WORK.

  ENDMETHOD.

ENDCLASS.
