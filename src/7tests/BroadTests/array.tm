* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  array.c-
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
* FUNCTION get
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,0(6)	Load integer constant 
 45:     LD  4,-2(1)	Load address of base of array x
 46:    SUB  3,4,3	Compute offset of value 
 47:     LD  3,0(3)	Load the value 
 48:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 49:    LDA  1,-4(1)	Load address of new frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    LDA  7,-46(7)	CALL output
 52:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 53:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 54:    LDA  1,-4(1)	Load address of new frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    LDA  7,-20(7)	CALL outnl
 57:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 58:    LDC  3,1(6)	Load integer constant 
 59:     ST  3,-4(1)	Save index 
 60:    LDC  3,666(6)	Load integer constant 
 61:     LD  4,-4(1)	Restore index 
 62:     LD  5,-2(1)	Load address of base of array x
 63:    SUB  5,5,4	Compute offset of value 
 64:     ST  3,0(5)	Store variable x
* RETURN
 65:     LD  3,-3(1)	Load variable i
 66:     LD  4,-2(1)	Load address of base of array x
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
* END FUNCTION get
* FUNCTION main
 77:     ST  3,-1(1)	Store return address. 
* COMPOUND
 78:    LDC  3,5(6)	load size of array x
 79:     ST  3,-2(1)	save size of array x
* EXPRESSION
 80:    LDC  3,2(6)	Load integer constant 
 81:     ST  3,-8(1)	Store variable dog
* EXPRESSION
 82:    LDC  3,0(6)	Load integer constant 
 83:     ST  3,-9(1)	Save index 
 84:    LDC  3,3(6)	Load integer constant 
 85:     LD  4,-9(1)	Restore index 
 86:    LDA  5,-3(1)	Load address of base of array x
 87:    SUB  5,5,4	Compute offset of value 
 88:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 89:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
 90:    LDC  3,0(6)	Load integer constant 
 91:    LDA  4,-3(1)	Load address of base of array x
 92:    SUB  3,4,3	Compute offset of value 
 93:     LD  3,0(3)	Load the value 
 94:     ST  3,-11(1)	Store parameter 
*                       Jump to output
 95:    LDA  1,-9(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-92(7)	CALL output
 98:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 99:    LDC  3,1(6)	Load integer constant 
100:     ST  3,-9(1)	Save index 
101:    LDC  3,0(6)	Load integer constant 
102:    LDA  4,-3(1)	Load address of base of array x
103:    SUB  3,4,3	Compute offset of value 
104:     LD  3,0(3)	Load the value 
105:     LD  4,-9(1)	Restore index 
106:    LDA  5,-3(1)	Load address of base of array x
107:    SUB  5,5,4	Compute offset of value 
108:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
109:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
110:    LDC  3,1(6)	Load integer constant 
111:    LDA  4,-3(1)	Load address of base of array x
112:    SUB  3,4,3	Compute offset of value 
113:     LD  3,0(3)	Load the value 
114:     ST  3,-11(1)	Store parameter 
*                       Jump to output
115:    LDA  1,-9(1)	Load address of new frame 
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-112(7)	CALL output
118:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
119:    LDC  3,2(6)	Load integer constant 
120:     ST  3,-9(1)	Save index 
121:    LDC  3,1(6)	Load integer constant 
122:    LDA  4,-3(1)	Load address of base of array x
123:    SUB  3,4,3	Compute offset of value 
124:     LD  3,0(3)	Load the value 
125:     ST  3,-10(1)	Save left side 
126:    LDC  3,1(6)	Load integer constant 
127:     LD  4,-10(1)	Load left into ac1 
128:    ADD  3,4,3	Op + 
129:     LD  4,-9(1)	Restore index 
130:    LDA  5,-3(1)	Load address of base of array x
131:    SUB  5,5,4	Compute offset of value 
132:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
133:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
134:    LDC  3,2(6)	Load integer constant 
135:    LDA  4,-3(1)	Load address of base of array x
136:    SUB  3,4,3	Compute offset of value 
137:     LD  3,0(3)	Load the value 
138:     ST  3,-11(1)	Store parameter 
*                       Jump to output
139:    LDA  1,-9(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-136(7)	CALL output
142:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
143:     LD  3,-8(1)	Load variable dog
144:     ST  3,-9(1)	Save left side 
145:     LD  3,-8(1)	Load variable dog
146:     LD  4,-9(1)	Load left into ac1 
147:    ADD  3,4,3	Op + 
148:     ST  3,-9(1)	Save index 
149:    LDC  3,496(6)	Load integer constant 
150:     LD  4,-9(1)	Restore index 
151:    LDA  5,-3(1)	Load address of base of array x
152:    SUB  5,5,4	Compute offset of value 
153:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
154:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
155:    LDC  3,4(6)	Load integer constant 
156:    LDA  4,-3(1)	Load address of base of array x
157:    SUB  3,4,3	Compute offset of value 
158:     LD  3,0(3)	Load the value 
159:     ST  3,-11(1)	Store parameter 
*                       Jump to output
160:    LDA  1,-9(1)	Load address of new frame 
161:    LDA  3,1(7)	Return address in ac 
162:    LDA  7,-157(7)	CALL output
163:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
164:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Jump to outnl
165:    LDA  1,-9(1)	Load address of new frame 
166:    LDA  3,1(7)	Return address in ac 
167:    LDA  7,-131(7)	CALL outnl
168:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
169:    LDC  3,2(6)	Load integer constant 
170:     ST  3,-8(1)	Store variable dog
* EXPRESSION
171:    LDC  3,0(6)	Load integer constant 
172:     ST  3,-9(1)	Save index 
173:    LDC  3,3(6)	Load integer constant 
174:     LD  4,-9(1)	Restore index 
175:    LDA  5,-1(0)	Load address of base of array y
176:    SUB  5,5,4	Compute offset of value 
177:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
178:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
179:    LDC  3,0(6)	Load integer constant 
180:    LDA  4,-1(0)	Load address of base of array y
181:    SUB  3,4,3	Compute offset of value 
182:     LD  3,0(3)	Load the value 
183:     ST  3,-11(1)	Store parameter 
*                       Jump to output
184:    LDA  1,-9(1)	Load address of new frame 
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-181(7)	CALL output
187:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
188:    LDC  3,1(6)	Load integer constant 
189:     ST  3,-9(1)	Save index 
190:    LDC  3,0(6)	Load integer constant 
191:    LDA  4,-1(0)	Load address of base of array y
192:    SUB  3,4,3	Compute offset of value 
193:     LD  3,0(3)	Load the value 
194:     LD  4,-9(1)	Restore index 
195:    LDA  5,-1(0)	Load address of base of array y
196:    SUB  5,5,4	Compute offset of value 
197:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
198:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
199:    LDC  3,1(6)	Load integer constant 
200:    LDA  4,-1(0)	Load address of base of array y
201:    SUB  3,4,3	Compute offset of value 
202:     LD  3,0(3)	Load the value 
203:     ST  3,-11(1)	Store parameter 
*                       Jump to output
204:    LDA  1,-9(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-201(7)	CALL output
207:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
208:    LDC  3,2(6)	Load integer constant 
209:     ST  3,-9(1)	Save index 
210:    LDC  3,1(6)	Load integer constant 
211:    LDA  4,-1(0)	Load address of base of array y
212:    SUB  3,4,3	Compute offset of value 
213:     LD  3,0(3)	Load the value 
214:     ST  3,-10(1)	Save left side 
215:    LDC  3,311(6)	Load integer constant 
216:     LD  4,-10(1)	Load left into ac1 
217:    ADD  3,4,3	Op + 
218:     LD  4,-9(1)	Restore index 
219:    LDA  5,-1(0)	Load address of base of array y
220:    SUB  5,5,4	Compute offset of value 
221:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
222:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
223:    LDC  3,2(6)	Load integer constant 
224:    LDA  4,-1(0)	Load address of base of array y
225:    SUB  3,4,3	Compute offset of value 
226:     LD  3,0(3)	Load the value 
227:     ST  3,-11(1)	Store parameter 
*                       Jump to output
228:    LDA  1,-9(1)	Load address of new frame 
229:    LDA  3,1(7)	Return address in ac 
230:    LDA  7,-225(7)	CALL output
231:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
232:     LD  3,-8(1)	Load variable dog
233:     ST  3,-9(1)	Save left side 
234:     LD  3,-8(1)	Load variable dog
235:     LD  4,-9(1)	Load left into ac1 
236:    ADD  3,4,3	Op + 
237:     ST  3,-9(1)	Save index 
238:    LDC  3,496(6)	Load integer constant 
239:     LD  4,-9(1)	Restore index 
240:    LDA  5,-1(0)	Load address of base of array y
241:    SUB  5,5,4	Compute offset of value 
242:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
243:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
244:    LDC  3,4(6)	Load integer constant 
245:    LDA  4,-1(0)	Load address of base of array y
246:    SUB  3,4,3	Compute offset of value 
247:     LD  3,0(3)	Load the value 
248:     ST  3,-11(1)	Store parameter 
*                       Jump to output
249:    LDA  1,-9(1)	Load address of new frame 
250:    LDA  3,1(7)	Return address in ac 
251:    LDA  7,-246(7)	CALL output
252:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
253:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Jump to outnl
254:    LDA  1,-9(1)	Load address of new frame 
255:    LDA  3,1(7)	Return address in ac 
256:    LDA  7,-220(7)	CALL outnl
257:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  get
258:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
259:    LDA  3,-1(0)	Load address of base of array y
260:     ST  3,-11(1)	Store parameter 
*                       Load param 2
261:    LDC  3,2(6)	Load integer constant 
262:     ST  3,-12(1)	Store parameter 
*                       Jump to get
263:    LDA  1,-9(1)	Load address of new frame 
264:    LDA  3,1(7)	Return address in ac 
265:    LDA  7,-224(7)	CALL get
266:    LDA  3,0(2)	Save the result in ac 
*                       End call to get
267:     ST  3,-8(1)	Store variable dog
* EXPRESSION
*                       Begin call to  output
268:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
269:     LD  3,-8(1)	Load variable dog
270:     ST  3,-11(1)	Store parameter 
*                       Jump to output
271:    LDA  1,-9(1)	Load address of new frame 
272:    LDA  3,1(7)	Return address in ac 
273:    LDA  7,-268(7)	CALL output
274:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
275:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  get
276:     ST  1,-11(1)	Store old fp in ghost frame 
*                       Load param 1
277:    LDA  3,-1(0)	Load address of base of array y
278:     ST  3,-13(1)	Store parameter 
*                       Load param 2
279:    LDC  3,2(6)	Load integer constant 
280:     ST  3,-14(1)	Store parameter 
*                       Jump to get
281:    LDA  1,-11(1)	Load address of new frame 
282:    LDA  3,1(7)	Return address in ac 
283:    LDA  7,-242(7)	CALL get
284:    LDA  3,0(2)	Save the result in ac 
*                       End call to get
285:     ST  3,-11(1)	Store parameter 
*                       Jump to output
286:    LDA  1,-9(1)	Load address of new frame 
287:    LDA  3,1(7)	Return address in ac 
288:    LDA  7,-283(7)	CALL output
289:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
290:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
291:    LDC  3,1(6)	Load integer constant 
292:    LDA  4,-3(1)	Load address of base of array x
293:    SUB  3,4,3	Compute offset of value 
294:     LD  3,0(3)	Load the value 
295:     ST  3,-11(1)	Store parameter 
*                       Jump to output
296:    LDA  1,-9(1)	Load address of new frame 
297:    LDA  3,1(7)	Return address in ac 
298:    LDA  7,-293(7)	CALL output
299:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
300:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Jump to outnl
301:    LDA  1,-9(1)	Load address of new frame 
302:    LDA  3,1(7)	Return address in ac 
303:    LDA  7,-267(7)	CALL outnl
304:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
305:    LDC  2,0(6)	Set return value to 0 
306:     LD  3,-1(1)	Load return address 
307:     LD  1,0(1)	Adjust fp 
308:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,308(7)	Jump to init [backpatch] 
* INIT
309:     LD  0,0(0)	Set the global pointer 
310:    LDA  1,-6(0)	set first frame at end of globals 
311:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
312:    LDC  3,5(6)	load size of array y
313:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
314:    LDA  3,1(7)	Return address in ac 
315:    LDA  7,-239(7)	Jump to main 
316:   HALT  0,0,0	DONE! 
* END INIT
