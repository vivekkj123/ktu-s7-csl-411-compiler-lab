# S7 Compiler Lab Experiments (KTU 2019 Scheme)

(See [Syllabus](https://drive.google.com/file/d/1Rioof9iXXxhx8r6v0KyUyEd0BAUTCSba/view))

## Experiments

| **Sl. No.** |                        **Experiment**                        |
| :---------: | :----------------------------------------------------------: |
|      1      |                   Lexical Analyzer using C                   |
|      2      |                  Lexical Analyzer using Lex                  |
|      3      | Lex program to display number of lines, words and characters |
|      4      |              Lex program to convert abc -> ABC               |
|      5      |    Lex program to display number of vowels and consonants    |
|      6      |          Lex program to implement simple calculator          |
|      7      |            YACC Program to detect valid idenifier            |
|      8      |      YACC Program to detect valid arithmetic expression      |
|      9      |                 Simple calculator using YACC                 |
|     10      |                  Program to find e-closure                   |
|     11      |           Program to implement Shift Reduce Parser           |
|     12      |        Program to implement Recursive Descent Parser         |
|     13      |       Program to implement Intermediate Code generator       |
|     14      |             Program to implement Code generator              |
|     15      |           Program to perform Constant Propagation            |

## Compiling and running programs

### C Programs

```
gcc program.c 
./a.out
```

### Lex Programs

```
lex main.l
gcc lex.yy.c 
./a.out
```

### YACC Programs

```
lex prog.l
yacc -d prog.y -W
gcc lex.yy.c y.tab.c -w
./a.out
```

## Common Troubleshooting

- Installation: For running Lex and YACC Programs in your computer you have to install `Flex` and `Bison` respectively in your operating system.

    - [GNU/Linux](https://anandgharu.wordpress.com/wp-content/uploads/2018/02/how-to-install-lex-yacc.pdf)

    - [Windows](https://thesvgway.wordpress.com/2013/10/09/how-to-compile-run-lex-yacc-programs-on-windows/)
    (Or Just use WSL or boot Gnu/Linux on your machine)
    - MAC (IDK 🤷)
- For YACC programs in newer versions of YACC and Bison compiler if `gcc lex.yy.c y.tab.c -w` returns an error like:
```
y.tab.c:1025:16: error: implicit declaration of function ‘yylex’ [-Wimplicit-function-declaration]
 1025 |       yychar = yylex ();
```

then simply edit .y file to include definition of that function in definition area (Within `%{ %}`)

From:

> ```
> %{
>  #include<stdio.h>
>  int valid=1;
> %}
>  ```

To:

>  ```
>  %{
>   #include<stdio.h>
>   int yylex();
>   int yyerror(); // if yyerror() also returns similar error
>   int valid=1;
>  %}
>  ```