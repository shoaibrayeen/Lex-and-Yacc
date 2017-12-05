%{
	int len=0;
	char cp[20];
%}
word	[ \t\n]+
%%
.*	{ 	if(len<yyleng)
		{
			len=yyleng;
			strcpy(cp,yytext);
		}
	}
{word}	;
%%
main(int argc,char **argv)
{
	system("clear");
	printf("This program finds the longest word\n\n");
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
	printf("\nLongest Word : %s\n",cp);
}	
