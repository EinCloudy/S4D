*&---------------------------------------------------------------------*
*& Report z06_main_vehicles
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_main_vehicles.

**********************************************************************
* Demo 1: Objekte und Referenzvariablen
**********************************************************************
DATA goofy_ahh TYPE REF TO ZCL_06_VEHICLE.
DATA vw_suii TYPE REF TO ZCL_06_VEHICLE.
DATA p1 TYPE REF TO ZCL_06_AIRPLANE.
DATA p2 TYPE REF TO ZCL_06_AIRPLANE.
DATA p3 TYPE REF TO ZCL_06_AIRPLANE.

DATA agency TYPE REF TO ZCL_06_AGENCY.
DATA carrier TYPE REF TO ZCL_06_CARRIER.

goofy_ahh = new ZCL_06_TRUCK( make = 'Tesla' model = 'Cybertruck' cargo_in_tons = 5 ).
vw_suii = new ZCL_06_CAR( make = 'Tesla' model = 'Roadster' number_of_seats = 5 ).
p1 = new ZCL_06_PASSENGER_PLANE( name = 'Goof' type = 'Ahh' number_of_seats = 5 ).
p2 = new ZCL_06_CARGO_PLANE( name = 'Big' type = 'Chungus' cargo_in_tons = 500 ).
p3 = new ZCL_06_CARGO_PLANE( name = 'Big Ahh' type = 'Choncc' cargo_in_tons = 10 ).

agency = new ZCL_06_AGENCY( name = 'Agency' ).

carrier = new ZCL_06_CARRIER( name = 'Goofy Ahh Carrier' ).
carrier->add_airplane( airplane = p2 ).
carrier->add_airplane( airplane = p3 ).

agency->add_partner( partner = carrier ).

WRITE / goofy_ahh->to_string( ).
WRITE / vw_suii->to_string( ).
"WRITE / p1->to_string( ).
"WRITE / p2->to_string( ).
"WRITE / carrier->zif_06_partner~to_string( ).
WRITE / agency->to_string( ).

"WRITE / |Fahrzeuge eingetragen: { ZCL_06_VEHICLE=>number_of_vehicles }|.
"WRITE / |Flugzeuge eingetragen: { ZCL_06_AIRPLANE=>get_number_of_airplanes( ) }|.

WRITE / |Biggest: { carrier->get_biggest_cargo_plane( )->to_string( ) }|.
