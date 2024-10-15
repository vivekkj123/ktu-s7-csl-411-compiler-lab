%{
#include "y.tab.h"
%}
%%
[0-9]+ { return NUMBER; }
[_a-zA-Z][_a-zA-z0-9]* { return ID; }
\n { return 0; }
. { return yytext[0]; }
%%
int yywrap()
{
return 1;
}
