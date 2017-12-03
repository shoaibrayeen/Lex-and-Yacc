%{ 
        #include <stdio.h>
	#include <stdlib.h>
%}
%token       L N '+' '-' '*'  '/'                                              
%%
stmt :  expr	{printf("Valid Expression\n");}
expr :  expr '+' expr
	| expr '-' expr
	| expr '*' expr
	| expr '/' expr
	| '(' expr  ')'              
	|  N   
	|  L  
	;
%%
main ( )
{
	system("clear");
	printf("\nThis program checks valid arithmetic expression\n\n");
	printf("\nEnter an expression to check : ");
	yyparse ( );
}
int yyerror()
{
	printf("\nInvalid Expression\n");
	exit(0);
}
