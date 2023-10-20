*&---------------------------------------------------------------------*
*& Report z06_demo09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_demo09.

PARAMETERS p_cid TYPE s_carr_id.
PARAMETERS p_cid2 TYPE c LENGTH 3.

WRITE 'Systemfelder'(sf1).

WRITE / |Anmeldename: { sy-uname }|.
WRITE / |Datum des Servers: { sy-datum DATE = USER }|.
WRITE / |Zeit des Servers: { sy-uzeit TIME = USER }|.
WRITE / |Datum des CLient: { sy-datlo DATE = USER }|.
WRITE / |Zeit des Client: { sy-timlo TIME = USER }|.
WRITE / |Anmeldemandant: { sy-mandt }|.
WRITE / |Anmeldesprache: { sy-langu }|.
