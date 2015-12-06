* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  t03.c-
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
* FUNCTION fib
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 43:     LD  3,-2(1)	Load variable n
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,3(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
* THEN
* RETURN
 49:    LDC  3,1(6)	Load integer constant 
 50:    LDA  2,0(3)	Copy result to rt register 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
 48:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
*                       Begin call to  fib
 55:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 56:     LD  3,-2(1)	Load variable n
 57:     ST  3,-5(1)	Save left side 
 58:    LDC  3,1(6)	Load integer constant 
 59:     LD  4,-5(1)	Load left into ac1 
 60:    SUB  3,4,3	Op - 
 61:     ST  3,-5(1)	Store parameter 
*                       Jump to fib
 62:    LDA  1,-3(1)	Load address of new frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    LDA  7,-23(7)	CALL fib
 65:    LDA  3,0(2)	Save the result in ac 
*                       End call to fib
 66:     ST  3,-3(1)	Save left side 
*                       Begin call to  fib
 67:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 68:     LD  3,-2(1)	Load variable n
 69:     ST  3,-6(1)	Save left side 
 70:    LDC  3,2(6)	Load integer constant 
 71:     LD  4,-6(1)	Load left into ac1 
 72:    SUB  3,4,3	Op - 
 73:     ST  3,-6(1)	Store parameter 
*                       Jump to fib
 74:    LDA  1,-4(1)	Load address of new frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    LDA  7,-35(7)	CALL fib
 77:    LDA  3,0(2)	Save the result in ac 
*                       End call to fib
 78:     LD  4,-3(1)	Load left into ac1 
 79:    ADD  3,4,3	Op + 
 80:    LDA  2,0(3)	Copy result to rt register 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
 54:    LDA  7,29(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6)	Set return value to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END FUNCTION fib
* FUNCTION main
 88:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  fib
 89:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 90:    LDC  3,12(6)	Load integer constant 
 91:     ST  3,-5(1)	Store parameter 
*                       Jump to fib
 92:    LDA  1,-3(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-53(7)	CALL fib
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to fib
 96:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 98:     LD  3,-2(1)	Load variable n
 99:     ST  3,-5(1)	Store parameter 
*                       Jump to output
100:    LDA  1,-3(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-97(7)	CALL output
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
104:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
105:    LDA  1,-3(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-71(7)	CALL outnl
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
109:    LDC  2,0(6)	Set return value to 0 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,112(7)	Jump to init [backpatch] 
* INIT
113:     LD  0,0(0)	Set the global pointer 
114:    LDA  1,0(0)	set first frame at end of globals 
115:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-30(7)	Jump to main 
118:   HALT  0,0,0	DONE! 
* END INIT
