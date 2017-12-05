%{
	#include<stdio.h>
	int m=0,n=0,i=0;
%}
a	"%d"|"%f"|"%c"|"%s"
id	[a-zA-Z][a-zA-Z0-9]*
%%
printf\(\"({a}|.)*\"(,{id})*\)		{
							for(i=0;i<yyleng;i++)
							{
								if(yytext[i]=='%')	m++;
								if(yytext[i]==',')	n++;
							}
							if(m==n)
							{
								printf("\ncorrect syntax : %s\n",yytext);
							}
							else
							{
								printf("\nIncorrect syntax : %s\n",yytext);
							}
						}
.|\n					;

%%
main()
{
	system("clear");
	printf("\nThis program checks syntax of printf\n");	
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
