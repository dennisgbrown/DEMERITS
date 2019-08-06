 1  DIM RE$(50),FL$(50)
 10  HOME : PRINT "List alphabetizer"
 14  PRINT : PRINT  CHR$ (4)"CATALOG"
 16  PRINT : PRINT "Enter a blank line for main menu."
 18  INPUT "List to process: ";LS$
 20  IF LS$ = "" THEN  PRINT  CHR$ (4)"RUN MAINMENU"
 25  PRINT : PRINT  CHR$ (4)"OPEN ";LS$: PRINT  CHR$ (4)"READ ";LS$
 28  INPUT X
 30  FOR J = 1 TO X: INPUT RE$(J): INPUT FL$(J): NEXT J
 35  PRINT  CHR$ (4)"CLOSE ";LS$
 36  PRINT 
 38 CH = 0
 40  FOR G = 1 TO X - 1
 50  REM  THIS IS A LOT OF STUFF!
 51 AB = ( ASC ( LEFT$ (FL$(G),1)) * 262144)
 52 AC = ( ASC ( MID$ (FL$(G),2,1)) * 4096)
 53 AD = ( ASC ( MID$ (FL$(G),3,1)) * 64)
 54 AE = ( ASC ( MID$ (FL$(G),4,1)) * 1)
 55 AF = AB + AC + AD + AE
 56 BB = ( ASC ( LEFT$ (FL$(G + 1),1)) * 262144)
 57 BC = ( ASC ( MID$ (FL$(G + 1),2,1)) * 4096)
 58 BD = ( ASC ( MID$ (FL$(G + 1),3,1)) * 64)
 59 BE = ( ASC ( MID$ (FL$(G + 1),4,1)) * 1)
 60 BF = BB + BC + BD + BE
 61  IF AF < BF THEN  GOTO 80
 63 CH = 1:JN$ = RE$(G):JM$ = FL$(G):RE$(G) = RE$(G + 1):FL$(G) = FL$(G + 1):RE$(G + 1) = JN$:FL$(G + 1) = JM$
 80  PRINT ".";
 85  NEXT G
 90  IF CH <  > 0 THEN  GOTO 38
 100  PRINT : PRINT "Sorted. Now saving.": PRINT 
 110  PRINT  CHR$ (4)"OPEN ";LS$: PRINT  CHR$ (4)"WRITE ";LS$: PRINT X
 120  FOR L = 1 TO X: PRINT RE$(L): PRINT FL$(L): NEXT L
 130  PRINT  CHR$ (4)"CLOSE ";LS$
 140  GOTO 10

