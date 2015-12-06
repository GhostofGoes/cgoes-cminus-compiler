* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  c0h.c-
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
* FUNCTION dog
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,3(6)	Load integer constant 
 45:     LD  5,-2(1)	Load address of base of array x
 46:    SUB  5,5,3	Compute offset of value 
 47:     LD  3,0(5)	load lhs variable x
 48:    LDA  3,1(3)	increment value of x
 49:     ST  3,0(5)	Store variable x
 50:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 55:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 56:    LDA  1,-3(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 60:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 61:    LDC  3,3(6)	Load integer constant 
 62:     LD  4,-2(1)	Load address of base of array x
 63:    SUB  3,4,3	Compute offset of value 
 64:     LD  3,0(3)	Load the value 
 65:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 66:    LDA  1,-3(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 70:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 71:    LDA  1,-3(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-37(7)	CALL outnl
 74:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 75:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 76:    LDC  3,3(6)	Load integer constant 
 77:     LD  5,-2(1)	Load address of base of array x
 78:    SUB  5,5,3	Compute offset of value 
 79:     LD  3,0(5)	load lhs variable x
 80:    LDA  3,-1(3)	decrement value of x
 81:     ST  3,0(5)	Store variable x
 82:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 83:    LDA  1,-3(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 87:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 88:    LDA  1,-3(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-54(7)	CALL outnl
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 92:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 93:    LDC  3,3(6)	Load integer constant 
 94:     LD  4,-2(1)	Load address of base of array x
 95:    SUB  3,4,3	Compute offset of value 
 96:     LD  3,0(3)	Load the value 
 97:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 98:    LDA  1,-3(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
102:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
103:    LDA  1,-3(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-69(7)	CALL outnl
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
107:    LDC  2,0(6)	Set return value to 0 
108:     LD  3,-1(1)	Load return address 
109:     LD  1,0(1)	Adjust fp 
110:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION main
111:     ST  3,-1(1)	Store return address. 
* COMPOUND
112:    LDC  3,7(6)	load size of array x
113:     ST  3,-2(1)	save size of array x
* EXPRESSION
114:    LDC  3,3(6)	Load integer constant 
115:     ST  3,-10(1)	Save index 
116:    LDC  3,1023(6)	Load integer constant 
117:     LD  4,-10(1)	Restore index 
118:    LDA  5,-3(1)	Load address of base of array x
119:    SUB  5,5,4	Compute offset of value 
120:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  dog
121:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
122:    LDA  3,-3(1)	Load address of base of array x
123:     ST  3,-12(1)	Store parameter 
*                       Jump to dog
124:    LDA  1,-10(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-85(7)	CALL dog
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
128:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
129:    LDC  3,3(6)	Load integer constant 
130:    LDA  4,-3(1)	Load address of base of array x
131:    SUB  3,4,3	Compute offset of value 
132:     LD  3,0(3)	Load the value 
133:     ST  3,-12(1)	Store parameter 
*                       Jump to output
134:    LDA  1,-10(1)	Load address of new frame 
135:    LDA  3,1(7)	Return address in ac 
136:    LDA  7,-131(7)	CALL output
137:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
138:    LDC  2,0(6)	Set return value to 0 
139:     LD  3,-1(1)	Load return address 
140:     LD  1,0(1)	Adjust fp 
141:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,141(7)	Jump to init [backpatch] 
* INIT
142:     LD  0,0(0)	Set the global pointer 
143:    LDA  1,0(0)	set first frame at end of globals 
144:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-36(7)	Jump to main 
147:   HALT  0,0,0	DONE! 
* END INIT
