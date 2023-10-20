*&---------------------------------------------------------------------*
*& Report z06_abap_08
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_abap_08.

PARAMETERS p_cid TYPE s_customer.

DATA bookings TYPE z06_bookings.

LOOP AT bookings REFERENCE INTO DATA(bookingReference).
  bookingReference->price *= '1.1'.
ENDLOOP.

SORT bookings BY price DESCENDING.

cl_demo_output=>display( bookings ).

AT SELECTION-SCREEN.
  TRY.
      bookings = zcl_06_helper=>get_bookings(
                       customer_id = p_cid
                     ).

      DELETE bookings WHERE flight_date < sy-datum.

      IF lines( bookings ) = 0.
        RAISE RESUMABLE EXCEPTION TYPE zcx_no_booking_found.
      ENDIF.

    CATCH zcx_no_booking_found INTO DATA(exception).
      MESSAGE e000(z09_booking_abap) WITH p_cid.
  ENDTRY.
