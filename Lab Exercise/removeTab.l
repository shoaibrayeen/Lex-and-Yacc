%{
	#include<stdio.h>
%}
%%
[ \t]+$	    printf("Hi");
.           {printf("%s",yytext);}
%%
main(){
	printf("\nRemove tab from end of lines\n");
	printf("Enter Input\t:\t");
    yylex();
	printf("End of Program\n");
}
