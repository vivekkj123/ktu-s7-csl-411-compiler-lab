%{
#include <stdio.h>
#include <stdlib.h>
%}
%token NUMBER ID
%left '+''-''*''/'
%%
exp : exp'+'exp| exp'-'exp
| exp'*'exp
| exp'/'exp
| '('exp')'
| NUMBER
| ID ;
%%
int main()
{
printf("Enter the expression: ");
yyparse();
printf("valid expression: \n");
}
int yyerror()
{
printf("invalid expressiono:\n");
exit(1);
}
