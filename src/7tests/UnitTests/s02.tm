* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  s02.c-
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
* IF
 53:     LD  3,-2(1)	Load variable init
* THEN
* EXPRESSION
 55:    LDC  3,0(6)	Load integer constant 
 56:     ST  3,-104(0)	Store variable runningSum
 54:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 57:     LD  3,-3(1)	Load variable x
 58:     LD  4,-104(0)	load lhs variable runningSum
 59:    ADD  3,4,3	op += 
 60:     ST  3,-104(0)	Store variable runningSum
* RETURN
 61:     LD  3,-104(0)	Load variable runningSum
 62:    LDA  2,0(3)	Copy result to rt register 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6)	Set return value to 0 
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    LDA  7,0(3)	Return 
* END FUNCTION sum
* FUNCTION main
 70:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 71:    LDC  3,7000(6)	Load integer constant 
 72:     ST  3,-2(0)	Store variable runningSum
* EXPRESSION
*                       Begin call to  output
 73:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 74:     LD  3,-2(0)	Load variable runningSum
 75:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 76:    LDA  1,-2(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  sum
 80:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 81:    LDC  3,1(6)	Load Boolean constant 
 82:     ST  3,-4(1)	Store parameter 
*                       Load param 2
 83:    LDC  3,666(6)	Load integer constant 
 84:     ST  3,-5(1)	Store parameter 
*                       Jump to sum
 85:    LDA  1,-2(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-36(7)	CALL sum
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
* EXPRESSION
*                       Begin call to  sum
 89:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 90:    LDC  3,0(6)	Load Boolean constant 
 91:     ST  3,-4(1)	Store parameter 
*                       Load param 2
 92:    LDC  3,3(6)	Load integer constant 
 93:     ST  3,-5(1)	Store parameter 
*                       Jump to sum
 94:    LDA  1,-2(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-45(7)	CALL sum
 97:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
* EXPRESSION
*                       Begin call to  output
 98:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  sum
 99:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
100:    LDC  3,0(6)	Load Boolean constant 
101:     ST  3,-6(1)	Store parameter 
*                       Load param 2
102:    LDC  3,0(6)	Load integer constant 
103:     ST  3,-7(1)	Store parameter 
*                       Jump to sum
104:    LDA  1,-4(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-55(7)	CALL sum
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
108:     ST  3,-4(1)	Store parameter 
*                       Jump to output
109:    LDA  1,-2(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
113:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
114:     LD  3,-2(0)	Load variable runningSum
115:     ST  3,-4(1)	Store parameter 
*                       Jump to output
116:    LDA  1,-2(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-113(7)	CALL output
119:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
120:    LDC  2,0(6)	Set return value to 0 
121:     LD  3,-1(1)	Load return address 
122:     LD  1,0(1)	Adjust fp 
123:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,123(7)	Jump to init [backpatch] 
* INIT
124:     LD  0,0(0)	Set the global pointer 
125:    LDA  1,-105(0)	set first frame at end of globals 
126:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
127:    LDC  3,100(6)	load size of array x
128:     ST  3,-3(0)	save size of array x
* END INIT GLOBALS AND STATICS
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-61(7)	Jump to main 
131:   HALT  0,0,0	DONE! 
* END INIT
