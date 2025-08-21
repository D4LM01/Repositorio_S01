10 x = RND(100)
15 PRINT "Resposta: " + x 
20 INPUT "Digite um numero: "; n
30 IF n > x THEN GOTO 100 
40 IF n < x THEN GOTO 120
50 IF n = x THEN GOTO 140
100 PRINT "Maior"
110 GOTO 20
120 PRINT "Menor"
130 GOTO 20
140 PRINT "Achou"
150 END