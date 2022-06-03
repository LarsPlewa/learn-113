*&---------------------------------------------------------------------*
*& Report zuv_abap_learn113_uebung_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_abap_learn113_uebung_02.

TYPES:
         BEGIN OF tys_person,
            id TYPE i,
            firstname(20) TYPE c,
            lastname(20) TYPE c,
            age TYPE i,
            gender TYPE c,
         END OF tys_person.

DATA ls_person TYPE tys_person.
ls_person-id = 1.
ls_person-firstname = 'Werner'.
ls_person-lastname = 'Schmidt'.
ls_person-age = 66.
ls_person-gender = 'd'.

WRITE 'ID:' && ls_person-id.
NEW-LINE.
WRITE 'First Name:' && ls_person-firstname.
NEW-LINE.
WRITE 'Last Name:' && ls_person-lastname.
NEW-Line.
WRITE 'Age:' && ls_person-age.
NEW-LINE.
WRITE 'Gender:' && ls_person-gender.
NEW-LINE.

TYPES:
         BEGIN OF tys_person2,
            id TYPE i,
            firstname(40) TYPE c,
            lastname(40) TYPE c,
            age TYPE i,
            gender TYPE c,
         END OF tys_person2.

DATA ls_person2 TYPE tys_person2.

"ls_person2 = ls_person.
""LS_PERSON2" and "LS_PERSON" cannot be converted to each other. In Unicode programs, "LS_PERSON2" must have the same structure layout as "LS_PERSON", regardless of the length of a Unicode character.

MOVE-CORRESPONDING ls_person TO ls_person2.
