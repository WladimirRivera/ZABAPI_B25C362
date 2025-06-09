CLASS zcl_constructor_exp_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_constructor_exp_c362 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
**********************Value************************************************
*    TYPES: BEGIN OF ty_students,
*             name TYPE string,
*           END OF ty_students.
*    DATA lt_msg TYPE STANDARD TABLE OF ty_students.
*    lt_msg = VALUE #( ( name = 'Jose' )
*                      ( name = 'Laura' ) ).
*
*    out->write( data = lt_msg name = 'Value' ).
*
*
*    DATA(ls_msg) = VALUE ty_students( name = 'Jose'   ).
*
*    out->write( data = ls_msg name = 'Value' ).

*    DATA: BEGIN OF ls_emp_data,
*            emp_name TYPE string,
*            BEGIN OF address,
*              street TYPE string,
*              lv_number TYPE string,
*            END OF address,
*          END OF ls_emp_data.

*    TYPES: BEGIN OF ls_emp_data2,
*             emp_name TYPE string,
*             BEGIN OF address,
*               street TYPE string,
*               lv_number TYPE string,
*             END OF address,
*           END OF ls_emp_data2.
*
*    DATA ls_emp_data TYPE ls_emp_data2.
*
*    ls_emp_data = VALUE #( emp_name = 'Laura'
*                           address  = VALUE #( street = 'Street CA'
*                                               lv_number = 123  )
*).

*    out->write( ls_emp_data ).

    SELECT FROM sflights
        FIELDS *
        INTO TABLE @DATA(lt_flights_all).
*        UP TO 10 ROWS.

    DATA lt_table_2 TYPE STANDARD TABLE OF sflights.

    lt_table_2 = VALUE #( FOR ls_table IN lt_flights_all
*lt_table = VALUE #( FOR i = 1 UNTIL i > 3
                         WHERE ( carrid EQ 'AA' )
                      ( carrid = ls_table-carrid
                        connid = ls_table-connid
                        fldate = ls_table-fldate )
                       ).
    out->write( lt_table_2 ).
*********************Corresponding*************************************************
*    TYPES: BEGIN OF ty_old,
*             name TYPE string,
*             age  TYPE i,
*           END OF ty_old.
*
*    TYPES: BEGIN OF ty_new,
*             name    TYPE string,
*             age     TYPE i,
*             address TYPE string,
*           END OF ty_new.
*
**    DATA: ls_old_data TYPE ty_old.
**
**    ls_old_data = VALUE #( name = 'Alice' age = 25 ).
**
**    DATA(ls_new_data) = CORRESPONDING ty_new( ls_old_data ).
**
**    out->write( ls_old_data ).
**
**    out->write( ls_new_data ).
**
**    out->write( cl_abap_char_utilities=>newline ).
*
*    DATA: lt_old_data   TYPE STANDARD TABLE OF ty_old,
*          lt_exept_data TYPE STANDARD TABLE OF ty_old,
*          lt_new_data   TYPE SORTED TABLE OF ty_new WITH UNIQUE KEY name.
*
*    lt_old_data = VALUE #( ( name = 'Alice' age = 25 )
*                            ( name = 'Alice' age = 25 )
*                            ( name = 'Alice' age = 25 )
*                            ( name = 'Laura' age = 25 ) ).
*
*    lt_new_data = CORRESPONDING #( lt_old_data DISCARDING DUPLICATES ).
**    lt_new_data = CORRESPONDING #( lt_old_data  ).
*    out->write( lt_new_data ).
*
*    lt_exept_data = CORRESPONDING #( lt_old_data EXCEPT age ).
*    out->write( lt_exept_data ).

***************************Ref********************************************
*    DATA: lv_lv_num     TYPE i,
*          lr_ref_lv_num TYPE REF TO i.
*
*    lv_lv_num = 200.
*
*    lr_ref_lv_num = REF #( lv_lv_num ). " Crear una referencia al valor de lv_num
*
*    out->write( lr_ref_lv_num->* ). " Acceder al valor referenciado
*    lr_ref_lv_num->* = 100.
*    out->write( lv_lv_num ). " Acceder al valor referenciado

*******************REDUCE****************************************************
*    DATA: lt_lv_numbers TYPE TABLE OF i,
*          lv_sum     TYPE i.
*
*    lt_lv_numbers = VALUE #( ( 1 ) ( 2 ) ( 3 ) ).
*
*    lv_sum = REDUCE #( INIT x = 0
*                    FOR n IN lt_lv_numbers
*                    NEXT x = x + n ).
*
*    out->write( lv_sum ).
*
*    out->write( cl_abap_char_utilities=>newline ).

**************************CONV********************************************
*    DATA: lv_text TYPE string,
*          lv_num  TYPE p LENGTH 5 DECIMALS 2 VALUE '3.4'.
*
**    lv_num = 100.
*
*    lv_text = CONV string( lv_num ).
*
*    out->write( lv_text ).
***************************NEW********************************************
*    DATA(lo_class) = NEW zcl_new_example_c362( ).
*
*    DATA: lo_class2 TYPE REF TO zcl_new_example_c362.
*
*    lo_class2 = NEW #( ).
*
*    out->write( lo_class2->print_value( )  ).
*
*    DATA: lo_class3 TYPE REF TO zcl_new_example_c362.
*    CREATE OBJECT lo_class3.
*
*    out->write( lo_class3->print_value( )  ).
***************************Cast*********************************************
*    TYPES: BEGIN OF t_struct,
*             col1 TYPE i,
*             col2 TYPE i,
*           END OF t_struct.
*
*    DATA: lo_data TYPE REF TO data,
*          ls_int  TYPE t_struct.
*
*
*    lo_data = NEW t_struct( ).
*
*    ls_int = CAST t_struct( lo_data )->*.
*    ls_int-col1 = CAST t_struct( lo_data )->col1.
*
*    out->write( ls_int ).
*
*    out->write( cl_abap_char_utilities=>newline ).
*
*    ls_int = VALUE #( col1 = 4
*                      col2 = 6 ).
*
*    CAST t_struct( lo_data )->* = ls_int.
*
*    out->write( ls_int ).

**********************Exact***********************************************

*    DATA: lv_int_value  TYPE i VALUE 327678,
*          lv_int2_value TYPE int2.
*    TRY.
*        lv_int2_value = EXACT int2( lv_int_value ).
*        out->write( data = lv_int2_value name = 'Converted value:' ).
*      CATCH cx_sy_conversion_error INTO DATA(lx_error).
*        out->write( data = lx_error->get_text( ) name = 'Error' ).
*    ENDTRY.

************************Filter**********************************************

*    DATA: lt_flights_all   TYPE STANDARD TABLE OF sflights,
*          lt_flights_final TYPE STANDARD TABLE OF sflights,
*          "Filter table
*          lt_filter        TYPE SORTED TABLE OF sflights-carrid WITH UNIQUE KEY table_line.
*
*    SELECT FROM sflights
*        FIELDS *
*        INTO TABLE @lt_flights_all.
*
*    "Filter values
*    lt_filter = VALUE #( ( 'AA ' ) ( 'LH ' ) ( 'UA ' ) ).
*    lt_flights_final =  FILTER #( lt_flights_all IN lt_filter WHERE carrid = table_line ) .
*    out->write( lt_flights_all ).
*    out->write( lt_flights_final ).

  ENDMETHOD.
ENDCLASS.
