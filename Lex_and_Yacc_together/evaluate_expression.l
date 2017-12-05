%{
	#include<stdio.h>
	#include"y.tab.h"
	extern int yylval;
%}
%%
([0-9]+|[0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?	{
							yylval=atof(yytext);
							return N;
							}
log						return LOG;
sqrt						return SQRT;
exp						return EXP;
[ \t]	;
\n	return 0;
.	return yytext[0];
%%


