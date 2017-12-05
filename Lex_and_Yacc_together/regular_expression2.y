%{
	#include<stdio.h>
	#include<stdlib.h>

%}
%token A B
%%
str:	S'\n'	{return 0;}
S:	A S B
	|A B
	;
%%
int yyerror()
{
	printf("\nInvalid String\n");
	exit(0);
}
main()
{
	system("clear");
	printf("\nThis program prints a string like (ab)* \n\n");
	printf("\nEnter String : ");
	yyparse();
	printf("\nValid String\n");
}
