# Infix to Postfix Conversion
    Infix to Postfix Conversion has been implemented using LEX and YACC.


## Case Handled
```
  5 - 3 + 2 * 8 / 6 
  5  3  -  2  8  *  6  /  + 
  
  
  2 + 3 - 1 / 5 * 18
  2  3  +  1  5  /  18  *  - 


  2 - 8
  2  8  - 


  8 / 1
  8  1  / 


  8 - 1 + 4
  8  1  -  4  + 
  
  
  87 / 1 * 13
  87  1  /  13  * 
```

## How to Run

  >>> lex myINtoPOST.l
  >>> yacc myINtoPOST.y
  >>> gcc lex.yy.c -ll y.tab.c -ly -o myINtoPOST
  >>> ./myINtoPOST


## Note
```
  - Implemented for only Real Numbers.
  - Will Work for only + , - , * and /
  - Don't use variables.
```
