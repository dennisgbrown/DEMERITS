 10  HOME 
 20  GOSUB 710
 30  DIM WH$(50),HM(50),RS$(50),RE$(50),FL$(50): GOSUB 840
 50  HOME 
 60  PRINT "Demerit Record System"
 70  PRINT : PRINT "  1. Make new student record"
 80  PRINT "  2. Edit existing record"
 110  PRINT "  3. List records"
 130  PRINT "  4. Quit to main menu": PRINT "  5. Choose different List file"
 140  PRINT : INPUT "Your choice: ";CH
 150  IF CH = 1 THEN  GOTO 230
 160  IF CH = 2 THEN  GOTO 380
 180  IF CH = 3 THEN  GOTO 1500
 190  IF CH = 4 THEN  GOTO 670
 200  IF CH = 5 THEN  GOTO 680
 220  GOTO 50
 230  HOME : PRINT "Add new student"
 240  PRINT : PRINT "Press L for a list of students;"
 250  PRINT "Press A to add a new student;"
 260  PRINT "Press C to change info on a student;": PRINT "Press E to exit to main menu."
 270  GET A$
 280  IF A$ = "L" THEN  PRINT : FOR I = 1 TO X: PRINT I;". ";RE$(I);"  ": NEXT I: PRINT 
 290  IF A$ = "C" THEN  PRINT : INPUT "Which student #? ";ST: PRINT RE$(ST): INPUT "New name: ";RE$(ST): GOTO 240
 300  IF A$ = "A" THEN  PRINT : INPUT "Last name: ";T1$: INPUT "First name: ";T2$: INPUT "Middle name or initial: ";T3$: INPUT "Which time period (ex. FIRST SIX WEEKS  -or- PRE-SEASON): ";T4$: GOTO 330
 310  IF A$ = "E" THEN  GOSUB 920: GOTO 50
 320  GOTO 240
 330 X = X + 1:RE$(X) = T2$ + " " + T3$ + " " + T1$:FL$(X) =  LEFT$ (T1$,3) +  LEFT$ (T2$,3) +  LEFT$ (T3$,3)
 340  PRINT  CHR$ (4)"OPEN ";FL$(X): PRINT  CHR$ (4)"WRITE ";FL$(X)
 350  PRINT T1$: PRINT T2$: PRINT T3$: PRINT T4$: PRINT 0
 360  PRINT  CHR$ (4)"CLOSE ";FL$(X)
 370  GOTO 240
 380  HOME : PRINT "Edit student record"
 390  PRINT : PRINT "Press L to list students;": PRINT "Press E to edit a student's record;": PRINT "Press M for main menu."
 400  GET A$
 410  IF A$ = "L" THEN  PRINT : FOR I = 1 TO X: PRINT I;". ";RE$(I);"  ": NEXT I: PRINT : GOTO 390
 420  IF A$ = "E" THEN  GOTO 440
 430  IF A$ = "M" THEN  GOTO 50ELSE GOTO 390
 440  PRINT : INPUT "Student record #";ST
 450  PRINT  CHR$ (4)"OPEN ";FL$(ST): PRINT  CHR$ (4)"READ ";FL$(ST)
 460  INPUT T1$: INPUT T2$: INPUT T3$: INPUT T4$: INPUT P: IF P = 0 THEN  GOTO 490
 470  PRINT : FOR K = 1 TO P: INPUT WH$(K): INPUT HM(K): INPUT RS$(K): PRINT K;". ";WH$(K);"   ";HM(K);" DEMERITS": PRINT RS$(K): PRINT : NEXT K: PRINT  CHR$ (4)"CLOSE ";FL$(ST)
 480  GOTO 500
 490  PRINT  CHR$ (4)"CLOSE ";FL$(ST): PRINT : PRINT "No demerits at this time.": PRINT 
 500  PRINT "Press C to change a current demerit;": PRINT "Press D to delete a current demerit;": PRINT "Press A to add a demerit;": PRINT "Press B to back up to last menu.": PRINT 
 510  GET A$
 520  IF A$ = "C" THEN  INPUT "Demerit #";DN: PRINT WH$(DN): PRINT HM(DN);" demerits": PRINT RS$(DN): PRINT 
 530  IF A$ = "C" THEN  INPUT "Date: ";WH$(DN): INPUT "# demerits: ";HM(DN): INPUT "Offense: ";RS$(DN): GOSUB 580
 540  IF A$ = "D" THEN  INPUT "Which to delete: ";DD:HM(DD) = 0:RS$(DD) = "Deleted": GOSUB 580
 550  IF A$ = "B" THEN  GOTO 390
 560  IF A$ = "A" THEN P = P + 1: INPUT "Date: ";WH$(P): INPUT "# of demerits: ";HM(P): INPUT "Offense: ";RS$(P): GOSUB 580
 570  GOTO 390
 580  PRINT  CHR$ (4)"OPEN ";FL$(ST): PRINT  CHR$ (4)"WRITE ";FL$(ST)
 590  PRINT T1$: PRINT T2$: PRINT T3$: PRINT T4$: PRINT P
 600  FOR K = 1 TO P: PRINT WH$(K): PRINT HM(K): PRINT RS$(K): NEXT K
 610  PRINT  CHR$ (4)"CLOSE ";FL$(ST)
 620  RETURN 
 630  REM 
 640  REM 
 650  GOTO 1500
 660  REM 
 670  PRINT  CHR$ (4)"RUN MAINMENU"
 680  GOSUB 710
 690  GOSUB 840
 700  GOTO 50
 710  HOME : PRINT  CHR$ (4)"CATALOG": PRINT : PRINT "Enter a blank line to start a new list.": INPUT "Which list to use: ";LS$
 720  IF LS$ <  > "" THEN  GOTO 760
 730  INPUT "Name to use: ";LS$
 750  GOTO 770
 760  HOME : RETURN 
 770  PRINT : PRINT "For a new list, you must enter the      name of the first person on the list    at this time."
 780  INPUT "Last name: ";A$
 790  INPUT "First name: ";B$
 800  INPUT "Middle name: ";M$
 805  INPUT "Which time period: ";S$
 810 U$ = B$ + " " + M$ + " " + A$: PRINT U$
 820 H$ =  LEFT$ (A$,3) +  LEFT$ (B$,3) +  LEFT$ (M$,3)
 830  PRINT  CHR$ (4)"OPEN ";LS$: PRINT  CHR$ (4)"WRITE ";LS$: PRINT 1: PRINT U$: PRINT H$: PRINT  CHR$ (4)"CLOSE ";LS$: GOSUB 1000: GOTO 760
 840  PRINT  CHR$ (4)"OPEN ";LS$: PRINT  CHR$ (4)"READ ";LS$
 850  INPUT X
 860  FOR J = 1 TO X
 870  INPUT RE$(J)
 880  INPUT FL$(J)
 890  NEXT J
 900  PRINT  CHR$ (4)"CLOSE ";LS$
 910  RETURN 
 920  PRINT  CHR$ (4)"OPEN ";LS$: PRINT  CHR$ (4)"WRITE ";LS$
 930  PRINT X
 940  FOR J = 1 TO X
 950  PRINT RE$(J)
 960  PRINT FL$(J)
 970  NEXT J
 980  PRINT  CHR$ (4)"CLOSE ";LS$
 990  RETURN 
 1000  PRINT  CHR$ (4)"OPEN ";H$: PRINT  CHR$ (4)"WRITE ";H$: PRINT A$: PRINT B$: PRINT M$: PRINT S$: PRINT 0: PRINT  CHR$ (4)"CLOSE ";H$: RETURN 
 1500  HOME : PRINT "List students"
 1505  PRINT : PRINT "There are ";X;" students in the": PRINT LS$;" list."
 1510  PRINT : INPUT "First student to list (#): ";FT
 1520  INPUT "Last student to list (#): ";LT
 1530  FOR JK = FT TO LT
 1540  PRINT  CHR$ (4)"OPEN ";FL$(JK): PRINT  CHR$ (4)"READ ";FL$(JK): INPUT T1$: INPUT T2$: INPUT T3$: INPUT T4$: INPUT Y
 1545  PRINT : PRINT RE$(JK): PRINT T4$;" SIX WEEKS": PRINT 
 1546 TT = 0
 1550  IF Y = 0 THEN  GOTO 1560
 1555  FOR T = 1 TO Y: INPUT WH$(T): INPUT HM(T): INPUT RS$(T): PRINT T;". ";WH$(T);"   ";HM(T);" DEMERITS": PRINT RS$(T):TT = TT + HM(T): NEXT T
 1557  PRINT  CHR$ (4)"CLOSE ";FL$(JK)
 1558  PRINT : PRINT "Total of ";TT;" demerits.": PRINT "Current grade: ";100 - ( INT (TT / 20));"% "
 1559  GOTO 1580
 1560  PRINT  CHR$ (4)"CLOSE ";FL$(JK): PRINT "No demerits at this time.": PRINT 
 1580  PRINT "Press any key for next student.": GET NM$
 1590  NEXT JK
 1595  PRINT : PRINT "Press any key.": GET NM$: GOTO 50
 2000  HOME : PRINT "Print records"
 2002  PRINT : PRINT "There are ";X;" students in the": PRINT LS$;" list."
 2004  PRINT : INPUT "Student (#) to print: ";FT
 2007  PRINT : PRINT "Ready printer and press P to print or   A to abort.": GET HJ$
 2008  IF HJ$ = "A" THEN  GOTO 50
 2010 JK = FT
 2020  PRINT  CHR$ (4)"OPEN ";FL$(JK): PRINT  CHR$ (4)"READ ";FL$(JK): INPUT T1$: INPUT T2$: INPUT T3$: INPUT T4$: INPUT Y
 2030 TT = 0: IF Y = 0 THEN  GOTO 2040
 2035  FOR T = 1 TO Y: INPUT WH$(T): INPUT HM(T): INPUT RS$(T):TT = TT + HM(T): NEXT T
 2040  PRINT  CHR$ (4)"CLOSE ";FL$(JK)
 2050  PR# 1
 2060  PRINT "DEMERIT REPORT FOR ";RE$(JK)
 2062  PRINT "AS OF: ";DT$
 2063  PRINT : PRINT T4$;" SIX WEEKS:": PRINT : PRINT 
 2065  IF Y = 0 THEN  PRINT "No demerits at this time.": PRINT : PRINT " *** LOSS OF 0 PERCENTAGE POINTS FROM DAILY GRADE AVERAGE THIS SIX WEEKS ***": PRINT : GOTO 2100
 2070  FOR PO = 1 TO Y: PRINT WH$(PO);"     ";HM(PO);" DEMERITS"
 2072  PRINT RS$(PO): PRINT 
 2073  NEXT PO: PRINT : PRINT " ***** TOTAL OF ";TT;" DEMERITS FOR VIOLATIONS DURING ";T4$;" SIX WEEKS *****"
 2075  PRINT : PRINT "*** LOSS OF "; INT (TT / 20);" PERCENTAGE POINTS FROM DAILY GRADE AVERAGE THIS SIX WEEKS ***"
 2080  PRINT : PRINT : PRINT : PRINT 
 2100  REM  end!

