%{
	int idf=0;
%}
%%
"int"|"float"|"break"|"char"|"void"|"return"|"if"|"main"|"printf"|"scanf"|"include"|"system"|"fopen"	;
"+"|"-"|"*"|"/"|"^"|"++"|"--"|"=="|"="	;
(\/\*(.*|\n)*\*\/)|(\/\/.*)	;
[0-9]+	;
[A-Za-z][A-Za-z0-9_]*	{idf++;}
.|\n ;
%%
main(int argc,char **argv)
{
	system("clear");
	printf("This program counts number of identifiers\n\n\n");
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
	system("clear");
	printf("This program counts number of identifiers\n\n");
	printf("\nNumber of Identifiers : %d\n",idf);
}
