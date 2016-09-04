#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#define FLAGS O_WRONLY|O_CREAT|O_TRUNC
#define NAME "Grace_kid.c"
#define FT(x) int main(void){char *str="#include <stdio.h>%c#include <unistd.h>%c#include <fcntl.h>%c#define FLAGS O_WRONLY|O_CREAT|O_TRUNC%c#define NAME %cGrace_kid.c%c%c#define FT(x) int main(void){char *str=%c%s%c;int fd=open(x,FLAGS,0644);dprintf(fd,str, 10, 10, 10, 10, 34, 34, 10, 34, str, 34, 10, 10);close(fd);}%cFT(NAME)%c";int fd=open(x,FLAGS,0644);dprintf(fd,str, 10, 10, 10, 10, 34, 34, 10, 34, str, 34, 10, 10);close(fd);}
FT(NAME)
