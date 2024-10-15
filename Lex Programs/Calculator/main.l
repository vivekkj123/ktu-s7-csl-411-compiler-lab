%{
	#include<stdio.h>
	float a=0,b=0;
	int op=0;
	void perform_operation();
%}

digit [0-9]+(\.[0-9]+)?
add "+"
sub "-"
mul "*"
div "/"
eq "="
ws [\t\n]+

%%

{digit} {
	if (op==0)
	{
		a=atof(yytext);
	}
	else
	{
		b=atof(yytext);
		perform_operation();
	}
}

{add} {op=1;}
{sub} {op=2;}
{mul} {op=3;}
{div} {op=4;}
{eq} {printf("Result :%f\n",a); op=0; a=0;}
{ws} {/* ignore white space*/}
. {printf("unknown character :%s\n",yytext);}
%%
void perform_operation(){
	switch(op){
		case 1: a+=b;break;
		case 2: a-=b;break;
		case 3: a*=b;break;
		case 4:
			if(b!=0)
			{
				a/=b;
			}
			else
			{
				printf("Error ,division by 0\n");
			}
			break;
	}
}
int main()
{
	printf("enter expression:");
	yylex();
	return 0;
}
int yywrap(){
	return 1;
}
