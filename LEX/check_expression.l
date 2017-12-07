%{
	#include<stdio.h>
	char ch[50];
	int k=0;
	int i=0;
	int m=0;
	int n=0;
%}
op	"+"|"-"|"*"|"/"
n	[0-9]+
kl	[a-z]+
%%
(({n}|{kl}){op}({n}|{kl}))*		{
						strcpy(ch,yytext);
						k=yyleng;
						for(i=0;i<k;i++)
						{
							if(yytext[i]=='+' || yytext[i]=='-'  || yytext[i]=='*' || yytext[i]=='/')
								m++;
							if(yytext[i]<=65 && yytext[i]<=91)
								n++;
						}
						if(n>m)
						{
							printf("\nValid Expression\n");
						}
						else
						{
							printf("\nInvalid\n");	
						}
					}	
.					;
%%
main()
{
	system("clear");
	printf("\nEnter Input\n");	
	yylex();
}
