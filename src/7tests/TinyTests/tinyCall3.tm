* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyCall3.c-
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
* RETURN
 65:    LDC  3,7(6)	Load integer constant 
 66:     LD  4,-2(1)	Load address of base of array z
 67:    SUB  3,4,3	Compute offset of value 
 68:     LD  3,0(3)	Load the value 
 69:    LDA  2,0(3)	Copy result to rt register 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 73:    LDC  2,0(6)	Set return value to 0 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    LDA  7,0(3)	Return 
* END FUNCTION three
* FUNCTION two
 77:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 78:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 79:    LDC  3,7(6)	Load integer constant 
 80:     LD  4,-2(1)	Load address of base of array y
 81:    SUB  3,4,3	Compute offset of value 
 82:     LD  3,0(3)	Load the value 
 83:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 84:    LDA  1,-3(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-81(7)	CALL output
 87:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  three
 88:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 89:     LD  3,-2(1)	Load address of base of array y
 90:     ST  3,-5(1)	Store parameter 
*                       Jump to three
 91:    LDA  1,-3(1)	Load address of new frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-52(7)	CALL three
 94:    LDA  3,0(2)	Save the result in ac 
*                       End call to three
* EXPRESSION
*                       Begin call to  output
 95:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 96:    LDC  3,7(6)	Load integer constant 
 97:     LD  4,-2(1)	Load address of base of array y
 98:    SUB  3,4,3	Compute offset of value 
 99:     LD  3,0(3)	Load the value 
100:     ST  3,-5(1)	Store parameter 
*                       Jump to output
101:    LDA  1,-3(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-98(7)	CALL output
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
105:    LDC  3,7(6)	Load integer constant 
106:     LD  4,-2(1)	Load address of base of array y
107:    SUB  3,4,3	Compute offset of value 
108:     LD  3,0(3)	Load the value 
109:    LDA  2,0(3)	Copy result to rt register 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
113:    LDC  2,0(6)	Set return value to 0 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    LDA  7,0(3)	Return 
* END FUNCTION two
* FUNCTION one
117:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
118:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
119:    LDC  3,7(6)	Load integer constant 
120:     LD  4,-2(1)	Load address of base of array x
121:    SUB  3,4,3	Compute offset of value 
122:     LD  3,0(3)	Load the value 
123:     ST  3,-5(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-3(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  two
128:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
129:     LD  3,-2(1)	Load address of base of array x
130:     ST  3,-5(1)	Store parameter 
*                       Jump to two
131:    LDA  1,-3(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-57(7)	CALL two
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to two
* EXPRESSION
*                       Begin call to  output
135:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
136:    LDC  3,7(6)	Load integer constant 
137:     LD  4,-2(1)	Load address of base of array x
138:    SUB  3,4,3	Compute offset of value 
139:     LD  3,0(3)	Load the value 
140:     ST  3,-5(1)	Store parameter 
*                       Jump to output
141:    LDA  1,-3(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-138(7)	CALL output
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
145:    LDC  3,7(6)	Load integer constant 
146:     LD  4,-2(1)	Load address of base of array x
147:    SUB  3,4,3	Compute offset of value 
148:     LD  3,0(3)	Load the value 
149:    LDA  2,0(3)	Copy result to rt register 
150:     LD  3,-1(1)	Load return address 
151:     LD  1,0(1)	Adjust fp 
152:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
153:    LDC  2,0(6)	Set return value to 0 
154:     LD  3,-1(1)	Load return address 
155:     LD  1,0(1)	Adjust fp 
156:    LDA  7,0(3)	Return 
* END FUNCTION one
* FUNCTION main
157:     ST  3,-1(1)	Store return address. 
* COMPOUND
158:    LDC  3,10(6)	load size of array w
159:     ST  3,-2(1)	save size of array w
* EXPRESSION
160:    LDC  3,7(6)	Load integer constant 
161:     ST  3,-13(1)	Save index 
162:    LDC  3,42(6)	Load integer constant 
163:     LD  4,-13(1)	Restore index 
164:    LDA  5,-3(1)	Load address of base of array w
165:    SUB  5,5,4	Compute offset of value 
166:     ST  3,0(5)	Store variable w
* EXPRESSION
*                       Begin call to  output
167:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  one
168:     ST  1,-15(1)	Store old fp in ghost frame 
*                       Load param 1
169:    LDA  3,-3(1)	Load address of base of array w
170:     ST  3,-17(1)	Store parameter 
*                       Jump to one
171:    LDA  1,-15(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-57(7)	CALL one
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to one
175:     ST  3,-15(1)	Store parameter 
*                       Jump to output
176:    LDA  1,-13(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
180:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
181:    LDC  3,7(6)	Load integer constant 
182:    LDA  4,-3(1)	Load address of base of array w
183:    SUB  3,4,3	Compute offset of value 
184:     LD  3,0(3)	Load the value 
185:     ST  3,-15(1)	Store parameter 
*                       Jump to output
186:    LDA  1,-13(1)	Load address of new frame 
187:    LDA  3,1(7)	Return address in ac 
188:    LDA  7,-183(7)	CALL output
189:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
190:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Jump to outnl
191:    LDA  1,-13(1)	Load address of new frame 
192:    LDA  3,1(7)	Return address in ac 
193:    LDA  7,-157(7)	CALL outnl
194:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
195:    LDC  2,0(6)	Set return value to 0 
196:     LD  3,-1(1)	Load return address 
197:     LD  1,0(1)	Adjust fp 
198:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,198(7)	Jump to init [backpatch] 
* INIT
199:     LD  0,0(0)	Set the global pointer 
200:    LDA  1,0(0)	set first frame at end of globals 
201:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
202:    LDA  3,1(7)	Return address in ac 
203:    LDA  7,-47(7)	Jump to main 
204:   HALT  0,0,0	DONE! 
* END INIT
