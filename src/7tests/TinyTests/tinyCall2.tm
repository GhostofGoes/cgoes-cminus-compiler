* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyCall2.c-
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
* FUNCTION three
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,7(6)	Load integer constant 
 45:     LD  4,-2(1)	Load address of base of array z
 46:    SUB  3,4,3	Compute offset of value 
 47:     LD  3,0(3)	Load the value 
 48:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 49:    LDA  1,-3(1)	Load address of new frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    LDA  7,-46(7)	CALL output
 52:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 53:    LDC  3,7(6)	Load integer constant 
 54:     ST  3,-3(1)	Save index 
 55:    LDC  3,666(6)	Load integer constant 
 56:     LD  4,-3(1)	Restore index 
 57:     LD  5,-2(1)	Load address of base of array z
 58:    SUB  5,5,4	Compute offset of value 
 59:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  outnl
 60:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 61:    LDA  1,-3(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-27(7)	CALL outnl
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 65:    LDC  2,0(6)	Set return value to 0 
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust fp 
 68:    LDA  7,0(3)	Return 
* END FUNCTION three
* FUNCTION two
 69:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 70:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 71:    LDC  3,7(6)	Load integer constant 
 72:     LD  4,-2(1)	Load address of base of array y
 73:    SUB  3,4,3	Compute offset of value 
 74:     LD  3,0(3)	Load the value 
 75:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 76:    LDA  1,-3(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  three
 80:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 81:     LD  3,-2(1)	Load address of base of array y
 82:     ST  3,-5(1)	Store parameter 
*                       Jump to three
 83:    LDA  1,-3(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-44(7)	CALL three
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to three
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDC  3,7(6)	Load integer constant 
 89:     LD  4,-2(1)	Load address of base of array y
 90:    SUB  3,4,3	Compute offset of value 
 91:     LD  3,0(3)	Load the value 
 92:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-3(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust fp 
100:    LDA  7,0(3)	Return 
* END FUNCTION two
* FUNCTION one
101:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
102:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
103:    LDC  3,7(6)	Load integer constant 
104:     LD  4,-2(1)	Load address of base of array x
105:    SUB  3,4,3	Compute offset of value 
106:     LD  3,0(3)	Load the value 
107:     ST  3,-5(1)	Store parameter 
*                       Jump to output
108:    LDA  1,-3(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-105(7)	CALL output
111:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  two
112:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
113:     LD  3,-2(1)	Load address of base of array x
114:     ST  3,-5(1)	Store parameter 
*                       Jump to two
115:    LDA  1,-3(1)	Load address of new frame 
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-49(7)	CALL two
118:    LDA  3,0(2)	Save the result in ac 
*                       End call to two
* EXPRESSION
*                       Begin call to  output
119:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
120:    LDC  3,7(6)	Load integer constant 
121:     LD  4,-2(1)	Load address of base of array x
122:    SUB  3,4,3	Compute offset of value 
123:     LD  3,0(3)	Load the value 
124:     ST  3,-5(1)	Store parameter 
*                       Jump to output
125:    LDA  1,-3(1)	Load address of new frame 
126:    LDA  3,1(7)	Return address in ac 
127:    LDA  7,-122(7)	CALL output
128:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
129:    LDC  2,0(6)	Set return value to 0 
130:     LD  3,-1(1)	Load return address 
131:     LD  1,0(1)	Adjust fp 
132:    LDA  7,0(3)	Return 
* END FUNCTION one
* FUNCTION main
133:     ST  3,-1(1)	Store return address. 
* COMPOUND
134:    LDC  3,10(6)	load size of array w
135:     ST  3,-2(1)	save size of array w
* EXPRESSION
136:    LDC  3,7(6)	Load integer constant 
137:     ST  3,-13(1)	Save index 
138:    LDC  3,42(6)	Load integer constant 
139:     LD  4,-13(1)	Restore index 
140:    LDA  5,-3(1)	Load address of base of array w
141:    SUB  5,5,4	Compute offset of value 
142:     ST  3,0(5)	Store variable w
* EXPRESSION
*                       Begin call to  one
143:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
144:    LDA  3,-3(1)	Load address of base of array w
145:     ST  3,-15(1)	Store parameter 
*                       Jump to one
146:    LDA  1,-13(1)	Load address of new frame 
147:    LDA  3,1(7)	Return address in ac 
148:    LDA  7,-48(7)	CALL one
149:    LDA  3,0(2)	Save the result in ac 
*                       End call to one
* EXPRESSION
*                       Begin call to  output
150:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
151:    LDC  3,7(6)	Load integer constant 
152:    LDA  4,-3(1)	Load address of base of array w
153:    SUB  3,4,3	Compute offset of value 
154:     LD  3,0(3)	Load the value 
155:     ST  3,-15(1)	Store parameter 
*                       Jump to output
156:    LDA  1,-13(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-153(7)	CALL output
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
160:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Jump to outnl
161:    LDA  1,-13(1)	Load address of new frame 
162:    LDA  3,1(7)	Return address in ac 
163:    LDA  7,-127(7)	CALL outnl
164:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
165:    LDC  2,0(6)	Set return value to 0 
166:     LD  3,-1(1)	Load return address 
167:     LD  1,0(1)	Adjust fp 
168:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,168(7)	Jump to init [backpatch] 
* INIT
169:     LD  0,0(0)	Set the global pointer 
170:    LDA  1,0(0)	set first frame at end of globals 
171:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-41(7)	Jump to main 
174:   HALT  0,0,0	DONE! 
* END INIT
