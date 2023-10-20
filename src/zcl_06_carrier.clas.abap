CLASS zcl_06_carrier DEFINITION

PUBLIC
CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES ZIF_06_PARTNER.
    METHODS: constructor IMPORTING name TYPE string,
      add_airplane IMPORTING airplane TYPE REF TO zcl_06_airplane,
      get_biggest_cargo_plane RETURNING VALUE(result) TYPE REF TO zcl_06_cargo_plane.
  PROTECTED SECTION.
    DATA: name TYPE string.
    DATA: airplanes TYPE TABLE OF REF TO zcl_06_airplane.
ENDCLASS. "cl_carrier DEFINITION

CLASS zcl_06_carrier IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD. "constructor

  METHOD add_airplane.
    APPEND airplane TO me->airplanes.
  ENDMETHOD. "add_airplane

METHOD get_biggest_cargo_plane.
  DATA: largest_cargo TYPE i VALUE 0,
        lr_cargo_airplane TYPE REF TO zcl_06_cargo_plane.

  "Loop through all airplanes
  LOOP AT me->airplanes INTO DATA(lr_airplane).
    "Check if the airplane is a cargo airplane using a casting operation
    TRY.
      DATA(lr_cargo) = CAST zcl_06_cargo_plane( lr_airplane ).

      "check capacity
      IF lr_cargo->get_cargo( ) > largest_cargo.
        largest_cargo = lr_cargo->get_cargo( ).
        lr_cargo_airplane = lr_cargo.
      ENDIF.

    CATCH cx_sy_move_cast_error.
      CONTINUE.
    ENDTRY.
  ENDLOOP.

  result = lr_cargo_airplane.

ENDMETHOD. "get_biggest_cargo_plane

  METHOD zif_06_partner~to_string.
    DATA: result_string   TYPE string,
          airplane_string TYPE string,
          first_iteration TYPE abap_bool VALUE abap_true.
    LOOP AT me->airplanes INTO DATA(airplane).
      airplane_string = airplane->to_string( ).

      IF first_iteration = abap_true.
        result_string = |Partner: { me->name }: { airplane_string }|.
        first_iteration = abap_false.
      ELSE.
        result_string = |{ result_string }, { airplane_string }|.
      ENDIF.
    ENDLOOP.

    value = result_string.
  ENDMETHOD. "to_string

ENDCLASS. "cl_carrier IMPLEMENTATION
