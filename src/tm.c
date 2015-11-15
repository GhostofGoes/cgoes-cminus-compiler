/**************************************************************/
/* File: tm.c                                                 */
/* The TM ("Tiny Machine") virtual machine                    */
/* Book: Compiler Construction: Principles and Practice       */
/*                                                            */
/* v3.3    Modified Robert Heckendorn Oct 14, 2015            */
/*          put in test and separate jump instructions        */
/*          redid CMP instruction to be more useful and       */
/*          added CPI instruction                             */
/* v3.1    Modified Robert Heckendorn Sep 3, 2015             */
/*          changed all the jump instructions, changed        */
/*          direction of MOV, SET instructions, added RND     */
/* v3.01    Modified Robert Heckendorn Nov  20, 2013          */
/*          Added array/character commands, incrementing      */
/*           Load and Store, relaxed syntax, character        */
/*           constants                                        */
/*                                                            */
/* v2.7.1  Modified Robert Heckendorn Nov  13, 2009           */
/*         bug fix                                            */
/* v2.7 Modified Robert Heckendorn for CS445 Apr  6, 2006     */
/*         empty line -> step, nicer tracing message          */
/* v2.6 Modified Robert Heckendorn for CS445 Mar 20, 2006     */
/*         Added OUTNL and modified OUTB and OUT instr.       */
/* v2.5 Modified Robert Heckendorn for CS445 May 11, 2005     */
/*         record at each data location the address of the    */
/*         instruction that last assigned a value there       */
/* v2.4 Modified Robert Heckendorn for CS445 Apr 22, 2004     */
/*         fix eof bug, 'd' w/o args uses last arguments and  */
/*         fixed some obscure bugs added 'u' command.         */
/* v2.3 Modified Robert Heckendorn for CS445 Apr 28, 2003     */
/*         marks memory as used or not, added 'e', -n on 'd'  */
/* v2.2 Modified Robert Heckendorn for CS445 Apr 22, 2003     */
/*         saves comments in imem, breakpoint, input break    */
/*         abort limit and other fixes                        */
/* v2.1 Modified Robert Heckendorn for CS445 Apr 21, 2003     */
/*         INB, OUTB                                          */
/* v2.0 Modified Robert Heckendorn for CS445 Apr 11, 2003     */
/*         =, load, more state reported                       */
/* v1.0 Kenneth C. Louden's original                          */
/*                                                            */
/* TO COMPILE: gcc tm.c -o tm                                 */
/*                                                            */
/**************************************************************/

char *versionNumber =(char *)"TM version 3.3";

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <sys/types.h>
#include <unistd.h>

#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif
#define TRACE 1
#define NOTRACE 0
#define NOTUSED -1
#define USED 1

/******* const *******/
#define   IADDR_SIZE  10000	/* increase for large programs */
#define   DADDR_SIZE  10000	/* increase for large programs */
#define   NO_REGS 8
#define   PC_REG  7

#define   LINESIZE  200
#define   WORDSIZE  1000        /* maximum length of a word of text */
#define   DEFAULT_ABORT_LIMIT 50000

/******* type  *******/

typedef enum
{
    opclRR,			/* reg operands r, s, t */
    opclRA			/* reg r, int d+s */
} OPCLASS;

typedef enum
{
    // RR instructions 
    opHALT,			// RR     halt, operands are ignored 
    opNOP,			// RR     no op, operands are ignored 
    opIN,			// RR     read integer into reg(r); s and t are ignored 
    opINB,			// RR     read bool into reg(r); s and t are ignored 
    opINC,			// RR     read char into reg(r); s and t are ignored 
    opOUT,			// RR     write integer from reg(r), s and t are ignored 
    opOUTB,			// RR     write bool from reg(r), s and t are ignored 
    opOUTC,			// RR     write char from reg(r), s and t are ignored 
    opOUTNL,			// RR     write newline regs r, s and t are ignored 
    opADD,			// RR     reg(r) = reg(s)+reg(t) 
    opSUB,			// RR     reg(r) = reg(s)-reg(t) 
    opMUL,			// RR     reg(r) = reg(s)*reg(t) 
    opDIV,			// RR     reg(r) = reg(s)/reg(t) 
    opAND,			// RR     reg(r) = reg(s)&reg(t) 
    opOR,			// RR     reg(r) = reg(s)|reg(t) 
    opXOR,			// RR     reg(r) = reg(s)^reg(t) 
    opNOT,			// RR     reg(r) = ~reg(s) 
    opSWP,			// RR     reg[r] = min(reg[r], reg[s]), reg[s] = max(reg[r], reg[s])  
    opRND,			// RR     reg[r] = random(0, abs(reg[s])) 

    opTLT,			// RR     if reg(s)<reg(t) then reg(r) = 1  else reg(r) = 0 
    opTLE,			// RR     if reg(s)<=reg(t) then reg(r) = 1  else reg(r) = 0 
    opTGT,			// RR     if reg(s)>reg(t) then reg(r) = 1  else reg(r) = 0 
    opTGE,			// RR     if reg(s)>=reg(t) then reg(r) = 1  else reg(r) = 0 
    opTEQ,			// RR     if reg(s)==reg(t) then reg(r) = 1  else reg(r) = 0 
    opTNE,			// RR     if reg(s)!=reg(t) then reg(r) = 1  else reg(r) = 0 

    opMOV,                      // RR     dMem[reg[r] + (0..reg[t]-1)] = dMem[reg[s] + (0..reg[t]-1)] 
    opSET,                      // RR     dMem[reg[r] + (0..reg[t]-1)] = reg[s] 
    opCMP,                      // RR     
    opCPI,                      // RR     
    opRRLim,			// limit of RR opcodes 

    // RA instructions 
    opLD,			// RM     reg(r) = mem(d+reg(s)) 
    opLDI,                      // RM     reg(r) = mem(d+reg(s)); reg[s]++ 
    opST,			// RM     mem(d+reg(s)) = reg(r) 
    opSTI,                      // RM     mem(d+reg(s)) = reg(r); reg[s]++ 
    opLDA,			// RA     reg(r) = d+reg(s) 
    opLDC,			// RA     reg(r) = d ; reg(t) is ignored 
    opJZR,			// RA     if reg(r)==0 then reg(7) = d+reg(s) 
    opJNZ,			// RA     if reg(r)!=0 then reg(7) = d+reg(s) 

    opRALim			// Limit of RA opcodes 
} OPCODE;

typedef enum
{
    srOKAY,
    srHALT,
    srIMEM_ERR,
    srDMEM_ERR,
    srZERODIVIDE
} STEPRESULT;

char *stepResultTab[] = {
    (char *)"OK",
    (char *)"Halted",
    (char *)"ERROR: Instruction Memory Fault",
    (char *)"ERROR: Data Memory Fault",
    (char *)"ERROR: Division by 0"
};


/* The structure for a instruction  */
typedef struct
{
    int iop;
    int iarg1;
    int iarg2;
    int iarg3;
    char *comment;
} INSTRUCTION;

/******** global vars ********/
int iloc = 0;
int dloc = 0;
int promptflag = TRUE;
int traceflag = FALSE;
int icountflag = FALSE;
int abortLimit = DEFAULT_ABORT_LIMIT;
int pc, lastpc;
int savedbreakpoint, breakpoint;
char *emptyString = (char *)"";
char pgmName[WORDSIZE];
int instrCount = 0;
int dmemStart = 0;
int dmemCount = 0;
int dmemDown = TRUE;

INSTRUCTION iMem[IADDR_SIZE];
int iMemTag[IADDR_SIZE];
int dMem[DADDR_SIZE];
int dMemTag[DADDR_SIZE];
int reg[NO_REGS];


char *opCodeTab[100];

void initOpCodeTab()
{
    opCodeTab[(int)opHALT] = (char *)"HALT";
    opCodeTab[(int)opNOP] = (char *)"NOP";
    opCodeTab[(int)opIN] = (char *)"IN";
    opCodeTab[(int)opINB] = (char *)"INB";
    opCodeTab[(int)opINC] = (char *)"INC";
    opCodeTab[(int)opOUT] = (char *)"OUT";
    opCodeTab[(int)opOUTB] = (char *)"OUTB";
    opCodeTab[(int)opOUTC] = (char *)"OUTC";
    opCodeTab[(int)opOUTNL] = (char *)"OUTNL";
    opCodeTab[(int)opADD] = (char *)"ADD";
    opCodeTab[(int)opSUB] = (char *)"SUB";
    opCodeTab[(int)opMUL] = (char *)"MUL";
    opCodeTab[(int)opDIV] = (char *)"DIV";
    opCodeTab[(int)opAND] = (char *)"AND";
    opCodeTab[(int)opOR] = (char *)"OR";
    opCodeTab[(int)opXOR] = (char *)"XOR";
    opCodeTab[(int)opNOT] = (char *)"NOT";
    opCodeTab[(int)opSWP] = (char *)"SWP";
    opCodeTab[(int)opRND] = (char *)"RND";
    opCodeTab[(int)opTLT] = (char *)"TLT";
    opCodeTab[(int)opTLE] = (char *)"TLE";
    opCodeTab[(int)opTGT] = (char *)"TGT";
    opCodeTab[(int)opTGE] = (char *)"TGE";
    opCodeTab[(int)opTEQ] = (char *)"TEQ";
    opCodeTab[(int)opTNE] = (char *)"TNE";
    opCodeTab[(int)opMOV] = (char *)"MOV";
    opCodeTab[(int)opSET] = (char *)"SET";
    opCodeTab[(int)opCMP] = (char *)"CMP";
    opCodeTab[(int)opCPI] = (char *)"CPI";
    opCodeTab[(int)opRRLim] = (char *)"RRLim";
    opCodeTab[(int)opLD] = (char *)"LD";
    opCodeTab[(int)opLDI] = (char *)"LDI";
    opCodeTab[(int)opST] = (char *)"ST";
    opCodeTab[(int)opSTI] = (char *)"STI";
    opCodeTab[(int)opLDA] = (char *)"LDA";
    opCodeTab[(int)opLDC] = (char *)"LDC";
    opCodeTab[(int)opJZR] = (char *)"JZR";
    opCodeTab[(int)opJNZ] = (char *)"JNZ";
    opCodeTab[(int)opRALim] = (char *)"RALim";
}

char *niceStringIn(char *s)
{
    int len;
    char *t;

    len = strlen(s);
    t = (char *)malloc(len+1);

    unsigned char *tp = (unsigned char *)t;
    unsigned char *sp = (unsigned char *)s;
    for (; sp<(unsigned char *)s+len; sp++) {
        if (*sp=='\\') {
            sp++;
            if (*sp=='t') {
                *tp++ = '\t';
            }
            else if (*sp=='n') {
                *tp++ = '\n';
            }
            else if (*sp=='0') {
                *tp++ = '\0';
            }
            else {
                *tp++ = *sp;
            }
        }
        else if (*sp=='^') {
            *sp++;
            *tp++ = (*sp) ^ 0x40;
        }
        else {
            *tp++ = *sp;
        }
    }
    *tp='\0';

    return t;
}

char *niceStringOut(char *s) 
{
    int len;
    char *t;

    len = strlen(s);
    t = (char *)malloc(3*len+1);

    unsigned char *tp = (unsigned char *)t;
    unsigned char *sp = (unsigned char *)s;
    for (; sp<(unsigned char *)s+len; sp++) {

        if (*sp=='\t') {
            *tp++ = '\\';
            *tp++ = 't';
           }
        else if (*sp=='\n') {
           *tp++ = '\\';
            *tp++ = 'n';
        }
        else if (*sp=='\0') {
           *tp++ = '\\';
            *tp++ = '0';
        }
        else if (*sp<' ') {
            *tp++ = '^';
            *tp++ = *sp;
        }
        else if (*sp==127) {
            *tp++ = '^';
            *tp++ = '?';
        }
        else if (*sp>127) {
            *tp++ = '\\';
           *tp++ = "0123456789abcdef"[(*sp)/16];
           *tp++ = "0123456789abcdef"[(*sp)%16];
           }
        else {
           *tp++ = *sp;
           }
    }
    *tp='\0';

    return t;
}


char *niceChar(int n) {
    if (n>=32 && n<127) {  // we can easily make this print nice chars for any range
        char s[2];
        s[0] = (char)n;
        s[1] = '\0';
        return niceStringOut(s);
    }
    else {
        return NULL;
    }
}


/* The ad hoc scanner's global state */
char in_Line[LINESIZE];
char *in_LinePtr;
int lineLen;
int inCol;
int num;
char word[WORDSIZE];
char ch;

/********************************************/
int opClass(int c)
{
    if (c <= (int)opRRLim)
	return opclRR;
    else
	return opclRA;
}



/********************************************/
void writeInstruction(int loc, int trace)
{
//DEBUG    printf("PC: %d  R7: %d  loc: %d\n", pc, reg[7], loc);
    printf("%4d: ", loc);
    if ((loc >= 0) && (loc<IADDR_SIZE)) {
	printf("%4s%3d,", opCodeTab[iMem[loc].iop], iMem[loc].iarg1);
	switch (opClass(iMem[loc].iop)) {
	case opclRR:
	    printf("%3d, %1d ", iMem[loc].iarg2, iMem[loc].iarg3);
	    if (trace) {
                printf("  | before:");
		printf("  r[%1d]: %-4d", iMem[loc].iarg1, reg[iMem[loc].iarg1]);
		printf("  r[%1d]: %-4d", iMem[loc].iarg2, reg[iMem[loc].iarg2]);
		printf("  r[%1d]: %-4d", iMem[loc].iarg3, reg[iMem[loc].iarg3]);
                printf("  | ");
	    }
	    break;
	case opclRA:
	    printf("%4d(%1d)", iMem[loc].iarg2, iMem[loc].iarg3);
	    if (trace) {
                int tmp;

                printf("  | before:");
		printf("  r[%1d]: %-4d",
                       iMem[loc].iarg1,
                       reg[iMem[loc].iarg1]);
		printf("  r[%1d]: %-4d",
                       iMem[loc].iarg3,
                       reg[iMem[loc].iarg3]);
/*   zzz   */
                tmp = iMem[loc].iarg2 + reg[iMem[loc].iarg3];
                if ((tmp >= 0) && (tmp<DADDR_SIZE)) {

                    printf("  m[%d]: %-4d",
                           iMem[loc].iarg2 + reg[iMem[loc].iarg3],
                           dMem[iMem[loc].iarg2 + reg[iMem[loc].iarg3]]);
                    printf("  | ");
                }
            }
	    break;
	}
        if (breakpoint == loc || savedbreakpoint == loc) printf(" %7s", "<-break");
        if (reg[7] == loc && !trace) printf(" %4s", "<-pc");
	printf(" %s\n", iMem[loc].comment);
    }
    fflush(stdout);
}				/* writeInstruction */



/********************************************/
/* get the next character
*/
int getCh()
{
//    printf("LINE: \'%s\'  LINELEN: %d INCOL: %d\n", in_Line, lineLen, inCol);
    if (++inCol<lineLen) {
	ch = in_Line[inCol];
        return 1;
    }
    else {
	ch = ' ';
        return 0;
    }
}



/********************************************/
/* span a bunch of whitespace
*/
int nonBlank(void)
{
    while ((inCol<lineLen) &&
	   ((in_Line[inCol] == ' ') || (in_Line[inCol] == '\t'))) inCol++;
    if (inCol<lineLen) {
	ch = in_Line[inCol];
	return TRUE;
    }
    else {
	ch = ' ';
	return FALSE;
    }
}

/********************************************/
/* span a bunch of whitespace
*/
int uptoComment(void)
{
    while ((inCol<lineLen) && (in_Line[inCol] != '*')) inCol++;
    if (inCol<lineLen) {
	ch = in_Line[inCol];
	return TRUE;
    }
    else {
	ch = ' ';
	return FALSE;
    }
}


/********************************************/
/*  returns the numerical equivalent of a character in num.
/* returns success or failure in function value
 */
int getChar(void)
{
    int ok = FALSE;

    num = 0;
    if (ch == '\'') {
        getCh();
        if (ch == '\\') {
            getCh();
            if (ch == '0') num = '\0';
            else if (ch == 't') num = '\t';
            else if (ch == 'n') num = '\n';
            else if (ch == '\\') num = '\\';
            else if (ch == '\'') num = '\'';
            else num = ch;
        }
        else if (ch == '^') {
            getCh();
            num = ch;
            num ^= 0x40;
        }
        else {
            num = ch;
        }

        getCh();
        if (ch == '\'') {
            ok = TRUE;
            getCh();
        }
    }

    printf("CHR: %d\n", num);
    return ok;
}

/********************************************/
/*  returns the number in num.
/* returns success or failure in function value
 */
int getNum(void)
{
    int sign;
    int term;
    int ok = FALSE;

    num = 0;
    nonBlank();
    do {
	sign = 1;
	while ((ch == '+') || (ch == '-')) {
	    ok = FALSE;
	    if (ch == '-')
		sign = -sign;
	    getCh();
	}
	term = 0;
	while (isdigit(ch)) {
	    ok = TRUE;
	    term = term*10 + (ch - '0');
	    getCh();
	}
	num = num + (term*sign);
    }
    while ((ch == '+') || (ch == '-'));

//    printf("NUM: %d\n", num);
    return ok;
}				/* getNum */





/********************************************/
int getNumOrChar(void)
{
    nonBlank();
    if ((ch == '+') || (ch == '-') || isdigit(ch)) return getNum();
    else return getChar();
}


/********************************************/
int getWord(void)
{
    int temp = FALSE;
    int length = 0;
    if (nonBlank()) {
	while (isalnum(ch) || ch=='=' || ch=='?') {
	    if (length<WORDSIZE - 1)
		word[length++] = ch;
	    getCh();
	}
	word[length] = '\0';
	temp = (length != 0);
    }
    return temp;
}				/* getWord */


/********************************************/
int getBool(void)
{
    nonBlank();

    num = 1;
    if ((ch=='F') || (ch=='f') || (ch=='0')) num = 0;
    getWord();

    return TRUE;
}


/********************************************/
int skipCh(char c)
{
    int temp = FALSE;
    if (nonBlank() && (ch == c)) {
	getCh();
	temp = TRUE;
    }
    return temp;
}				/* skipCh */



/********************************************/
/* note this returns a duplicate string and not true or false */
char *getRemaining(void)
{
    skipCh(')');
    if (nonBlank()) return strdup(&in_Line[inCol]);
    return emptyString;
}



/********************************************/
int atEOL(void)
{
    return (!nonBlank());
}				/* atEOL */



/********************************************/
int error(char *msg, int lineNo, int instNo)
{
    printf("ERROR: Line %d", lineNo);
    if (instNo >= 0)
	printf(" (Address: %d)", instNo);
    printf("   %s\n", msg);
    return FALSE;
}				/* error */



/* clear registers and data memory */
void clearMachine()
{
    int regNo, loc;

    iloc = 0;
    dloc = 0;
    for (regNo = 0; regNo<NO_REGS; regNo++) reg[regNo] = 0;
    dMem[0] = DADDR_SIZE - 1;
    dMemTag[0] = NOTUSED;
    for (loc = 1; loc<DADDR_SIZE; loc++) {
	dMem[loc] = 0;
	dMemTag[loc] = NOTUSED;
    }
    dmemStart = dMem[0];
    dmemCount = -10;
    dmemDown = TRUE;
    instrCount = 0;
}

/* clear registers, data and instruction memory */
void fullClearMachine()
{
    int loc;

    /* clear registers and data memory */
    clearMachine();
    savedbreakpoint = breakpoint = -1;

    /* zero out instruction memory */
    for (loc = 0; loc<IADDR_SIZE; loc++) {
	iMem[loc].iop = opHALT;
	iMem[loc].iarg1 = 0;
	iMem[loc].iarg2 = 0;
	iMem[loc].iarg3 = 0;
	iMem[loc].comment = (char *)"* initially empty";
	iMemTag[loc] = NOTUSED;
    }
}


int readInstructions(char *fileName)
{
    FILE *pgm;
    OPCODE op;
    int arg1, arg2, arg3;
    int loc, regNo, lineNo;
    char errorString[128];

    /* load program */
    if (*fileName!='\0') strcpy(pgmName, fileName);
    if (strchr(pgmName, '.') == NULL) strcat(pgmName, (char *)".tm");
    pgm = fopen(pgmName, "r");
    if (pgm == NULL) {
	printf("ERROR: file '%s' not found\n", pgmName);
	return FALSE;
    }
    printf("Loading file: %s\n", pgmName);

    /* clear the way for the new program */
    fullClearMachine();

    /* load program */
    lineNo = 0;
    loc = -1;   /* fist location to load is 0 */
    /* get line */
    fgets(in_Line, LINESIZE - 2, pgm);
    while (!feof(pgm)) {
        /* process line */
	inCol = 0;
	lineNo++;
	lineLen = strlen(in_Line) - 1;
	if (in_Line[lineLen] == '\n')
	    in_Line[lineLen] = '\0';
	else
	    in_Line[++lineLen] = '\0';

        /* process an instruction */
	if ((nonBlank()) && (in_Line[inCol] != '*')) {
            /* get address */
	    if (getNum()) {
                loc = num;

                /* colon after address */
                if (!skipCh(':')) {
                    return error((char *)"Missing colon", lineNo, loc);
                }
            }
            else {   /* if no address given then just increment counter */
                loc++;
            }
	    if (loc>=IADDR_SIZE)
		return error((char *)"Location too large", lineNo, loc);


            /* get op code */
	    if (!getWord())
		return error((char *)"Missing opcode", lineNo, loc);

            { int opcnt;

                for (opcnt = 0; opcnt<int(opRALim); opcnt++) {
                    if (strncmp(opCodeTab[opcnt], word, 4) == 0) break;
                }
                if (opcnt>=int(opRALim)) {
                    sprintf(errorString, (char *)"Illegal opcode: %s", word);
                    return error(errorString, lineNo, loc);
                }
		op = (OPCODE)opcnt;
            }

            /* process args to op code */
            arg1 = arg2 = arg3 = 0;
            if (op==opHALT || op==opNOP) {
                uptoComment();
            }
            else {
                switch (opClass(op)) {
                case opclRR:
                    /***********************************/
                    /* arg 1 */
                    if ((!getNum()) || (num<0) || (num >= NO_REGS))
                        return error((char *)"Bad first register", lineNo, loc);
                    arg1 = num;
                    if (!skipCh(','))
                        return error((char *)"Missing comma", lineNo, loc);

                    /* arg 2 */
                    if ((!getNum()) || (num<0) || (num >= NO_REGS))
                        return error((char *)"Bad second register", lineNo, loc);
                    arg2 = num;
                    if (!skipCh(','))
                        return error((char *)"Missing comma", lineNo, loc);

                    /* arg 3 */
                    if ((!getNum()) || (num<0) || (num >= NO_REGS))
                        return error((char *)"Bad third register", lineNo, loc);
                    arg3 = num;
                    break;

                case opclRA:
                    /***********************************/
                    /* arg 1 */
                    if (!getNum() || ((num<0) || (num >= NO_REGS)))
                        return error((char *)"Bad first register", lineNo, loc);
                    arg1 = num;
                    if (!skipCh(','))
                        return error((char *)"Missing comma", lineNo, loc);

                    /* arg 2 */
                    if (!getNumOrChar())
                        return error((char *)"Bad displacement", lineNo, loc);
                    arg2 = num;
                    if (!skipCh('(') && !skipCh(',')) {
                        if (op==opLDC) {
                            break;
                        }
                        return error((char *)"Missing left paren", lineNo, loc);
                    }

                    /* arg 3 */
                    if ((!getNum()) || (num<0) || (num >= NO_REGS))
                        return error((char *)"Bad second register", lineNo, loc);
                    arg3 = num;
                    break;
                }
            }
	    iMem[loc].iop = op;
	    iMem[loc].iarg1 = arg1;
	    iMem[loc].iarg2 = arg2;
	    iMem[loc].iarg3 = arg3;
	    iMem[loc].comment = getRemaining();
	    iMemTag[loc] = USED;     /* correctly counts assignments to same loc  */
	}

        /* get next line */
        fgets(in_Line, LINESIZE - 2, pgm);
    }
    return TRUE;
}				/* readInstructions */



/********************************************/
STEPRESULT stepTM(void)
{
    INSTRUCTION currentinstruction;
    int r, s, t, d, m;
    int ok;

    pc = reg[PC_REG];
    if ((pc<0) || (pc>=IADDR_SIZE))
	return srIMEM_ERR;

    if (pc == breakpoint) {
	savedbreakpoint = breakpoint;
	breakpoint = -1;
	return srHALT;
    }
    breakpoint = savedbreakpoint;

    lastpc = pc;
    reg[PC_REG] = pc + 1;
    currentinstruction = iMem[pc];
    instrCount++;

    /* get the args to the instruction */
    if (opClass(currentinstruction.iop) == opclRR) {
        r = currentinstruction.iarg1;
        s = currentinstruction.iarg2;
        t = currentinstruction.iarg3;
    }
    else {  /* note s changes its position */
	r = currentinstruction.iarg1;
        d = currentinstruction.iarg2;
	s = currentinstruction.iarg3;
	m = currentinstruction.iarg2 + reg[s];
    }

    switch (currentinstruction.iop) {
	/* RR instructions */
    case opHALT:
        /***********************************/
	return srHALT;
	/* break; */

    case opNOP:
        break;

    case opIN:
        /***********************************/
	do {
	    if (promptflag) printf("Enter integer value: ");
	    fflush(stdin);
	    fflush(stdout);

            fgets(in_Line, LINESIZE - 2, stdin);
            {
                char *p;

                for (p=in_Line; *p; p++) {
                    if (*p=='\n') {
                        *p='\0';
                        break;
                    }
                }
                lineLen = p-in_Line;
            }

	    if (!promptflag) printf("entered: %s\n", in_Line);

	    inCol = 0;
	    ok = getNum();
	    if (!ok) {
		printf("Illegal value in input: \"%s\"\n", in_Line);
                exit(1);
            }
	    else {
		reg[r] = num;
            }
	}
	while (!ok);
	if (skipCh('#')) return srHALT;
	break;

    case opINB:
        /***********************************/
	if (promptflag) printf("Enter Boolean value: ");
	fflush(stdin);
	fflush(stdout);

	fgets(in_Line, LINESIZE - 2, stdin);
	{
	    char *p;

	    for (p=in_Line; *p; p++) {
		if (*p=='\n') {
		    *p='\0';
		    break;
		}
	    }
	    lineLen = p-in_Line;
	}

	if (!promptflag) printf("entered: %s\n", in_Line);

	inCol = 0;
	getBool();
	reg[r] = num;
	if (skipCh('#')) return srHALT;
	break;

    case opINC:
        /***********************************/
	fflush(stdin);
	fflush(stdout);

        while (inCol+1>=lineLen) {
            char *p;

	    if (promptflag) printf("Enter characters: ");
            fgets(in_Line, LINESIZE - 2, stdin);

            for (p=in_Line; *p; p++) {
                if (*p=='\n') {
                    *p='\0';
                    break;
                }
            }
            lineLen = p-in_Line;
            inCol = -1;
        }

        if (getCh()) {
            reg[r] = ch;
        }

	break;

    case opOUT:
	printf("%d ", reg[r]);
        fflush(stdout);
	break;

    case opOUTB:
	if (reg[r]) printf("T ");
	else printf("F ");
        fflush(stdout);
	break;

    case opOUTC:
	printf("%c", reg[r]);
        fflush(stdout);
	break;

    case opOUTNL:
	printf("\n");
        fflush(stdout);
	break;

    case opADD:
	reg[r] = reg[s] + reg[t];
	break;

    case opSUB:
	reg[r] = reg[s] - reg[t];
	break;

    case opMUL:
	reg[r] = reg[s]*reg[t];
	break;

    case opDIV:
	if (reg[t] != 0)
	    reg[r] = reg[s]/reg[t];
	else
	    return srZERODIVIDE;
	break;

    case opAND:
	reg[r] = reg[s]&reg[t];
	break;

    case opOR:
	reg[r] = reg[s]|reg[t];
	break;

    case opXOR:
	reg[r] = reg[s]^reg[t];
	break;

    case opNOT:
	reg[r] = ~reg[s];
	break;

    case opSWP:
        if (reg[r]>reg[s]) {
            int tmp;
            tmp = reg[r];
            reg[r] = reg[s];
            reg[s] = tmp;
        }
	break;

    case opRND:
        reg[r] = random()%abs(reg[s]+1);
	break;

    case opMOV: {
        int raddr, saddr;
        int i;

        raddr = reg[r];
        saddr = reg[s];
        for (i=0; i<reg[t]; i++) {
            dMem[raddr] = dMem[saddr];
            dMemTag[saddr] = pc;
            raddr++;
            saddr++;
        }
    }
        break;

    case opSET: {
        int raddr, svalue;
        int i;

        raddr = reg[r];
        svalue = reg[s];
        for (i=0; i<reg[t]; i++) {
            dMem[raddr] = svalue;
            dMemTag[raddr] = pc;
            raddr++;
        }
    }
        break;

    case opCMP: {
        int raddr, saddr;

        raddr = reg[r];
        saddr = reg[s];
        for (int i=0; i<reg[t]; i++) {
            reg[5] = dMem[raddr];
            reg[6] = dMem[saddr];
            if (dMem[raddr] != dMem[saddr]) break;
            raddr++;
            saddr++;
        }
    }
        break;

    case opCPI: {
        int raddr, saddr;

        raddr = reg[r];
        saddr = reg[s];
        for (int i=0; i<reg[t]; i++) {
            reg[5] = raddr;
            reg[6] = saddr;
            if (dMem[raddr] != dMem[saddr]) break;
            raddr++;
            saddr++;
        }
    }
        break;

        /*************** RA instructions ********************/
    case opLD:
	reg[r] = dMem[m];
	break;
    case opLDI:
	reg[r] = dMem[m];
        reg[s]++;
	break;
    case opST:
	dMem[m] = reg[r];
	dMemTag[m] = pc;
	break;
    case opSTI:
	dMem[m] = reg[r];
	dMemTag[m] = pc;
        reg[s]++;
	break;
    case opLDA:
	reg[r] = m;
	break;
    case opLDC:
	reg[r] = d;
	break;
    case opTLT:
        reg[r] = (reg[s]<reg[t] ? 1 : 0);
	break;
    case opTLE:
        reg[r] = (reg[s]<=reg[t] ? 1 : 0);
	break;
    case opTGT:
        reg[r] = (reg[s]>reg[t] ? 1 : 0);
	break;
    case opTGE:
        reg[r] = (reg[s]>=reg[t] ? 1 : 0);
	break;
    case opTEQ:
        reg[r] = (reg[s]==reg[t] ? 1 : 0);
	break;
    case opTNE:
        reg[r] = (reg[s]!=reg[t] ? 1 : 0);
	break;
    case opJZR:
	if (reg[r] == 0)
	    reg[PC_REG] = m;
	break;
    case opJNZ:
	if (reg[r] != 0)
	    reg[PC_REG] = m;
	break;

	/* end of legal instructions */
    }				/* case */
    return srOKAY;
}				/* stepTM */




/********************************************/
void usage()
{
    printf("%s\n", versionNumber);
    printf("\nCommands are:\n");
    printf(" a(bortLimit <<n>> Maximum number of instructions between halts (default is %d).\n", DEFAULT_ABORT_LIMIT);
    printf(" b(reakpoint <<n>> Set a breakpoint for instr n.  No n means clear breakpoints.\n");
    printf(" c(lear            Reset simulator for new execution of program\n");
    printf(" d(Mem <b <n>>     Print n dMem locations (counting down) starting at b (n can be negative to count up)\n");
    printf(" e(xecStats        Print execution statistics since last load or clear\n");
    printf(" g(o               Execute TM instructions until HALT\n");
    printf(" h(elp             Cause this list of commands to be printed\n");
    printf(" i(Mem <b <n>>     Print n iMem locations (counting up) starting at b\n");
    printf(" l(oad filename    Load filename into memory (default is last file)\n");
    printf(" n(ext             Print the next command that will be executed\n");
    printf(" p(rint            Toggle printing of total number instructions executed ('go' only)\n");
    printf(" q(uit             Terminate the simulation\n");
    printf(" r(egs             Print the contents of the registers\n");
    printf(" s(tep <n>         Execute n (default 1) TM instructions\n");
    printf(" t(race            Toggle instruction tracing (printing) during execution\n");
    printf(" u(nprompt)        Unprompted for script input\n");
    printf(" x(it              Terminate the simulation\n");
    printf(" = <r> <n>         Set register number r to value n (e.g. set the pc)\n");
    printf(" < <addr> <value>  Set dMem at addr to value\n");
    printf(" (empty line does a step)\n");
    printf("Also a # character placed after input will cause TM to halt\n  after processing the IN or INB commands (e.g. 34#  or f# )\n");
}



int doCommand(void)
{
    char cmd;
    int i;
    int printcnt;
    int stepResult;
    int regNo, loc;
    int stepcnt;

    stepcnt = 0;
    do {
	if (promptflag) printf("Enter command: ");
	fflush(stdin);
	fflush(stdout);

	fgets(in_Line, LINESIZE - 2, stdin);
	if (feof(stdin)) {
	    word[0] = 'q';
	    word[1] = '\0';
	    break;
	}

	{
	    char *p;

	    for (p=in_Line; *p; p++) {
		if (*p=='\n') {
		    *p='\0';
		    break;
		}
	    }
	    lineLen = p-in_Line;
	}
	inCol = 0;
    }
    while ((lineLen>0) && !getWord());

    if (lineLen==0) {
        word[0] = 's';
        word[1] = '\0';
    }

    if (! promptflag) printf("command: %s\n", in_Line);

    cmd = word[0];
    switch (cmd) {
    case 'l':
        /***********************************/
	if (!getWord()) *word = '\0';
	readInstructions(word);
	break;

    case 't':
        /***********************************/
	traceflag = !traceflag;
	printf("Tracing now ");
	if (traceflag)
	    printf("on.\n");
	else
	    printf("off.\n");
	break;

        /***********************************/
    case 'u':
//        printf("\n");
	promptflag = FALSE;
	break;

    case '?':
    case 'h':
        /***********************************/
	usage();
	break;

    case 'p':
        /***********************************/
	icountflag = !icountflag;
	printf("Printing instruction count now ");
	if (icountflag)
	    printf("on.\n");
	else
	    printf("off.\n");
	break;

    case 'a':
        /***********************************/
        if (getNum()) {
	    abortLimit = abs(num);
        }
	else {
	    abortLimit = 0;
	    printf("Abort limit turned off.\n");
        }
	break;

    case 's':
        /***********************************/
	if (atEOL())
	    stepcnt = 1;
	else if (getNum())
	    stepcnt = abs(num);
	else
	    printf("Step count?\n");
	break;

    case 'e':
        /***********************************/
    { int cnt;
            printf("EXEC STAT: Number of instructions executed: %d\n", instrCount);

	    cnt = 0;
	    for (i = 0; i<IADDR_SIZE; i++) if (iMemTag[i]==USED) cnt++;
	    printf("EXEC STAT: Instruction memory used: %d\n", cnt);

	    cnt = 0;
	    for (i = 0; i<IADDR_SIZE; i++) if (dMemTag[i]>=0) cnt++;
	    printf("EXEC STAT: Data memory used: %d\n", cnt);
    }
    break;

    case 'g':
        /***********************************/
	stepcnt = 1;
	break;

    case 'r':
        /***********************************/
	for (i = 0; i<NO_REGS; i++) {
	    printf("r[%1d]: %-4d   ", i, reg[i]);
	    if ((i%4) == 3) printf("\n");
	}
	break;

    case '=':
        /***********************************/
	if (getNum()) {
	    loc = num;
	    if (getNum()) {
		if (loc<0 || loc>=NO_REGS) printf("%d is not a legal register number\n", loc);
		else reg[loc] = num;
	    }
	    else printf("Register value?\n");
	}
        else printf("Register number?\n");
        break;

        /***********************************/
    case 'n':
	iloc = reg[PC_REG];
	if ((iloc >= 0) && (iloc<IADDR_SIZE)) writeInstruction(iloc, TRACE);
	break;

    case 'i':
        /***********************************/
	printcnt = 1;
	if (getNum()) {
	    iloc = num;
	    if (getNum())
		printcnt = num;
	}
	if (!atEOL())
	    printf("Instruction locations?\n");
	else {
	    while ((iloc >= 0) && (iloc<IADDR_SIZE) && (printcnt>0)) {
		writeInstruction(iloc, NOTRACE);
		iloc++;
		printcnt--;
	    }
	}
	break;

    case 'd':
        /***********************************/
    { int down;

            if (getNum()) {
                dmemStart = num;
                if (getNum()) {
                    dmemDown = TRUE;
                    if (num<0) dmemDown = FALSE;
                    dmemCount = abs(num);
                }
            }
            dloc = dmemStart;
            printcnt = dmemCount;
            down = dmemDown;
            printf("%5s: %5s", "addr", "value");
            printf("    %s\n", "instr that last assigned this loc");
            while ((dloc >= 0) && (dloc<DADDR_SIZE) && (printcnt>0)) {
                char *c;
                c = niceChar(dMem[dloc]);
                if (c) printf("%5d: %5d '%s'", dloc, dMem[dloc], c);
                else printf("%5d: %5d %3s", dloc, dMem[dloc], "");
                if (dMemTag[dloc]>=0) printf("    %d\n", dMemTag[dloc]);
                else printf("    %s\n", "unused");
                if (down) dloc--;
                else dloc++;
                printcnt--;
            }
    }
    break;

    case '<':
            if (getNum()) {
                dloc = num;
                getNum();
            }
            if (dloc >= 0 && dloc<DADDR_SIZE) {
                dMem[dloc] = num;
            }
            break;

    case 'b':
	if (atEOL()) {
	    savedbreakpoint = breakpoint = -1;
	}
	else if (getNum())
	    savedbreakpoint = breakpoint = abs(num);
	else
	    printf("Breakpoint location?\n");
	break;


    case 'c':
        /***********************************/
	clearMachine();
	lastpc = 0;
	stepcnt = 0;
	break;

    case 'q':
    case 'x':
	return FALSE;		/* break; */

    default:
	printf("Command %c unknown.\n", cmd);
	usage();
	break;
    }				/* case */

    stepResult = srOKAY;
    if (stepcnt>0) {
	if (cmd == 'g') {
	    stepcnt = 0;
	    while ((stepResult == srOKAY) && ((abortLimit==0) || (stepcnt<abortLimit))) {
		iloc = reg[PC_REG];
		if (traceflag)
		    writeInstruction(iloc, TRACE);
		stepResult = stepTM();
		stepcnt++;
	    }
	    if ((stepcnt>=abortLimit) && (abortLimit!=0)) {
		stepResult = srHALT;
		printf("Abort limit reached! (limit = %d) (see 'a' command in help).\n", abortLimit);
	    }
	    if (icountflag)
		printf("Number of instructions executed = %d\n", stepcnt);
	}
	else {
	    while ((stepcnt>0) && (stepResult == srOKAY)) {
		iloc = reg[PC_REG];
		if (traceflag)
		    writeInstruction(iloc, TRACE);
		stepResult = stepTM();
		stepcnt--;
	    }
	}

	printf("Status: %s\n", stepResultTab[stepResult]);
	if (stepResult!=srOKAY) {
	    printf("Last executed cmd: ");
	    writeInstruction(lastpc, TRACE);
	}
	printf("PC was %d, PC is now %d\n", lastpc, reg[PC_REG]);
    }
    return TRUE;
}				/* doCommand */



/********************************************/
/* E X E C U T I O N   B E G I N S   H E R E */
/********************************************/

int main(int argc, char *argv[])
{
    srandom(getpid()*2 + 1);
    initOpCodeTab();

    printf("%s (enter h for help)...\n\n", versionNumber);

    /* tell the user how much space they have */
    printf("Memory Configuration: Data Addresses: 0-%d  Instruction Addresses: 0-%d\n", DADDR_SIZE-1, IADDR_SIZE-1);
    printf("Abort Limit: %d\n", DEFAULT_ABORT_LIMIT);

    /* guarantee a full clear even if the file load fails */
    fullClearMachine();

    /* read the program if supplied as an argument */
    if (argc == 2) readInstructions(argv[1]);

    /* do stuff */
    while (doCommand());

    printf("Bye.\n");

    return 0;
}
