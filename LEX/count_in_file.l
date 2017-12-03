%{
	#include<stdio.h>
	int bc=0,lc=0,cc=0,wc=0;
%}
word	[^ \t\n]+
eol	"\n"
blank	" "
%%
{word}	{wc++;cc+=yyleng;}
{eol}	{lc++;cc++;}
{blank}	{bc++;}
.	{cc++;}
%%
main(int argc,char **argv)
{
	system("clear");
	printf("This program counts number of words , characters & lines\n\n\n");
	char fname[50];
	if(argc>1)
		strcpy(fname,argv[1]);
	else
	{
		printf("\nEnter Filename    :     ");
		scanf("%s",fname);
	}
	FILE *f;
	f=fopen(fname,"r");
	if(!f)
	{
		printf("\ncould not open file\n");
		exit(1);
	}
	yyin=f;
	yylex();
	printf("\nNumber of Characters : %d\n",cc);
	printf("\nNumber of Lines : %d\n",lc);
	printf("\nNumber of Words : %d\n",wc);
	printf("\nNumber of Blank Spaces : %d\n",bc);
}
