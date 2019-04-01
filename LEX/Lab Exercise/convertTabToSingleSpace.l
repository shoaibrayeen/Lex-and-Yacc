%{
	#include<stdio.h>
%}
%%
[ \t]+	    {printf(" ");}
.           {printf("%s",yytext);}
%%
main(){
	printf("\nConvert Tab to single Space\n");
	printf("Enter Input\t:\t");
    yylex();
	printf("End of Program\n");
}
