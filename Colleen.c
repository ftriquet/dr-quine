#include <stdio.h>
void f(void){
char *str = "#include <stdio.h>%cvoid f(void){%cchar *str = %c%s%c;%cprintf(str, 10, 10, 34, str, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c/*%c	Comment%c*/%cint main(void){%c/*%c	Komanterre%c*/%cf();%creturn 0;%c}%c";
printf(str, 10, 10, 34, str, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}
/*
	Comment
*/
int main(void){
/*
	Komanterre
*/
f();
return 0;
}
