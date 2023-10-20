*&---------------------------------------------------------------------*
*& Report z06_abap_06
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_abap_06.

DATA customer_data TYPE ZABAP_CUSTOMER.

parameters cust_id type S_CUSTOMER.

customer_data = ZCL_ABAP_HELPER=>get_customer( customer_id = cust_id ).

WRITE: customer_data-customer_id, customer_data-city.
