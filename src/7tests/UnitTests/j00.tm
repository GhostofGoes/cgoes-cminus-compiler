* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  j00.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address. 
* RETURN
 43:     LD  3,-3(1)	Load variable i
 44:     LD  4,-2(1)	Load address of base of array x
 45:    SUB  3,4,3	Compute offset of value 
 46:     LD  3,0(3)	Load the value 
 47:    LDA  2,0(3)	Copy result to rt register 
 48:     LD  3,-1(1)	Load return address 
 49:     LD  1,0(1)	Adjust fp 
 50:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 51:    LDC  2,0(6)	Set return value to 0 
 52:     LD  3,-1(1)	Load return address 
 53:     LD  1,0(1)	Adjust fp 
 54:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION dog
 55:     ST  3,-1(1)	Store return address. 
* RETURN
*                       Begin call to  cat
 56:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 57:     LD  3,-2(1)	Load address of base of array x
 58:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 59:     LD  3,-3(1)	Load variable i
 60:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
 61:    LDA  1,-4(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-22(7)	CALL cat
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 65:    LDA  2,0(3)	Copy result to rt register 
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust fp 
 68:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 69:    LDC  2,0(6)	Set return value to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION fox
 73:     ST  3,-1(1)	Store return address. 
* RETURN
*                       Begin call to  dog
 74:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 75:     LD  3,-2(1)	Load address of base of array x
 76:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 77:     LD  3,-3(1)	Load variable i
 78:     ST  3,-7(1)	Store parameter 
*                       Jump to dog
 79:    LDA  1,-4(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-27(7)	CALL dog
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
 83:    LDA  2,0(3)	Copy result to rt register 
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 87:    LDC  2,0(6)	Set return value to 0 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    LDA  7,0(3)	Return 
* END FUNCTION fox
* FUNCTION main
 91:     ST  3,-1(1)	Store return address. 
* COMPOUND
 92:    LDC  3,10(6)	load size of array h
 93:     ST  3,-3(1)	save size of array h
* EXPRESSION
 94:    LDC  3,1(6)	Load integer constant 
 95:     ST  3,-2(1)	Store variable i
* WHILE
 96:     LD  3,-2(1)	Load variable i
 97:     ST  3,-14(1)	Save left side 
 98:    LDC  3,10(6)	Load integer constant 
 99:     LD  4,-14(1)	Load left into ac1 
100:    TLT  3,4,3	Op < 
101:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
103:     LD  3,-2(1)	Load variable i
104:     ST  3,-14(1)	Save index 
105:     LD  3,-2(1)	Load variable i
106:     ST  3,-15(1)	Save index 
107:     LD  3,-2(1)	Load variable i
108:     ST  3,-16(1)	Save index 
109:     LD  3,-2(1)	load lhs variable i
110:    LDA  3,1(3)	increment value of i
111:     ST  3,-2(1)	Store variable i
112:     LD  4,-16(1)	Restore index 
113:    LDA  5,-12(0)	Load address of base of array s
114:    SUB  5,5,4	Compute offset of value 
115:     ST  3,0(5)	Store variable s
116:     LD  4,-15(1)	Restore index 
117:    LDA  5,-1(0)	Load address of base of array g
118:    SUB  5,5,4	Compute offset of value 
119:     ST  3,0(5)	Store variable g
120:     LD  4,-14(1)	Restore index 
121:    LDA  5,-4(1)	Load address of base of array h
122:    SUB  5,5,4	Compute offset of value 
123:     ST  3,0(5)	Store variable h
124:    LDA  7,-29(7)	go to beginning of loop 
102:    LDA  7,22(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
125:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
126:    LDC  3,6(6)	Load integer constant 
127:    LDA  4,-1(0)	Load address of base of array g
128:    SUB  3,4,3	Compute offset of value 
129:     LD  3,0(3)	Load the value 
130:     ST  3,-16(1)	Store parameter 
*                       Jump to output
131:    LDA  1,-14(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-128(7)	CALL output
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
135:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
136:    LDC  3,6(6)	Load integer constant 
137:    LDA  4,-4(1)	Load address of base of array h
138:    SUB  3,4,3	Compute offset of value 
139:     LD  3,0(3)	Load the value 
140:     ST  3,-16(1)	Store parameter 
*                       Jump to output
141:    LDA  1,-14(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-138(7)	CALL output
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
145:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
146:    LDC  3,6(6)	Load integer constant 
147:    LDA  4,-12(0)	Load address of base of array s
148:    SUB  3,4,3	Compute offset of value 
149:     LD  3,0(3)	Load the value 
150:     ST  3,-16(1)	Store parameter 
*                       Jump to output
151:    LDA  1,-14(1)	Load address of new frame 
152:    LDA  3,1(7)	Return address in ac 
153:    LDA  7,-148(7)	CALL output
154:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
155:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
156:    LDA  1,-14(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-122(7)	CALL outnl
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
160:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
161:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
162:    LDA  3,-1(0)	Load address of base of array g
163:     ST  3,-18(1)	Store parameter 
*                       Load param 2
164:    LDC  3,6(6)	Load integer constant 
165:     ST  3,-19(1)	Store parameter 
*                       Jump to cat
166:    LDA  1,-16(1)	Load address of new frame 
167:    LDA  3,1(7)	Return address in ac 
168:    LDA  7,-127(7)	CALL cat
169:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
170:     ST  3,-16(1)	Store parameter 
*                       Jump to output
171:    LDA  1,-14(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-168(7)	CALL output
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
175:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
176:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
177:    LDA  3,-4(1)	Load address of base of array h
178:     ST  3,-18(1)	Store parameter 
*                       Load param 2
179:    LDC  3,6(6)	Load integer constant 
180:     ST  3,-19(1)	Store parameter 
*                       Jump to cat
181:    LDA  1,-16(1)	Load address of new frame 
182:    LDA  3,1(7)	Return address in ac 
183:    LDA  7,-142(7)	CALL cat
184:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
185:     ST  3,-16(1)	Store parameter 
*                       Jump to output
186:    LDA  1,-14(1)	Load address of new frame 
187:    LDA  3,1(7)	Return address in ac 
188:    LDA  7,-183(7)	CALL output
189:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
190:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
191:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
192:    LDA  3,-12(0)	Load address of base of array s
193:     ST  3,-18(1)	Store parameter 
*                       Load param 2
194:    LDC  3,6(6)	Load integer constant 
195:     ST  3,-19(1)	Store parameter 
*                       Jump to cat
196:    LDA  1,-16(1)	Load address of new frame 
197:    LDA  3,1(7)	Return address in ac 
198:    LDA  7,-157(7)	CALL cat
199:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
200:     ST  3,-16(1)	Store parameter 
*                       Jump to output
201:    LDA  1,-14(1)	Load address of new frame 
202:    LDA  3,1(7)	Return address in ac 
203:    LDA  7,-198(7)	CALL output
204:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
205:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
206:    LDA  1,-14(1)	Load address of new frame 
207:    LDA  3,1(7)	Return address in ac 
208:    LDA  7,-172(7)	CALL outnl
209:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
210:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  dog
211:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
212:    LDA  3,-1(0)	Load address of base of array g
213:     ST  3,-18(1)	Store parameter 
*                       Load param 2
214:    LDC  3,6(6)	Load integer constant 
215:     ST  3,-19(1)	Store parameter 
*                       Jump to dog
216:    LDA  1,-16(1)	Load address of new frame 
217:    LDA  3,1(7)	Return address in ac 
218:    LDA  7,-164(7)	CALL dog
219:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
220:     ST  3,-16(1)	Store parameter 
*                       Jump to output
221:    LDA  1,-14(1)	Load address of new frame 
222:    LDA  3,1(7)	Return address in ac 
223:    LDA  7,-218(7)	CALL output
224:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
225:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  dog
226:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
227:    LDA  3,-4(1)	Load address of base of array h
228:     ST  3,-18(1)	Store parameter 
*                       Load param 2
229:    LDC  3,6(6)	Load integer constant 
230:     ST  3,-19(1)	Store parameter 
*                       Jump to dog
231:    LDA  1,-16(1)	Load address of new frame 
232:    LDA  3,1(7)	Return address in ac 
233:    LDA  7,-179(7)	CALL dog
234:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
235:     ST  3,-16(1)	Store parameter 
*                       Jump to output
236:    LDA  1,-14(1)	Load address of new frame 
237:    LDA  3,1(7)	Return address in ac 
238:    LDA  7,-233(7)	CALL output
239:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
240:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  dog
241:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
242:    LDA  3,-12(0)	Load address of base of array s
243:     ST  3,-18(1)	Store parameter 
*                       Load param 2
244:    LDC  3,6(6)	Load integer constant 
245:     ST  3,-19(1)	Store parameter 
*                       Jump to dog
246:    LDA  1,-16(1)	Load address of new frame 
247:    LDA  3,1(7)	Return address in ac 
248:    LDA  7,-194(7)	CALL dog
249:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
250:     ST  3,-16(1)	Store parameter 
*                       Jump to output
251:    LDA  1,-14(1)	Load address of new frame 
252:    LDA  3,1(7)	Return address in ac 
253:    LDA  7,-248(7)	CALL output
254:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
255:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
256:    LDA  1,-14(1)	Load address of new frame 
257:    LDA  3,1(7)	Return address in ac 
258:    LDA  7,-222(7)	CALL outnl
259:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
260:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fox
261:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
262:    LDA  3,-1(0)	Load address of base of array g
263:     ST  3,-18(1)	Store parameter 
*                       Load param 2
264:    LDC  3,6(6)	Load integer constant 
265:     ST  3,-19(1)	Store parameter 
*                       Jump to fox
266:    LDA  1,-16(1)	Load address of new frame 
267:    LDA  3,1(7)	Return address in ac 
268:    LDA  7,-196(7)	CALL fox
269:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
270:     ST  3,-16(1)	Store parameter 
*                       Jump to output
271:    LDA  1,-14(1)	Load address of new frame 
272:    LDA  3,1(7)	Return address in ac 
273:    LDA  7,-268(7)	CALL output
274:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
275:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fox
276:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
277:    LDA  3,-4(1)	Load address of base of array h
278:     ST  3,-18(1)	Store parameter 
*                       Load param 2
279:    LDC  3,6(6)	Load integer constant 
280:     ST  3,-19(1)	Store parameter 
*                       Jump to fox
281:    LDA  1,-16(1)	Load address of new frame 
282:    LDA  3,1(7)	Return address in ac 
283:    LDA  7,-211(7)	CALL fox
284:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
285:     ST  3,-16(1)	Store parameter 
*                       Jump to output
286:    LDA  1,-14(1)	Load address of new frame 
287:    LDA  3,1(7)	Return address in ac 
288:    LDA  7,-283(7)	CALL output
289:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
290:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fox
291:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
292:    LDA  3,-12(0)	Load address of base of array s
293:     ST  3,-18(1)	Store parameter 
*                       Load param 2
294:    LDC  3,6(6)	Load integer constant 
295:     ST  3,-19(1)	Store parameter 
*                       Jump to fox
296:    LDA  1,-16(1)	Load address of new frame 
297:    LDA  3,1(7)	Return address in ac 
298:    LDA  7,-226(7)	CALL fox
299:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
300:     ST  3,-16(1)	Store parameter 
*                       Jump to output
301:    LDA  1,-14(1)	Load address of new frame 
302:    LDA  3,1(7)	Return address in ac 
303:    LDA  7,-298(7)	CALL output
304:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
305:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
306:    LDA  1,-14(1)	Load address of new frame 
307:    LDA  3,1(7)	Return address in ac 
308:    LDA  7,-272(7)	CALL outnl
309:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
310:    LDC  2,0(6)	Set return value to 0 
311:     LD  3,-1(1)	Load return address 
312:     LD  1,0(1)	Adjust fp 
313:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,313(7)	Jump to init [backpatch] 
* INIT
314:     LD  0,0(0)	Set the global pointer 
315:    LDA  1,-22(0)	set first frame at end of globals 
316:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
317:    LDC  3,10(6)	load size of array g
318:     ST  3,0(0)	save size of array g
319:    LDC  3,10(6)	load size of array s-1
320:     ST  3,-11(0)	save size of array s-1
* END INIT GLOBALS AND STATICS
321:    LDA  3,1(7)	Return address in ac 
322:    LDA  7,-232(7)	Jump to main 
323:   HALT  0,0,0	DONE! 
* END INIT
