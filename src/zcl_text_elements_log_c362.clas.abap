CLASS zcl_text_elements_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_text_elements_log_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    "Text symbols
*    "out->write( 'Welcome ABAP Student' ).
*    out->write( text-001 ).
*    out->write( 'This is your first text symbol' ).

*    DATA lv_string TYPE string VALUE 'LOGALI local  '.

*    "strlen() and numofchar(9
*    DATA(lv_num)   = strlen( 'LOGALI GROUP' ).
*    out->write( lv_num ).
*
*    lv_num = numofchar( '  LOGALI   ' ).
*    out->write( lv_num ).

*    "count
*    lv_num = count( val = lv_string sub = 'LO' ). "encuentra el número de coincidencias con el patron exacto
*    out->write( lv_num ).
*
*    lv_num = count_any_of( val = lv_string sub = 'LO' ). "encuentra las coincidencias no importa el orden
*    out->write( lv_num ). "encuentra el caracter L dos veces y O una vez
*
*    lv_num = count_any_not_of( val = lv_string sub = 'LO'  ).
*    out->write( lv_num ). "devuelve todas las posiciones que no coinciden con el patrón


*    "find
*    lv_num = find( val = lv_string sub = 'LI' ).
*    out->write( lv_num ).
*
*    lv_num = find_any_of( val = lv_string sub = 'LI' ).
*    out->write( lv_num ).
*
*    lv_num = find_any_not_of( val = lv_string sub = 'LI' ).
*    out->write( lv_num ).

    DATA lv_string TYPE string VALUE ' ¡LOGALI GROUP! Welcome to ABAP Cloud Master  '.
    "Change Case of characters
    out->write( |TO_UPPER         = {   to_upper(  lv_string ) } | ).
    out->write( |TO_LOWER         = {   to_lower(  lv_string ) } | ).
    out->write( |TO_MIXED         = {   to_mixed(  lv_string ) } | ).
    out->write( |FROM_MIXED       = { from_mixed(  lv_string ) } | ).


  ENDMETHOD.

ENDCLASS.
