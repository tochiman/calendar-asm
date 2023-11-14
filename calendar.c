#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define IW          (7)
#define CW          (3)
#define OW          (21)
#define OH          (6)
#define MAX_CANVAS  (OW*OH)

extern int monthwoffset(int,int,int);
extern int monthlen(int,int);
extern void mk1cal(int,int,char*);

int main(int argc, char *argv[]){
	int y;
	int m;
//	int d;
	char canvas[MAX_CANVAS];

	if (argc==3){
		y = atoi(argv[1]);
		m = atoi(argv[2]);
//		d = atoi(argv[3]);
	}else{
		printf("usage: %s y m\t - one month\n", argv[0]);
	}
	memset(canvas, ' ', sizeof(canvas));
	mk1cal(y,m,canvas);
    for(int i=0;i<MAX_CANVAS;i++) {
        if(canvas[i]) {
            printf("%c", canvas[i]);
        }
        if(i%OW==OW-1) {
            printf("\n");
        }
    }
}
