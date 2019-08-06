 1 D = 66
 5  DIM WH$(50),HM(50),RS$(50),F$(50),RE$(50)
 6  HOME : INPUT "Enter date MM/DD/YY: ";DT$
 10  HOME : PRINT "Print Demerit Records"
 20  PRINT : PRINT  CHR$ (4)"CATALOG"
 25  PRINT : PRINT "Enter a blank line for main menu."
 30  PRINT : INPUT "Which list file: ";FL$
 35  IF FL$ = "" THEN  PRINT  CHR$ (4)"RUN MAINMENU"
 36  PRINT : INPUT "Do you want Current Grade % printed on  the report (Y/N)? ";GT$
 40  PRINT  CHR$ (4)"OPEN ";FL$
 45  PRINT  CHR$ (4)"READ ";FL$
 50  INPUT X
 55  FOR K = 1 TO X: INPUT RE$(K): INPUT F$(K)
 57  NEXT K
 60  PRINT "There are ";X;" students in": PRINT "the file ";FL$;"."
 70  PRINT  CHR$ (4)"CLOSE ";FL$
 75  INPUT "List students to screen (Y/N)? ";YN$: IF YN$ = "N" THEN  GOTO 80
 76  FOR J = 1 TO X: PRINT J;". ";RE$(J): NEXT J
 80  INPUT "First student to print: ";FT: INPUT "Last student to print: ";LT
 90  PRINT "Printing from #";FT;". ";RE$(FT);" to #";LT;". ";RE$(LT)
 100  PRINT : PRINT "Press P to print;": PRINT "Press R to re-start program."
 105  GET E$: IF E$ = "R" THEN  GOTO 10
 115  FOR G = FT TO LT
 120  PRINT  CHR$ (4)"OPEN ";F$(G): PRINT  CHR$ (4)"READ ";F$(G)
 130  INPUT T1$: INPUT T2$: INPUT T3$: INPUT T4$: INPUT Y
 136  IF Y = 0 THEN  GOTO 140
 138  FOR I = 1 TO Y: INPUT WH$(I): INPUT HM(I): INPUT RS$(I): NEXT I
 140  PRINT  CHR$ (4)"CLOSE ";F$(G)
 141  PRINT  CHR$ (4)"PR#1"
 145 TT = 0
 148  PRINT  CHR$ (27); CHR$ (33);
 150  PRINT : PRINT "DEMERIT REPORT FOR: "; CHR$ (27); CHR$ (88);"   ";RE$(G);"   "; CHR$ (27); CHR$ (89);"    As of: "; CHR$ (27); CHR$ (88);DT$
 160  PRINT : PRINT : PRINT T4$; CHR$ (27); CHR$ (89);":"
 165  IF Y = 0 THEN  PRINT : PRINT : PRINT "No demerits at this time.": PRINT : PRINT : GOTO 190
 170  PRINT : PRINT : FOR H = 1 TO Y
 175  PRINT WH$(H);"       ";HM(H);" DEMERITS":TT = TT + HM(H)
 180  PRINT  LEFT$ (RS$(H),75): PRINT  MID$ (RS$(H),76)
 185  PRINT : NEXT H
 190  PRINT : PRINT "***** TOTAL OF ";TT;" DEMERITS FOR VIOLATIONS DURING ";T4$;" *****"
 195  PRINT : PRINT "*** LOSS OF "; INT (TT / 20);" PERCENTAGE POINTS FROM DAILY GRADE AVERAGE ***"
 196  PRINT : PRINT : PRINT "(STUDENTS LOSE ONE PERCENTAGE POINT FROM DAILY PARTICIPATION GRADE FOR EACH": PRINT " TWENTY DEMERITS WITHIN A SIX WEEKS PERIOD.)"
 197  IF GT$ = "Y" THEN  PRINT : PRINT "**** CURRENT GRADE AVERAGE IS ";(100 -  INT (TT / 20));"% *****":D = D - 2
 199  IF Y = 0 THEN  FOR L = 1 TO (D - 17): PRINT : NEXT L: GOTO 220
 200  FOR L = 1 TO (D - ((4 * Y) + 15)): PRINT : NEXT L
 201  PRINT  CHR$ (27); CHR$ (34);
 202  PRINT 
 220  PRINT  CHR$ (4)"PR#0"
 225  NEXT G
 230  PRINT "Done. Press any key.": GET H$: GOTO 10

