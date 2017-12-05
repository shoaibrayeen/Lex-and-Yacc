%{
	int n=1;
%}
%%
(.*)(\n)	{printf("Line %d : %s",n++,yytext);}
%%
main()
{
	system("clear");
	printf("This program appends line# before line\n\n\n");
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
