#include <string.h>
#include <stdio.h>
#include <ctype.h>

char input[100];
int i, error;

void E();
void T();
void Eprime();
void Tprime();
void F();

int main() {
    i = 0;
    error = 0;
    printf("Enter an arithmetic expression (e.g., a+a*a): ");
    fgets(input, sizeof(input), stdin);
    input[strcspn(input, "\n")] = 0;
    
    E();
    
    if (strlen(input) == i && error == 0) {
        printf("\nAccepted..!!!\n");
    } else {
        printf("\nRejected..!!!\n");
        if (error) {
            printf("Error: Invalid expression.\n");
        } else {
            printf("Error: Unconsumed input remaining.\n");
        }
    }
    
    return 0;
}

void E() {
    T();
    Eprime();
}

void Eprime() {
    if (input[i] == '+') {
        i++;
        T();
        Eprime();
    }
}

void T() {
    F();
    Tprime();
}

void Tprime() {
    if (input[i] == '*') {
        i++;
        F();
        Tprime();
    }
}

void F() {
    if (isalnum(input[i])) {
        i++;
    } else if (input[i] == '(') {
        i++;
        E();
        if (input[i] == ')') {
            i++;
        } else {
            error = 1;
            printf("Error: Mismatched parentheses.\n");
        }
    } else {
        error = 1;
        printf("Error: Invalid character '%c'.\n", input[i]);
    }
}

