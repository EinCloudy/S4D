*&---------------------------------------------------------------------*
*& Report z06_demo02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_demo02.

**********************************************************************
* Wichtige ABAP Standardtypen
**********************************************************************
TYPES ty_i TYPE i. "Ganze Zahl ( Bsp. 42 )
TYPES type_c40 TYPE c LENGTH 40. "Zeichenkette fester Länge ( Bsp 'Hello World' )
TYPES ty_n7 TYPE n LENGTH 7. "Numerische Folge fester Länge ( Bsp. '5841236' )
TYPES ty_d TYPE d. "Datum ( Bsp. '20231016' )
TYPES ty_t TYPE t. "Zeit ( Bsp. '105525' )
TYPES ty_p162 TYPE p LENGTH 16 DECIMALS 2. "Kommazahl ( Bsp. '420.69' )
TYPES ty_boolean TYPE c LENGTH 1. "'Boolscher Wahreitswert' (Bsp. 'X')


**********************************************************************
* Gepackte Zahlen
**********************************************************************
* TYPES ty_p162 TYPE p LENGTH 16 DECIMALS 2.
* Länge in Byte: LENGTH -> 16
* Anzahl Ziffern: 2 * LENGTH -1 -> 31
* Nachkommastellen: DECIMALS -> 2
* Vorkommastellen: Anzahl Ziffern - DECIMALS -> 29

DATA matriculation_number TYPE ty_n7.
DATA decimal TYPE p LENGTH 8 DECIMALS 3. "ABAP Standardtyp
DATA carrier_id TYPE s_carr_id. "Datenelement ( globaler Datentyp )

**********************************************************************
* Wertzuweisungen
**********************************************************************
matriculation_number = '42069'. "Zuweisungsoperator
DATA connection_id TYPE s_conn_id VALUE '0400'. "Statische Vorbelegung
DATA(text) = 'Hello World'. "Inlinedeklaration

WRITE: matriculation_number, connection_id, text.


**********************************************************************
* Initialisierung
**********************************************************************
CLEAR text.
connection_id = '0000'.

WRITE ''.

**********************************************************************
* Deklaration fixer Datenobjekte
**********************************************************************
CONSTANTS pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.


**********************************************************************
* Eingabeparameter
**********************************************************************
PARAMETERS p_cid TYPE c LENGTH 3.
PARAMETERS p_cid2 TYPE s_carr_id.

WRITE: p_cid, p_cid2.
