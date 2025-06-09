CLASS zcl_new_example_c362 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! <p class="shorttext synchronized" lang="en"></p>
    "! Hola Mundo
    "! @parameter rv_value | <p class="shorttext synchronized" lang="en"></p>
    METHODS print_value RETURNING VALUE(rv_value) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_new_example_c362 IMPLEMENTATION.
  METHOD print_value.
    rv_value = 'Hola mundo'.
  ENDMETHOD.
ENDCLASS.
