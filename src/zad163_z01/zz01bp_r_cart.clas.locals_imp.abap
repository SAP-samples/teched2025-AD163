CLASS lhc_item DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
    METHODS calculateItemPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Item~calculateItemPrice.

    METHODS calculateItemID FOR DETERMINE ON SAVE
      IMPORTING keys FOR Item~calculateItemID.
    METHODS validateOrderedItem FOR VALIDATE ON SAVE
      IMPORTING keys FOR Item~validateOrderedItem.

    METHODS validateOrderQuantity FOR VALIDATE ON SAVE
      IMPORTING keys FOR Item~validateOrderQuantity.

ENDCLASS.

CLASS lhc_item IMPLEMENTATION.

  METHOD calculateItemPrice.
    READ ENTITIES OF zZ01r_cart IN LOCAL MODE
      ENTITY Item
        FIELDS ( Quantity ItemUnitPrice )
        WITH CORRESPONDING #( keys )
      RESULT DATA(entities).

    LOOP AT entities INTO DATA(entity).
      DATA(lv_item_price) = entity-Quantity * entity-ItemUnitPrice.

      MODIFY ENTITIES OF zZ01r_cart IN LOCAL MODE
        ENTITY Item
          UPDATE FIELDS ( ItemPrice )
          WITH VALUE #(
            ( %tky = entity-%tky
              ItemPrice = lv_item_price )
          ).
    ENDLOOP.
  ENDMETHOD.

  METHOD calculateItemID.

    DATA: lv_count        TYPE i,
          lv_semantic_key TYPE string.

    SELECT COUNT(*) FROM zZ01item INTO @lv_count.

    lv_semantic_key = |ITEM_{ lv_count }|.

    MODIFY ENTITIES OF zZ01r_cart IN LOCAL MODE
      ENTITY Item
        UPDATE FIELDS ( ItemID )
        WITH VALUE #(
          FOR key IN keys
          ( %tky = key-%tky
            ItemID = lv_semantic_key )
        ).
  ENDMETHOD.

  METHOD validateOrderedItem.

    READ ENTITIES OF zZ01r_cart IN LOCAL MODE
      ENTITY Item
        FIELDS ( OrderedItem )
        WITH CORRESPONDING #( keys )
      RESULT DATA(entities).

    LOOP AT entities INTO DATA(entity).
      APPEND VALUE #(
          %tky        = entity-%tky
          %state_area = 'Validation-OrderedItem'
      ) TO reported-Item.

      IF entity-OrderedItem IS INITIAL.
        APPEND VALUE #( %tky = entity-%tky ) TO failed-Item.
        APPEND VALUE #(
            %tky        = entity-%tky
            %state_area = 'Validation-OrderedItem'
            %msg        = new_message_with_text(
              text     = 'OrderedItem must not be initial.'
              severity = if_abap_behv_message=>severity-error
            )
        ) TO reported-Item.
      ELSE.
        SELECT SINGLE * FROM zad163_i_products
          WHERE material = @entity-OrderedItem
          INTO @DATA(lv_product).

        IF sy-subrc <> 0.
          APPEND VALUE #( %tky = entity-%tky ) TO failed-Item.
          APPEND VALUE #(
              %tky        = entity-%tky
              %state_area = 'Validation-OrderedItem'
              %msg        = new_message_with_text(
                text     = 'OrderedItem is not valid.'
                severity = if_abap_behv_message=>severity-error
              )
          ) TO reported-Item.
        ENDIF.
      ENDIF.
    ENDLOOP.


  ENDMETHOD.

  METHOD validateOrderQuantity.



   READ ENTITIES OF zZ01r_cart IN LOCAL MODE
     ENTITY Item
       FIELDS ( Quantity )
       WITH CORRESPONDING #( keys )
     RESULT DATA(entities).

   LOOP AT entities INTO DATA(entity).
     APPEND VALUE #(
         %tky        = entity-%tky
         %state_area = 'Validation-Quantity'
     ) TO reported-Item.

     IF entity-Quantity IS INITIAL.
       APPEND VALUE #( %tky = entity-%tky ) TO failed-Item.
       APPEND VALUE #(
           %tky        = entity-%tky
           %state_area = 'Validation-Quantity'
           %msg        = new_message_with_text(
             text     = 'Quantity must not be initial.'
             severity = if_abap_behv_message=>severity-error
           )
       ) TO reported-Item.
     ENDIF.
   ENDLOOP.




  ENDMETHOD.

ENDCLASS.

CLASS lhc_Cart DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Cart RESULT result.
    METHODS calculateOrderID FOR DETERMINE ON SAVE
      IMPORTING keys FOR Cart~calculateOrderID.
    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Cart~calculateTotalPrice.
    METHODS validateRequestDeliveryDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Cart~validateRequestDeliveryDate.

ENDCLASS.

CLASS lhc_Cart IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD calculateOrderID.

    DATA: lt_cart     TYPE TABLE OF zz01cart,
          lv_count    TYPE i,
          lv_order_id TYPE string.

    " Read the entries from the ZZ01CART table
    SELECT * FROM zz01cart INTO TABLE @lt_cart.

    " Calculate the number of entries
    lv_count = lines( lt_cart ).

    " Create a semantic key based on the number of entries
    lv_order_id = |ORD-{ lv_count }|.

    " Modify the entities with the calculated OrderID
    MODIFY ENTITIES OF zz01r_cart IN LOCAL MODE
      ENTITY Cart
        UPDATE FIELDS ( OrderID )
        WITH VALUE #(
          FOR key IN keys (
            %tky    = key-%tky
            OrderID = lv_order_id
          )
        ).

  ENDMETHOD.

  METHOD calculateTotalPrice.

    READ ENTITIES OF zZ01r_cart IN LOCAL MODE
      ENTITY Item
        FIELDS ( ItemPrice )
        WITH CORRESPONDING #( keys )
      RESULT DATA(entities).

    DATA lv_total_price TYPE decfloat34 VALUE 0.

    LOOP AT entities INTO DATA(entity).
      lv_total_price += entity-ItemPrice.
    ENDLOOP.

    MODIFY ENTITIES OF zZ01r_cart IN LOCAL MODE
      ENTITY Cart
        UPDATE FIELDS ( TotalPrice )
        WITH VALUE #(
          FOR key IN keys
          ( %tky = key-%tky
            TotalPrice = lv_total_price )
        ).
  ENDMETHOD.



  METHOD validateRequestDeliveryDate.

    READ ENTITIES OF zZ01r_cart IN LOCAL MODE
      ENTITY Cart
        FIELDS ( RequestDeliveryDate )
        WITH CORRESPONDING #( keys )
      RESULT DATA(entities).

    DATA(current_date) = cl_abap_context_info=>get_system_date( ).

    LOOP AT entities INTO DATA(entity).
      APPEND VALUE #(  %tky               = entity-%tky
                       %state_area        = 'Validation-RequestDeliveryDate'
                     ) TO reported-cart.
      IF entity-RequestDeliveryDate IS INITIAL OR entity-RequestDeliveryDate <= current_date.
        APPEND VALUE #( %tky = entity-%tky ) TO failed-Cart.
        APPEND VALUE #(
            %tky        = entity-%tky
            %state_area = 'Validation-RequestDeliveryDate'
            %msg        = new_message_with_text(
              text     = 'RequestDeliveryDate must be in the future and not initial.'
              severity = if_abap_behv_message=>severity-error
            )
        ) TO reported-Cart.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
