%{
 #include<stdio.h>
int valid=1;

%}

%token digit letter key

%%

start : letter s

s :letter s| digit s |   ;
%%

int yyerror()

{

    printf("\nIts not an identifier!\n");

    valid=0;

    return 0;

}

int main()

{

    printf("\nEnter name for identifier ");

    yyparse();

    if(valid)

    {

        printf("\nIt is an identifier!\n");

    }

}
