*&---------------------------------------------------------------------*
*& Report z06_demo10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_demo10.

TRY.
    DATA(result) = zcl_06_calculator=>divide( value1 = 6 value2 = 9 ).
  CATCH cx_sy_zerodivide INTO DATA(e).
    WRITE / e->get_text( ).
ENDTRY.

WRITE result.
