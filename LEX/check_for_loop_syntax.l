%{
	#include<stdio.h>
%}
o	"+"|"-"|"*"|"/"|"^"|"++"|"--"
id	[A-Za-z][A-Za-z0-9]*
rop	"<"|">"|"<="|">="|"="|"=="
n	[0-9]+
l	[\n\t ]
%%
({l}*)(for\(({id}=({n}|{id}))?\;({id}{rop}({id}|{n}))\;({id}{o})?\){l}+\{([^}]|\n)*\})	{
											printf("\nCorrect Syntax of For Loop : %s\n",yytext);
											exit(0);
											}
.|\n											;
%%
main()
{
	system("clear");
	printf("\nThis program checks syntax of for loop\n\n");	
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
