%{
#include<stdio.h>
int v_count=0;
int c_count=0;
%}
%%
[aeiouAEIOU] {v_count++;}
[a-zA-Z] {c_count++;}
%%
int yywrap(){
	return 1;
}
int main(){
	printf("Enter the String: ");
	yylex();
	printf("Number of Vowels: %d\n", v_count);
	printf("Number of Consonants: %d\n", c_count);
	return 0;
}
