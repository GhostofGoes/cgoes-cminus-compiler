* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  charout.c-
* FUNCTION input
  1:     ST  3,-1(1)	Store return address 
  2:     IN  2,2,2	Grab int input 
  3:     LD  3,-1(1)	Load return address 
  4:     LD  1,0(1)	Adjust fp 
  5:    LDA  7,0(3)	Return 
* END FUNCTION input
* FUNCTION output
  6:     ST  3,-1(1)	Store return address 
  7:     LD  3,-2(1)	Load parameter 
  8:    OUT  3,3,3	Output integer 
  9:    LDC  2,0(6)	Set return to 0 
 10:     LD  3,-1(1)	Load return address 
 11:     LD  1,0(1)	Adjust fp 
 12:    LDA  7,0(3)	Return 
* END FUNCTION output
* FUNCTION inputb
 13:     ST  3,-1(1)	Store return address 
 14:    INB  2,2,2	Grab bool input 
 15:     LD  3,-1(1)	Load return address 
 16:     LD  1,0(1)	Adjust fp 
 17:    LDA  7,0(3)	Return 
* END FUNCTION inputb
* FUNCTION outputb
 18:     ST  3,-1(1)	Store return address 
 19:     LD  3,-2(1)	Load parameter 
 20:   OUTB  3,3,3	Output bool 
 21:    LDC  2,0(6)	Set return to 0 
 22:     LD  3,-1(1)	Load return address 
 23:     LD  1,0(1)	Adjust fp 
 24:    LDA  7,0(3)	Return 
* END FUNCTION outputb
* FUNCTION inputc
 25:     ST  3,-1(1)	Store return address 
 26:    INC  2,2,2	Grab char input 
 27:     LD  3,-1(1)	Load return address 
 28:     LD  1,0(1)	Adjust fp 
 29:    LDA  7,0(3)	Return 
* END FUNCTION inputc
* FUNCTION outputc
 30:     ST  3,-1(1)	Store return address 
 31:     LD  3,-2(1)	Load parameter 
 32:   OUTC  3,3,3	Output char 
 33:    LDC  2,0(6)	Set return to 0 
 34:     LD  3,-1(1)	Load return address 
 35:     LD  1,0(1)	Adjust fp 
 36:    LDA  7,0(3)	Return 
* END FUNCTION outputc
* FUNCTION outnl
 37:     ST  3,-1(1)	Store return address 
 38:  OUTNL  3,3,3	Output a newline 
 39:     LD  3,-1(1)	Load return address 
 40:     LD  1,0(1)	Adjust fp 
 41:    LDA  7,0(3)	Return 
* END FUNCTION outnl
* FUNCTION main
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,30(6)	Load integer constant 
 44:     ST  3,-5(1)	Store variable max
* EXPRESSION
 45:    LDC  3,1(6)	Load integer constant 
 46:     ST  3,-4(1)	Store variable k
* WHILE
 47:     LD  3,-4(1)	Load variable k
 48:     ST  3,-6(1)	Save left side 
 49:     LD  3,-5(1)	Load variable max
 50:     LD  4,-6(1)	Load left into ac1 
 51:    TLT  3,4,3	Op < 
 52:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 54:    LDC  3,0(6)	Load integer constant 
 55:     ST  3,-3(1)	Store variable i
* WHILE
 56:     LD  3,-3(1)	Load variable i
 57:     ST  3,-6(1)	Save left side 
 58:     LD  3,-5(1)	Load variable max
 59:     LD  4,-6(1)	Load left into ac1 
 60:    TLT  3,4,3	Op < 
 61:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
 63:     LD  3,-3(1)	Load variable i
 64:     ST  3,-6(1)	Save left side 
 65:     LD  3,-4(1)	Load variable k
 66:     LD  4,-6(1)	Load left into ac1 
 67:    DIV  5,4,3	Op % 
 68:    MUL  5,5,3	 
 69:    SUB  3,4,5	 
 70:     ST  3,-6(1)	Save left side 
 71:    LDC  3,0(6)	Load integer constant 
 72:     LD  4,-6(1)	Load left into ac1 
 73:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  outputc
 75:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 76:    LDC  3,88(6)	Load char constant 
 77:     ST  3,-8(1)	Store parameter 
*                       Jump to outputc
 78:    LDA  1,-6(1)	Load address of new frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    LDA  7,-51(7)	CALL outputc
 81:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
 74:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  outputc
 83:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 84:    LDC  3,32(6)	Load char constant 
 85:     ST  3,-8(1)	Store parameter 
*                       Jump to outputc
 86:    LDA  1,-6(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-59(7)	CALL outputc
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
 82:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
 90:     LD  3,-3(1)	load lhs variable i
 91:    LDA  3,1(3)	increment value of i
 92:     ST  3,-3(1)	Store variable i
* END COMPOUND
 93:    LDA  7,-38(7)	go to beginning of loop 
 62:    LDA  7,31(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outputc
 94:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 95:    LDC  3,10(6)	Load char constant 
 96:     ST  3,-8(1)	Store parameter 
*                       Jump to outputc
 97:    LDA  1,-6(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-70(7)	CALL outputc
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
101:     LD  3,-4(1)	load lhs variable k
102:    LDA  3,1(3)	increment value of k
103:     ST  3,-4(1)	Store variable k
* END COMPOUND
104:    LDA  7,-58(7)	go to beginning of loop 
 53:    LDA  7,51(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
105:    LDC  2,0(6)	Set return value to 0 
106:     LD  3,-1(1)	Load return address 
107:     LD  1,0(1)	Adjust fp 
108:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,108(7)	Jump to init [backpatch] 
* INIT
109:     LD  0,0(0)	Set the global pointer 
110:    LDA  1,0(0)	set first frame at end of globals 
111:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-72(7)	Jump to main 
114:   HALT  0,0,0	DONE! 
* END INIT
