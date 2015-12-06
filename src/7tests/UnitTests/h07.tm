* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  h07.c-
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
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable x
 45:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-3(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 50:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-17(7)	CALL outnl
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
 55:     LD  3,-2(1)	Load variable x
 56:     ST  3,-3(1)	Save left side 
 57:    LDC  3,2(6)	Load integer constant 
 58:     LD  4,-3(1)	Load left into ac1 
 59:    TLT  3,4,3	Op < 
* THEN
* RETURN
 61:    LDC  3,1(6)	Load integer constant 
 62:    LDA  2,0(3)	Copy result to rt register 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
 60:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
*                       Begin call to  fib
 66:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 67:     LD  3,-2(1)	Load variable x
 68:     ST  3,-5(1)	Save left side 
 69:    LDC  3,1(6)	Load integer constant 
 70:     LD  4,-5(1)	Load left into ac1 
 71:    SUB  3,4,3	Op - 
 72:     ST  3,-5(1)	Store parameter 
*                       Jump to fib
 73:    LDA  1,-3(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-34(7)	CALL fib
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to fib
 77:     ST  3,-3(1)	Save left side 
*                       Begin call to  fib
 78:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 79:     LD  3,-2(1)	Load variable x
 80:     ST  3,-6(1)	Save left side 
 81:    LDC  3,2(6)	Load integer constant 
 82:     LD  4,-6(1)	Load left into ac1 
 83:    SUB  3,4,3	Op - 
 84:     ST  3,-6(1)	Store parameter 
*                       Jump to fib
 85:    LDA  1,-4(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-46(7)	CALL fib
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to fib
 89:     LD  4,-3(1)	Load left into ac1 
 90:    ADD  3,4,3	Op + 
 91:    LDA  2,0(3)	Copy result to rt register 
 92:     LD  3,-1(1)	Load return address 
 93:     LD  1,0(1)	Adjust fp 
 94:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 95:    LDC  2,0(6)	Set return value to 0 
 96:     LD  3,-1(1)	Load return address 
 97:     LD  1,0(1)	Adjust fp 
 98:    LDA  7,0(3)	Return 
* END FUNCTION fib
* FUNCTION main
 99:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
100:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fib
101:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
102:    LDC  3,6(6)	Load integer constant 
103:     ST  3,-6(1)	Store parameter 
*                       Jump to fib
104:    LDA  1,-4(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-65(7)	CALL fib
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to fib
108:     ST  3,-4(1)	Store parameter 
*                       Jump to output
109:    LDA  1,-2(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
113:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
114:    LDA  1,-2(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-80(7)	CALL outnl
117:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
118:    LDC  2,0(6)	Set return value to 0 
119:     LD  3,-1(1)	Load return address 
120:     LD  1,0(1)	Adjust fp 
121:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,121(7)	Jump to init [backpatch] 
* INIT
122:     LD  0,0(0)	Set the global pointer 
123:    LDA  1,0(0)	set first frame at end of globals 
124:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-28(7)	Jump to main 
127:   HALT  0,0,0	DONE! 
* END INIT
