 8  DIM RE$(50),FL$(50)
 10  HOME : PRINT "LIST Lister"
 12  PRINT : PRINT  CHR$ (4)"CATALOG": PRINT 
 15  PRINT "Enter a blank line for main menu."
 17  INPUT "List to print: ";PL$
 18  IF PL$ = "" THEN  PRINT  CHR$ (4)"RUN MAINMENU"
 20  PRINT  CHR$ (4)"OPEN ";PL$: PRINT  CHR$ (4)"READ ";PL$
 25  INPUT X
 28  FOR J = 1 TO X: INPUT RE$(J): INPUT FL$(J): NEXT J
 30  PRINT  CHR$ (4)"CLOSE ";PL$
 31  INPUT "Use entire page? (Y/N): ";FF$
 32  PRINT : PRINT "Press P to print;": PRINT "Press R to re-start program."
 36  GET A$
 40  IF A$ = "R" THEN  GOTO 10
 45  PRINT 
 46  PRINT  CHR$ (4)"PR#1": PRINT  CHR$ (27); CHR$ (33)
 50  PRINT : PRINT "List ";PL$;" has ";X;" students.": PRINT 
 51  FOR J = 1 TO X
 52  PRINT J;". Name: ";RE$(J);"    Data file name: ";FL$(J)
 54  NEXT J: IF FF$ = "N" THEN  PRINT : GOTO 56
 55  FOR H = 1 TO (66 - (X + 3)): PRINT : NEXT H
 56  PRINT  CHR$ (27); CHR$ (34): PRINT  CHR$ (4)"PR#0"
 57  PRINT : PRINT "Done. Press any key.": GET JK$: GOTO 10

