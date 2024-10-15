
%{
#include<stdio.h>
%}
%token NUM
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E{ printf("\nResult=%d\n",$$); return 0; }
;
E:E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {$$=$1/$3;}
 |E'%'E {$$=$1%$3;}
 |'('E')' {$$=$2;}
 | NUM {$$=$1;}
;
%%
void main()
{
   printf("\nEnter an arithmetic expression:\n");
   yyparse();
   }
void yyerror()
{
   printf("\nInvalid expression\n");
}
