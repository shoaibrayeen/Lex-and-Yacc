%{
	#include<stdio.h>
	#include<stdlib.h>
%}
%token A B
%%
str:	S'\n'	{return 0;}
S:	X B
X:	X A
	| A
	;
%%
int yyerror()
{
	printf("\nInvalid String\n");
	exit(1);
}
main()
{
	system("clear");
	printf("\nThis program prints a string like (a)*b where n>=10 \n\n");
	printf("\nEnter String : ");
	yyparse();
	printf("\nValid String\n");
}
\
