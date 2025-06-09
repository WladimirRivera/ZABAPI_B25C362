CLASS zcl_date_time_log_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_date_time_log_c362 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA(lv_date) = '20250101'. "mostrar asi en el depurador e imprimir
*    out->write( lv_date ).
*
*    DATA(lv_date2) = CONV d( '20250101' ).
*    out->write( lv_date2 ).

*    "Date and Time
*    DATA: lv_date  TYPE d,
*          lv_time  TYPE t,
*          lv_time2 TYPE c LENGTH 6.
*
*    lv_date  = cl_abap_context_info=>get_system_date(  ).
*    lv_time  = cl_abap_context_info=>get_system_time(  ). "hora del sistema
*    lv_time2 = cl_abap_context_info=>get_user_time_zone(  ). "Obtiene la zona horaria del usuario determinado.
*    "Si no se proporciona ningún nombre de usuario,
*    "se utiliza el usuario actual.
*    out->write( lv_date ).
*    out->write( lv_time ).
*    out->write( lv_time2 ). " UTC (Universal Time Coordinated) significa en español “Tiempo Coordinado Universal”.

** Date and Time
*    DATA: lv_date  TYPE d,
*          lv_date2 TYPE d,
*          lv_time  TYPE t,
*          lv_time2 TYPE c LENGTH 6.
*
*    "calculos de fecha y hora
*    lv_date  = '20250101'.
*    lv_date2 = '20250622'.
*
*    DATA(lv_days) = lv_date2 - lv_date. "probar también con resultado solo de 30 días
*    out->write( lv_days ).
*
*    "Offset
*    DATA(lv_month) = lv_date2+4(2). "mes
*    out->write( lv_month ).
*    lv_month = lv_date2+4(2) + 2. "mes
*    out->write( lv_month ).
*    DATA(lv_year) = lv_date2(4).
*    out->write( lv_year ). "año
*    DATA(lv_day) = lv_date2+6(2).
*    out->write( lv_day ).  "día
*
*    lv_date  = cl_abap_context_info=>get_system_date(  ) + 10.
*    out->write( lv_date ).

    " utclong
*    DATA: lv_time1 TYPE utclong,
*          lv_time2 TYPE utclong.
*
**    lv_time1 = utclong_current( ).
**    out->write( lv_time1  ).
**
**    lv_time1 = utclong_add( val = lv_time1 days = 1 hours = -1 ).
**    out->write( lv_time1  ).
*
**    "para sacar la diferencia entre dos fechas
**    lv_time1 = utclong_current( ).
**    out->write( lv_time1  ).
**    lv_time2 = utclong_current( ).
**    out->write( lv_time2  ).
**
**    lv_time2 = utclong_add( val = lv_time1  hours = -5 ). "menos 5 horas
**    out->write( lv_time2  ).
**
**    DATA(lv_total) = utclong_diff( high = lv_time1 low = lv_time2 ).
**    out->write( lv_total  ).

 " utclong
    DATA: lv_time1 TYPE utclong,
          lv_time2 TYPE utclong,
          lv_date  TYPE d,
          lv_time3 TYPE t.

    lv_time1 = utclong_current( ).

    CONVERT UTCLONG lv_time1
    TIME ZONE cl_abap_context_info=>get_user_time_zone(  )
    INTO DATE lv_date
    TIME lv_time3.

    out->write( lv_date  ).
    out->write( lv_time3  ).





  ENDMETHOD.

ENDCLASS.
