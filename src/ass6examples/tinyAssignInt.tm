* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyAssignInt.c-
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
* FUNCTION esperanza
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,10(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* EXPRESSION
 45:    LDC  3,111(6)	Load integer constant 
 46:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 48:     LD  3,0(0)	Load variable gx
 49:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 50:    LDA  1,-16(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 54:    LDC  3,9(6)	Load integer constant 
 55:     ST  3,-16(1)	Save index 
 56:    LDC  3,222(6)	Load integer constant 
 57:     LD  4,-16(1)	Restore index 
 58:    LDA  5,-2(0)	Load address of base of array gy
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
 61:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 62:    LDC  3,9(6)	Load integer constant 
 63:    LDA  4,-2(0)	Load address of base of array gy
 64:    SUB  3,4,3	Compute offset of value 
 65:     LD  3,0(3)	Load the value 
 66:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 67:    LDA  1,-16(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-64(7)	CALL output
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 71:    LDC  3,333(6)	Load integer constant 
 72:     ST  3,-4(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
 73:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 74:     LD  3,-4(1)	Load variable x
 75:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 76:    LDA  1,-16(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 80:    LDC  3,9(6)	Load integer constant 
 81:     ST  3,-16(1)	Save index 
 82:    LDC  3,444(6)	Load integer constant 
 83:     LD  4,-16(1)	Restore index 
 84:    LDA  5,-6(1)	Load address of base of array y
 85:    SUB  5,5,4	Compute offset of value 
 86:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDC  3,9(6)	Load integer constant 
 89:    LDA  4,-6(1)	Load address of base of array y
 90:    SUB  3,4,3	Compute offset of value 
 91:     LD  3,0(3)	Load the value 
 92:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-16(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 97:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
 98:    LDA  1,-16(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-64(7)	CALL outnl
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
102:    LDC  3,555(6)	Load integer constant 
103:     ST  3,-2(1)	Store variable px
* EXPRESSION
*                       Begin call to  output
104:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
105:     LD  3,-2(1)	Load variable px
106:     ST  3,-18(1)	Store parameter 
*                       Jump to output
107:    LDA  1,-16(1)	Load address of new frame 
108:    LDA  3,1(7)	Return address in ac 
109:    LDA  7,-104(7)	CALL output
110:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
111:    LDC  3,9(6)	Load integer constant 
112:     ST  3,-16(1)	Save index 
113:    LDC  3,666(6)	Load integer constant 
114:     LD  4,-16(1)	Restore index 
115:     LD  5,-3(1)	Load address of base of array py
116:    SUB  5,5,4	Compute offset of value 
117:     ST  3,0(5)	Store variable py
* EXPRESSION
*                       Begin call to  output
118:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
119:    LDC  3,9(6)	Load integer constant 
120:     LD  4,-3(1)	Load address of base of array py
121:    SUB  3,4,3	Compute offset of value 
122:     LD  3,0(3)	Load the value 
123:     ST  3,-18(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-16(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
128:    LDC  3,777(6)	Load integer constant 
129:     ST  3,-12(0)	Store variable sx
* EXPRESSION
*                       Begin call to  output
130:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
131:     LD  3,-12(0)	Load variable sx
132:     ST  3,-18(1)	Store parameter 
*                       Jump to output
133:    LDA  1,-16(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
137:    LDC  3,9(6)	Load integer constant 
138:     ST  3,-16(1)	Save index 
139:    LDC  3,888(6)	Load integer constant 
140:     LD  4,-16(1)	Restore index 
141:    LDA  5,-14(0)	Load address of base of array sy
142:    SUB  5,5,4	Compute offset of value 
143:     ST  3,0(5)	Store variable sy
* EXPRESSION
*                       Begin call to  output
144:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
145:    LDC  3,9(6)	Load integer constant 
146:    LDA  4,-14(0)	Load address of base of array sy
147:    SUB  3,4,3	Compute offset of value 
148:     LD  3,0(3)	Load the value 
149:     ST  3,-18(1)	Store parameter 
*                       Jump to output
150:    LDA  1,-16(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-147(7)	CALL output
153:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
154:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
155:    LDA  1,-16(1)	Load address of new frame 
156:    LDA  3,1(7)	Return address in ac 
157:    LDA  7,-121(7)	CALL outnl
158:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
159:    LDC  2,0(6)	Set return value to 0 
160:     LD  3,-1(1)	Load return address 
161:     LD  1,0(1)	Adjust fp 
162:    LDA  7,0(3)	Return 
* END FUNCTION esperanza
* FUNCTION main
163:     ST  3,-1(1)	Store return address. 
* COMPOUND
164:    LDC  3,10(6)	load size of array zy
165:     ST  3,-3(1)	save size of array zy
* EXPRESSION
*                       Begin call to  esperanza
166:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
167:     LD  3,-2(1)	Load variable zx
168:     ST  3,-16(1)	Store parameter 
*                       Load param 2
169:    LDA  3,-4(1)	Load address of base of array zy
170:     ST  3,-17(1)	Store parameter 
*                       Jump to esperanza
171:    LDA  1,-14(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-132(7)	CALL esperanza
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to esperanza
* END COMPOUND
* Add standard closing in case there is no return statement
175:    LDC  2,0(6)	Set return value to 0 
176:     LD  3,-1(1)	Load return address 
177:     LD  1,0(1)	Adjust fp 
178:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,178(7)	Jump to init [backpatch] 
* INIT
179:     LD  0,0(0)	Set the global pointer 
180:    LDA  1,-24(0)	set first frame at end of globals 
181:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
182:    LDC  3,10(6)	load size of array gy
183:     ST  3,-1(0)	save size of array gy
184:    LDC  3,10(6)	load size of array sy-2
185:     ST  3,-13(0)	save size of array sy-2
* END INIT GLOBALS AND STATICS
186:    LDA  3,1(7)	Return address in ac 
187:    LDA  7,-25(7)	Jump to main 
188:   HALT  0,0,0	DONE! 
* END INIT
