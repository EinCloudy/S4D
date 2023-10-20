CLASS zcl_06_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_06_vehicle
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: to_string REDEFINITION.
    METHODS constructor
        IMPORTING make TYPE string
        model TYPE string
        cargo_in_tons TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA cargo_in_tons TYPE i.
ENDCLASS.



CLASS zcl_06_truck IMPLEMENTATION.
  METHOD to_string.
    value = |Truck({ me->cargo_in_tons }): { make }, { model }|.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( make_i = make model_i = model ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

ENDCLASS.
