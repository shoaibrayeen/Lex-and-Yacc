%%
[a-wA-W]	{printf("%c",yytext[0]+3);}
[x-zX-Z]	{printf("%c",yytext[0]-23);}
%%
main(){
	system("clear");
	printf("This program adds 3 in the ASCII code of every letters\n\n");
	printf("Enter Input\n");
	yylex();
	printf("End of Program\n");
}
