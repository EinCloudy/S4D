CLASS zcl_06_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_06_airplane
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: to_string REDEFINITION.
    METHODS constructor
      IMPORTING name            TYPE string
                type            TYPE String
                cargo_in_tons TYPE i.
    METHODS get_cargo
        RETURNING VALUE(value) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA cargo_in_tons TYPE i.
ENDCLASS.



CLASS zcl_06_cargo_plane IMPLEMENTATION.
  METHOD to_string.
    value = |{ me->get_name( ) } as { me->get_type( ) } with { me->cargo_in_tons } Tons|.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( name = name type = type ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD get_cargo.
    value = me->cargo_in_tons.
  ENDMETHOD.

ENDCLASS.
