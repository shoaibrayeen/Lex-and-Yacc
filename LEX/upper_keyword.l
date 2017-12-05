%{
	#include<stdio.h>
	int i=0;
%}
key	"int"|"float"|"break"|"char"|"void"|"return"|"if"|"main"|"else"|"double"|"printf"|"scanf"
%%
{key}	{
		for(i=0;i<yyleng;i++)
		{
			printf("%c",toupper(yytext[i]));
		}
		printf("\n");
	}
.|\n	;
%%
main()
{
	system("clear");
	printf("\nThis program converts keyword to upper case\n\nEnter Input\n");	
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
