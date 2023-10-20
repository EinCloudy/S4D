*&---------------------------------------------------------------------*
*& Report z06_demo_13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_demo_13.

**********************************************************************
* Deklaration interner Tabellen
**********************************************************************
DATA connections TYPE z04_connections. "TYPE [Tabellentyp]
DATA connections2 TYPE TABLE OF z04_connection. "TYPE TABLE OF [Strukturtyp]

**********************************************************************
* Hinzufügen von Datensätzen
**********************************************************************
connections = VALUE #( BASE connections
( carrier_id = 'GA' connection_id = '0400' )
 ).

APPEND VALUE #( connection_id = '0402' ) TO connections.

WRITE ''.

DATA connection TYPE z04_connection.
connection-arrival_city = 'GOOFUS MAXIMUS'.
connection-departure_city = 'OHIO'.

APPEND connection TO connections.
connections = VALUE #( BASE connections ( connection ) ).


**********************************************************************
* Lesen von Datensätzen
**********************************************************************
" Lesen eines Einzelsatzes

IF line_exists( connections[ 1 ] ).
  connection = connections[ 1 ].
ENDIF.

TRY.
    connection = connections[ carrier_id = 'AA' connection_id = '0017' ]. "Komponenten
  CATCH cx_sy_itab_line_not_found.
ENDTRY.

" Lesen mehrerer Datensätze
LOOP AT connections INTO connection WHERE carrier_id = 'LH' AND arrival_city IS NOT INITIAL.
  WRITE / connection.
ENDLOOP.
