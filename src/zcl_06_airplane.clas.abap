CLASS zcl_06_airplane DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING name TYPE string
                type TYPE string.

    METHODS to_string ABSTRACT
      RETURNING VALUE(value) TYPE string.

    CLASS-METHODS get_number_of_airplanes RETURNING VALUE(number) TYPE i.

  PROTECTED SECTION.
    METHODS get_name RETURNING VALUE(value) TYPE string.

    METHODS get_type RETURNING VALUE(value) TYPE string.

  PRIVATE SECTION.
    DATA name TYPE string.
    DATA plane_type TYPE string.
    CLASS-DATA number_of_airplanes TYPE i.
ENDCLASS.



CLASS zcl_06_airplane IMPLEMENTATION.


  METHOD constructor.
    me->name = name.
    me->plane_type = type.
    number_of_airplanes = number_of_airplanes + 1.
  ENDMETHOD.

  METHOD get_name.
    value = me->name.
  ENDMETHOD.

  METHOD get_type.
    value = me->plane_type.
  ENDMETHOD.

  METHOD get_number_of_airplanes.
    number = number_of_airplanes.
  ENDMETHOD.

ENDCLASS.
