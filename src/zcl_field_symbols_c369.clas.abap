CLASS zcl_field_symbols_c369 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_field_symbols_c369 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
******************Field Symbols****************************************************
*    DATA: lv_employee TYPE string.
*
*    FIELD-SYMBOLS <fs_employee> TYPE string.
*
*    ASSIGN lv_employee TO <fs_employee>.
*
*    ASSIGN lv_employee TO FIELD-SYMBOL(<fs_employee>).
*
*    out->write( <fs_employee> ).
*
*    <fs_employee> = 'Laura'.
*
*    out->write( lv_employee ).
*
*    UNASSIGN <fs_employee>.
*    out->write( <fs_employee> ).
*
************************Add records in a field Symbol**********************************************
*    DATA lt_flights TYPE STANDARD TABLE OF sflights.
*
*    APPEND INITIAL LINE TO lt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>).
*
*    <fs_flights> = VALUE #(  carrid = 'AA'
*                            carrname = 'American Airlines'
*                            connid = 0777  ).
*    out->write( lt_flights ).
*
*************************insert records in a field Symbol**********************************************
*    UNASSIGN <fs_flights>.
*    INSERT INITIAL LINE INTO lt_flights ASSIGNING <fs_flights> INDEX 1.
*
*    <fs_flights> = VALUE #(  carrid = 'LH'
*                            carrname = 'American Airlines'
*                            connid = 0777  ).
*    out->write( lt_flights ).

************************modify multiple records**********************************************
    DATA lt_flights TYPE STANDARD TABLE OF sflights.

    SELECT FROM sflights
            FIELDS *
            WHERE carrid IS NOT INITIAL
            INTO TABLE @lt_flights
            UP TO 10 ROWS.

*    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>).
*
**      <fs_flights>-carrid = 'EE'.
*      <fs_flights>-fldate = cl_abap_context_info=>get_system_date( ).
*
*
*      out->write( |flight: { <fs_flights>-carrid }-{ <fs_flights>-fldate }| ).
*
*    ENDLOOP.
**************************READ TABLE with field symbols********************************************
*    READ TABLE lt_flights ASSIGNING FIELD-SYMBOL(<fs_flights>) INDEX 1.
*
*    out->write( <fs_flights> ).
*
*    <fs_flights>-carrid = 'EE'.
*    <fs_flights>-fldate = cl_abap_context_info=>get_system_date( ).
*
*
*    out->write( <fs_flights> ).
*
*    UNASSIGN <fs_flights>.

*************************CAST*********************************************
* this example shows how to cast a date type to a field symbol
 TYPES: BEGIN OF ty_date,
             day   TYPE n LENGTH 2,
             month TYPE n LENGTH 2,
             year  TYPE n LENGTH 4,
           END OF ty_date.

    DATA: lv_date     TYPE d.

*     Implicit casting of date type to a field symbol
    FIELD-SYMBOLS: <lv_date>  TYPE d,
                   <lv_date2> TYPE any,
                   <lv_date3> TYPE n.

    lv_date = cl_abap_context_info=>get_system_date( ).
    lv_date = lv_date+6(2) && lv_date+4(2) && lv_date+0(4).

    ASSIGN lv_date TO <lv_date>.
    out->write( |Today's Date: { <lv_date> }| ).

    ASSIGN lv_date TO <lv_date2> CASTING TYPE ty_date.


    DO.

      ASSIGN COMPONENT sy-index OF STRUCTURE <lv_date2> TO <lv_date3>.

      IF sy-subrc <> 0.

        EXIT.

      ENDIF.

      out->write( |Today's Date: { <lv_date3> }| ).

    ENDDO.
  ENDMETHOD.
ENDCLASS.
