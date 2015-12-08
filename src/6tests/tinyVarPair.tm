* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyVarPair.c-
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
* FUNCTION fred
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,10(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* EXPRESSION
 45:    LDC  3,111(6)	Load integer constant 
 46:     ST  3,0(0)	Store variable gx
* EXPRESSION
 47:     LD  3,0(0)	Load variable gx
 48:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
 49:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 50:     LD  3,0(0)	Load variable gx
 51:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 52:    LDA  1,-16(1)	Load address of new frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    LDA  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 56:    LDC  3,9(6)	Load integer constant 
 57:     ST  3,-16(1)	Save index 
 58:    LDC  3,222(6)	Load integer constant 
 59:     LD  4,-16(1)	Restore index 
 60:    LDA  5,-2(0)	Load address of base of array gy
 61:    SUB  5,5,4	Compute offset of value 
 62:     ST  3,0(5)	Store variable gy
* EXPRESSION
 63:    LDC  3,9(6)	Load integer constant 
 64:     ST  3,-16(1)	Save index 
 65:    LDC  3,9(6)	Load integer constant 
 66:    LDA  4,-2(0)	Load address of base of array gy
 67:    SUB  3,4,3	Compute offset of value 
 68:     LD  3,0(3)	Load the value 
 69:     LD  4,-16(1)	Restore index 
 70:    LDA  5,-2(0)	Load address of base of array gy
 71:    SUB  5,5,4	Compute offset of value 
 72:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
 73:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 74:    LDC  3,9(6)	Load integer constant 
 75:    LDA  4,-2(0)	Load address of base of array gy
 76:    SUB  3,4,3	Compute offset of value 
 77:     LD  3,0(3)	Load the value 
 78:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 79:    LDA  1,-16(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 83:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
 84:    LDA  1,-16(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-50(7)	CALL outnl
 87:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 88:    LDC  3,333(6)	Load integer constant 
 89:     ST  3,-4(1)	Store variable x
* EXPRESSION
 90:     LD  3,-4(1)	Load variable x
 91:     ST  3,-4(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
 92:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 93:     LD  3,-4(1)	Load variable x
 94:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 95:    LDA  1,-16(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-92(7)	CALL output
 98:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 99:    LDC  3,9(6)	Load integer constant 
100:     ST  3,-16(1)	Save index 
101:    LDC  3,444(6)	Load integer constant 
102:     LD  4,-16(1)	Restore index 
103:    LDA  5,-6(1)	Load address of base of array y
104:    SUB  5,5,4	Compute offset of value 
105:     ST  3,0(5)	Store variable y
* EXPRESSION
106:    LDC  3,9(6)	Load integer constant 
107:     ST  3,-16(1)	Save index 
108:    LDC  3,9(6)	Load integer constant 
109:    LDA  4,-6(1)	Load address of base of array y
110:    SUB  3,4,3	Compute offset of value 
111:     LD  3,0(3)	Load the value 
112:     LD  4,-16(1)	Restore index 
113:    LDA  5,-6(1)	Load address of base of array y
114:    SUB  5,5,4	Compute offset of value 
115:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
116:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
117:    LDC  3,9(6)	Load integer constant 
118:    LDA  4,-6(1)	Load address of base of array y
119:    SUB  3,4,3	Compute offset of value 
120:     LD  3,0(3)	Load the value 
121:     ST  3,-18(1)	Store parameter 
*                       Jump to output
122:    LDA  1,-16(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
126:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
127:    LDA  1,-16(1)	Load address of new frame 
128:    LDA  3,1(7)	Return address in ac 
129:    LDA  7,-93(7)	CALL outnl
130:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
131:    LDC  3,555(6)	Load integer constant 
132:     ST  3,-2(1)	Store variable px
* EXPRESSION
133:     LD  3,-2(1)	Load variable px
134:     ST  3,-2(1)	Store variable px
* EXPRESSION
*                       Begin call to  output
135:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
136:     LD  3,-2(1)	Load variable px
137:     ST  3,-18(1)	Store parameter 
*                       Jump to output
138:    LDA  1,-16(1)	Load address of new frame 
139:    LDA  3,1(7)	Return address in ac 
140:    LDA  7,-135(7)	CALL output
141:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
142:    LDC  3,9(6)	Load integer constant 
143:     ST  3,-16(1)	Save index 
144:    LDC  3,666(6)	Load integer constant 
145:     LD  4,-16(1)	Restore index 
146:     LD  5,-3(1)	Load address of base of array py
147:    SUB  5,5,4	Compute offset of value 
148:     ST  3,0(5)	Store variable py
* EXPRESSION
149:    LDC  3,9(6)	Load integer constant 
150:     ST  3,-16(1)	Save index 
151:    LDC  3,9(6)	Load integer constant 
152:     LD  4,-3(1)	Load address of base of array py
153:    SUB  3,4,3	Compute offset of value 
154:     LD  3,0(3)	Load the value 
155:     LD  4,-16(1)	Restore index 
156:     LD  5,-3(1)	Load address of base of array py
157:    SUB  5,5,4	Compute offset of value 
158:     ST  3,0(5)	Store variable py
* EXPRESSION
*                       Begin call to  output
159:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
160:    LDC  3,9(6)	Load integer constant 
161:     LD  4,-3(1)	Load address of base of array py
162:    SUB  3,4,3	Compute offset of value 
163:     LD  3,0(3)	Load the value 
164:     ST  3,-18(1)	Store parameter 
*                       Jump to output
165:    LDA  1,-16(1)	Load address of new frame 
166:    LDA  3,1(7)	Return address in ac 
167:    LDA  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
169:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
170:    LDA  1,-16(1)	Load address of new frame 
171:    LDA  3,1(7)	Return address in ac 
172:    LDA  7,-136(7)	CALL outnl
173:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
174:    LDC  3,777(6)	Load integer constant 
175:     ST  3,-12(0)	Store variable sx
* EXPRESSION
176:     LD  3,-12(0)	Load variable sx
177:     ST  3,-12(0)	Store variable sx
* EXPRESSION
*                       Begin call to  output
178:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
179:     LD  3,-12(0)	Load variable sx
180:     ST  3,-18(1)	Store parameter 
*                       Jump to output
181:    LDA  1,-16(1)	Load address of new frame 
182:    LDA  3,1(7)	Return address in ac 
183:    LDA  7,-178(7)	CALL output
184:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
185:    LDC  3,9(6)	Load integer constant 
186:     ST  3,-16(1)	Save index 
187:    LDC  3,888(6)	Load integer constant 
188:     LD  4,-16(1)	Restore index 
189:    LDA  5,-14(0)	Load address of base of array sy
190:    SUB  5,5,4	Compute offset of value 
191:     ST  3,0(5)	Store variable sy
* EXPRESSION
192:    LDC  3,9(6)	Load integer constant 
193:     ST  3,-16(1)	Save index 
194:    LDC  3,9(6)	Load integer constant 
195:    LDA  4,-14(0)	Load address of base of array sy
196:    SUB  3,4,3	Compute offset of value 
197:     LD  3,0(3)	Load the value 
198:     LD  4,-16(1)	Restore index 
199:    LDA  5,-14(0)	Load address of base of array sy
200:    SUB  5,5,4	Compute offset of value 
201:     ST  3,0(5)	Store variable sy
* EXPRESSION
*                       Begin call to  output
202:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
203:    LDC  3,9(6)	Load integer constant 
204:    LDA  4,-14(0)	Load address of base of array sy
205:    SUB  3,4,3	Compute offset of value 
206:     LD  3,0(3)	Load the value 
207:     ST  3,-18(1)	Store parameter 
*                       Jump to output
208:    LDA  1,-16(1)	Load address of new frame 
209:    LDA  3,1(7)	Return address in ac 
210:    LDA  7,-205(7)	CALL output
211:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
212:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
213:    LDA  1,-16(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-179(7)	CALL outnl
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
217:    LDC  2,0(6)	Set return value to 0 
218:     LD  3,-1(1)	Load return address 
219:     LD  1,0(1)	Adjust fp 
220:    LDA  7,0(3)	Return 
* END FUNCTION fred
* FUNCTION main
221:     ST  3,-1(1)	Store return address. 
* COMPOUND
222:    LDC  3,10(6)	load size of array ly
223:     ST  3,-3(1)	save size of array ly
* EXPRESSION
*                       Begin call to  fred
224:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
225:     LD  3,0(0)	Load variable gx
226:     ST  3,-16(1)	Store parameter 
*                       Load param 2
227:    LDA  3,-2(0)	Load address of base of array gy
228:     ST  3,-17(1)	Store parameter 
*                       Jump to fred
229:    LDA  1,-14(1)	Load address of new frame 
230:    LDA  3,1(7)	Return address in ac 
231:    LDA  7,-190(7)	CALL fred
232:    LDA  3,0(2)	Save the result in ac 
*                       End call to fred
* EXPRESSION
*                       Begin call to  fred
233:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
234:     LD  3,-2(1)	Load variable lx
235:     ST  3,-16(1)	Store parameter 
*                       Load param 2
236:    LDA  3,-4(1)	Load address of base of array ly
237:     ST  3,-17(1)	Store parameter 
*                       Jump to fred
238:    LDA  1,-14(1)	Load address of new frame 
239:    LDA  3,1(7)	Return address in ac 
240:    LDA  7,-199(7)	CALL fred
241:    LDA  3,0(2)	Save the result in ac 
*                       End call to fred
* END COMPOUND
* Add standard closing in case there is no return statement
242:    LDC  2,0(6)	Set return value to 0 
243:     LD  3,-1(1)	Load return address 
244:     LD  1,0(1)	Adjust fp 
245:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,245(7)	Jump to init [backpatch] 
* INIT
246:     LD  0,0(0)	Set the global pointer 
247:    LDA  1,-24(0)	set first frame at end of globals 
248:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
249:    LDC  3,10(6)	load size of array gy
250:     ST  3,-1(0)	save size of array gy
251:    LDC  3,10(6)	load size of array sy-2
252:     ST  3,-13(0)	save size of array sy-2
* END INIT GLOBALS AND STATICS
253:    LDA  3,1(7)	Return address in ac 
254:    LDA  7,-34(7)	Jump to main 
255:   HALT  0,0,0	DONE! 
* END INIT
