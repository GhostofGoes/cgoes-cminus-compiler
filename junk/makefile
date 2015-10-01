BIN  = calc
CC   = g++
SRCS = $(BIN).y $(BIN).l
OBJS = lex.yy.o $(BIN).tab.o
LIBS = -lm 

$(BIN): $(OBJS)
	$(CC) $(CCFLAGS) $(OBJS) $(LIBS) -o $(BIN)

$(BIN).tab.h $(BIN).tab.c: $(BIN).y
	bison -v -t -d $(BIN).y   # -d supplies defines file

lex.yy.c: $(BIN).l $(BIN).tab.h
	flex $(BIN).l  # -d debug

all:    
	touch $(SRCS)
	make

clean:
	rm -f $(OBJS) $(BIN) lex.yy.c $(BIN).tab.h $(BIN).tab.c $(BIN).tar *~

pdf:    calc.y calc.l makefile
	mktex calc.y
	mv calc.pdf calc-y.pdf
	mktex calc.l
	mv calc.pdf calc-l.pdf
	mktex makefile
	save calc-l.pdf  calc-y.pdf makefile.pdf
	rm *.tex

tar:
	tar -cvf $(BIN).tar $(SRCS) makefile 

