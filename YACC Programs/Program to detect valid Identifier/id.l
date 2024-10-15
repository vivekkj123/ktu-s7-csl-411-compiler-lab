
%{
#include "y.tab.h"
%}
%%
if|else|int|float return key;
[a-zA-Z_][a-zA-Z_0-9]* return letter;

[0-9] return digit;

. return yytext[0];

\n  return 0;

%%

int yywrap()

{

return 1;
}
