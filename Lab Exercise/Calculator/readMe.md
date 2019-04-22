# Calculator
      Simple Calculator has been implemented using LEX and YACC.

## About Storage
``` 
  SYMBOL TABLE is used to store variables and their values.
  This Calculator can store upto 20 symbols in SYMBOL Table.
      We can increase number of variables stored in SYMBOL TABLE by changing the value of 
      MACRO NSYMS in mycal.h
  
```
## Case Handled
```
  10 + 20
  Output -> 30
  10 - 20
  Output -> -10
  10 * 20
  Output -> 200
  10 / 20
  Output -> 0.5
  
  
  A = 120
  A + 220
  Output -> 340
  
  B = -10
  B + A
  Output -> 110
  
  A / 0
  Output -> INVALID AND THEN PROGRAM WILL EXIT.

  C = 2 * A - B
  C
  Output -> 250
  
  
  D = A + B + C
  D
  Output -> 360
  
  A + B + C + D
  Output -> 720
```

## How to Run
```
  >>> lex mycal.l
  >>> yacc mycal.y
  >>> gcc lex.yy.c -ll y.tab.c -ly -o mycal
  >>> ./mycal
```
