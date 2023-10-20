*&---------------------------------------------------------------------*
*& Report z04_abap_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_abap_03.

PARAMETERS: p_num1 TYPE p LENGTH 10 DECIMALS 2,
            p_num2 TYPE p LENGTH 10 DECIMALS 2,
            p_oper TYPE c LENGTH 1.

DATA: result TYPE p LENGTH 10 DECIMALS 2.

  CASE p_oper.
    WHEN '+'.
      result = p_num1 + p_num2.
    WHEN '-'.
      result = p_num1 - p_num2.
    WHEN '*'.
      result = p_num1 * p_num2.
    WHEN '/'.
      IF p_num2 <> 0.
        result = p_num1 / p_num2.
      ELSE.
        WRITE 'Division durch Null ist nicht erlaubt!'.
        EXIT.
      ENDIF.
    WHEN OTHERS.
      WRITE 'Ungültiger Operator! Verwenden Sie +, -, * oder /.'.
      EXIT.
  ENDCASE.

  WRITE: / 'Ergebnis:', result.
