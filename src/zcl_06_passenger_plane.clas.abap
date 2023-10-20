CLASS zcl_06_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_06_airplane
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: to_string REDEFINITION.
    METHODS constructor
      IMPORTING name            TYPE string
                type            TYPE String
                number_of_seats TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA number_of_seats TYPE i.
ENDCLASS.



CLASS zcl_06_passenger_plane IMPLEMENTATION.
  METHOD to_string.
    value = |{ me->get_name( ) } as { me->get_type( ) } with { me->number_of_seats } Seats|.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( name = name type = type ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

ENDCLASS.
