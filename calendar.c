#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern int monthwoffset(int,int,int);
extern int monthlen(int,int);

int main(int argc, char *argv[]){
	int y;
	int m;
//	int d;

	if (argc==3){
		y = atoi(argv[1]);
		m = atoi(argv[2]);
//		d = atoi(argv[3]);
	}else{
		printf("usage: %s y m\t - one month\n", argv[0]);
	}
	printf("%d\n",monthlen(y,m));
}
