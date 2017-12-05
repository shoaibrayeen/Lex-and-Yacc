%%
(\/\/)+.*		;
(\/\*)+(.*|\n)*(\*\/)$	;
.|\n	{fprintf(yyout,"%s",yytext);}
%%
main()
{
	system("clear");
	printf("This program removes comments from a c file\n\n\n");
	char fname[50];
	char oname[50];
	printf("\nEnter Input Filename    :     ");
	scanf("%s",fname);
	printf("\nEnter Output Filename    :     ");
	scanf("%s",oname);
	FILE *f1;
	FILE *f2;
	f1=fopen(fname,"r");
	if(!f1)
	{
		printf("\ncould not open input file\n");
		exit(1);
	}
	f2=fopen(oname,"w");
	if(!f2)
	{
		printf("\ncould not open output file\n");
		exit(1);
	}
	yyin=f1;
	yyout=f2;
	yylex();
}
