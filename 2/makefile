BIN  = cminus
CC   = g++
SRCS = $(BIN).y $(BIN).l types.h types.c
TESTSRCS = CuTest.c CuTest.h AllTests.c
OBJS = lex.yy.o $(BIN).tab.o
LIBS = -lm types.c
CCFLAGS = -g

$(BIN): $(OBJS)
	$(CC) $(CCFLAGS) $(OBJS) $(LIBS) -o c- # $(BIN)

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
	tar -cvf $(BIN).tar $(SRCS) $(TESTSRCS) makefile 

test:
	make clean
	make all
	./c-
	
#I'm sure there is a way to do this more generically. TODO;
# maybe an actual testing bash script.
testA1:
	make clean
	make all
	./c- everything03.c- > output11.txt
	./c- scannerTest.c- > output12.txt

testA2:
	make clean
	make all
	./c- everything04.c- > output21.txt
	./c- exp.c- > output22.txt
	./c- init.c- > output23.txt
	./c- pas.c- > output24.txt
	./c- whileif.c- > output25.txt

testAll:
	make testA1
	make testA2