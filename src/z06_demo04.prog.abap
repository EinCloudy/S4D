*&---------------------------------------------------------------------*
*& Report z06_demo04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z06_demo04.

PARAMETERS p_knr type S_CUSTOMER.
PARAMETERS p_cname type S_CUSTNAME.
PARAMETERS p_city type CITY.
PARAMETERS p_cntry type S_COUNTRY.

WRITE: (*) p_knr, (*) p_cname,  (*) p_city, '(' NO-GAP, (*) p_cntry NO-GAP, ')' NO-GAP.
