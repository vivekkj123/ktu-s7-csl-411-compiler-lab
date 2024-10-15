%{
#include<stdio.h>
int lc = 0;
int wc = 0;
int cc = 0;
%}
%%

\n {lc++;}
[^\n\t ]+ {wc++; cc+=yyleng;}
. {cc++;}
%%
int yywrap(){
	return 1;
}
int main(){
	printf("Enter the text (After inputting press ctrl+d):\n");
	yylex();
	printf("No. of Lines: %d\n", lc);
	printf("No. of Words: %d\n", wc);	
	printf("No. of Characters: %d\n", cc);	
	return 0;
}
