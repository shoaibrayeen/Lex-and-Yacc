%{
	#include<stdio.h>
%}
y	[1-2][0-9][0-9][0-9]
m31	0(1|3|5|7|8)|10|12
m30	0(4|6|9)|11
m29	0(2)
d29	([0-2][1-9])|10|20
%%	
{d29}\/{m29}\/{y}|({d29}|30)\/{m30}\/{y}|({d29}|30|31)\/{m31}\/{y}	{	
										int d=0,y=0,i=0,month=0;
										while(yytext[i]!='/')
										{d=(d*10)+(yytext[i]-'0');
											i++;}
										i++;
										while(yytext[i]!='/')
										{	month=(month*10)+(yytext[i]-'0');
											i++;
										}
										i++;
										while(i<yyleng)
										{	y=(y*10)+(yytext[i++]-'0');}
										if(( y%4==0 && y%100!=0)||(y%4==0 && y%100==0 && y%400==0))
										{
											printf("\n%d/%d/%d is leap year and is valid date\n",d,month,y);
											exit(0);
										}
										else
										{
											if(month==2 && d>28)
											{	printf("\nInvalid Date\n");exit(0);}
												printf("\n%d/%d/%d is not leap year and is valid date\n",d,month,y);
												exit(0);
											}
										}
.|\n										{printf("\nInvalid date\n");exit(0);}
%%
main()
{
	system("clear");
	printf("\nEnter Date\n");	
	yylex();
	printf("\nEnd of Program\n");
}
