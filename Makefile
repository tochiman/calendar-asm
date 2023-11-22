PROGRAM = cal
OBJS1 = calendar.c mk1cal.s  divsub.s modsub.s monthlen.s monthwoffset.s
OBJS2 = calendar.c mk1cal.s  divsub.s modsub.s monthlen.s monthwoffset.s showheader.s pdec.s
OBJS3 = calendar.c mk1cal.s  divsub.s modsub.s monthlen.s monthwoffset.s showheader.s pdec.s
CC = cc
.PHONY: cal

1:
	$(CC) -o $(PROGRAM) $(OBJS1)

2:
	$(CC) -o $(PROGRAM) $(OBJS2)

3:
	$(CC) -o $(PROGRAM) $(OBJS3)