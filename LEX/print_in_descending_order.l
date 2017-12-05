%{
	int k=0;
	char cp[20];
	char c[20];
%}
%%
[A-Za-z0-9]+	{
			k=yyleng;
			strcpy(c,yytext);
			while(k>=0)
			{
				c[k]='\0';
				printf("\n%s",c);	
				k--;
			}
		}	
%%
main()
{
	system("clear");
	printf("\nThis program prints input in decsending order\n");
	printf("Enter String : ");
	yylex();
	printf("\nEnd of Program\n");
}
