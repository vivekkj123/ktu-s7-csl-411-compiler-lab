#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>

char inp[100], q1, q2;
int i, top = -1, v = 65, n;
char st[100];
void push(char a) {
  top += 1;
  st[top] = a;
}
char pop() {
  char t;
  t = st[top];
  top -= 1;
  return t;
}
void main() {
  printf("Enter the length of expression: ");
  scanf("%d", & n);
  printf("Enter expression :");
  scanf("%s", & inp[i]);
  printf("\nThe Expression is:");
  printf("%s", inp);
  printf("\n Machine code is: ");
  for (i = 0; i < n; i++) {
    if (isalpha(inp[i])) {
      push(inp[i]);
    } else {
      if (inp[i] == '+') {
        q1 = pop();
        q2 = pop();
        printf("\nMOV %c %c", v, q1);
        printf("\nMOV %c %c", (v + 1), q2);
        printf("\nADD %c %c", (v), (v + 1));
        push(v);
        v++;
      } else if (inp[i] == '*') {
        q1 = pop();
        q2 = pop();
        printf("\nMOV %c %c", v, q1);
        printf("\nMOV %c %c", (v + 1), q2);
        printf("\nMUL %c %c", (v), (v + 1));
        push(v);
        v++;

      } else if (inp[i] == '-') {
        q1 = pop();
        q2 = pop();
        printf("\nMOV %c %c", v, q1);
        printf("\nMOV %c %c", (v + 1), q2);
        printf("\nSUB %c %c", (v), (v + 1));
        push(v);
        v++;

      } else if (inp[i] == '/') {
        q1 = pop();
        q2 = pop();
        printf("\nMOV %c %c", v, q1);
        printf("\nMOV %c %c", (v + 1), q2);
        printf("\nDIV %c %c", (v), (v + 1));
        push(v);
        v++;
      } else if (inp[i] == '=')

      {
        q1 = pop();
        q2 = pop();

        printf("\nMOV %c %c", v, q1);
        printf("\nMOV %c %c", (v + 1), q2);
        printf("\nMOV %c %c", (v), (v + 1));
        push(v);
        v++;
      }
    }
  }
}
