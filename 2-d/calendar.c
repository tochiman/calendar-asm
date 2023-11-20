#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define IW          (7)
#define CW          (3)
#define OW          (21)
#define OH          (8)

extern int monthwoffset(int,int,int);
extern int monthlen(int,int);
extern void mk1cal(int,int,char*,int);

int main(int argc, char *argv[]){
	int y;
	int m;
	int cont;
	int MAX_CANVAS;

	if (argc<=4){
		y = atoi(argv[1]);
		m = atoi(argv[2]);
		cont = atoi(argv[3]);

		MAX_CANVAS = OW*OH*cont;
		char canvas[MAX_CANVAS];

		memset(canvas, ' ', sizeof(canvas));
		mk1cal(y,m,canvas,cont);
		int i, j;
		for(i=0;i<MAX_CANVAS;i++) {
			if(canvas[i]) {
				printf("%c", canvas[i]);
			}
			if(i%OW==OW-1) {
				printf("\n");
			}
		}
	}else{
		printf("usage: %s y m [-m]\t - one month\n", argv[0]);
	}
}
