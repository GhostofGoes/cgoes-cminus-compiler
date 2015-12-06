* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  array0.c-
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
* FUNCTION show
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-3(1)	Load variable n
 45:     LD  4,-2(1)	Load address of base of array z
 46:    SUB  3,4,3	Compute offset of value 
 47:     LD  3,0(3)	Load the value 
 48:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 49:    LDA  1,-4(1)	Load address of new frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    LDA  7,-46(7)	CALL output
 52:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
 53:     LD  3,-3(1)	Load variable n
 54:     LD  4,-2(1)	Load address of base of array z
 55:    SUB  3,4,3	Compute offset of value 
 56:     LD  3,0(3)	Load the value 
 57:    LDA  2,0(3)	Copy result to rt register 
 58:     LD  3,-1(1)	Load return address 
 59:     LD  1,0(1)	Adjust fp 
 60:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 61:    LDC  2,0(6)	Set return value to 0 
 62:     LD  3,-1(1)	Load return address 
 63:     LD  1,0(1)	Adjust fp 
 64:    LDA  7,0(3)	Return 
* END FUNCTION show
* FUNCTION main
 65:     ST  3,-1(1)	Store return address. 
* COMPOUND
 66:    LDC  3,4(6)	load size of array a
 67:     ST  3,-2(1)	save size of array a
* EXPRESSION
 68:    LDC  3,1(6)	Load integer constant 
 69:     ST  3,-7(1)	Save index 
 70:    LDC  3,666(6)	Load integer constant 
 71:     LD  4,-7(1)	Restore index 
 72:    LDA  5,-1(0)	Load address of base of array g
 73:    SUB  5,5,4	Compute offset of value 
 74:     ST  3,0(5)	Store variable g
* EXPRESSION
 75:    LDC  3,1(6)	Load integer constant 
 76:     ST  3,-7(1)	Save index 
 77:    LDC  3,777(6)	Load integer constant 
 78:     LD  4,-7(1)	Restore index 
 79:    LDA  5,-3(1)	Load address of base of array a
 80:    SUB  5,5,4	Compute offset of value 
 81:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  output
 82:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 83:    LDC  3,1(6)	Load integer constant 
 84:    LDA  4,-3(1)	Load address of base of array a
 85:    SUB  3,4,3	Compute offset of value 
 86:     LD  3,0(3)	Load the value 
 87:     ST  3,-9(1)	Store parameter 
*                       Jump to output
 88:    LDA  1,-7(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-85(7)	CALL output
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 92:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 93:    LDC  3,1(6)	Load integer constant 
 94:    LDA  4,-1(0)	Load address of base of array g
 95:    SUB  3,4,3	Compute offset of value 
 96:     LD  3,0(3)	Load the value 
 97:     ST  3,-9(1)	Store parameter 
*                       Jump to output
 98:    LDA  1,-7(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
102:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
103:    LDA  1,-7(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-69(7)	CALL outnl
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  show
107:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
108:    LDA  3,-3(1)	Load address of base of array a
109:     ST  3,-9(1)	Store parameter 
*                       Load param 2
110:    LDC  3,1(6)	Load integer constant 
111:     ST  3,-10(1)	Store parameter 
*                       Jump to show
112:    LDA  1,-7(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-73(7)	CALL show
115:    LDA  3,0(2)	Save the result in ac 
*                       End call to show
* EXPRESSION
*                       Begin call to  show
116:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
117:    LDA  3,-1(0)	Load address of base of array g
118:     ST  3,-9(1)	Store parameter 
*                       Load param 2
119:    LDC  3,1(6)	Load integer constant 
120:     ST  3,-10(1)	Store parameter 
*                       Jump to show
121:    LDA  1,-7(1)	Load address of new frame 
122:    LDA  3,1(7)	Return address in ac 
123:    LDA  7,-82(7)	CALL show
124:    LDA  3,0(2)	Save the result in ac 
*                       End call to show
* EXPRESSION
*                       Begin call to  outnl
125:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
126:    LDA  1,-7(1)	Load address of new frame 
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-92(7)	CALL outnl
129:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
130:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  show
131:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
132:    LDA  3,-3(1)	Load address of base of array a
133:     ST  3,-11(1)	Store parameter 
*                       Load param 2
134:    LDC  3,1(6)	Load integer constant 
135:     ST  3,-12(1)	Store parameter 
*                       Jump to show
136:    LDA  1,-9(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-97(7)	CALL show
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to show
140:     ST  3,-9(1)	Store parameter 
*                       Jump to output
141:    LDA  1,-7(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-138(7)	CALL output
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
145:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  show
146:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
147:    LDA  3,-1(0)	Load address of base of array g
148:     ST  3,-11(1)	Store parameter 
*                       Load param 2
149:    LDC  3,1(6)	Load integer constant 
150:     ST  3,-12(1)	Store parameter 
*                       Jump to show
151:    LDA  1,-9(1)	Load address of new frame 
152:    LDA  3,1(7)	Return address in ac 
153:    LDA  7,-112(7)	CALL show
154:    LDA  3,0(2)	Save the result in ac 
*                       End call to show
155:     ST  3,-9(1)	Store parameter 
*                       Jump to output
156:    LDA  1,-7(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-153(7)	CALL output
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
160:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
161:    LDA  1,-7(1)	Load address of new frame 
162:    LDA  3,1(7)	Return address in ac 
163:    LDA  7,-127(7)	CALL outnl
164:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
165:    LDC  3,1(6)	Load integer constant 
166:     ST  3,-7(1)	Save index 
167:    LDC  3,4(6)	Load integer constant 
168:     LD  4,-7(1)	Restore index 
169:    LDA  5,-1(0)	Load address of base of array g
170:    SUB  5,5,4	Compute offset of value 
171:     LD  4,0(5)	load lhs variable g
172:    ADD  3,4,3	op += 
173:     ST  3,0(5)	Store variable g
* EXPRESSION
174:    LDC  3,1(6)	Load integer constant 
175:     ST  3,-7(1)	Save index 
176:    LDC  3,3(6)	Load integer constant 
177:     LD  4,-7(1)	Restore index 
178:    LDA  5,-3(1)	Load address of base of array a
179:    SUB  5,5,4	Compute offset of value 
180:     LD  4,0(5)	load lhs variable a
181:    ADD  3,4,3	op += 
182:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  output
183:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
184:    LDC  3,1(6)	Load integer constant 
185:    LDA  4,-3(1)	Load address of base of array a
186:    SUB  3,4,3	Compute offset of value 
187:     LD  3,0(3)	Load the value 
188:     ST  3,-9(1)	Store parameter 
*                       Jump to output
189:    LDA  1,-7(1)	Load address of new frame 
190:    LDA  3,1(7)	Return address in ac 
191:    LDA  7,-186(7)	CALL output
192:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
193:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
194:    LDC  3,1(6)	Load integer constant 
195:    LDA  4,-1(0)	Load address of base of array g
196:    SUB  3,4,3	Compute offset of value 
197:     LD  3,0(3)	Load the value 
198:     ST  3,-9(1)	Store parameter 
*                       Jump to output
199:    LDA  1,-7(1)	Load address of new frame 
200:    LDA  3,1(7)	Return address in ac 
201:    LDA  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
203:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
204:    LDA  1,-7(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-170(7)	CALL outnl
207:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
208:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
209:    LDC  3,1(6)	Load integer constant 
210:     ST  3,-9(1)	Save index 
211:    LDC  3,100(6)	Load integer constant 
212:     LD  4,-9(1)	Restore index 
213:    LDA  5,-3(1)	Load address of base of array a
214:    SUB  5,5,4	Compute offset of value 
215:     LD  4,0(5)	load lhs variable a
216:    ADD  3,4,3	op += 
217:     ST  3,0(5)	Store variable a
218:     ST  3,-9(1)	Store parameter 
*                       Jump to output
219:    LDA  1,-7(1)	Load address of new frame 
220:    LDA  3,1(7)	Return address in ac 
221:    LDA  7,-216(7)	CALL output
222:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
223:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
224:    LDC  3,1(6)	Load integer constant 
225:     ST  3,-9(1)	Save index 
226:    LDC  3,100(6)	Load integer constant 
227:     LD  4,-9(1)	Restore index 
228:    LDA  5,-1(0)	Load address of base of array g
229:    SUB  5,5,4	Compute offset of value 
230:     LD  4,0(5)	load lhs variable g
231:    ADD  3,4,3	op += 
232:     ST  3,0(5)	Store variable g
233:     ST  3,-9(1)	Store parameter 
*                       Jump to output
234:    LDA  1,-7(1)	Load address of new frame 
235:    LDA  3,1(7)	Return address in ac 
236:    LDA  7,-231(7)	CALL output
237:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
238:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
239:    LDA  1,-7(1)	Load address of new frame 
240:    LDA  3,1(7)	Return address in ac 
241:    LDA  7,-205(7)	CALL outnl
242:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
243:    LDC  2,0(6)	Set return value to 0 
244:     LD  3,-1(1)	Load return address 
245:     LD  1,0(1)	Adjust fp 
246:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,246(7)	Jump to init [backpatch] 
* INIT
247:     LD  0,0(0)	Set the global pointer 
248:    LDA  1,-5(0)	set first frame at end of globals 
249:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
250:    LDC  3,4(6)	load size of array g
251:     ST  3,0(0)	save size of array g
* END INIT GLOBALS AND STATICS
252:    LDA  3,1(7)	Return address in ac 
253:    LDA  7,-189(7)	Jump to main 
254:   HALT  0,0,0	DONE! 
* END INIT
