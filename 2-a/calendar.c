#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define IW          (7)
#define CW          (3)
#define OW          (21)
#define OH          (8)
#define MAX_CANVAS  (OW*OH)

char canvas[MAX_CANVAS];

extern int monthwoffset(int,int,int);
extern int monthlen(int,int);
extern void mk1cal(int,int,char*);

void printcal(void) {
    int i, j;
    for(i=0;i<MAX_CANVAS;i++) {
        if(canvas[i]) {
            printf("%c", canvas[i]);
        }
        if(i%OW==OW-1) {
            printf("\n");
        }
    }
}

int main(int argc, char *argv[]){
	int y;
	int m;

	if (argc<=3){
		y = atoi(argv[1]);
		m = atoi(argv[2]);
		memset(canvas, ' ', sizeof(canvas));
		mk1cal(y,m,canvas);
		printcal();
	}else{
		printf("usage: %s y m\t - one month\n", argv[0]);
	}
}
