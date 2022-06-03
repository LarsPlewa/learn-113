*&---------------------------------------------------------------------*
*& Report zuv_abap_learn113_uebung_04
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_abap_learn113_uebung_04.


DATA lt_table2 TYPE zuv_abap_learn113_std_table.

FIELD-SYMBOLS:
                <ls_person> TYPE zuv_abap_learn113_person.

APPEND INITIAL LINE TO lt_table2 ASSIGNING <ls_person>.
<ls_person>-id = 15.
<ls_person>-firstname = 'Werner1'.
<ls_person>-lastname = 'Schmidt'.
<ls_person>-age = 66.
<ls_person>-gender = 'd'.
DO 7 TIMES.
    APPEND INITIAL LINE TO lt_table2 ASSIGNING <ls_person>.
    <ls_person>-id = SY-INDEX.
    <ls_person>-firstname = 'Werner' && SY-INDEX.
    <ls_person>-lastname = 'Schmidtz'.
    <ls_person>-age = 66.
    <ls_person>-gender = 'd'.
ENDDO.



READ TABLE lt_table2 ASSIGNING <ls_person> INDEX 5.
"3c. Bei Zugriff auf nicht zugewiesene Zeile
"Runtime Error: GETWA_NOT_ASSIGNED

<ls_person>-firstname = 'Werner'.
<ls_person>-lastname = 'Schmidt'.
<ls_person>-age = 66.
<ls_person>-gender = 'd'.

SORT lt_table2 BY firstname ASCENDING lastname DESCENDING.

DATA lt_table4 TYPE zuv_abap_learn113_table_sorted.

INSERT LINES OF lt_table2 INTO TABLE lt_table4.

READ TABLE lt_table4 ASSIGNING <ls_person> INDEX 5.
"<ls_person>-id = 123.
"5c. ID kann nicht geändert werden, das es sich um den UNIQUE KEY handelt, nach dem sortiert wird.
<ls_person>-age = 12.

DATA lt_table5 TYPE zuv_abap_learn113_table_hash_3.

DATA:
        ls_struct1 TYPE zuv_abap_learn113_hash_entry,
        ls_struct2 TYPE zuv_abap_learn113_hash_entry,
        ls_struct3 TYPE zuv_abap_learn113_hash_entry,
        ls_struct4 TYPE zuv_abap_learn113_hash_entry,
        ls_struct5 TYPE zuv_abap_learn113_hash_entry.

ls_struct1 = VALUE zuv_abap_learn113_hash_entry( id = '1'  ).
ls_struct2 = VALUE zuv_abap_learn113_hash_entry( id = '2' anzahl = 1 ).
ls_struct3 = VALUE zuv_abap_learn113_hash_entry( id = '3' anzahl = 1 ).
ls_struct4 = VALUE zuv_abap_learn113_hash_entry( id = '1' anzahl = 1 ).
ls_struct5 = VALUE zuv_abap_learn113_hash_entry( id = '2' anzahl = 1 preis = '1.00' ).

COLLECT ls_struct1 INTO lt_table5.
COLLECT ls_struct2 INTO lt_table5.
COLLECT ls_struct3 INTO lt_table5.
COLLECT ls_struct4 INTO lt_table5.
COLLECT ls_struct5 INTO lt_table5.
COLLECT ls_struct5 INTO lt_table5.

FIELD-SYMBOLS <ls_struct6> TYPE zuv_abap_learn113_hash_entry.

LOOP AT lt_table5 ASSIGNING <ls_struct6>.
    WRITE 'ID:' && <ls_struct6>-id.
    NEW-LINE.
    WRITE 'Anzahl:' && <ls_struct6>-anzahl.
    NEW-LINE.
    WRITE 'Preis:' && <ls_struct6>-preis.
    NEW-LINE.
ENDLOOP.

"6c. Die Anzahl von Einträgen mit derselben ID wird zusammengezählt.

"6d. Der Preis wird auch zusammengerechnet. Die Rechnung Anzahl * Preis stimmt daher nicht mehr.
