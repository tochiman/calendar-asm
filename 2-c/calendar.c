#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define IW          (7)
#define CW          (3)
#define OW          (21)
#define OH          (24)
#define MAX_CANVAS  (OW*OH)

char canvas[MAX_CANVAS];

extern int monthwoffset(int,int,int);
extern int monthlen(int,int);
extern void mk1cal(int,int,char*,int);

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

	if (argc<=4){
		y = atoi(argv[1]);
		m = atoi(argv[2]);
		memset(canvas, ' ', sizeof(canvas));
		//　月曜日始まり
		if (argc >= 4 && strcmp(argv[3], "-m") == 0){
			mk1cal(y,m,canvas,0);
			printcal();
		// 日曜日始まり
		} else{
			mk1cal(y,m,canvas,1);
			printcal();
		}
	}else{
		printf("usage: %s y m [-m]\t - one month\n", argv[0]);
	}
}
