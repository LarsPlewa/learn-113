*&---------------------------------------------------------------------*
*& Report zuv_abap_learn113_uebung_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_abap_learn113_uebung_03.

DATA lt_table TYPE STANDARD TABLE OF i.

DO 10 TIMES.
    APPEND SY-INDEX TO lt_table.
ENDDO.

FIELD-SYMBOLS:
                <lv_num> TYPE i.

LOOP AT lt_table ASSIGNING <lv_num>.
    WRITE <lv_num>.
    NEW-LINE.
ENDLOOP.

SORT lt_table DESCENDING.

"LOOP AT lt_table ASSIGNING <lv_num>.
"    WRITE <lv_num>.
"    NEW-LINE.
"ENDLOOP.

TYPES:
         BEGIN OF tys_person,
            id TYPE i,
            firstname(20) TYPE c,
            lastname(20) TYPE c,
            age TYPE i,
            gender TYPE c,
         END OF tys_person.

DATA lt_table2 TYPE STANDARD TABLE OF tys_person.

FIELD-SYMBOLS:
                <ls_person> TYPE tys_person.

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

DATA lt_table3 TYPE SORTED TABLE OF i WITH NON-UNIQUE KEY table_line.

DO 10 TIMES.
    APPEND SY-INDEX TO lt_table3.
ENDDO.
"APPEND 5 TO lt_table3.
"4b. APPEND funktioniert meistens nicht, weil die Werte sortiert eingefügt werden müssen.

SKIP.
LOOP AT lt_table3 ASSIGNING <lv_num>.
    WRITE <lv_num>.
    NEW-LINE.
ENDLOOP.

DATA lt_table4 TYPE SORTED TABLE OF tys_person WITH UNIQUE KEY id.

INSERT LINES OF lt_table2 INTO TABLE lt_table4.

READ TABLE lt_table4 ASSIGNING <ls_person> INDEX 5.
"<ls_person>-id = 123.
"5c. ID kann nicht geändert werden, das es sich um den UNIQUE KEY handelt, nach dem sortiert wird.
<ls_person>-age = 12.

TYPES:
         BEGIN OF tys_struct,
            id(10) TYPE c,
            anzahl TYPE i,
            preis TYPE preis,
         END OF tys_struct.

DATA lt_table5 TYPE HASHED TABLE OF tys_struct WITH UNIQUE KEY id.

DATA:
        ls_struct1 TYPE tys_struct,
        ls_struct2 TYPE tys_struct,
        ls_struct3 TYPE tys_struct,
        ls_struct4 TYPE tys_struct,
        ls_struct5 TYPE tys_struct.

ls_struct1 = VALUE tys_struct( id = '1' anzahl = 1 ).
ls_struct2 = VALUE tys_struct( id = '2' anzahl = 1 ).
ls_struct3 = VALUE tys_struct( id = '3' anzahl = 1 ).
ls_struct4 = VALUE tys_struct( id = '1' anzahl = 1 ).
ls_struct5 = VALUE tys_struct( id = '2' anzahl = 1 preis = 1 ).

COLLECT ls_struct1 INTO lt_table5.
COLLECT ls_struct2 INTO lt_table5.
COLLECT ls_struct3 INTO lt_table5.
COLLECT ls_struct4 INTO lt_table5.
COLLECT ls_struct5 INTO lt_table5.
COLLECT ls_struct5 INTO lt_table5.

FIELD-SYMBOLS <ls_struct6> TYPE tys_struct.

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

FIELD-SYMBOLS <ls_struct7> TYPE tys_struct.
<ls_struct7>-id = 5.
