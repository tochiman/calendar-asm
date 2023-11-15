PROGRAM = calendar
OBJS = calendar.c mk1cal.s  divsub.s modsub.s monthlen.s monthwoffset.s
CC = cc
.PHONY: calendar

calendar:
	$(CC) -o $(PROGRAM) $(OBJS)

debug:
	$(CC) -o $(PROGRAM) $(OBJS) -g