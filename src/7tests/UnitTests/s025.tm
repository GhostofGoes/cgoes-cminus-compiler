* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  s025.c-
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
* FUNCTION toad
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
 43:    LDC  2,0(6)	Set return value to 0 
 44:     LD  3,-1(1)	Load return address 
 45:     LD  1,0(1)	Adjust fp 
 46:    LDA  7,0(3)	Return 
* END FUNCTION toad
* FUNCTION load
 47:     ST  3,-1(1)	Store return address. 
* COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6)	Set return value to 0 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END FUNCTION load
* FUNCTION sum
 52:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 53:     LD  3,-2(1)	Load variable x
 54:     LD  4,-104(0)	load lhs variable runningSum
 55:    ADD  3,4,3	op += 
 56:     ST  3,-104(0)	Store variable runningSum
* RETURN
 57:     LD  3,-104(0)	Load variable runningSum
 58:    LDA  2,0(3)	Copy result to rt register 
 59:     LD  3,-1(1)	Load return address 
 60:     LD  1,0(1)	Adjust fp 
 61:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 62:    LDC  2,0(6)	Set return value to 0 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
* END FUNCTION sum
* FUNCTION main
 66:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 67:    LDC  3,7000(6)	Load integer constant 
 68:     ST  3,-103(0)	Store variable runningSum
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 70:     LD  3,-103(0)	Load variable runningSum
 71:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 72:    LDA  1,-2(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  sum
 76:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 77:    LDC  3,666(6)	Load integer constant 
 78:     ST  3,-4(1)	Store parameter 
*                       Jump to sum
 79:    LDA  1,-2(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-30(7)	CALL sum
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
* EXPRESSION
*                       Begin call to  sum
 83:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 84:    LDC  3,3(6)	Load integer constant 
 85:     ST  3,-4(1)	Store parameter 
*                       Jump to sum
 86:    LDA  1,-2(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-37(7)	CALL sum
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
* EXPRESSION
*                       Begin call to  output
 90:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  sum
 91:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 92:    LDC  3,0(6)	Load integer constant 
 93:     ST  3,-6(1)	Store parameter 
*                       Jump to sum
 94:    LDA  1,-4(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-45(7)	CALL sum
 97:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
 98:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 99:    LDA  1,-2(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-96(7)	CALL output
102:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
103:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
104:     LD  3,-103(0)	Load variable runningSum
105:     ST  3,-4(1)	Store parameter 
*                       Jump to output
106:    LDA  1,-2(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
110:    LDC  2,0(6)	Set return value to 0 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,113(7)	Jump to init [backpatch] 
* INIT
114:     LD  0,0(0)	Set the global pointer 
115:    LDA  1,-105(0)	set first frame at end of globals 
116:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
117:    LDC  3,0(6)	Load integer constant 
118:     ST  3,-104(0)	Store variable runningSum-2
119:    LDC  3,100(6)	load size of array x
120:     ST  3,-2(0)	save size of array x
* END INIT GLOBALS AND STATICS
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-57(7)	Jump to main 
123:   HALT  0,0,0	DONE! 
* END INIT
