CLASS zcl_06_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_06_vehicle
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: to_string REDEFINITION.
    METHODS constructor
        IMPORTING make TYPE string
        model TYPE string
        number_of_seats TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA number_of_seats TYPE i.
ENDCLASS.



CLASS zcl_06_car IMPLEMENTATION.
  METHOD to_string.
    value = |Car({ me->number_of_seats }): { make }, { model }|.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( make_i = make model_i = model ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

ENDCLASS.
