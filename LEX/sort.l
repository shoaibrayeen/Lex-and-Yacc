%{
	int a[30];
	int k=0;
%}
%%
[-]?([0-9])+	{
			int n=0,i=0,j;
			if(yytext[i]=='-')
			{	i+=1;}
			while(i<yyleng)
			{
				n=(n*10)+yytext[i]-'0';
				i++;
			}
			a[k]=yytext[0]=='-'?n*(-1):n;
			j=k-1;
			while(j>=0 && a[j]>a[j+1])
			{
				int t=a[j];
				a[j]=a[j+1];
				a[j+1]=t;
				j--;
			}
			k++;
		}
.|\n	;
%%
int main(int argc,char **argv)
{
	system("clear");
	printf("This program sorts the numbers from a c file\n\n\n");
	char fname[50];
	int i=0;
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
	for(i=0;i<k;i++)
	printf("%d ",a[i]);
	printf("\n");
	
}
