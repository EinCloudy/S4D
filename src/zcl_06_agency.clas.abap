CLASS zcl_06_agency DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
        IMPORTING name TYPE string.
    METHODS add_partner
        IMPORTING partner TYPE REF TO zif_06_partner.
    METHODS to_string
        RETURNING VALUE(value) TYPE STRING.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA name TYPE string.
    DATA partners TYPE TABLE OF REF TO zif_06_partner.
ENDCLASS.



CLASS zcl_06_agency IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD add_partner.
    APPEND partner TO me->partners.
  ENDMETHOD.

  METHOD to_string.
    DATA: result_string   TYPE string,
          partner_string TYPE string,
          first_iteration TYPE abap_bool VALUE abap_true.

    LOOP AT me->partners INTO DATA(partner).
      partner_string = partner->to_string( ).

      IF first_iteration = abap_true.
        result_string = partner_string.
        first_iteration = abap_false.
      ELSE.
        result_string = |{ result_string }, { partner_string }|.
      ENDIF.
    ENDLOOP.

    value = result_string.
  ENDMETHOD.

ENDCLASS.
