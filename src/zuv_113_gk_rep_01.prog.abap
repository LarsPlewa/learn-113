*&---------------------------------------------------------------------*
*& Report zuv_113_gk_rep_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_113_gk_rep_01.

DATA:
      lv_ueber TYPE string VALUE 'Überschrift',
      lv_unter TYPE string VALUE 'Unterschrift'.

WRITE lv_ueber.
NEW-LINE.
"SKIP.
WRITE lv_unter.
SKIP.

DATA:  lv_datum TYPE d VALUE '20220602',
       lv_datum2 TYPE d,
       lv_datum3 TYPE d VALUE '20110101'.

WRITE lv_datum.
"2a. Das Datum wird nicht mit der Inputformatierung ausgegeben.
NEW-LINE.

lv_datum2 = SY-DATUM.
WRITE lv_datum2 DDMMYY.
NEW-LINE.

lv_datum3 = lv_datum3 - 1.
WRITE lv_datum3.
SKIP.
"31.12.2010

DO 10 TIMES.
    WRITE 'Hello World'.
    NEW-Line.
    WRITE SY-INDEX.
    NEW-LINE.
ENDDO.
"Die ungültigen Daten werden trotzdem ausgegeben.
