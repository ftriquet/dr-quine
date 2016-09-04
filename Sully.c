#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#define FLAGS O_WRONLY|O_CREAT|O_TRUNC
int main(void){
int i=5;
if(i<0){return 0;};char *filename;asprintf(&filename,"Sully_%d.c",i);int fd=open(filename,FLAGS,0644);
char *binary;asprintf(&binary,"./Sully_%d",i);--i;
char *command;asprintf(&command,"gcc -Wall -Wextra -Werror %s -o %s",filename,binary);
char *str="#include <stdio.h>%c#include <stdlib.h>%c#include <unistd.h>%c#include <fcntl.h>%c#define FLAGS O_WRONLY|O_CREAT|O_TRUNC%cint main(void){%cint i=%d;%cif(i<0){return 0;};char *filename;asprintf(&filename,%cSully_%cd.c%c,i);int fd=open(filename,FLAGS,0644);%cchar *binary;asprintf(&binary,%c./Sully_%cd%c,i);--i;%cchar *command;asprintf(&command,%cgcc -Wall -Wextra -Werror %cs -o %cs%c,filename,binary);%cchar *str=%c%s%c;dprintf(fd,str,10,10,10,10,10,10,i,10,34,37,34,10,34,37,34,10,34,37,37,34,10,34,str,34,10,10,10);%cclose(fd);system(command);system(binary);return 0;%c}%c";dprintf(fd,str,10,10,10,10,10,10,i,10,34,37,34,10,34,37,34,10,34,37,37,34,10,34,str,34,10,10,10);
close(fd);system(command);system(binary);return 0;
}
