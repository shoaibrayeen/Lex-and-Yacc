%%
a|ab|abc|abcd {printf("%s\n",yytext);REJECT;}	
. ;
%%
main()
{
	system("clear");
	printf("Enter String : ");
	yylex();
	printf("\nEnd of Program\n");
}
