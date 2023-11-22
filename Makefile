PROGRAM = cal
OBJS1 = calendar.c mk1cal.s  divsub.s modsub.s monthlen.s monthwoffset.s
OBJS2 = calendar.c mk1cal.s  divsub.s modsub.s monthlen.s monthwoffset.s showheader.s pdec.s
CC = cc
.PHONY: cal

1:
	$(CC) -o $(PROGRAM) $(OBJS1)

2-a:
	$(CC) -o $(PROGRAM) $(OBJS2)

2-b:
	$(CC) -o $(PROGRAM) $(OBJS2)

2-c:
	$(CC) -o $(PROGRAM) $(OBJS1)

2-d:
	$(CC) -o $(PROGRAM) $(OBJS2)

3-a:
	$(CC) -o $(PROGRAM) $(OBJS2)
