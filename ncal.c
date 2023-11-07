#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int
monthwoffset(int y, int m, int d) 
{
    int rv;
    int e;

    if(m==1 || m==2) {
        y--;
        m += 12;
    }
    e = y+y/4-y/100+y/400+((13*m+8))/5 + d;
    rv = e % 7;

    return rv;
}

int
monthlen(int y, int m) 
{
    int q;
    int rv;

    q = (y%4==0) - (y%100==0) + (y%400==0);

    if(m==2) {
        if(q) { rv = 29; }
        else  { rv = 28; }
    }
    else {
        switch(m) {
        case  1:
        case  3:
        case  5:
        case  7:
        case  8:
        case 10:
        case 12:
            rv = 31;
            break;
        default:
            rv = 30;
            break;
        }
    }

    return rv;
}

/*
 *  columns: 3 char. x 7 days in row = 21 char.
 *  rows:    worst case uses 6 rows
 *
 *          columns
 *          123456789012345678901
 *          ---------------------
 *               July 2023
 *          Su Mo Tu We Th Fr Sa
 *                             1 |1 rows
 *           2  3  4  5  6  7  8 |2
 *           9 10 11 12 13 14 15 |3
 *          16 17 18 19 20 21 22 |4
 *          23 24 25 26 27 28 29 |5
 *          30 31                |6
 *
 */
#define IW          (7)
#define CW          (3)
#define OW          (21)
#define OH          (6)
#define MAX_CANVAS  (OW*OH)

char canvas[MAX_CANVAS];

int
mk1cal(int y, int m)
{
    int  d;
    int  dlen;
    int  woff;
    int  c, r;
    int  b;

    dlen = monthlen(y, m);
    woff = monthwoffset(y, m, 1);

    r = 0;
    for(d=1;d<=dlen;d++) {
        c = (woff+d-1+7)%IW;
        b = r*OW+c*CW;
        if(d>=10) {
            canvas[b] = d/10 + '0';
        }
        b++;
        canvas[b] = d%10 + '0';
        if(c>=IW-1) {
            r++;
        }
    }
    return 0;
}

void
printcal(void)
{
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

int
main(int argc, char *argv[])
{
    int y;
    int m;

    if(argc==3) {
        y = atoi(argv[1]);
        m = atoi(argv[2]);
    }
    else {
        printf("usage: %s y m              - one month\n",
            argv[0]);
        exit(9);
    }

    memset(canvas, ' ', sizeof(canvas));
    mk1cal(y, m);
    printcal();
    exit(0);
}
