
word	[^ \t\n]+
%%

{word}	{   printf("%s\t %d" , yytext , yyleng);
            int k = yyleng;
            int i  = 0;
            char temp[k];
            strcpy(temp,yytext);
            
            temp[k] = '\0';
            k--;
            while( i < yyleng/2 ) {
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

