%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<math.h>
%}
%token N
%left '-' '+'
%left '*' '/'
%nonassoc UNIMOS
%%
stmt :	expr 		{printf("Answer is : %d\n",$1);}
expr :	expr '+' expr	{$$=$1+$3;}
	|expr '-' expr	{$$=$1-$3;}
	|expr '*' expr	{$$=$1*$3;}
	|expr '/' expr	{
				if($3==0)
				{	yyerror();
				}
				else
				{	$$=$1/$3;}
			}
	|'-' expr %prec UNIMOS	{$$=-$2;}
	|'(' expr ')'	{$$=$2;}
	|LOG '(' expr ')'	{	if($3<0) yyerror();
					$$=log($3);}
	|SQRT '('expr')'	{	if($3<0) yyerror();
					$$=sqrt($3);}
	|EXP '('expr')'		{	$$=exp($3);}
	|N		{$$=$1;}
	;
%%
int yyerror()
{
	printf("\nInvalid Expression\n");
	exit(0);
}
main()
{
	system("clear");
	printf("\nThis program evaluate an expression \n");
	printf("\nEnter Integer Expression : ");
	yyparse();
	printf("\nValid Expression\n");
}
