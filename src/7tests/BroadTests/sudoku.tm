* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  sudoku.c-
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
* FUNCTION initBoard
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
* WHILE
 45:     LD  3,-2(1)	Load variable i
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,81(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 52:     LD  3,-2(1)	Load variable i
 53:     ST  3,-3(1)	Save index 
 54:    LDC  3,0(6)	Load integer constant 
 55:     LD  4,-3(1)	Restore index 
 56:    LDA  5,-1(0)	Load address of base of array board
 57:    SUB  5,5,4	Compute offset of value 
 58:     ST  3,0(5)	Store variable board
* EXPRESSION
 59:     LD  3,-2(1)	Load variable i
 60:     ST  3,-3(1)	Save index 
 61:    LDC  3,0(6)	Load Boolean constant 
 62:     LD  4,-3(1)	Restore index 
 63:    LDA  5,-83(0)	Load address of base of array locked
 64:    SUB  5,5,4	Compute offset of value 
 65:     ST  3,0(5)	Store variable locked
* EXPRESSION
 66:     LD  3,-2(1)	load lhs variable i
 67:    LDA  3,1(3)	increment value of i
 68:     ST  3,-2(1)	Store variable i
* END COMPOUND
 69:    LDA  7,-25(7)	go to beginning of loop 
 51:    LDA  7,18(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
 70:    LDC  2,0(6)	Set return value to 0 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust fp 
 73:    LDA  7,0(3)	Return 
* END FUNCTION initBoard
* FUNCTION setValue
 74:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 75:     LD  3,-2(1)	Load variable row
 76:     ST  3,-5(1)	Save left side 
 77:    LDC  3,9(6)	Load integer constant 
 78:     LD  4,-5(1)	Load left into ac1 
 79:    MUL  3,4,3	Op * 
 80:     ST  3,-5(1)	Save left side 
 81:     LD  3,-3(1)	Load variable col
 82:     LD  4,-5(1)	Load left into ac1 
 83:    ADD  3,4,3	Op + 
 84:     ST  3,-5(1)	Save index 
 85:     LD  3,-4(1)	Load variable value
 86:     LD  4,-5(1)	Restore index 
 87:    LDA  5,-1(0)	Load address of base of array board
 88:    SUB  5,5,4	Compute offset of value 
 89:     ST  3,0(5)	Store variable board
* END COMPOUND
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6)	Set return value to 0 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END FUNCTION setValue
* FUNCTION getValue
 94:     ST  3,-1(1)	Store return address. 
* COMPOUND
* RETURN
 95:     LD  3,-2(1)	Load variable row
 96:     ST  3,-4(1)	Save left side 
 97:    LDC  3,9(6)	Load integer constant 
 98:     LD  4,-4(1)	Load left into ac1 
 99:    MUL  3,4,3	Op * 
100:     ST  3,-4(1)	Save left side 
101:     LD  3,-3(1)	Load variable col
102:     LD  4,-4(1)	Load left into ac1 
103:    ADD  3,4,3	Op + 
104:    LDA  4,-1(0)	Load address of base of array board
105:    SUB  3,4,3	Compute offset of value 
106:     LD  3,0(3)	Load the value 
107:    LDA  2,0(3)	Copy result to rt register 
108:     LD  3,-1(1)	Load return address 
109:     LD  1,0(1)	Adjust fp 
110:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
111:    LDC  2,0(6)	Set return value to 0 
112:     LD  3,-1(1)	Load return address 
113:     LD  1,0(1)	Adjust fp 
114:    LDA  7,0(3)	Return 
* END FUNCTION getValue
* FUNCTION setLocked
115:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
116:     LD  3,-2(1)	Load variable row
117:     ST  3,-5(1)	Save left side 
118:    LDC  3,9(6)	Load integer constant 
119:     LD  4,-5(1)	Load left into ac1 
120:    MUL  3,4,3	Op * 
121:     ST  3,-5(1)	Save left side 
122:     LD  3,-3(1)	Load variable col
123:     LD  4,-5(1)	Load left into ac1 
124:    ADD  3,4,3	Op + 
125:     ST  3,-5(1)	Save index 
126:     LD  3,-4(1)	Load variable value
127:     LD  4,-5(1)	Restore index 
128:    LDA  5,-83(0)	Load address of base of array locked
129:    SUB  5,5,4	Compute offset of value 
130:     ST  3,0(5)	Store variable locked
* END COMPOUND
* Add standard closing in case there is no return statement
131:    LDC  2,0(6)	Set return value to 0 
132:     LD  3,-1(1)	Load return address 
133:     LD  1,0(1)	Adjust fp 
134:    LDA  7,0(3)	Return 
* END FUNCTION setLocked
* FUNCTION getLocked
135:     ST  3,-1(1)	Store return address. 
* COMPOUND
* RETURN
136:     LD  3,-2(1)	Load variable row
137:     ST  3,-4(1)	Save left side 
138:    LDC  3,9(6)	Load integer constant 
139:     LD  4,-4(1)	Load left into ac1 
140:    MUL  3,4,3	Op * 
141:     ST  3,-4(1)	Save left side 
142:     LD  3,-3(1)	Load variable col
143:     LD  4,-4(1)	Load left into ac1 
144:    ADD  3,4,3	Op + 
145:    LDA  4,-83(0)	Load address of base of array locked
146:    SUB  3,4,3	Compute offset of value 
147:     LD  3,0(3)	Load the value 
148:    LDA  2,0(3)	Copy result to rt register 
149:     LD  3,-1(1)	Load return address 
150:     LD  1,0(1)	Adjust fp 
151:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
152:    LDC  2,0(6)	Set return value to 0 
153:     LD  3,-1(1)	Load return address 
154:     LD  1,0(1)	Adjust fp 
155:    LDA  7,0(3)	Return 
* END FUNCTION getLocked
* FUNCTION isOkAt
156:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
157:    LDC  3,0(6)	Load integer constant 
158:     ST  3,-5(1)	Store variable i
* WHILE
159:     LD  3,-5(1)	Load variable i
160:     ST  3,-9(1)	Save left side 
161:    LDC  3,9(6)	Load integer constant 
162:     LD  4,-9(1)	Load left into ac1 
163:    TLT  3,4,3	Op < 
164:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
*                       Begin call to  getValue
166:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
167:     LD  3,-5(1)	Load variable i
168:     ST  3,-11(1)	Store parameter 
*                       Load param 2
169:     LD  3,-3(1)	Load variable col
170:     ST  3,-12(1)	Store parameter 
*                       Jump to getValue
171:    LDA  1,-9(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-80(7)	CALL getValue
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
175:     ST  3,-9(1)	Save left side 
176:     LD  3,-4(1)	Load variable value
177:     LD  4,-9(1)	Load left into ac1 
178:    TEQ  3,4,3	Op == 
* THEN
* RETURN
180:    LDC  3,0(6)	Load Boolean constant 
181:    LDA  2,0(3)	Copy result to rt register 
182:     LD  3,-1(1)	Load return address 
183:     LD  1,0(1)	Adjust fp 
184:    LDA  7,0(3)	Return 
179:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
*                       Begin call to  getValue
185:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
186:     LD  3,-2(1)	Load variable row
187:     ST  3,-11(1)	Store parameter 
*                       Load param 2
188:     LD  3,-5(1)	Load variable i
189:     ST  3,-12(1)	Store parameter 
*                       Jump to getValue
190:    LDA  1,-9(1)	Load address of new frame 
191:    LDA  3,1(7)	Return address in ac 
192:    LDA  7,-99(7)	CALL getValue
193:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
194:     ST  3,-9(1)	Save left side 
195:     LD  3,-4(1)	Load variable value
196:     LD  4,-9(1)	Load left into ac1 
197:    TEQ  3,4,3	Op == 
* THEN
* RETURN
199:    LDC  3,0(6)	Load Boolean constant 
200:    LDA  2,0(3)	Copy result to rt register 
201:     LD  3,-1(1)	Load return address 
202:     LD  1,0(1)	Adjust fp 
203:    LDA  7,0(3)	Return 
198:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
204:     LD  3,-5(1)	load lhs variable i
205:    LDA  3,1(3)	increment value of i
206:     ST  3,-5(1)	Store variable i
* END COMPOUND
207:    LDA  7,-49(7)	go to beginning of loop 
165:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
208:     LD  3,-2(1)	Load variable row
209:     ST  3,-9(1)	Save left side 
210:    LDC  3,3(6)	Load integer constant 
211:     LD  4,-9(1)	Load left into ac1 
212:    DIV  3,4,3	Op / 
213:     ST  3,-9(1)	Save left side 
214:    LDC  3,3(6)	Load integer constant 
215:     LD  4,-9(1)	Load left into ac1 
216:    MUL  3,4,3	Op * 
217:     ST  3,-7(1)	Store variable boxRowStart
* EXPRESSION
218:     LD  3,-3(1)	Load variable col
219:     ST  3,-9(1)	Save left side 
220:    LDC  3,3(6)	Load integer constant 
221:     LD  4,-9(1)	Load left into ac1 
222:    DIV  3,4,3	Op / 
223:     ST  3,-9(1)	Save left side 
224:    LDC  3,3(6)	Load integer constant 
225:     LD  4,-9(1)	Load left into ac1 
226:    MUL  3,4,3	Op * 
227:     ST  3,-8(1)	Store variable boxColStart
* EXPRESSION
228:    LDC  3,0(6)	Load integer constant 
229:     ST  3,-5(1)	Store variable i
* WHILE
230:     LD  3,-5(1)	Load variable i
231:     ST  3,-9(1)	Save left side 
232:    LDC  3,3(6)	Load integer constant 
233:     LD  4,-9(1)	Load left into ac1 
234:    TLT  3,4,3	Op < 
235:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
237:    LDC  3,0(6)	Load integer constant 
238:     ST  3,-6(1)	Store variable j
* WHILE
239:     LD  3,-6(1)	Load variable j
240:     ST  3,-9(1)	Save left side 
241:    LDC  3,3(6)	Load integer constant 
242:     LD  4,-9(1)	Load left into ac1 
243:    TLT  3,4,3	Op < 
244:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
*                       Begin call to  getValue
246:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
247:     LD  3,-7(1)	Load variable boxRowStart
248:     ST  3,-11(1)	Save left side 
249:     LD  3,-5(1)	Load variable i
250:     LD  4,-11(1)	Load left into ac1 
251:    ADD  3,4,3	Op + 
252:     ST  3,-11(1)	Store parameter 
*                       Load param 2
253:     LD  3,-8(1)	Load variable boxColStart
254:     ST  3,-12(1)	Save left side 
255:     LD  3,-6(1)	Load variable j
256:     LD  4,-12(1)	Load left into ac1 
257:    ADD  3,4,3	Op + 
258:     ST  3,-12(1)	Store parameter 
*                       Jump to getValue
259:    LDA  1,-9(1)	Load address of new frame 
260:    LDA  3,1(7)	Return address in ac 
261:    LDA  7,-168(7)	CALL getValue
262:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
263:     ST  3,-9(1)	Save left side 
264:     LD  3,-4(1)	Load variable value
265:     LD  4,-9(1)	Load left into ac1 
266:    TEQ  3,4,3	Op == 
* THEN
* RETURN
268:    LDC  3,0(6)	Load Boolean constant 
269:    LDA  2,0(3)	Copy result to rt register 
270:     LD  3,-1(1)	Load return address 
271:     LD  1,0(1)	Adjust fp 
272:    LDA  7,0(3)	Return 
267:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
273:     LD  3,-6(1)	load lhs variable j
274:    LDA  3,1(3)	increment value of j
275:     ST  3,-6(1)	Store variable j
* END COMPOUND
276:    LDA  7,-38(7)	go to beginning of loop 
245:    LDA  7,31(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
277:     LD  3,-5(1)	load lhs variable i
278:    LDA  3,1(3)	increment value of i
279:     ST  3,-5(1)	Store variable i
* END COMPOUND
280:    LDA  7,-51(7)	go to beginning of loop 
236:    LDA  7,44(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
281:    LDC  3,1(6)	Load Boolean constant 
282:    LDA  2,0(3)	Copy result to rt register 
283:     LD  3,-1(1)	Load return address 
284:     LD  1,0(1)	Adjust fp 
285:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
286:    LDC  2,0(6)	Set return value to 0 
287:     LD  3,-1(1)	Load return address 
288:     LD  1,0(1)	Adjust fp 
289:    LDA  7,0(3)	Return 
* END FUNCTION isOkAt
* FUNCTION search
290:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
*                       Begin call to  getLocked
291:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
292:     LD  3,-2(1)	Load variable i
293:     ST  3,-6(1)	Store parameter 
*                       Load param 2
294:     LD  3,-3(1)	Load variable j
295:     ST  3,-7(1)	Store parameter 
*                       Jump to getLocked
296:    LDA  1,-4(1)	Load address of new frame 
297:    LDA  3,1(7)	Return address in ac 
298:    LDA  7,-164(7)	CALL getLocked
299:    LDA  3,0(2)	Save the result in ac 
*                       End call to getLocked
* THEN
* COMPOUND
* IF
301:     LD  3,-2(1)	Load variable i
302:     ST  3,-4(1)	Save left side 
303:    LDC  3,8(6)	Load integer constant 
304:     LD  4,-4(1)	Load left into ac1 
305:    TEQ  3,4,3	Op == 
306:     ST  3,-4(1)	Save left side 
307:     LD  3,-3(1)	Load variable j
308:     ST  3,-5(1)	Save left side 
309:    LDC  3,8(6)	Load integer constant 
310:     LD  4,-5(1)	Load left into ac1 
311:    TEQ  3,4,3	Op == 
312:     LD  4,-4(1)	Load left into ac1 
313:    AND  3,4,3	Op AND 
* THEN
* RETURN
315:    LDC  3,1(6)	Load Boolean constant 
316:    LDA  2,0(3)	Copy result to rt register 
317:     LD  3,-1(1)	Load return address 
318:     LD  1,0(1)	Adjust fp 
319:    LDA  7,0(3)	Return 
314:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
321:     LD  3,-3(1)	Load variable j
322:     ST  3,-4(1)	Save left side 
323:    LDC  3,8(6)	Load integer constant 
324:     LD  4,-4(1)	Load left into ac1 
325:    TEQ  3,4,3	Op == 
* THEN
* RETURN
*                       Begin call to  search
327:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
328:     LD  3,-2(1)	Load variable i
329:     ST  3,-6(1)	Save left side 
330:    LDC  3,1(6)	Load integer constant 
331:     LD  4,-6(1)	Load left into ac1 
332:    ADD  3,4,3	Op + 
333:     ST  3,-6(1)	Store parameter 
*                       Load param 2
334:    LDC  3,0(6)	Load integer constant 
335:     ST  3,-7(1)	Store parameter 
*                       Jump to search
336:    LDA  1,-4(1)	Load address of new frame 
337:    LDA  3,1(7)	Return address in ac 
338:    LDA  7,-49(7)	CALL search
339:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
340:    LDA  2,0(3)	Copy result to rt register 
341:     LD  3,-1(1)	Load return address 
342:     LD  1,0(1)	Adjust fp 
343:    LDA  7,0(3)	Return 
326:    JZR  3,18(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
*                       Begin call to  search
345:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
346:     LD  3,-2(1)	Load variable i
347:     ST  3,-6(1)	Store parameter 
*                       Load param 2
348:     LD  3,-3(1)	Load variable j
349:     ST  3,-7(1)	Save left side 
350:    LDC  3,1(6)	Load integer constant 
351:     LD  4,-7(1)	Load left into ac1 
352:    ADD  3,4,3	Op + 
353:     ST  3,-7(1)	Store parameter 
*                       Jump to search
354:    LDA  1,-4(1)	Load address of new frame 
355:    LDA  3,1(7)	Return address in ac 
356:    LDA  7,-67(7)	CALL search
357:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
358:    LDA  2,0(3)	Copy result to rt register 
359:     LD  3,-1(1)	Load return address 
360:     LD  1,0(1)	Adjust fp 
361:    LDA  7,0(3)	Return 
344:    LDA  7,17(7)	Jump around the ELSE [backpatch] 
* ENDIF
320:    LDA  7,41(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
300:    JZR  3,62(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
363:    LDC  3,1(6)	Load integer constant 
364:     ST  3,-4(1)	Store variable n
* WHILE
365:     LD  3,-4(1)	Load variable n
366:     ST  3,-6(1)	Save left side 
367:    LDC  3,9(6)	Load integer constant 
368:     LD  4,-6(1)	Load left into ac1 
369:    TLE  3,4,3	Op <= 
370:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
*                       Begin call to  isOkAt
372:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
373:     LD  3,-2(1)	Load variable i
374:     ST  3,-8(1)	Store parameter 
*                       Load param 2
375:     LD  3,-3(1)	Load variable j
376:     ST  3,-9(1)	Store parameter 
*                       Load param 3
377:     LD  3,-4(1)	Load variable n
378:     ST  3,-10(1)	Store parameter 
*                       Jump to isOkAt
379:    LDA  1,-6(1)	Load address of new frame 
380:    LDA  3,1(7)	Return address in ac 
381:    LDA  7,-226(7)	CALL isOkAt
382:    LDA  3,0(2)	Save the result in ac 
*                       End call to isOkAt
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  setValue
384:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
385:     LD  3,-2(1)	Load variable i
386:     ST  3,-8(1)	Store parameter 
*                       Load param 2
387:     LD  3,-3(1)	Load variable j
388:     ST  3,-9(1)	Store parameter 
*                       Load param 3
389:     LD  3,-4(1)	Load variable n
390:     ST  3,-10(1)	Store parameter 
*                       Jump to setValue
391:    LDA  1,-6(1)	Load address of new frame 
392:    LDA  3,1(7)	Return address in ac 
393:    LDA  7,-320(7)	CALL setValue
394:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* IF
395:     LD  3,-2(1)	Load variable i
396:     ST  3,-6(1)	Save left side 
397:    LDC  3,8(6)	Load integer constant 
398:     LD  4,-6(1)	Load left into ac1 
399:    TEQ  3,4,3	Op == 
400:     ST  3,-6(1)	Save left side 
401:     LD  3,-3(1)	Load variable j
402:     ST  3,-7(1)	Save left side 
403:    LDC  3,8(6)	Load integer constant 
404:     LD  4,-7(1)	Load left into ac1 
405:    TEQ  3,4,3	Op == 
406:     LD  4,-6(1)	Load left into ac1 
407:    AND  3,4,3	Op AND 
* THEN
* RETURN
409:    LDC  3,1(6)	Load Boolean constant 
410:    LDA  2,0(3)	Copy result to rt register 
411:     LD  3,-1(1)	Load return address 
412:     LD  1,0(1)	Adjust fp 
413:    LDA  7,0(3)	Return 
408:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
415:     LD  3,-3(1)	Load variable j
416:     ST  3,-6(1)	Save left side 
417:    LDC  3,8(6)	Load integer constant 
418:     LD  4,-6(1)	Load left into ac1 
419:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  search
421:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
422:     LD  3,-2(1)	Load variable i
423:     ST  3,-8(1)	Save left side 
424:    LDC  3,1(6)	Load integer constant 
425:     LD  4,-8(1)	Load left into ac1 
426:    ADD  3,4,3	Op + 
427:     ST  3,-8(1)	Store parameter 
*                       Load param 2
428:    LDC  3,0(6)	Load integer constant 
429:     ST  3,-9(1)	Store parameter 
*                       Jump to search
430:    LDA  1,-6(1)	Load address of new frame 
431:    LDA  3,1(7)	Return address in ac 
432:    LDA  7,-143(7)	CALL search
433:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
434:     ST  3,-5(1)	Store variable foundOne
420:    JZR  3,15(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  search
436:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
437:     LD  3,-2(1)	Load variable i
438:     ST  3,-8(1)	Store parameter 
*                       Load param 2
439:     LD  3,-3(1)	Load variable j
440:     ST  3,-9(1)	Save left side 
441:    LDC  3,1(6)	Load integer constant 
442:     LD  4,-9(1)	Load left into ac1 
443:    ADD  3,4,3	Op + 
444:     ST  3,-9(1)	Store parameter 
*                       Jump to search
445:    LDA  1,-6(1)	Load address of new frame 
446:    LDA  3,1(7)	Return address in ac 
447:    LDA  7,-158(7)	CALL search
448:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
449:     ST  3,-5(1)	Store variable foundOne
435:    LDA  7,14(7)	Jump around the ELSE [backpatch] 
* ENDIF
414:    LDA  7,35(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
450:     LD  3,-5(1)	Load variable foundOne
* THEN
* RETURN
452:    LDC  3,1(6)	Load Boolean constant 
453:    LDA  2,0(3)	Copy result to rt register 
454:     LD  3,-1(1)	Load return address 
455:     LD  1,0(1)	Adjust fp 
456:    LDA  7,0(3)	Return 
451:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  setValue
458:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
459:     LD  3,-2(1)	Load variable i
460:     ST  3,-8(1)	Store parameter 
*                       Load param 2
461:     LD  3,-3(1)	Load variable j
462:     ST  3,-9(1)	Store parameter 
*                       Load param 3
463:    LDC  3,0(6)	Load integer constant 
464:     ST  3,-10(1)	Store parameter 
*                       Jump to setValue
465:    LDA  1,-6(1)	Load address of new frame 
466:    LDA  3,1(7)	Return address in ac 
467:    LDA  7,-394(7)	CALL setValue
468:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
457:    LDA  7,11(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
383:    JZR  3,85(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
469:     LD  3,-4(1)	load lhs variable n
470:    LDA  3,1(3)	increment value of n
471:     ST  3,-4(1)	Store variable n
* END COMPOUND
472:    LDA  7,-108(7)	go to beginning of loop 
371:    LDA  7,101(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
362:    LDA  7,110(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
473:    LDC  3,0(6)	Load Boolean constant 
474:    LDA  2,0(3)	Copy result to rt register 
475:     LD  3,-1(1)	Load return address 
476:     LD  1,0(1)	Adjust fp 
477:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
478:    LDC  2,0(6)	Set return value to 0 
479:     LD  3,-1(1)	Load return address 
480:     LD  1,0(1)	Adjust fp 
481:    LDA  7,0(3)	Return 
* END FUNCTION search
* FUNCTION searchTrivial
482:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
483:    LDC  3,1(6)	Load Boolean constant 
484:     ST  3,-6(1)	Store variable changed
* WHILE
485:     LD  3,-6(1)	Load variable changed
486:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
488:    LDC  3,0(6)	Load Boolean constant 
489:     ST  3,-6(1)	Store variable changed
* EXPRESSION
490:    LDC  3,0(6)	Load integer constant 
491:     ST  3,-2(1)	Store variable i
* WHILE
492:     LD  3,-2(1)	Load variable i
493:     ST  3,-8(1)	Save left side 
494:    LDC  3,9(6)	Load integer constant 
495:     LD  4,-8(1)	Load left into ac1 
496:    TLT  3,4,3	Op < 
497:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
499:    LDC  3,0(6)	Load integer constant 
500:     ST  3,-3(1)	Store variable j
* WHILE
501:     LD  3,-3(1)	Load variable j
502:     ST  3,-8(1)	Save left side 
503:    LDC  3,9(6)	Load integer constant 
504:     LD  4,-8(1)	Load left into ac1 
505:    TLT  3,4,3	Op < 
506:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
*                       Begin call to  getLocked
508:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
509:     LD  3,-2(1)	Load variable i
510:     ST  3,-10(1)	Store parameter 
*                       Load param 2
511:     LD  3,-3(1)	Load variable j
512:     ST  3,-11(1)	Store parameter 
*                       Jump to getLocked
513:    LDA  1,-8(1)	Load address of new frame 
514:    LDA  3,1(7)	Return address in ac 
515:    LDA  7,-381(7)	CALL getLocked
516:    LDA  3,0(2)	Save the result in ac 
*                       End call to getLocked
517:     ST  3,-8(1)	Save left side 
518:    LDC  3,0(6)	Load Boolean constant 
519:     LD  4,-8(1)	Load left into ac1 
520:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
522:    LDC  3,1(6)	Load integer constant 
523:     ST  3,-4(1)	Store variable test
* EXPRESSION
524:    LDC  3,0(6)	Load Boolean constant 
525:     ST  3,-7(1)	Store variable foundOne
* WHILE
526:     LD  3,-4(1)	Load variable test
527:     ST  3,-8(1)	Save left side 
528:    LDC  3,9(6)	Load integer constant 
529:     LD  4,-8(1)	Load left into ac1 
530:    TLE  3,4,3	Op <= 
531:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
*                       Begin call to  isOkAt
533:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
534:     LD  3,-2(1)	Load variable i
535:     ST  3,-10(1)	Store parameter 
*                       Load param 2
536:     LD  3,-3(1)	Load variable j
537:     ST  3,-11(1)	Store parameter 
*                       Load param 3
538:     LD  3,-4(1)	Load variable test
539:     ST  3,-12(1)	Store parameter 
*                       Jump to isOkAt
540:    LDA  1,-8(1)	Load address of new frame 
541:    LDA  3,1(7)	Return address in ac 
542:    LDA  7,-387(7)	CALL isOkAt
543:    LDA  3,0(2)	Save the result in ac 
*                       End call to isOkAt
* THEN
* COMPOUND
* IF
545:     LD  3,-7(1)	Load variable foundOne
* THEN
* COMPOUND
* EXPRESSION
547:    LDC  3,0(6)	Load Boolean constant 
548:     ST  3,-7(1)	Store variable foundOne
* BREAK
549:    LDA  7,-18(7)	break 
* END COMPOUND
546:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
551:    LDC  3,1(6)	Load Boolean constant 
552:     ST  3,-7(1)	Store variable foundOne
* EXPRESSION
553:     LD  3,-4(1)	Load variable test
554:     ST  3,-5(1)	Store variable value
* END COMPOUND
550:    LDA  7,4(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
544:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
555:     LD  3,-4(1)	load lhs variable test
556:    LDA  3,1(3)	increment value of test
557:     ST  3,-4(1)	Store variable test
* END COMPOUND
558:    LDA  7,-33(7)	go to beginning of loop 
532:    LDA  7,26(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
559:     LD  3,-7(1)	Load variable foundOne
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  setValue
561:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
562:     LD  3,-2(1)	Load variable i
563:     ST  3,-10(1)	Store parameter 
*                       Load param 2
564:     LD  3,-3(1)	Load variable j
565:     ST  3,-11(1)	Store parameter 
*                       Load param 3
566:     LD  3,-5(1)	Load variable value
567:     ST  3,-12(1)	Store parameter 
*                       Jump to setValue
568:    LDA  1,-8(1)	Load address of new frame 
569:    LDA  3,1(7)	Return address in ac 
570:    LDA  7,-497(7)	CALL setValue
571:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* EXPRESSION
*                       Begin call to  setLocked
572:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
573:     LD  3,-2(1)	Load variable i
574:     ST  3,-10(1)	Store parameter 
*                       Load param 2
575:     LD  3,-3(1)	Load variable j
576:     ST  3,-11(1)	Store parameter 
*                       Load param 3
577:    LDC  3,1(6)	Load Boolean constant 
578:     ST  3,-12(1)	Store parameter 
*                       Jump to setLocked
579:    LDA  1,-8(1)	Load address of new frame 
580:    LDA  3,1(7)	Return address in ac 
581:    LDA  7,-467(7)	CALL setLocked
582:    LDA  3,0(2)	Save the result in ac 
*                       End call to setLocked
* EXPRESSION
583:    LDC  3,1(6)	Load Boolean constant 
584:     ST  3,-6(1)	Store variable changed
* END COMPOUND
560:    JZR  3,24(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
521:    JZR  3,63(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
585:     LD  3,-3(1)	load lhs variable j
586:    LDA  3,1(3)	increment value of j
587:     ST  3,-3(1)	Store variable j
* END COMPOUND
588:    LDA  7,-88(7)	go to beginning of loop 
507:    LDA  7,81(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
589:     LD  3,-2(1)	load lhs variable i
590:    LDA  3,1(3)	increment value of i
591:     ST  3,-2(1)	Store variable i
* END COMPOUND
592:    LDA  7,-101(7)	go to beginning of loop 
498:    LDA  7,94(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
593:    LDA  7,-109(7)	go to beginning of loop 
487:    LDA  7,106(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
594:    LDC  2,0(6)	Set return value to 0 
595:     LD  3,-1(1)	Load return address 
596:     LD  1,0(1)	Adjust fp 
597:    LDA  7,0(3)	Return 
* END FUNCTION searchTrivial
* FUNCTION solve
598:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
599:    LDC  3,0(6)	Load integer constant 
600:     ST  3,-2(1)	Store variable i
* WHILE
601:     LD  3,-2(1)	Load variable i
602:     ST  3,-5(1)	Save left side 
603:    LDC  3,9(6)	Load integer constant 
604:     LD  4,-5(1)	Load left into ac1 
605:    TLT  3,4,3	Op < 
606:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
608:    LDC  3,0(6)	Load integer constant 
609:     ST  3,-3(1)	Store variable j
* WHILE
610:     LD  3,-3(1)	Load variable j
611:     ST  3,-5(1)	Save left side 
612:    LDC  3,9(6)	Load integer constant 
613:     LD  4,-5(1)	Load left into ac1 
614:    TLT  3,4,3	Op < 
615:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  getValue
617:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
618:     LD  3,-2(1)	Load variable i
619:     ST  3,-7(1)	Store parameter 
*                       Load param 2
620:     LD  3,-3(1)	Load variable j
621:     ST  3,-8(1)	Store parameter 
*                       Jump to getValue
622:    LDA  1,-5(1)	Load address of new frame 
623:    LDA  3,1(7)	Return address in ac 
624:    LDA  7,-531(7)	CALL getValue
625:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
626:     ST  3,-4(1)	Store variable n
* EXPRESSION
*                       Begin call to  setValue
627:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
628:     LD  3,-2(1)	Load variable i
629:     ST  3,-7(1)	Store parameter 
*                       Load param 2
630:     LD  3,-3(1)	Load variable j
631:     ST  3,-8(1)	Store parameter 
*                       Load param 3
632:    LDC  3,0(6)	Load integer constant 
633:     ST  3,-9(1)	Store parameter 
*                       Jump to setValue
634:    LDA  1,-5(1)	Load address of new frame 
635:    LDA  3,1(7)	Return address in ac 
636:    LDA  7,-563(7)	CALL setValue
637:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* IF
*                       Begin call to  getLocked
638:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
639:     LD  3,-2(1)	Load variable i
640:     ST  3,-7(1)	Store parameter 
*                       Load param 2
641:     LD  3,-3(1)	Load variable j
642:     ST  3,-8(1)	Store parameter 
*                       Jump to getLocked
643:    LDA  1,-5(1)	Load address of new frame 
644:    LDA  3,1(7)	Return address in ac 
645:    LDA  7,-511(7)	CALL getLocked
646:    LDA  3,0(2)	Save the result in ac 
*                       End call to getLocked
647:     ST  3,-5(1)	Save left side 
648:    LDC  3,1(6)	Load Boolean constant 
649:     LD  4,-5(1)	Load left into ac1 
650:    TEQ  3,4,3	Op == 
651:     ST  3,-5(1)	Save left side 
*                       Begin call to  isOkAt
652:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
653:     LD  3,-2(1)	Load variable i
654:     ST  3,-8(1)	Store parameter 
*                       Load param 2
655:     LD  3,-3(1)	Load variable j
656:     ST  3,-9(1)	Store parameter 
*                       Load param 3
657:     LD  3,-4(1)	Load variable n
658:     ST  3,-10(1)	Store parameter 
*                       Jump to isOkAt
659:    LDA  1,-6(1)	Load address of new frame 
660:    LDA  3,1(7)	Return address in ac 
661:    LDA  7,-506(7)	CALL isOkAt
662:    LDA  3,0(2)	Save the result in ac 
*                       End call to isOkAt
663:     ST  3,-6(1)	Save left side 
664:    LDC  3,0(6)	Load Boolean constant 
665:     LD  4,-6(1)	Load left into ac1 
666:    TEQ  3,4,3	Op == 
667:     LD  4,-5(1)	Load left into ac1 
668:    AND  3,4,3	Op AND 
* THEN
* RETURN
670:    LDC  3,0(6)	Load Boolean constant 
671:    LDA  2,0(3)	Copy result to rt register 
672:     LD  3,-1(1)	Load return address 
673:     LD  1,0(1)	Adjust fp 
674:    LDA  7,0(3)	Return 
669:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  setValue
675:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
676:     LD  3,-2(1)	Load variable i
677:     ST  3,-7(1)	Store parameter 
*                       Load param 2
678:     LD  3,-3(1)	Load variable j
679:     ST  3,-8(1)	Store parameter 
*                       Load param 3
680:     LD  3,-4(1)	Load variable n
681:     ST  3,-9(1)	Store parameter 
*                       Jump to setValue
682:    LDA  1,-5(1)	Load address of new frame 
683:    LDA  3,1(7)	Return address in ac 
684:    LDA  7,-611(7)	CALL setValue
685:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* EXPRESSION
686:     LD  3,-3(1)	load lhs variable j
687:    LDA  3,1(3)	increment value of j
688:     ST  3,-3(1)	Store variable j
* END COMPOUND
689:    LDA  7,-80(7)	go to beginning of loop 
616:    LDA  7,73(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
690:     LD  3,-2(1)	load lhs variable i
691:    LDA  3,1(3)	increment value of i
692:     ST  3,-2(1)	Store variable i
* END COMPOUND
693:    LDA  7,-93(7)	go to beginning of loop 
607:    LDA  7,86(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  searchTrivial
694:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to searchTrivial
695:    LDA  1,-5(1)	Load address of new frame 
696:    LDA  3,1(7)	Return address in ac 
697:    LDA  7,-216(7)	CALL searchTrivial
698:    LDA  3,0(2)	Save the result in ac 
*                       End call to searchTrivial
* RETURN
*                       Begin call to  search
699:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
700:    LDC  3,0(6)	Load integer constant 
701:     ST  3,-7(1)	Store parameter 
*                       Load param 2
702:    LDC  3,0(6)	Load integer constant 
703:     ST  3,-8(1)	Store parameter 
*                       Jump to search
704:    LDA  1,-5(1)	Load address of new frame 
705:    LDA  3,1(7)	Return address in ac 
706:    LDA  7,-417(7)	CALL search
707:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
708:    LDA  2,0(3)	Copy result to rt register 
709:     LD  3,-1(1)	Load return address 
710:     LD  1,0(1)	Adjust fp 
711:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
712:    LDC  2,0(6)	Set return value to 0 
713:     LD  3,-1(1)	Load return address 
714:     LD  1,0(1)	Adjust fp 
715:    LDA  7,0(3)	Return 
* END FUNCTION solve
* FUNCTION showBoard
716:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
717:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
718:    LDA  1,-4(1)	Load address of new frame 
719:    LDA  3,1(7)	Return address in ac 
720:    LDA  7,-684(7)	CALL outnl
721:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
722:    LDC  3,0(6)	Load integer constant 
723:     ST  3,-2(1)	Store variable i
* WHILE
724:     LD  3,-2(1)	Load variable i
725:     ST  3,-4(1)	Save left side 
726:    LDC  3,9(6)	Load integer constant 
727:     LD  4,-4(1)	Load left into ac1 
728:    TLT  3,4,3	Op < 
729:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
731:    LDC  3,0(6)	Load integer constant 
732:     ST  3,-3(1)	Store variable j
* WHILE
733:     LD  3,-3(1)	Load variable j
734:     ST  3,-4(1)	Save left side 
735:    LDC  3,9(6)	Load integer constant 
736:     LD  4,-4(1)	Load left into ac1 
737:    TLT  3,4,3	Op < 
738:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
740:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  getValue
741:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
742:     LD  3,-2(1)	Load variable i
743:     ST  3,-8(1)	Store parameter 
*                       Load param 2
744:     LD  3,-3(1)	Load variable j
745:     ST  3,-9(1)	Store parameter 
*                       Jump to getValue
746:    LDA  1,-6(1)	Load address of new frame 
747:    LDA  3,1(7)	Return address in ac 
748:    LDA  7,-655(7)	CALL getValue
749:    LDA  3,0(2)	Save the result in ac 
*                       End call to getValue
750:     ST  3,-6(1)	Store parameter 
*                       Jump to output
751:    LDA  1,-4(1)	Load address of new frame 
752:    LDA  3,1(7)	Return address in ac 
753:    LDA  7,-748(7)	CALL output
754:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
755:     LD  3,-3(1)	load lhs variable j
756:    LDA  3,1(3)	increment value of j
757:     ST  3,-3(1)	Store variable j
* END COMPOUND
758:    LDA  7,-26(7)	go to beginning of loop 
739:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
759:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
760:    LDA  1,-4(1)	Load address of new frame 
761:    LDA  3,1(7)	Return address in ac 
762:    LDA  7,-726(7)	CALL outnl
763:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
764:     LD  3,-2(1)	load lhs variable i
765:    LDA  3,1(3)	increment value of i
766:     ST  3,-2(1)	Store variable i
* END COMPOUND
767:    LDA  7,-44(7)	go to beginning of loop 
730:    LDA  7,37(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
768:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
769:    LDA  1,-4(1)	Load address of new frame 
770:    LDA  3,1(7)	Return address in ac 
771:    LDA  7,-735(7)	CALL outnl
772:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
773:    LDC  2,0(6)	Set return value to 0 
774:     LD  3,-1(1)	Load return address 
775:     LD  1,0(1)	Adjust fp 
776:    LDA  7,0(3)	Return 
* END FUNCTION showBoard
* FUNCTION getInput
777:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
778:    LDC  3,0(6)	Load integer constant 
779:     ST  3,-2(1)	Store variable i
* WHILE
780:     LD  3,-2(1)	Load variable i
781:     ST  3,-5(1)	Save left side 
782:    LDC  3,9(6)	Load integer constant 
783:     LD  4,-5(1)	Load left into ac1 
784:    TLT  3,4,3	Op < 
785:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
787:    LDC  3,0(6)	Load integer constant 
788:     ST  3,-3(1)	Store variable j
* WHILE
789:     LD  3,-3(1)	Load variable j
790:     ST  3,-5(1)	Save left side 
791:    LDC  3,9(6)	Load integer constant 
792:     LD  4,-5(1)	Load left into ac1 
793:    TLT  3,4,3	Op < 
794:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  input
796:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
797:    LDA  1,-5(1)	Load address of new frame 
798:    LDA  3,1(7)	Return address in ac 
799:    LDA  7,-799(7)	CALL input
800:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
801:     ST  3,-4(1)	Store variable inputVal
* IF
802:     LD  3,-4(1)	Load variable inputVal
803:     ST  3,-5(1)	Save left side 
804:    LDC  3,0(6)	Load integer constant 
805:     LD  4,-5(1)	Load left into ac1 
806:    TGT  3,4,3	Op > 
807:     ST  3,-5(1)	Save left side 
808:     LD  3,-4(1)	Load variable inputVal
809:     ST  3,-6(1)	Save left side 
810:    LDC  3,10(6)	Load integer constant 
811:     LD  4,-6(1)	Load left into ac1 
812:    TLT  3,4,3	Op < 
813:     LD  4,-5(1)	Load left into ac1 
814:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  setValue
816:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
817:     LD  3,-2(1)	Load variable i
818:     ST  3,-7(1)	Store parameter 
*                       Load param 2
819:     LD  3,-3(1)	Load variable j
820:     ST  3,-8(1)	Store parameter 
*                       Load param 3
821:     LD  3,-4(1)	Load variable inputVal
822:     ST  3,-9(1)	Store parameter 
*                       Jump to setValue
823:    LDA  1,-5(1)	Load address of new frame 
824:    LDA  3,1(7)	Return address in ac 
825:    LDA  7,-752(7)	CALL setValue
826:    LDA  3,0(2)	Save the result in ac 
*                       End call to setValue
* EXPRESSION
*                       Begin call to  setLocked
827:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
828:     LD  3,-2(1)	Load variable i
829:     ST  3,-7(1)	Store parameter 
*                       Load param 2
830:     LD  3,-3(1)	Load variable j
831:     ST  3,-8(1)	Store parameter 
*                       Load param 3
832:    LDC  3,1(6)	Load Boolean constant 
833:     ST  3,-9(1)	Store parameter 
*                       Jump to setLocked
834:    LDA  1,-5(1)	Load address of new frame 
835:    LDA  3,1(7)	Return address in ac 
836:    LDA  7,-722(7)	CALL setLocked
837:    LDA  3,0(2)	Save the result in ac 
*                       End call to setLocked
* END COMPOUND
815:    JZR  3,22(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
838:     LD  3,-3(1)	load lhs variable j
839:    LDA  3,1(3)	increment value of j
840:     ST  3,-3(1)	Store variable j
* END COMPOUND
841:    LDA  7,-53(7)	go to beginning of loop 
795:    LDA  7,46(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
842:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
843:    LDA  1,-5(1)	Load address of new frame 
844:    LDA  3,1(7)	Return address in ac 
845:    LDA  7,-809(7)	CALL outnl
846:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
847:     LD  3,-2(1)	load lhs variable i
848:    LDA  3,1(3)	increment value of i
849:     ST  3,-2(1)	Store variable i
* END COMPOUND
850:    LDA  7,-71(7)	go to beginning of loop 
786:    LDA  7,64(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
851:    LDC  2,0(6)	Set return value to 0 
852:     LD  3,-1(1)	Load return address 
853:     LD  1,0(1)	Adjust fp 
854:    LDA  7,0(3)	Return 
* END FUNCTION getInput
* FUNCTION main
855:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  initBoard
856:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to initBoard
857:    LDA  1,-2(1)	Load address of new frame 
858:    LDA  3,1(7)	Return address in ac 
859:    LDA  7,-818(7)	CALL initBoard
860:    LDA  3,0(2)	Save the result in ac 
*                       End call to initBoard
* EXPRESSION
*                       Begin call to  getInput
861:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to getInput
862:    LDA  1,-2(1)	Load address of new frame 
863:    LDA  3,1(7)	Return address in ac 
864:    LDA  7,-88(7)	CALL getInput
865:    LDA  3,0(2)	Save the result in ac 
*                       End call to getInput
* IF
*                       Begin call to  solve
866:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to solve
867:    LDA  1,-2(1)	Load address of new frame 
868:    LDA  3,1(7)	Return address in ac 
869:    LDA  7,-272(7)	CALL solve
870:    LDA  3,0(2)	Save the result in ac 
*                       End call to solve
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  showBoard
872:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to showBoard
873:    LDA  1,-2(1)	Load address of new frame 
874:    LDA  3,1(7)	Return address in ac 
875:    LDA  7,-160(7)	CALL showBoard
876:    LDA  3,0(2)	Save the result in ac 
*                       End call to showBoard
* END COMPOUND
871:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
*                       Begin call to  outputb
878:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
879:    LDC  3,0(6)	Load Boolean constant 
880:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
881:    LDA  1,-2(1)	Load address of new frame 
882:    LDA  3,1(7)	Return address in ac 
883:    LDA  7,-866(7)	CALL outputb
884:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
885:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
886:    LDA  1,-2(1)	Load address of new frame 
887:    LDA  3,1(7)	Return address in ac 
888:    LDA  7,-852(7)	CALL outnl
889:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
877:    LDA  7,12(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
890:    LDC  3,0(6)	Load integer constant 
891:    LDA  2,0(3)	Copy result to rt register 
892:     LD  3,-1(1)	Load return address 
893:     LD  1,0(1)	Adjust fp 
894:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
895:    LDC  2,0(6)	Set return value to 0 
896:     LD  3,-1(1)	Load return address 
897:     LD  1,0(1)	Adjust fp 
898:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,898(7)	Jump to init [backpatch] 
* INIT
899:     LD  0,0(0)	Set the global pointer 
900:    LDA  1,-164(0)	set first frame at end of globals 
901:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
902:    LDC  3,81(6)	load size of array board
903:     ST  3,0(0)	save size of array board
904:    LDC  3,81(6)	load size of array locked
905:     ST  3,-82(0)	save size of array locked
* END INIT GLOBALS AND STATICS
906:    LDA  3,1(7)	Return address in ac 
907:    LDA  7,-53(7)	Jump to main 
908:   HALT  0,0,0	DONE! 
* END INIT
