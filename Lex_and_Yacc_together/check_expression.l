%{
	#include"y.tab.h"
%}
%%
[0-9]+	return N;
[a-z]+	return L;
\n	return 0;
.	return yytext[0];
%%
