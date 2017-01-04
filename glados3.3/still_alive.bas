1 REM PORTAL CLOSING CREDITS APPLESOFT
2 REM BASED ON QBASIC VERSION BY Thomas Moss (spinneretsystems)
5 TEXT:PRINT CHR$(4)+"PR#3": REM 80 COLUMN MODE
7 HOME:C$=CHR$(13):GOTO 50
'
10 REM SET LEFT WINDOW
11 POKE 32,2:POKE 33,35:POKE 34,1:POKE 35,21
12 RETURN
15 REM SET RIGHT WINDOW
16 POKE 32,39:POKE 33,40:POKE 34,1:POKE 35,23
17 RETURN
'
18 X=PEEK(36):Y=PEEK(37):RETURN
19 POKE 36,X:POKE 37,Y-1:RETURN
'
20 REM SLOWTEXT
21 FOR C = 1 TO LEN(T$)
22 PRINT MID$(T$, C, 1);
23 FOR I = 1 TO 50:NEXT I
24 NEXT C
25 RETURN
'
50 PRINT " ------------------------------------ "
55 FOR I=1 TO 20: PRINT "|                                    |":NEXT I
60 PRINT " ------------------------------------ "
65 GOSUB 10
'
70 HOME
72 T$="Forms FORM-29827281-12:"+C$:GOSUB 20
74 T$="Test Assessment Report"+C$:GOSUB 20
76 PRINT:PRINT
78 FOR I=1 TO 1000: NEXT I
'
' This was a triumph.
'
80 T$="This ":GOSUB 20:REM SOUND 392, 4.8
82 T$="was ":GOSUB 20:REM SOUND 370, 4.8
84 T$="a ":GOSUB 20:REM SOUND 330, 4.8
86 T$="tri":GOSUB 20
87 REM SOUND 0, .01
88 REM SOUND 330, 4.8
89 T$="umph."+C$:GOSUB 20
90 REM SOUND 370, 19.2
'
'REM SOUND 123.4, 4.8
'REM SOUND 146.8, 4.8
'REM SOUND 184.9, 4.8
'REM SOUND 146.8, 4.8
'REM SOUND 110, 4.8
'REM SOUND 146.8, 4.8
'REM SOUND 184.9, 4.8
'
' I'm making a note here:
'
94 T$="I'm ":GOSUB 20: REM SOUND 220, 4.8
96 T$="ma":GOSUB 20: REM SOUND 392, 4.8
98 T$="king ":GOSUB 20: REM SOUND 370, 4.8
100 T$="a ":GOSUB 20:REM SOUND 330, 4.8
102 T$="note ":GOSUB 20:REM SOUND 0, .1:REM SOUND 330, 9.6
104 T$ = "here:"+C$:GOSUB 20:REM SOUND 370, 14.4
'
' HUGE SUCCESS.
'
106 T$ = "HUGE ":GOSUB 20:REM SOUND 294, 9.6
108 T$ = "SUC":GOSUB 20:REM SOUND 330, 4.8
110 T$ = "CESS."+C$:GOSUB 20:REM SOUND 220, 3.36
'delay .48
'
' It's hard to overstate
'
112 T$="It's ":GOSUB 20:REM SOUND 220, 4.8
114 T$="hard ":GOSUB 20:REM SOUND 330, 9.6
116 T$="to ":GOSUB 20:REM SOUND 370, 4.8
118 T$="o":GOSUB 20:REM SOUND 392, 14.4
120 T$="ver":GOSUB 20:REM SOUND 330, 4.8
122 T$="state"+C$:GOSUB 20:REM SOUND 277, 9.6
'
' my satisfaction.
'
124 T$="my ":GOSUB 20:REM SOUND 294, 14.4
126 T$="sa":GOSUB 20:REM SOUND 330, 9.6
128 T$="tis":GOSUB 20:REM SOUND 220, 4.8
130 T$="fac":GOSUB 20:REM SOUND 0, .01:SOUND 220, 9.6
132 T$="tion."+C$:GOSUB 20:REM SOUND 370, 3.36
'
'SOUND 110, 4.8
'SOUND 146.8, 4.8
'SOUND 184.9, 4.8
'SOUND 146.8, 4.8
'
' APERTURE SCIENCE LOGO
134 GOSUB 18:GOSUB 15:HOME:GOSUB 2000: GOSUB 10:GOSUB 19:PRINT
'
' Aperture Science
136 T$="A":GOSUB 20:REM SOUND 392, 4.8
138 T$="per":GOSUB 20:REM SOUND 370, 4.8
140 T$="ture ":GOSUB 20:REM SOUND 330, 4.8
142 T$="Sci":GOSUB 20:REM SOUND 0, .01REM SOUND 330, 4.8
144 T$="ence"+C$:GOSUB 20:REM SOUND 370, 1.92
'
'REM SOUND 123.4, 4.8
'REM SOUND 146.8, 4.8
'REM SOUND 184.9, 4.8
'REM SOUND 146.8, 4.8
'REM SOUND 110, 4.8
'REM SOUND 146.8, 4.8
'REM SOUND 184.8, 4.8
'
' We do what we must
'
146 T$="We ":GOSUB 20:REM SOUND 220, 4.8
148 T$="do ":GOSUB 20:REM SOUND 392, 4.8
150 T$="what ":GOSUB 20:REM SOUND 370, 4.8
152 T$="we ":GOSUB 20:REM SOUND 330, 4.8
154 T$="must"+C$:GOSUB 20:REM SOUND 0, .1REM SOUND 330, 14.4
'
' because we can.
'
156 T$="be":GOSUB 20:REM SOUND 370, 4.8
158 T$="cause ":GOSUB 20:REM SOUND 294, 14.4
160 T$="we ":GOSUB 20:REM SOUND 330, 4.8
162 T$="can."+C$:GOSUB 20:REM SOUND 220, 14.4
'REM SOUND 184.9, 4.8
'REM SOUND 146.8, 4.8
'REM SOUND 123.4, 4.8
'REM SOUND 146.8, 4.8
'REM SOUND 184.9, 4.8
'REM SOUND 146.8, 4.8
'
'
' For the good of all of us.
'
164 T$="For ":GOSUB 20:REM SOUND 330, 9.6
166 T$="the ":GOSUB 20:REM SOUND 370, 4.8
168 T$="good ":GOSUB 20:REM SOUND 392, 14.4
170 T$="of ":GOSUB 20:REM SOUND 330, 4.8
172 T$="all ":GOSUB 20:REM SOUND 277.2, 14.4
174 T$="of ":GOSUB 20:REM SOUND 294, 4.8
176 T$="us."+C$:GOSUB 20:REM SOUND 330, 9.6
'
' RADIATION
178 GOSUB 18:GOSUB 15:HOME:GOSUB 2100: GOSUB 10:GOSUB 19:PRINT
'
' Except the ones who are dead.
'
180 T$="Ex":GOSUB 20:REM SOUND 220, 4.8
182 T$="cept ":GOSUB 20:REM SOUND 294, 4.8
184 T$="the ":GOSUB 20:REM SOUND 330, 4.8
186 T$="ones ":GOSUB 20:REM SOUND 349.2, 4.8
188 T$="who ":GOSUB 20:REM SOUND 330, 4.8
190 T$="are ":GOSUB 20:REM SOUND 293.6, 4.8
192 T$="dead."+C$:GOSUB 20:REM SOUND 261.6, 4.8
'
'
'REM SOUND 0, 9.6
'
' APERTURE SCIENCE LOGO
194 GOSUB 18:GOSUB 15:HOME:GOSUB 2000: GOSUB 10:GOSUB 19:PRINT
'
' But there's no sense crying\nover every mistake.
'
196 PRINT
198 T$="But ":GOSUB 20:REM SOUND 220, 4.8
200 T$="there's ":GOSUB 20:REM SOUND 233, 4.8
202 T$="no ":GOSUB 20:REM SOUND 261.6, 9.6
204 T$="sense ":GOSUB 20:REM SOUND 349.2, 9.6
206 T$="cry":GOSUB 20:REM SOUND 330, 4.8
208 T$="ing"+C$:GOSUB 20:REM SOUND 293.6, 4.8
210 T$="o":GOSUB 20:REM SOUND 0, .1REM SOUND 293.6, 4.8
212 T$="ver ":GOSUB 20:REM SOUND 261.6, 4.8
214 T$="e":GOSUB 20:REM SOUND 293.6, 4.8
216 T$="very ":GOSUB 20:REM SOUND 261.6, 4.8
218 T$="mis":GOSUB 20:REM SOUND 0, .1:REM SOUND 261.6, 9.6
220 T$="take."+C$:GOSUB 20:REM SOUND 0, .1REM SOUND 261.6, 9.6
'
' You just keep on trying\ntill you run out of cake.
'
222 T$="You ":GOSUB 20:REM SOUND 220, 4.8
224 T$="just ":GOSUB 20:REM SOUND 233, 4.8
226 T$="keep ":GOSUB 20:REM SOUND 261.6, 9.6
228 T$="on ":GOSUB 20:REM SOUND 349.2, 9.6
230 T$="try":GOSUB 20:REM SOUND 391.9, 4.8
232 T$="ing"+C$:GOSUB 20:REM SOUND 349.2, 4.8
234 T$="till ":GOSUB 20:REM SOUND 329.6, 4.8
236 T$="you ":GOSUB 20:REM SOUND 293.6, 4.8
238 T$="run ":GOSUB 20:REM SOUND 0, .2:REM SOUND 293.6, 4.8
240 T$="out ":GOSUB 20:REM SOUND 329.6, 4.8
242 T$="of ":GOSUB 20:REM SOUND 349.2, 9.6:REM SOUND 0, .2
244 T$="cake."+C$:GOSUB 20:REM SOUND 0, .2:REM SOUND 349.2, 9.6
'
' ATOM
'
246 GOSUB 18:GOSUB 15:HOME:GOSUB 2200: GOSUB 10:GOSUB 19:PRINT
'
' And the Science gets done.
'
248 T$="And ":GOSUB 20:REM SOUND 391.9, 4.8
250 T$="the ":GOSUB 20:REM SOUND 440, 4.8
252 T$="Sci":GOSUB 20:REM SOUND 466.1, 4.8
254 T$="ence ":GOSUB 20:REM delaytime = .01:REM SOUND 466.1, 4.8
256 T$="gets ":GOSUB 20:REM SOUND 440, 9.6
258 T$="done."+C$:GOSUB 20:REM SOUND 391.9, 9.6
'
' And you make a neat gun
'
260 T$="And ":GOSUB 20:REM SOUND 349.2, 4.8
262 T$="you ":GOSUB 20:REM SOUND 391.9, 4.8
264 T$="make ":GOSUB 20:REM SOUND 440, 4.8
266 T$="a ":GOSUB 20:REM SOUND 0, .1:REM SOUND 440, 4.8
268 T$="neat ":GOSUB 20:REM SOUND 391.9, 9.6
270 T$="gun."+C$:GOSUB 20:REM SOUND 349.2, 9.6
'
' APERTURE SCIENCE LOGO
272 GOSUB 18:GOSUB 15:HOME:GOSUB 2000: GOSUB 10:GOSUB 19:PRINT
'
' For the people who are
'
274 T$="For ":GOSUB 20:REM SOUND 293.6, 4.8
276 T$="the ":GOSUB 20:REM SOUND 261.6, 4.8
278 T$="peo":GOSUB 20:REM SOUND 293.6, 4.8
280 T$="ple ":GOSUB 20:REM SOUND 349.2, 4.8
282 T$="who ":GOSUB 20:REM SOUND 0, .1:REM SOUND 349.2, 4.8
284 T$="are"+C$:GOSUB 20:REM SOUND 329.6, 9.6
'
' still alive.
'
286 T$="still ":GOSUB 20:REM SOUND 329.6, 4.8
288 T$="a":GOSUB 20:REM SOUND 369.9, 4.8
290 T$="live."+C$:GOSUB 20:REM SOUND 0, .1:REM SOUND 369.9, 4.8
'
'FOR i = 1 TO 3
'REM SOUND 146.8, 14.4
'REM SOUND 0, .1
'REM SOUND 146.8, 4.8
'REM SOUND 123.4, 14.4
'REM SOUND 0, .1
'REM SOUND 123.4, 4.8
'NEXT i
'REM SOUND 146.8, 14.4
'.if 0

clearleft
LOCATE 2, 2
T$="Forms FORM-55551-5:"+C$ + "|Personnel File Addendum:"+C$ + "|"+C$ + "|Dear <<Subject Name Here>>"
fasttext
PRINT "|"
PRINT "|"

T$="|I'm "
GOSUB 20:
REM SOUND 220, 4.8
T$="not "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="e"
GOSUB 20:
REM SOUND 369.9, 4.8
T$="ven "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="an"
GOSUB 20:
REM SOUND 0, .1
REM SOUND 329.6, 7.2
T$="gry."+C$
GOSUB 20:
REM SOUND 369.9, 1.68

REM                             "|I'm not even angry."+C$

REM SOUND 123.4, 14.4
REM SOUND 0, .1
REM SOUND 123.4, 4.8
REM SOUND 146.8, 14.4
delay
REM SOUND 146.6, 4.8

T$="|I'm "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="be"
GOSUB 20:
REM SOUND 369.9, 4.8
T$="ing "
GOSUB 20:
REM SOUND 329.6, 4.8
text = "so "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 329.6, 14.4
text = "sin"
GOSUB 20:
REM SOUND 369.9, 4.8
text = "cere "
GOSUB 20:
REM SOUND 293.6, 9.6
text = "right"+C$
GOSUB 20:
REM SOUND 329.6, 9.6
text = "|now."+C$
GOSUB 20:
REM SOUND 220, 14.4
REM                             "|I'm being so sincere right"+C$ + "|now."+C$

REM SOUND 146.8, 4.8
REM SOUND 0, .1
REM SOUND 146.8, 4.8
REM SOUND 123.4, 14.4
REM SOUND 0, .1
REM SOUND 123.4, 4.8

T$="|E"
GOSUB 20:
REM SOUND 329.6, 9.6
T$="ven "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="though "
GOSUB 20:
REM SOUND 391.9, 14.4
T$="you "
GOSUB 20:
REM SOUND 329.6, 9.6
T$="broke "
GOSUB 20:
REM SOUND 277.1, 9.6
T$="my"+C$
GOSUB 20:
REM SOUND 293.6, 4.8
REM                             "|Even though you broke my"+C$

heart
LOCATE 11, 1

T$="|heart."+C$
GOSUB 20:
REM SOUND 329.6, 14.4
LOCATE 12, 1

T$="|And "
GOSUB 20:
REM SOUND 220, 4.8
T$="killed "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 220, 9.6
T$="me."+C$
GOSUB 20:
REM SOUND 369.9, 2.4
REM                             "|heart. And killed me."+C$

REM 480
delaytime = .48
delay

REM SOUND 123.4, 4.8
REM SOUND 146.8, 14.4

explode
LOCATE 13, 1
T$="|And "
GOSUB 20:
REM SOUND 220, 4.8
T$="tore "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 391.9, 1
REM SOUND 493.8, 1
NEXT i
T$="me "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 369.9, 1
REM SOUND 440, 1
NEXT i
T$="to "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
T$="pie"
GOSUB 20:
REM SOUND 0, .1
FOR i = 1 TO 2.4
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
text = "ces."+C$
GOSUB 20:
FOR i = 1 TO 4.8
REM SOUND 369.9, 1
REM SOUND 440, 1
NEXT i
REM                             "|And tore me to pieces."+C$

REM 480
delaytime = .48
delay

REM SOUND 146.8, 4.8
REM SOUND 123.4, 14.4
REM SOUND 0, .1
REM SOUND 123.4, 4.8
REM SOUND 146.8, 14.4

T$="|And "
GOSUB 20:
REM SOUND 220, 4.8
T$="threw "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 391.9, 1
REM SOUND 493.8, 1
NEXT i
T$="ev"
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 369.9, 1
REM SOUND 440, 1
NEXT i
T$="ery "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
T$="piece "
GOSUB 20:
REM SOUND 0, .1
FOR i = 1 TO 7.2
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
T$="in"
GOSUB 20:
FOR i = 1 TO 2.6
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
T$="to"+C$
GOSUB 20:
FOR i = 1 TO 7.2
REM SOUND 369.9, 1
REM SOUND 293.6, 1
NEXT i
REM                             "|And threw every peice into"+C$

fire
LOCATE 15, 1

T$="|a "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
T$="fire."+C$
GOSUB 20:
FOR i = 1 TO 7.2
REM SOUND 293.6, 1
REM SOUND 220, 1
NEXT i

REM                             "|a fire."+C$

REM 480
delaytime = .48
delay

REM SOUND 146.8, 4.8
REM SOUND 123.4, 14.4
REM SOUND 0, .1
REM SOUND 123.4, 4.8

T$="|As "
GOSUB 20:
REM SOUND 329.6, 9.6
T$="they "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="burned "
GOSUB 20:
REM SOUND 391.9, 14.4
T$="it "
GOSUB 20:
REM SOUND 329.6, 9.6
T$="hurt"+C$
GOSUB 20:
REM SOUND 277.1, 9.6
REM                             "|As they burned it hurt"+C$

T$="|be"
GOSUB 20:
REM SOUND 293.6, 4.8
T$="cause "
GOSUB 20:
REM SOUND 329.6, 9.6
T$="I "
GOSUB 20:
REM SOUND 220, 4.8
T$="was "
GOSUB 20:
REM SOUND 293.6, 4.8
T$="so "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="hap"
GOSUB 20:
REM SOUND 349.2, 4.8
text = "py "
GOSUB 20:
REM SOUND 329.6, 4.8
text = "for"+C$
GOSUB 20:
REM SOUND 293.6, 4.8
text = "|you!"+C$
GOSUB 20:
REM SOUND 261.6, 14.4
REM                             "|becuase I was so happy for"+C$ + "|you!"+C$

tick
delaytime = .5
delay
LOCATE 19, 1

T$="|Now "
GOSUB 20:
REM SOUND 220, 4.8
T$="these "
GOSUB 20:
REM SOUND 233, 4.8
T$="points "
GOSUB 20:
REM SOUND 261.6, 9.6
T$="of "
GOSUB 20:
REM SOUND 349.2, 9.6
T$="da"
GOSUB 20:
REM SOUND 329.6, 4.8
T$="ta"+C$
GOSUB 20:
REM SOUND 293.6, 4.8
T$="|make "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 293.6, 4.8
T$="a "
GOSUB 20:
REM SOUND 261.6, 4.8
T$="beau"
GOSUB 20:
REM SOUND 293.6, 4.8
T$="ti"
GOSUB 20:
REM SOUND 261.6, 4.8
T$="ful "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 261.6, 9.6
T$="line."+C$
GOSUB 20:
REM SOUND 0, .1
REM SOUND 261.6, 9.6
REM                             "|Now these points of data"+C$ + "|make a beautiful line."+C$

T$="|And "
GOSUB 20:
REM SOUND 220, 4.8
T$="we're "
GOSUB 20:
REM SOUND 233, 4.8
T$="out "
GOSUB 20:
REM SOUND 261.6, 9.6
T$="of "
GOSUB 20:
REM SOUND 349.2, 9.6
T$="be"
GOSUB 20:
REM SOUND 391.9, 4.8
T$="ta."+C$
GOSUB 20:
REM SOUND 349.2, 4.8

T$="|We're "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="re"
GOSUB 20:
REM SOUND 293.6, 4.8
T$="lea"
GOSUB 20:
REM SOUND 0, .1
REM SOUND 293.6, 4.8
T$="sing "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="on "
GOSUB 20:
REM SOUND 349.2, 9.6
T$="time."+C$
GOSUB 20:
REM SOUND 0, .1
REM SOUND 349.2, 9.6
REM                             "|And we're out of beta."+C$ + "|We're releasing on time."

explode
scroll
LOCATE 22, 1

T$="|So "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="I'm "
GOSUB 20:
REM SOUND 440, 4.8
T$="GLaD. "
GOSUB 20:
REM SOUND 466.1, 4.8
scroll

T$="I "
GOSUB 20:
REM SOUND 466.1, 4.8
T$="got "
GOSUB 20:
REM SOUND 440, 9.6
T$="burned."+C$
GOSUB 20:
REM SOUND 391.9, 9.6
REM                             "|So I'm GLaD. I got burned."+C$

scroll
atom

T$="|Think "
GOSUB 20:
REM SOUND 349.2, 4.8
T$="of "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="all "
GOSUB 20:
REM SOUND 440, 4.8
T$="the "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 440, 4.8
T$="things "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="we"+C$
GOSUB 20:
REM SOUND 349.2, 4.8
REM                             "|Think of all the things we"+C$

scroll

T$="learned"+C$
GOSUB 20:
REM SOUND 349.2, 9.6
REM                             "learned"+C$

aplabs
scroll

T$="for "
GOSUB 20:
REM SOUND 293.6, 4.8
T$="the "
GOSUB 20:
REM SOUND 261.6, 4.8
T$="peo"
GOSUB 20:
REM SOUND 293.6, 4.8
T$="ple "
GOSUB 20:
REM SOUND 349.2, 4.8
T$="who "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 349.2, 4.8
T$="are"+C$
GOSUB 20:
REM SOUND 329.6, 9.6
REM                             "for the people who are"+C$

scroll

T$="still "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="alive."+C$
GOSUB 20:
REM SOUND 369.9, 4.8
REM SOUND 0, .1
REM SOUND 369.9, 24
REM                             "still alive."+C$

clearleft
T$="|Forms FORM-55551-6:"+C$ + "|Personnel File Addendum"+C$ + "|Addendum:"+C$ + "|"+C$
fasttext
T$="|One last thing:"+C$ + "|"+C$
GOSUB 20:

FOR i = 1 TO 3
REM SOUND 123.4, 14.4
REM SOUND 0, .1
REM SOUND 123.4, 4.8
REM SOUND 146.6, 14.4
REM SOUND 0, .1
REM SOUND 146.6, 4.8
NEXT i

T$="|Go "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="ahead "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="and "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="leave "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 329.6, 9.6
T$="me"+C$
GOSUB 20:
REM SOUND 369.9, 14.2
REM                             "|Go ahead and leave me"+C$

REM SOUND 123.4, 4.8
REM SOUND 146.8, 4.8
REM SOUND 184.9, 4.8
REM SOUND 146.8, 4.8
REM SOUND 110, 4.8
REM SOUND 123.4, 4.8
REM SOUND 146.8, 4.8

T$="|I "
GOSUB 20:
REM SOUND 220, 4.8
T$="think "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="I "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="pre"
GOSUB 20:
REM SOUND 329.6, 4.8
T$="fer "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 329.6, 14.2
T$="to "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="stay"+C$
GOSUB 20:
REM SOUND 293.6, 14.2
T$="|in"
GOSUB 20:
REM SOUND 329.6, 4.8
T$="side."+C$
GOSUB 20:
REM SOUND 220, 24
REM                             "|I think I prefer to stay"+C$ + "|inside."+C$

REM SOUND 123.4, 4.8
REM SOUND 146.8, 4.8
REM SOUND 184.9, 4.8
REM SOUND 146.8, 4.8

T$="|May"
GOSUB 20:
REM SOUND 329.6, 9.6
T$="be "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="you'll "
GOSUB 20:
REM SOUND 391.9, 14.2
T$="find "
GOSUB 20:
REM SOUND 329.6, 9.6
T$="some"
GOSUB 20:
REM SOUND 277.1, 9.6
T$="one"+C$
GOSUB 20:
REM SOUND 293.6, 4.8
T$="|else "
GOSUB 20:
REM SOUND 329.6, 9.6

REM 480
delaytime = .48
delay

T$="to "
GOSUB 20:
REM SOUND 220, 4.8
T$="help "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 220, 9.6
T$="you."+C$
GOSUB 20:
REM SOUND 369.9, 24
REM                             "|Maybe you'll find someone"+C$ + "|else to help you."+C$

REM SOUND 184.9, 4.8
REM SOUND 146.8, 4.8
REM SOUND 110, 4.8
REM SOUND 146.8, 4.8
REM SOUND 184.9, 4.8
REM SOUND 146.8, 4.8

bmesa
LOCATE 13, 1

T$="|May"
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 391.9, 1
REM SOUND 493.8, 1
NEXT i
T$="be "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 369.9, 1
REM SOUND 440, 1
NEXT i
T$="Black "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
T$="Me"
GOSUB 20:
REM SOUND 0, .1
FOR i = 1 TO 4.755
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
T$="sa."
GOSUB 20:
FOR i = 1 TO 4.8
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
REM                             "|Maybe Black Mesa."

REM SOUND 0, .1

REM SOUND 146.8, 4.8
REM SOUND 123.4, 14.4
delay
REM SOUND 123.4, 4.8
REM SOUND 146.8, 14.4
delay
REM SOUND 146.8, 4.8

LOCATE 13, 19
FOR i = 1 TO 2
PRINT ".";
NEXT i
PRINT CHR$(13)+C$

T$="|THAT "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 391.9, 1
REM SOUND 493.8, 1
NEXT i
T$="WAS "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
T$="A "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
T$="JOKE."+C$
GOSUB 20:
FOR i = 1 TO 7.2
REM SOUND 391.9, 1
REM SOUND 329.6, 1
NEXT i
REM                             "|THAT WAS A JOKE."+C$

REM <HAHA>
FOR i = 1 TO 2.4
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
FOR i = 1 TO 7.2
REM SOUND 369.9, 1
REM SOUND 293.6, 1
NEXT i
T$="|FAT "
fasttext
FOR i = 1 TO 2.4
REM SOUND 391.9, 1
REM SOUND 329.6, 1
NEXT i
T$="CHANCE."+C$
fasttext
FOR i = 1 TO 7.2
REM SOUND 293.6, 1
REM SOUND 220, 1
NEXT i
REM                             "|FAT CHANCE."+C$

REM 480
delaytime = .48
delay

REM SOUND 146.8, 4.8
REM SOUND 123.4, 14.4
REM SOUND 0, .1
REM SOUND 123.4, 4.8

T$="|A"
GOSUB 20:
REM SOUND 329.6, 9.6
T$="ny"
GOSUB 20:
REM SOUND 369.9, 4.8
text = "way, "
GOSUB 20:
REM SOUND 391.9, 14.4
text = "this "
GOSUB 20:
REM SOUND 329.6, 9.6
T$="cake "
GOSUB 20:
REM SOUND 277.1, 9.6
T$="is"+C$
GOSUB 20:
REM SOUND 293.6, 4.8
REM                             "|Anyway, this cake is"+C$

cake
LOCATE 19, 1

T$="|great."+C$
GOSUB 20:
REM SOUND 329.6, 9.6
REM                             "|great."+C$

T$="|It's "
GOSUB 20:
REM SOUND 220, 4.8
T$="so "
GOSUB 20:
REM SOUND 293.6, 4.8
T$="de"
GOSUB 20:
REM SOUND 329.6, 4.8
T$="li"
GOSUB 20:
REM SOUND 349.2, 4.8
T$="cious "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="and"+C$
GOSUB 20:
REM SOUND 293.6, 4.8
T$="|moist."+C$
GOSUB 20:
REM SOUND 261.6, 14.4
REM                             "|It's so delicious and"+C$ + "|moist."+C$

GLaDOS
LOCATE 22, 1

T$="|Look "
GOSUB 20:
REM SOUND 220, 4.8
T$="at "
GOSUB 20:
REM SOUND 233, 4.8
T$="me "
GOSUB 20:
REM SOUND 261.6, 9.6
T$="still"+C$
GOSUB 20:
REM SOUND 349.2, 9.6
REM                             "|Look at me still"+C$

scroll

T$="tal"
GOSUB 20:
REM SOUND 329.6, 4.8
T$="king "
GOSUB 20:
REM SOUND 293.6, 4.8
T$="when "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 293.6, 4.8
T$="there's"+C$
GOSUB 20:
REM SOUND 261.6, 4.8
REM                             "talking when there's"+C$

scroll
radiation
LOCATE 22, 1

T$="|Sci"
GOSUB 20:
REM SOUND 293.6, 4.8
T$="ence "
GOSUB 20:
REM SOUND 261.6, 4.8
T$="to "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 261.6, 9.6
T$="do."+C$
GOSUB 20:
REM SOUND 0, .1
REM SOUND 261.6, 9.6
REM                             "|Science to do."+C$

aplabs
scroll
LOCATE 22, 1

T$="|When "
GOSUB 20:
REM SOUND 220, 4.8
T$="I "
GOSUB 20:
REM SOUND 233, 4.8
T$="look "
GOSUB 20:
REM SOUND 261.6, 9.6
T$="out "
GOSUB 20:
REM SOUND 349.2, 9.6
T$="there "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="it"+C$
GOSUB 20:
REM SOUND 349.2, 4.8
REM                             "|When I look out there it"+C$

scroll
LOCATE 22, 1

T$="|Makes "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="me "
GOSUB 20:
REM SOUND 293.6, 4.8
T$="GLaD "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 293.6, 4.8
T$="I'm "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="not "
GOSUB 20:
REM SOUND 349.2, 9.6
T$="you."+C$
GOSUB 20:
REM SOUND 0, .1
REM SOUND 349.2, 9.6
REM                             "|Makes me GLaD I'm not you."+C$

atom
scroll
LOCATE 22, 1

T$="|I've "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="ex"
GOSUB 20:
REM SOUND 440, 4.8
T$="pe"
GOSUB 20:
REM SOUND 466.1, 4.8
T$="ri"
GOSUB 20:
REM SOUND 0, .1
REM SOUND 466.1, 4.8
T$="ments "
GOSUB 20:
REM SOUND 440, 4.7
T$="to "
GOSUB 20:
REM SOUND 391.9, 4.7

REM 18
REM SOUND 0, .18

T$="run."+C$
GOSUB 20:
REM SOUND 0, .1
REM SOUND 391.9, 9.6
REM                             "|I've experiments to run."+C$

scroll
explode
LOCATE 22, 1

T$="|There "
GOSUB 20:
REM SOUND 349.2, 4.8
T$="is "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="re"
GOSUB 20:
REM SOUND 440, 4.8
T$="search "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 440, 4.8
T$="to "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="be"+C$
GOSUB 20:
REM SOUND 349.2, 4.8
REM                             "|There is research to be"+C$

scroll

T$="done."+C$
GOSUB 20:
REM SOUND 349.2, 9.6
REM                             "done."+C$

scroll
aplabs
LOCATE 22, 1

T$="|On "
GOSUB 20:
REM SOUND 293.6, 4.8
T$="the "
GOSUB 20:
REM SOUND 261.6, 4.8
T$="peo"
GOSUB 20:
REM SOUND 293.6, 4.8
T$="ple "
GOSUB 20:
REM SOUND 349.2, 4.8
T$="who "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 349.2, 4.8
T$="are"+C$
GOSUB 20:
REM SOUND 329.6, 9.6
REM                             "|On the people who are"+C$

scroll

T$="still "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="a"
GOSUB 20:
REM SOUND 369.9, 4.8
T$="live."+C$
GOSUB 20:
REM SOUND 0, .1
REM SOUND 369.9, 24
REM                             "still alive."+C$

hl

clearleft
LOCATE 5, 2

hl

T$="PS: And "
GOSUB 20:
REM SOUND 440, 4.7

T$="be"
GOSUB 20:
REM SOUND 440, 4.7

REM 9
delaytime = .09
delay

T$="lieve "
GOSUB 20:
REM SOUND 493.8, 4.7

REM 9
delaytime = .09
delay

T$="me "
GOSUB 20:
REM SOUND 440, 4.7

REM 9
delaytime = .09
delay

T$="I "
GOSUB 20:
REM SOUND 369.9, 4.7

REM 9
delaytime = .09
delay

T$="am"+C$
GOSUB 20:
REM SOUND 293.6, 9.6
T$="|still "
GOSUB 20:
REM SOUND 329.6, 4.8
T$="a"
GOSUB 20:
REM SOUND 369.9, 4.8
T$="live."+C$
GOSUB 20:
FOR i = 1 TO 7.2
REM SOUND 369.9, 1
REM SOUND 440, 1
NEXT i
REM                             "PS: And believe me I am"+C$ + "|still alive."+C$

hl

T$="|PPS: "
fasttext

T$="I'm "
GOSUB 20:
REM SOUND 440, 4.8
T$="do"
GOSUB 20:
delaytime = .01
delay
REM SOUND 440, 4.8
T$="ing "
GOSUB 20:
delay
REM SOUND 440, 4.8
T$="Sci"
GOSUB 20:
REM SOUND 493.8, 4.8
T$="ence"+C$
GOSUB 20:
REM SOUND 440, 4.8
T$="|and "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="I'm"+C$
GOSUB 20:
REM SOUND 293.6, 9.6
T$="|still "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 391.9, 1
REM SOUND 329.6, 1
NEXT i
T$="a"
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
T$="live."+C$
GOSUB 20:
FOR i = 1 TO 7.2
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
REM                             "|PPS: I'm doing Science"+C$ + "|and I'm"+C$ + "|still alive."+C$

hl

T$="|PPPS: "
fasttext

T$="I "
GOSUB 20:
REM SOUND 440, 4.8
T$="feel "
GOSUB 20:
delaytime = .01
delay
REM SOUND 440, 4.8
T$="FAN"
GOSUB 20:
delaytime = .01
delay
REM SOUND 440, 4.8
T$="TAS"
GOSUB 20:
REM SOUND 493.8, 4.8
T$="TIC"+C$
GOSUB 20:
REM SOUND 440, 4.8
T$="|and "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="I'm"+C$
GOSUB 20:
REM SOUND 293.6, 9.6
T$="|still "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 391.9, 1
REM SOUND 329.6, 1
NEXT i
T$="a"
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
T$="live."+C$
GOSUB 20:
delaytime = .01
delay
FOR i = 1 TO 7.2
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
REM                             "|PPPS: I feel FANTASTIC"+C$ + "|and I'm"+C$ + "|still alive"+C$

PRINT "|"
T$="|FINAL THOUGHT:"+C$
fasttext

hl

T$="|While "
GOSUB 20:
REM SOUND 440, 4.8
T$="you're "
GOSUB 20:
delaytime = .01
delay
REM SOUND 440, 4.8
T$="dy"
GOSUB 20:
REM SOUND 493.8, 4.8
T$="ing "
GOSUB 20:
REM SOUND 440, 4.8
T$="I'll "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="be"+C$
GOSUB 20:
REM SOUND 293.6, 9.6
T$="|still "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 391.9, 1
REM SOUND 329.6, 1
NEXT i
T$="a"
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 369.9, 1
REM SOUND 440, 1
NEXT i
T$="live"
GOSUB 20:
REM SOUND 0, .1
FOR i = 1 TO 9.6
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
REM                             "|FINAL THOUGHT:"+C$ + "|While you're dying I'll be"+C$ + "|still alive."+C$

text$ = CHR$(13) + "|"+C$ + "|FINAL THOUGHT PS:"+C$
fasttext

hl

T$="|And "
GOSUB 20:
REM SOUND 440, 4.8
T$="when "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 440, 4.8
T$="you're "
GOSUB 20:
REM SOUND 0, .1
REM SOUND 440, 4.8
T$="dead "
GOSUB 20:
REM SOUND 493.8, 4.8
T$="I"+C$
GOSUB 20:
REM SOUND 440, 4.8
T$="|will "
GOSUB 20:
REM SOUND 369.9, 4.8
T$="be"+C$
GOSUB 20:
REM SOUND 293.6, 9.6
T$="|still "
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 329.6, 1
REM SOUND 391.9, 1
NEXT i
T$="a"
GOSUB 20:
FOR i = 1 TO 2.4
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
T$="live"+C$
GOSUB 20:
REM SOUND 0, .1
FOR i = 1 TO 7.2
REM SOUND 440, 1
REM SOUND 369.9, 1
NEXT i
REM                             "|FINAL THOUGHT PS:"+C$ + "|And when you're dead I"+C$ + "|will be"+C$ +"|still alive"+C$

REM 1440
delaytime = 1.44
delay

scroll
text$ = CHR$(13)
GOSUB 20:
scroll

REM <STILL ALIVE>
REM SOUND 391.9, 4.8
REM SOUND 440, 4.8
REM SOUND 0, .1
REM SOUND 440, 14.4
delaytime = 1.44
delay
REM </STILL ALIVE>

T$="STILL "
GOSUB 20:
REM SOUND 391.9, 4.8
T$="ALIVE"
GOSUB 20:
REM SOUND 0, .1
REM SOUND 369.9, 4.8
REM SOUND 0, .1
REM SOUND 369.9, 4.8
REM                             "STILL ALIVE"

SLEEP 2
clearleft
LOCATE 22, 1
T$="|THANK YOU FOR"+C$
GOSUB 20:
scroll
T$="PARTICIPATING IN THIS"+C$
GOSUB 20:
scroll
T$="ENRICHMENT CENTER"+C$
GOSUB 20:
scroll
T$="ACTIVITY!!"
GOSUB 20:
FOR i = 1 TO 6
scroll
NEXT i
SLEEP 5
LOCATE 22, 2
'.endif
'
1999 END
2000 REM APETURE
2001 PRINT "              .,-:;//;:=,"
2002 PRINT "          . :H@@@MM@M#H/.,+%;,"
2003 PRINT "       ,/X+ +M@@M@MM%=,-%HMMM@X/,"
2004 PRINT "     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-"
2005 PRINT "    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/."
2006 PRINT "  ,%MM@@MH ,@%=            .---=-=:=,."
2007 PRINT "  =@#@@@MX .,              -%HX$$%%%+;"
2008 PRINT " =-./@M@M$                  .;@MMMM@MM:"
2009 PRINT " X@/ -$MM/                    .+MM@@@M$"
2010 PRINT ",@M@H: :@:                    . =X#@@@@-";
2011 PRINT ",@@@MMX, .                    /H- ;@M@M=";
2012 PRINT ".H@@@@M@+,                    %MM+..%#$.";
2013 PRINT " /MMMM@MMH/.                  XM@MH; =;"
2014 PRINT "  /%+%$XHH@$=              , .H@@@@MX,"
2015 PRINT "   .=--------.           -%H.,@@@@@MX,"
2016 PRINT "   .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%."
2017 PRINT "     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX="
2018 PRINT "       =%@M@M#@$-.=$@MM@@@M; %M%="
2019 PRINT "         ,:+$+-,/H#MMMMMMM@= =,"
2020 PRINT "               =++%%%%+/:-."
2030 RETURN
'
2100 REM RADIOACTIVE
2101 PRINT "             =+$HM####@H%;,"
2102 PRINT "          /H###############M$,"
2103 PRINT "          ,@################+"
2104 PRINT "           .H##############+"
2105 PRINT "             X############/"
2106 PRINT "              $##########/"
2107 PRINT "               %########/"
2108 PRINT "                /X/;;+X/"
2109 PRINT
2110 PRINT "                 -XHHX-"
2111 PRINT "                ,######,"
2112 PRINT "#############X  .M####M.  X#############";
2113 PRINT "##############-   -//-   -##############";
2114 PRINT "X##############%,      ,+##############X";
2115 PRINT "-##############X        X##############-";
2116 PRINT " %############%          %############%"
2117 PRINT "  %##########;            ;##########%"
2118 PRINT "   ;#######M=              =M#######;"
2119 PRINT "    .+M###@,                ,@###M+."
2120 PRINT "       :XH.                  .HX:"
2130 RETURN
'
2200 REM ATOM
2201 PRINT "                 =/;;/-"
2202 PRINT "                +:    //"
2203 PRINT "               /;      /;"
2204 PRINT "              -X        H."
2205 PRINT ".//;;;:;;-,   X=        :+   .-;:=;:;%;.";
2206 PRINT "M-       ,=;;;#:,      ,:#;;:=,       ,@";
2207 PRINT ":%           :%.=/++++/=.$=           %=";
2208 PRINT " ,%;         %/:+/;,,/++:+/         ;+."
2209 PRINT "   ,+/.    ,;@+,        ,%H;,    ,/+,"
2210 PRINT "      ;+;;/= @.  .H##X   -X :///+;"
2211 PRINT "      ;+=;;;.@,  .XM@$.  =X.//;=%/."
2212 PRINT "   ,;:      :@%=        =$H:     .+%-"
2213 PRINT " ,%=         %;-///==///-//         =%,"
2214 PRINT ";+           :%-;;;:;;;;-X-           +:";
2215 PRINT "@-      .-;;;;M-        =M/;;;-.      -X";
2216 PRINT " :;;::;;-.    %-        :+    ,-;;-;:=="
2217 PRINT "              ,X        H."
2218 PRINT "               ;/      %="
2219 PRINT "                //    +;"
2220 PRINT "                 ,////,"
2230 RETURN
'
2300 REM BROKEN HEART
2301 PRINT "                          .,---.        "
2302 PRINT "                        ,/XM#MMMX;,     "
2303 PRINT "                      -%##########M%,   "
2304 PRINT "                     -@######%  $###@=  "
2305 PRINT "      .,--,         -H#######$   $###M: "
2306 PRINT "   ,;$M###MMX;     .;##########$;HM###X="
2307 PRINT " ,/@##########H=      ;################+"
2308 PRINT "-+#############M/,      %##############+"
2309 PRINT "%M###############=      /##############:"
2310 PRINT "H################      .M#############;."
2311 PRINT "@###############M      ,@###########M:. "
2312 PRINT "X################,      -$=X#######@:   "
2313 PRINT "/@##################%-     +######$-    "
2314 PRINT ".;##################X     .X#####+,     "
2315 PRINT " .;H################/     -X####+.      "
2316 PRINT "   ,;X##############,       .MM/        "
2317 PRINT "      ,:+$H@M#######M#$-    .$$=        "
2318 PRINT "           .,-=;+$@###X:    ;/=.        "
2319 PRINT "                  .,/X$;   .::,         "
2320 PRINT "                      .,    ..          "
2330 RETURN
'
2400 REM EXPLOSION
2401 PRINT "            .+                          "
2402 PRINT "             /M;                        "
2403 PRINT "              H#@:              ;,      "
2404 PRINT "              -###H-          -@/       "
2405 PRINT "               %####$.  -;  .%#X        "
2406 PRINT "                M#####+;#H :M#M.        "
2407 PRINT "..          .+/;%#########X###-         "
2408 PRINT " -/%H%+;-,    +##############/          "
2409 PRINT "    .:$M###MH$%+############X  ,--=;-   "
2410 PRINT "        -/H#####################H+=.    "
2411 PRINT "           .+#################X.        "
2412 PRINT "         =%M####################H;.     "
2413 PRINT "            /@###############+;;/%%;,   "
2414 PRINT "         -%###################$.        "
2415 PRINT "       ;H######################M=       "
2416 PRINT "    ,%#####MH$%;+#####M###-/@####%      "
2417 PRINT "  :$H%+;=-      -####X.,H#   -+M##@-    "
2418 PRINT " .              ,###;    ;      =$##+   "
2419 PRINT "                .#H,               :XH, "
2420 PRINT "                 +                   .;-"
2430 RETURN
'
2500 REM FIRE
2501 PRINT "                     -$-                "
2502 PRINT "                    .H##H,              "
2503 PRINT "                   +######+             "
2504 PRINT "                .+#########H.           "
2505 PRINT "              -$############@.          "
2506 PRINT "            =H###############@  -X:     "
2507 PRINT "          .$##################:  @#@-   "
2508 PRINT "     ,;  .M###################;  H###;  "
2509 PRINT "   ;@#:  @###################@  ,#####: "
2510 PRINT " -M###.  M#################@.  ;######H "
2511 PRINT " M####-  +###############$   =@#######X "
2512 PRINT " H####$   -M###########+   :#########M, "
2513 PRINT "  /####X-   =########%   :M########@/.  "
2514 PRINT "    ,;%H@X;   .$###X   :##MM@%+;:-      "
2515 PRINT "                 ..                     "
2516 PRINT "  -/;:-,.              ,,-==+M########H "
2517 PRINT " -##################@HX%%+%%$%%%+:,,    "
2518 PRINT "    .-/H%%%+%%$H@###############M@+=:/+:"
2519 PRINT "/XHX%:#####MH%=    ,---:;;;;/%%XHM,:###$"
2520 PRINT "$@#MX %+;-                           .  "
2530 RETURN
'
2600 REM CHECK
2601 PRINT "                                     :X-"
2602 PRINT "                                  :X### "
2603 PRINT "                                ;@####@ "
2604 PRINT "                              ;M######X "
2605 PRINT "                            -@########$ "
2606 PRINT "                          .$##########@ "
2607 PRINT "                         =M############-"
2608 PRINT "                        +##############$"
2609 PRINT "                      .H############$=. "
2610 PRINT "         ,/:         ,M##########M;.    "
2611 PRINT "      -+@###;       =##########M;       "
2612 PRINT "   =%M#######;     :#########M/         "
2613 PRINT "-$M###########;   :#########/           "
2614 PRINT " ,;X###########; =########$.            "
2615 PRINT "     ;H#########+#######M=              "
2616 PRINT "       ,+##############+                "
2617 PRINT "          /M#########@-                 "
2618 PRINT "            ;M######%                   "
2619 PRINT "              +####:                    "
2620 PRINT "               ,$M-                     "
2630 RETURN
'
2800 REM BLACK MESA
2801 PRINT "           .-;+$XHHHHHHX$+;-.           "
2802 PRINT "        ,;X@@X%/;=----=:/%X@@X/,        "
2803 PRINT "      =$@@%=.              .=+H@X:      "
2804 PRINT "    -XMX:                      =XMX=    "
2805 PRINT "   /@@:                          =H@+   "
2806 PRINT "  %@X,                            .$@$  "
2807 PRINT " +@X.                               $@% "
2808 PRINT "-@@,                                .@@="
2809 PRINT "%@%                                  +@$"
2810 PRINT "H@:                                  :@H"
2811 PRINT "H@:         :HHHHHHHHHHHHHHHHHHX,    =@H"
2812 PRINT "%@%         ;@M@@@@@@@@@@@@@@@@@H-   +@$"
2813 PRINT "=@@,        :@@@@@@@@@@@@@@@@@@@@@= .@@:"
2814 PRINT " +@X        :@@@@@@@@@@@@@@@M@@@@@@:%@% "
2815 PRINT "  $@$,      ;@@@@@@@@@@@@@@@@@M@@@@@@$. "
2816 PRINT "   +@@HHHHHHH@@@@@@@@@@@@@@@@@@@@@@@+   "
2817 PRINT "    =X@@@@@@@@@@@@@@@@@@@@@@@@@@@@X=    "
2818 PRINT "      :$@@@@@@@@@@@@@@@@@@@M@@@@$:      "
2819 PRINT "        ,;$@@@@@@@@@@@@@@@@@@X/-        "
2820 PRINT "           .-;+$XXHHHHHX$+;-.           "
2830 RETURN
'
2900 REM CAKE DELICIOUS AND MOIST
2901 PRINT "            ,:/+/-                      "
2902 PRINT "            /M/              .,-=;//;-  "
2903 PRINT "       .:/= ;MH/,    ,=/+%$XH@MM#@:     "
2904 PRINT "      -$##@+$###@H@MMM#######H:.    -/H#"
2905 PRINT " .,H@H@ X######@ -H#####@+-     -+H###@X"
2906 PRINT "  .,@##H;      +XM##M/,     =%@###@X;-  "
2907 PRINT "X%-  :M##########$.    .:%M###@%:       "
2908 PRINT "M##H,   +H@@@$/-.  ,;$M###@%,          -"
2909 PRINT "M####M=,,---,.-%%H####M$:          ,+@##"
2910 PRINT "@##################@/.         :%H##@$- "
2911 PRINT "M###############H,         ;HM##M$=     "
2912 PRINT "#################.    .=$M##M$=         "
2913 PRINT "################H..;XM##M$=          .:+"
2914 PRINT "M###################@%=           =+@MH%"
2915 PRINT "@################M/.          =+H#X%=   "
2916 PRINT "=+M##############M,       -/X#X+;.      "
2917 PRINT "  .;XM##########H=    ,/X#H+:,          "
2918 PRINT "     .=+HM######M+/+HM@+=.              "
2919 PRINT "         ,:/%XM####H/.                  "
2920 PRINT "              ,.:=-.                    "
2930 RETURN
'
3000 REM GLaDOS
3001 PRINT "       #+ @      # #              M#@   "
3002 PRINT " .    .X  X.%##@;# #   +@#######X. @#%  "
3003 PRINT "   ,==.   ,######M+  -#####%M####M-    #"
3004 PRINT "  :H##M%:=##+ .M##M,;#####/+#######% ,M#"
3005 PRINT " .M########=  =@#@.=#####M=M#######=  X#"
3006 PRINT " :@@MMM##M.  -##M.,#######M#######. =  M"
3007 PRINT "             @##..###:.    .H####. @@ X,"
3008 PRINT "   ############: ###,/####;  /##= @#. M "
3009 PRINT "           ,M## ;##,@#M;/M#M  @# X#% X# "
3010 PRINT ".%=   ######M## ##.M#:   ./#M ,M #M ,#$ "
3011 PRINT "##/         $## #+;#: #### ;#/ M M- @# :"
3012 PRINT "#+ #M@MM###M-;M #:$#-##$H# .#X @ + $#. #"
3013 PRINT "      ######/.: #%=# M#:MM./#.-#  @#: H#"
3014 PRINT "+,.=   @###: /@ %#,@  ##@X #,-#@.##% .@#"
3015 PRINT "#####+;/##/ @##  @#,+       /#M    . X, "
3016 PRINT "   ;###M#@ M###H .#M-     ,##M  ;@@; ###"
3017 PRINT "   .M#M##H ;####X ,@#######M/ -M###$  -H"
3018 PRINT "    .M###%  X####H  .@@MM@;  ;@#M@      "
3019 PRINT "      H#M    /@####/      ,++.  / ==-,  "
3020 PRINT "               ,=/:, .+X@MMH@#H  #####$="
3030 RETURN
'
3100 REM hl
3101 REM SOUND 146.6, 4.8
3102 REM SOUND 0, .1
3103 REM SOUND 146.6, 4.8
3104 REM SOUND 123.4, 4.8
3105 RETURN
'