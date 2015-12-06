* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  c0f.c-
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
 43:    LDC  3,7(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
* EXPRESSION
 45:    LDC  3,3(6)	Load integer constant 
 46:     ST  3,-10(1)	Save index 
 47:    LDC  3,1023(6)	Load integer constant 
 48:     LD  4,-10(1)	Restore index 
 49:    LDA  5,-3(1)	Load address of base of array x
 50:    SUB  5,5,4	Compute offset of value 
 51:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
 53:    LDC  3,3(6)	Load integer constant 
 54:    LDA  5,-3(1)	Load address of base of array x
 55:    SUB  5,5,3	Compute offset of value 
 56:     LD  3,0(5)	load lhs variable x
 57:    LDA  3,1(3)	increment value of x
 58:     ST  3,0(5)	Store variable x
 59:     ST  3,-12(1)	Store parameter 
*                       Jump to output
 60:    LDA  1,-10(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 64:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to outnl
 65:    LDA  1,-10(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-31(7)	CALL outnl
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
 70:    LDC  3,3(6)	Load integer constant 
 71:    LDA  4,-3(1)	Load address of base of array x
 72:    SUB  3,4,3	Compute offset of value 
 73:     LD  3,0(3)	Load the value 
 74:     ST  3,-12(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-10(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 79:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to outnl
 80:    LDA  1,-10(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-46(7)	CALL outnl
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 84:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
 85:    LDC  3,3(6)	Load integer constant 
 86:    LDA  5,-3(1)	Load address of base of array x
 87:    SUB  5,5,3	Compute offset of value 
 88:     LD  3,0(5)	load lhs variable x
 89:    LDA  3,-1(3)	decrement value of x
 90:     ST  3,0(5)	Store variable x
 91:     ST  3,-12(1)	Store parameter 
*                       Jump to output
 92:    LDA  1,-10(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-89(7)	CALL output
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 96:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to outnl
 97:    LDA  1,-10(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-63(7)	CALL outnl
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
101:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
102:    LDC  3,3(6)	Load integer constant 
103:    LDA  4,-3(1)	Load address of base of array x
104:    SUB  3,4,3	Compute offset of value 
105:     LD  3,0(3)	Load the value 
106:     ST  3,-12(1)	Store parameter 
*                       Jump to output
107:    LDA  1,-10(1)	Load address of new frame 
108:    LDA  3,1(7)	Return address in ac 
109:    LDA  7,-104(7)	CALL output
110:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
111:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to outnl
112:    LDA  1,-10(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-78(7)	CALL outnl
115:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
116:    LDC  2,0(6)	Set return value to 0 
117:     LD  3,-1(1)	Load return address 
118:     LD  1,0(1)	Adjust fp 
119:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,119(7)	Jump to init [backpatch] 
* INIT
120:     LD  0,0(0)	Set the global pointer 
121:    LDA  1,0(0)	set first frame at end of globals 
122:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-83(7)	Jump to main 
125:   HALT  0,0,0	DONE! 
* END INIT
