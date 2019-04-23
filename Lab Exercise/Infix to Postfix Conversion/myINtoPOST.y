%{
	#include "myINtoPOST.h"
	#include <string.h>
	#include <stdlib.h>
	#include <stdio.h>
%}
%union {
	double dval;
	struct symtab *symp;
	}

%token <symp> NAME
%token <dval> NUMBER
%left '-' '+'
%left '*' '/'
%type <dval> expr;
%%


stmt_list :	expr '\n' {printf("\n");}
     |	stmt_list expr'\n' {printf("\n");}
	;
expr :	expr '+' expr	{
                            printf(" + ");
                        }
	|expr '-' expr	{
                        printf(" - ");
                    }
	|expr '*' expr	{
                        printf(" * ");
                    }
	|expr '/' expr	{
				        printf(" / ");
			        }
	|NUMBER	{   
                $$ = $1;
                printf(" %g ",$1);
            }
	i|NAME	{
                $$ = $1->value;
                printf(" %g ",$1);
            }
	;
%%
struct symtab *symlook(char* s){
	struct symtab*	sp;
	for( sp = symtab; sp < &symtab[NSYMS]; sp++) {
		if(sp->name && !strcmp(sp->name,s)) {
			return sp;
        }
		if(!sp->name) {
			sp->name = strdup(s);
			return sp;
		}
	}
    yyerror();
}
int yyerror() {
	printf("\nInvalid\n");
	exit(0);
}
main() {
	system("clear");
	printf("\nThis program evaluate an Infix Expression to Postfix Expression\n\n");
	printf("\nEnter Expression  \n");
	yyparse();
}
