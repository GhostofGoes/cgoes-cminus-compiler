BIN  = cminus
CC   = g++
SRCS = $(BIN).y $(BIN).l types.h cminus.h cminus.cpp toker.c toker.h
OBJS = lex.yy.o $(BIN).tab.o
LIBS = -lm cminus.cpp toker.c
CCFLAGS = -g -std=gnu++11

$(BIN): $(OBJS)
	$(CC) $(CCFLAGS) $(OBJS) $(LIBS) -o c-

$(BIN).tab.h $(BIN).tab.c: $(BIN).y
	bison -v -t -d $(BIN).y

lex.yy.c: $(BIN).l $(BIN).tab.h
	flex $(BIN).l

all:    
	touch $(SRCS)
	make

clean:
	rm -f $(OBJS) $(BIN) lex.yy.c $(BIN).tab.h $(BIN).tab.c $(BIN).tar *~

pdf:    $(BIN).y $(BIN).l makefile
	mktex $(BIN).y
	mv $(BIN).pdf $(BIN)-y.pdf
	mktex $(BIN).l
	mv $(BIN).pdf $(BIN)-l.pdf
	mktex makefile
	save $(BIN)-l.pdf  $(BIN)-y.pdf makefile.pdf
	rm *.tex

tar:
	tar -cvf $(BIN).tar $(SRCS) makefile 

test:
	make clean
	make all
	./c-