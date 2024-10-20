%{
#include<stdio.h>
%}
digit [0-9]
id [a-z]([a-z]|{digit})*
%%
if|else|while|int|switch|for|char|printf|scanf {printf("%s is a keyword\n", yytext);}
"+"|"-"|"%"|"/"|"*" {printf("%s is an operator\n", yytext);}
","|";"|"("|")"|"{"|"}" {printf("%s is an special character\n", yytext);}

{id} {printf("%s is an identifier\n", yytext);}
[0-9]*(\.[0-9]+)? {printf("%s is a number\n", yytext);}
"=" {printf("%s is an assignment operator\n", yytext);}
"==" {printf("%s is an equality operator\n", yytext);}
"<" {printf("%s is an relational operator less than\n", yytext);}
">" {printf("%s is an relational operator greater than\n", yytext);}
"<=" {printf("%s is an relational operator less than or equal to\n", yytext);}
"<>" {printf("%s is an relational operator not equal\n", yytext);}
%%
int yywrap(){
	return 1;
}
int main(){
	yyin = fopen("input.txt", "r");
	yylex();
	return 0;
}
