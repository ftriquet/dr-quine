#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#define FLAGS O_WRONLY|O_CREAT|O_TRUNC
int main(void){
int i=12;--i;char *filename;asprintf(&filename,"Sully_%d.c",i);int fd=open(filename,FLAGS,0644);
char *str="#include <stdio.h>%c#include <stdlib.h>%c#include <unistd.h>%c#include <fcntl.h>%c#define FLAGS O_WRONLY|O_CREAT|O_TRUNC%cint main(void){%cint i=%d;--i;char *filename;asprintf(&filename,%cSully_%cd.c%c,i);int fd=open(filename,FLAGS,0644);char *str=%c%s%c;dprintf(fd,str,10,10,10,10,10,10,i,34,37,34,34,str,34,10,10,34,37,34,34,34,10);%cclose(fd);%cchar *command;asprintf(&command,%cgcc -Wall -Wextra -Werror Sully_%cd.c -o sully%c,i);system(command);system(%c./sully%c);return 0;%c}";
dprintf(fd,str,10,10,10,10,10,10,i,34,37,34,34,str,34,10,10,34,37,34,34,34,10);
close(fd);char *command;asprintf(&command,"gcc -Wall -Wextra -Werror Sully_%d.c -o sully",i);system(command);system("./sully");return 0;
}
