%{
	#include<stdio.h>
%}
key	"int"|"float"|"break"|"char"|"void"|"return"|"if"|"main"|"printf"|"scanf"|"include"
o	"+"|"-"|"*"|"/"|"^"|"++"|"--"
s	[A-Za-z][A-Za-z0-9_]*
n	[0-9]+
d	"."
%%
{key}				{printf("Keyword :  %s\n",yytext);}
{s}				{printf("Identifier : %s\n",yytext);}
{n}{d}{n}|{d}{n}		{printf("Float : %s\n",yytext);}
{o}{n}|{n}			{printf("Integer : %s\n",yytext);}
{o}				{printf("Operator : %s\n",yytext);}
(\/\*(.*|\n)*\*\/)|(\/\/.*)	{printf("Comment : %s\n",yytext);}
.				;
%%
main()
{
	system("clear");
	printf("\nThis program checks type of input\n");
	char fname[50];
	printf("\nEnter Filename    :     ");
	scanf("%s",fname);
	FILE *f;
	f=fopen(fname,"r");
	if(!f)
	{
		printf("\ncould not open file\n");
		exit(1);
	}
	yyin=f;
	yylex();
}
