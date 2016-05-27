7 TEXT:HOME
20 AN$="ZURGTROYD":SS=3
100 EN(1)=1:ST(1)=1:FT(1)=1
101 EN(2)=2:ST(2)=2:FT(2)=1
102 EN(3)=3:ST(3)=3:FT(3)=1
125 POKE 232,0:POKE 233,16
127 PRINT CHR$(4);"BLOAD ROCKET.SHAPE,A$1000"
130 REM FOR L=7925 TO 8175: READ B:POKE L,B:NEXT L
1000 PRINT "ROCKET SUMMARY:":PRINT
1002 G=-9.8:LN=0:CQ=0:OM=0:S=SS
1005 FOR I=1 TO S
1010 EM(I)=EN(I)*1.5+ST(I)*FT(I)*0.5
1012 IF I=1 THEN EM(I)=EM(I)+1.0
1014 FM(I)=ST(I)*FT(I)*4.0
1015 SF(I)=FM(I)
1016 SM(I)=EM(I)+FM(I)
1020 TM(I)=0
1022 FOR J=1 TO I
1025 TM(I)=TM(I)+SM(J)
1030 NEXT J
1035 TH(I)=EN(I)*168
1040 DV(I)=270*-G*LOG(TM(I)/(TM(I)-FM(I)))
1050 TW(I)=TH(I)/(TM(I)*-G)
1055 FF(I)=TH(I)/(270*-G)
1990 PRINT "STAGE: ";4-I
1991 PRINT "  TANKS=";ST(I)*FT(I);" ENGINES=";EN(I)
1992 PRINT "  STAGE MASS=";SM(I);" TOTAL MASS=";TM(I)
1993 PRINT "  DELTAV=";DV(I)
1995 PRINT "  TWR=";TW(I)
2000 NEXT I
2999 GET A$
3000 AN=0:GX=0:GY=-9.8:GA=0:V=0:VX=0:VY=0:AX=0:AY=0:KR=600000
3016 RX=0:RY=KR+10:RA=KR+10:TR=0:T=0:BF=0:MX=0
3020 HGR:ROT=0:SCALE=2:H=0
3030 REM ** LAUNCHPAD **
3035 PRINT:PRINT CHR$(4);"BLOAD LAUNCHPAD.HGR,A$2000"
3038 HCOLOR=1:HPLOT 1,80 TO 132,80: HPLOT 148,80 TO 247,80
3039 HCOLOR=3:HPLOT 110,110 TO 110,60:HPLOT TO 130,60: HPLOT 110,70 TO 130,70
3040 XDRAW 1+((S-1)*2)+TR AT 140,80
4000 REM ** LOOP **
4002 IF LN=0 GOTO 5032
4003 RR=RA-KR:IF RR>MX THEN MX=RR
4004 IF OM=1 GOTO 4018
4005 IF RR>1800 OR OM=1 THEN GOTO 4012
4007 HCOLOR=0:HPLOT 1,80+H TO 132,80+H:HPLOT 148,80+H TO 247,80+H
4010 H=RR/20:HCOLOR=1:HPLOT 1,80+H TO 132,80+H:HPLOT 148,80+H TO 247,80+H
4012 IF RR<40000 AND CQ<>0 THEN GOSUB 7600
4014 IF RR<40000 GOTO 4018
4016 IF RR>40000 AND CQ<>1 THEN GOSUB 7700
4018 FL=FM(S)*100/SF(S)
4020 IF TR<>1 THEN GOTO 4050
4025 IF FM(S)<0.1 THEN FM(S)=0:BF=1:AX=0:AY=0:GOTO 4050
4030 AX=(TH(S)/TM(S))*SIN(AN):AY=(TH(S)/TM(S))*COS(AN)
4040 FM(S)=FM(S)-FF(S):TM(S)=TM(S)-FF(S)
4047 GOTO 4060
4050 REM NOT THRUSTING
4055 AX=0:AY=0
4060 GA=ATN(RX/RY)
4065 IF RY<0 THEN GA=GA+3.14
4070 GY=COS(GA)*G:GX=SIN(GA)*G:AY=AY+GY:AX=AX+GX
4090 ZX=VX:ZY=VY:VY=ZY+AY:VX=ZX+AX:V=SQR(VX*VX+VY*VY)
5012 RY=RY+0.5*(ZY+VY):RX=RX+0.5*(ZX+VX):RA=SQR(RX*RX+RY*RY)
5020 IF RA<KR THEN GOTO 8000
5030 G=-9.8/((RA/KR)*(RA/KR))
5032 VTAB 21:PRINT "TIME: ";T,"STAGE: ";4-S;"      ";AN$
5045 PRINT "ALT: ";INT((RA-KR)/1000);"KM","ANGLE=";R*5.625;"   "
5060 PRINT "VEL: ";INT(V);"M/S","FUEL: ";INT(FL);"%  "
5100 IF BF=1 THEN BF=0:A$="X":GOTO 5555
5115 Q=PEEK(-16384):IF Q<128 THEN GOTO 6095
5222 A$=CHR$(Q-128):POKE 49168,0
5555 IF OM<>1 THEN XDRAW 1+((S-1)*2)+TR AT 140,80
6060 IF A$="Q" THEN GOTO 9000
6061 IF A$="A" THEN R=R-8:AN=AN-0.7853
6062 IF A$="D" THEN R=R+8:AN=AN+0.7853
6063 IF A$="C" THEN GOTO 8000
6064 IF A$="Z" THEN TR=1
6066 IF A$="X" THEN TR=0
6067 IF A$="M" AND OM=1 THEN OM=0:CQ=-1:GOTO 4000
6068 IF A$="M" AND OM=0 THEN OM=1:HOME:PRINT:PRINT CHR$(4);"BLOAD GLOBE.HGR,A$2000":GOTO 6095
6070 IF A$=" " AND LN=1 THEN S=S-1:XX=PEEK(-16336)
6071 IF A$=" " AND LN=0 THEN GOSUB 7500
6072 IF A$="E" THEN GOSUB 8100
6073 IF R=64 THEN R=0:AN=0
6074 IF R=-8 THEN R=56
6075 IF S<1 THEN S=1
6080 ROT=R
6090 IF OM<>1 THEN XDRAW 1+((S-1)*2)+TR AT 140,80
6095 IF OM=1 THEN HX=INT(RX/25000)+140:HY=INT(-RY/25000)+85:HCOLOR=3:HPLOT HX,HY
6118 T=T+1
6200 GOTO 4000
7500 REM *** LAUNCH ***
7510 HCOLOR=0:HPLOT 110,110 TO 110,60:HPLOT TO 130,60: HPLOT 110,70 TO 130,70
7520 XX=PEEK(-16336)
7530 TR=1:LN=1
7535 GOSUB 8220
7540 RETURN
7600 REM *** GROUND ***
7610 HOME:PRINT:PRINT CHR$(4);"BLOAD LAUNCHPAD.HGR,A$2000"
7615 XDRAW 1+((S-1)*2)+TR AT 140,80
7620 CQ=0
7650 RETURN
7700 REM *** SPACE_UP ***
7710 HOME:PRINT:PRINT CHR$(4);"BLOAD ORBIT_TOP.HGR,A$2000"
7715 XDRAW 1+((S-1)*2)+TR AT 140,80
7720 CQ=1
7750 RETURN
8000 REM *** CRASH ***
8010 SCALE=3
8015 GOSUB 8200
8020 FOR I=0 TO 64 STEP 8: ROT=I:XDRAW 1+((S-1)*2)+TR AT 140,80: XX=PEEK(-16336):NEXT I
8030 FOR I=1 TO 50
8040 X=INT(RND(1)*80)+1:Y=INT(RND(1)*80)+1
8050 C=INT(RND(1)*7)+1:HCOLOR=C
8060 HPLOT 140,80 TO 100+X,40+Y
8070 XX=PEEK(-16336)
8080 NEXT I
8085 AD(W)=1
8090 GOTO 9000
8100 REM *** KERBAL EYES ***
8105 HCOLOR=3:HPLOT 258,150 TO 263,150:HPLOT 265,150 TO 270,150
8110 KE=INT(RND(1)*3)
8120 HCOLOR=0:HPLOT 258+(2*KE),150 TO 259+(2*KE),150
8125 HPLOT 265+(2*KE),150 TO 266+(2*KE),150
8130 RETURN
8200 REM *** KERBAL FROWN ***
8205 HCOLOR=1:HPLOT 259,155 TO 271,155:HPLOT 259,156 TO 271,156
8206 HCOLOR=0:HPLOT 261,155 TO 269,155:HPLOT 259,156 TO 271,156
8207 RETURN
8210 REM *** KERBAL NEUTRAL ***
8215 HCOLOR=1:HPLOT 259,155 TO 271,155:HPLOT 259,156 TO 271,156
8216 HCOLOR=0:HPLOT 259,155 TO 271,155
8217 RETURN
8220 REM *** KERBAL SMILE ***
8225 HCOLOR=1:HPLOT 259,155 TO 271,155:HPLOT 259,156 TO 271,156
8226 HCOLOR=0:HPLOT 259,155 TO 271,155:HPLOT 261,156 TO 269,156
8227 RETURN
9000 REM *** CONTRACT COMPLETE ***
9005 IF MX<40000 THEN C$="CRASH SHIP":F$="0.30":E$="-1":GOTO 9010
9007 C$="REACH SPACE":F$="200":E$="20"
9010 TEXT:HOME
9020 HTAB 10:VTAB 9
9021 FOR I=1 TO 20: PRINT "*";: NEXT I: PRINT "*"
9023 HTAB 10: PRINT "* ";:INVERSE: PRINT "CONTRACT COMPLETE";:NORMAL: PRINT " *"
9024 HTAB 10: PRINT "* ";
9026 L=10-(LEN(C$))/2
9027 HTAB 10+L:PRINT C$;:HTAB 30: PRINT "*"
9030 HTAB 10:PRINT "*      FUNDS ";F$;:HTAB 30: PRINT "*"
9030 HTAB 10:PRINT "*   EXPERIENCE ";E$;:HTAB 30: PRINT "*"
9040 HTAB 10
9042 FOR I=1 TO 20: PRINT "*";: NEXT I:PRINT "*"
9100 VTAB 16
9110 PRINT "NOW WHAT?"
9120 PRINT "  1. RETURN TO THE VAB"
9130 PRINT "  2. RETURN TO ASTRO COMPLEX"
9140 PRINT "  3. RETURN TO LAUNCH"
9145 PRINT "  4. HELP"
9150 PRINT "  5. QUIT GAME"
9160 PRINT "---> ";
9170 GET A$
9171 IF A$="1" GOTO 1
9172 IF A$="2" GOTO 2
9173 IF A$="3" GOTO 1000
9174 IF A$="4" OR A$="H" GOTO 9200
9175 IF A$="5" OR A$="Q" THEN TEXT:HOME:END
9176 GOTO 9160
9200 REM *** HELP ***
9210 HOME
9220 PRINT "KSP-APPLE-II BY VINCE WEAVER"
9230 PRINT "     APPLE II FOREVER"
9240 PRINT " A,D   - STEER SHIP LEFT/RIGHT"
9250 PRINT " Z     - START ENGINES"
9260 PRINT " X     - CUT ENGINES"
9270 PRINT " SPACE - LAUNCH,STAGE"
9275 PRINT " M     - SWITCH TO ORBITAL VIEW"
9280 PRINT " ESC   - QUIT" 
9300 GET A$
9320 GOTO 9010
