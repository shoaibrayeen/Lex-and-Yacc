%%
[A-Za-z0-9]+	{
			        int k = yyleng;
                    int i  = 0;
                    char temp[k];
                    strcpy(temp,yytext);
                    temp[k] = '\0';
                    k--;
                    while( i <= yyleng/2 ) {
                        
                        char t = temp[i];
                        temp[i] = temp[k];
                        temp[k] = t;
                        i++;
                        k--;
                    }
			        printf("\nReverse String\t:\t%s\n" , temp);
                    exit(0);
		    }	
%%
main()
{
	system("clear");
	printf("\nThis program reverses given input\n");
	printf("Enter String : ");
	yylex();
	printf("\nEnd of Program\n");
}
