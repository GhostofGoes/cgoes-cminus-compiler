* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  c0g.c-
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
* EXPRESSION
 43:    LDC  3,3(6)	Load integer constant 
 44:     ST  3,-2(1)	Save index 
 45:    LDC  3,1023(6)	Load integer constant 
 46:     LD  4,-2(1)	Restore index 
 47:    LDA  5,-1(0)	Load address of base of array x
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 50:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 51:    LDC  3,3(6)	Load integer constant 
 52:    LDA  5,-1(0)	Load address of base of array x
 53:    SUB  5,5,3	Compute offset of value 
 54:     LD  3,0(5)	load lhs variable x
 55:    LDA  3,1(3)	increment value of x
 56:     ST  3,0(5)	Store variable x
 57:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 58:    LDA  1,-2(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 62:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 63:    LDA  1,-2(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-29(7)	CALL outnl
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 67:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 68:    LDC  3,3(6)	Load integer constant 
 69:    LDA  4,-1(0)	Load address of base of array x
 70:    SUB  3,4,3	Compute offset of value 
 71:     LD  3,0(3)	Load the value 
 72:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 73:    LDA  1,-2(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 77:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 78:    LDA  1,-2(1)	Load address of new frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    LDA  7,-44(7)	CALL outnl
 81:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 82:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 83:    LDC  3,3(6)	Load integer constant 
 84:    LDA  5,-1(0)	Load address of base of array x
 85:    SUB  5,5,3	Compute offset of value 
 86:     LD  3,0(5)	load lhs variable x
 87:    LDA  3,-1(3)	decrement value of x
 88:     ST  3,0(5)	Store variable x
 89:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-2(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 94:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 95:    LDA  1,-2(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-61(7)	CALL outnl
 98:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 99:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
100:    LDC  3,3(6)	Load integer constant 
101:    LDA  4,-1(0)	Load address of base of array x
102:    SUB  3,4,3	Compute offset of value 
103:     LD  3,0(3)	Load the value 
104:     ST  3,-4(1)	Store parameter 
*                       Jump to output
105:    LDA  1,-2(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-102(7)	CALL output
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
109:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
110:    LDA  1,-2(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-76(7)	CALL outnl
113:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
114:    LDC  2,0(6)	Set return value to 0 
115:     LD  3,-1(1)	Load return address 
116:     LD  1,0(1)	Adjust fp 
117:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,117(7)	Jump to init [backpatch] 
* INIT
118:     LD  0,0(0)	Set the global pointer 
119:    LDA  1,-8(0)	set first frame at end of globals 
120:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
121:    LDC  3,7(6)	load size of array x
122:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-83(7)	Jump to main 
125:   HALT  0,0,0	DONE! 
* END INIT
