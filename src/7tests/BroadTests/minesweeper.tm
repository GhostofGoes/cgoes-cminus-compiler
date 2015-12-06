* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  minesweeper.c-
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
* FUNCTION Random
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:     LD  3,0(0)	Load variable seed
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,333331(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    MUL  3,4,3	Op * 
 48:     ST  3,-3(1)	Save left side 
 49:    LDC  3,3331(6)	Load integer constant 
 50:     LD  4,-3(1)	Load left into ac1 
 51:    ADD  3,4,3	Op + 
 52:     ST  3,0(0)	Store variable seed
* IF
 53:     LD  3,0(0)	Load variable seed
 54:     ST  3,-3(1)	Save left side 
 55:    LDC  3,0(6)	Load integer constant 
 56:     LD  4,-3(1)	Load left into ac1 
 57:    TLT  3,4,3	Op < 
* THEN
* RETURN
 59:     LD  3,0(0)	Load variable seed
 60:    LDC  4,0(6)	Load 0 
 61:    SUB  3,4,3	Op unary - 
 62:     ST  3,-3(1)	Save left side 
 63:    LDC  3,100(6)	Load integer constant 
 64:     LD  4,-3(1)	Load left into ac1 
 65:    DIV  5,4,3	Op % 
 66:    MUL  5,5,3	 
 67:    SUB  3,4,5	 
 68:    LDA  2,0(3)	Copy result to rt register 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    LDA  7,0(3)	Return 
 58:    JZR  3,14(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 73:     LD  3,0(0)	Load variable seed
 74:     ST  3,-3(1)	Save left side 
 75:    LDC  3,100(6)	Load integer constant 
 76:     LD  4,-3(1)	Load left into ac1 
 77:    DIV  5,4,3	Op % 
 78:    MUL  5,5,3	 
 79:    SUB  3,4,5	 
 80:    LDA  2,0(3)	Copy result to rt register 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
 72:    LDA  7,11(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6)	Set return value to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END FUNCTION Random
* FUNCTION CreateBoard
 88:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 89:    LDC  3,0(6)	Load integer constant 
 90:     ST  3,-2(1)	Store variable i
* WHILE
 91:     LD  3,-2(1)	Load variable i
 92:     ST  3,-4(1)	Save left side 
 93:    LDC  3,100(6)	Load integer constant 
 94:     LD  4,-4(1)	Load left into ac1 
 95:    TLT  3,4,3	Op < 
 96:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 98:     LD  3,-2(1)	Load variable i
 99:     ST  3,-4(1)	Save index 
100:    LDC  3,0(6)	Load Boolean constant 
101:     LD  4,-4(1)	Restore index 
102:    LDA  5,-103(0)	Load address of base of array guess
103:    SUB  5,5,4	Compute offset of value 
104:     ST  3,0(5)	Store variable guess
* EXPRESSION
105:    LDC  3,1(6)	Load integer constant 
106:     LD  4,-2(1)	load lhs variable i
107:    ADD  3,4,3	op += 
108:     ST  3,-2(1)	Store variable i
* END COMPOUND
109:    LDA  7,-19(7)	go to beginning of loop 
 97:    LDA  7,12(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
110:    LDC  3,0(6)	Load integer constant 
111:     ST  3,-2(1)	Store variable i
* WHILE
112:     LD  3,-2(1)	Load variable i
113:     ST  3,-4(1)	Save left side 
114:    LDC  3,100(6)	Load integer constant 
115:     LD  4,-4(1)	Load left into ac1 
116:    TLT  3,4,3	Op < 
117:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
119:     LD  3,-2(1)	Load variable i
120:     ST  3,-4(1)	Save index 
121:    LDC  3,0(6)	Load integer constant 
122:     LD  4,-4(1)	Restore index 
123:    LDA  5,-2(0)	Load address of base of array board
124:    SUB  5,5,4	Compute offset of value 
125:     ST  3,0(5)	Store variable board
* EXPRESSION
126:    LDC  3,1(6)	Load integer constant 
127:     LD  4,-2(1)	load lhs variable i
128:    ADD  3,4,3	op += 
129:     ST  3,-2(1)	Store variable i
* END COMPOUND
130:    LDA  7,-19(7)	go to beginning of loop 
118:    LDA  7,12(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
131:    LDC  3,0(6)	Load integer constant 
132:     ST  3,-2(1)	Store variable i
* WHILE
133:     LD  3,-2(1)	Load variable i
134:     ST  3,-4(1)	Save left side 
135:    LDC  3,15(6)	Load integer constant 
136:     LD  4,-4(1)	Load left into ac1 
137:    TLE  3,4,3	Op <= 
138:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* WHILE
140:    LDC  3,1(6)	Load Boolean constant 
141:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  Random
143:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to Random
144:    LDA  1,-5(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-105(7)	CALL Random
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to Random
148:     ST  3,-4(1)	Store variable rand
* IF
149:     LD  3,-4(1)	Load variable rand
150:    LDA  4,-2(0)	Load address of base of array board
151:    SUB  3,4,3	Compute offset of value 
152:     LD  3,0(3)	Load the value 
153:     ST  3,-5(1)	Save left side 
154:    LDC  3,1(6)	Load integer constant 
155:    LDC  4,0(6)	Load 0 
156:    SUB  3,4,3	Op unary - 
157:     LD  4,-5(1)	Load left into ac1 
158:    TNE  3,4,3	Op != 
* THEN
* COMPOUND
* EXPRESSION
160:     LD  3,-4(1)	Load variable rand
161:     ST  3,-5(1)	Save index 
162:    LDC  3,1(6)	Load integer constant 
163:    LDC  4,0(6)	Load 0 
164:    SUB  3,4,3	Op unary - 
165:     LD  4,-5(1)	Restore index 
166:    LDA  5,-2(0)	Load address of base of array board
167:    SUB  5,5,4	Compute offset of value 
168:     ST  3,0(5)	Store variable board
* IF
169:     LD  3,-4(1)	Load variable rand
170:     ST  3,-5(1)	Save left side 
171:    LDC  3,10(6)	Load integer constant 
172:     LD  4,-5(1)	Load left into ac1 
173:    DIV  5,4,3	Op % 
174:    MUL  5,5,3	 
175:    SUB  3,4,5	 
176:     ST  3,-5(1)	Save left side 
177:    LDC  3,0(6)	Load integer constant 
178:     LD  4,-5(1)	Load left into ac1 
179:    TNE  3,4,3	Op != 
180:     ST  3,-5(1)	Save left side 
181:     LD  3,-4(1)	Load variable rand
182:     ST  3,-6(1)	Save left side 
183:    LDC  3,9(6)	Load integer constant 
184:     LD  4,-6(1)	Load left into ac1 
185:    TGT  3,4,3	Op > 
186:     LD  4,-5(1)	Load left into ac1 
187:    AND  3,4,3	Op AND 
* THEN
* IF
189:     LD  3,-4(1)	Load variable rand
190:     ST  3,-5(1)	Save left side 
191:    LDC  3,11(6)	Load integer constant 
192:     LD  4,-5(1)	Load left into ac1 
193:    SUB  3,4,3	Op - 
194:    LDA  4,-2(0)	Load address of base of array board
195:    SUB  3,4,3	Compute offset of value 
196:     LD  3,0(3)	Load the value 
197:     ST  3,-5(1)	Save left side 
198:    LDC  3,1(6)	Load integer constant 
199:    LDC  4,0(6)	Load 0 
200:    SUB  3,4,3	Op unary - 
201:     LD  4,-5(1)	Load left into ac1 
202:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
204:     LD  3,-4(1)	Load variable rand
205:     ST  3,-5(1)	Save left side 
206:    LDC  3,11(6)	Load integer constant 
207:     LD  4,-5(1)	Load left into ac1 
208:    SUB  3,4,3	Op - 
209:     ST  3,-5(1)	Save index 
210:    LDC  3,1(6)	Load integer constant 
211:     LD  4,-5(1)	Restore index 
212:    LDA  5,-2(0)	Load address of base of array board
213:    SUB  5,5,4	Compute offset of value 
214:     LD  4,0(5)	load lhs variable board
215:    ADD  3,4,3	op += 
216:     ST  3,0(5)	Store variable board
203:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
188:    JZR  3,28(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
217:     LD  3,-4(1)	Load variable rand
218:     ST  3,-5(1)	Save left side 
219:    LDC  3,9(6)	Load integer constant 
220:     LD  4,-5(1)	Load left into ac1 
221:    TGT  3,4,3	Op > 
* THEN
* IF
223:     LD  3,-4(1)	Load variable rand
224:     ST  3,-5(1)	Save left side 
225:    LDC  3,10(6)	Load integer constant 
226:     LD  4,-5(1)	Load left into ac1 
227:    SUB  3,4,3	Op - 
228:    LDA  4,-2(0)	Load address of base of array board
229:    SUB  3,4,3	Compute offset of value 
230:     LD  3,0(3)	Load the value 
231:     ST  3,-5(1)	Save left side 
232:    LDC  3,1(6)	Load integer constant 
233:    LDC  4,0(6)	Load 0 
234:    SUB  3,4,3	Op unary - 
235:     LD  4,-5(1)	Load left into ac1 
236:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
238:     LD  3,-4(1)	Load variable rand
239:     ST  3,-5(1)	Save left side 
240:    LDC  3,10(6)	Load integer constant 
241:     LD  4,-5(1)	Load left into ac1 
242:    SUB  3,4,3	Op - 
243:     ST  3,-5(1)	Save index 
244:    LDC  3,1(6)	Load integer constant 
245:     LD  4,-5(1)	Restore index 
246:    LDA  5,-2(0)	Load address of base of array board
247:    SUB  5,5,4	Compute offset of value 
248:     LD  4,0(5)	load lhs variable board
249:    ADD  3,4,3	op += 
250:     ST  3,0(5)	Store variable board
237:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
222:    JZR  3,28(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
251:     LD  3,-4(1)	Load variable rand
252:     ST  3,-5(1)	Save left side 
253:    LDC  3,9(6)	Load integer constant 
254:     LD  4,-5(1)	Load left into ac1 
255:    DIV  5,4,3	Op % 
256:    MUL  5,5,3	 
257:    SUB  3,4,5	 
258:     ST  3,-5(1)	Save left side 
259:    LDC  3,0(6)	Load integer constant 
260:     LD  4,-5(1)	Load left into ac1 
261:    TNE  3,4,3	Op != 
262:     ST  3,-5(1)	Save left side 
263:     LD  3,-4(1)	Load variable rand
264:     ST  3,-6(1)	Save left side 
265:    LDC  3,9(6)	Load integer constant 
266:     LD  4,-6(1)	Load left into ac1 
267:    TGT  3,4,3	Op > 
268:     LD  4,-5(1)	Load left into ac1 
269:    AND  3,4,3	Op AND 
* THEN
* IF
271:     LD  3,-4(1)	Load variable rand
272:     ST  3,-5(1)	Save left side 
273:    LDC  3,9(6)	Load integer constant 
274:     LD  4,-5(1)	Load left into ac1 
275:    SUB  3,4,3	Op - 
276:    LDA  4,-2(0)	Load address of base of array board
277:    SUB  3,4,3	Compute offset of value 
278:     LD  3,0(3)	Load the value 
279:     ST  3,-5(1)	Save left side 
280:    LDC  3,1(6)	Load integer constant 
281:    LDC  4,0(6)	Load 0 
282:    SUB  3,4,3	Op unary - 
283:     LD  4,-5(1)	Load left into ac1 
284:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
286:     LD  3,-4(1)	Load variable rand
287:     ST  3,-5(1)	Save left side 
288:    LDC  3,9(6)	Load integer constant 
289:     LD  4,-5(1)	Load left into ac1 
290:    SUB  3,4,3	Op - 
291:     ST  3,-5(1)	Save index 
292:    LDC  3,1(6)	Load integer constant 
293:     LD  4,-5(1)	Restore index 
294:    LDA  5,-2(0)	Load address of base of array board
295:    SUB  5,5,4	Compute offset of value 
296:     LD  4,0(5)	load lhs variable board
297:    ADD  3,4,3	op += 
298:     ST  3,0(5)	Store variable board
285:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
270:    JZR  3,28(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
299:     LD  3,-4(1)	Load variable rand
300:     ST  3,-5(1)	Save left side 
301:    LDC  3,10(6)	Load integer constant 
302:     LD  4,-5(1)	Load left into ac1 
303:    DIV  5,4,3	Op % 
304:    MUL  5,5,3	 
305:    SUB  3,4,5	 
306:     ST  3,-5(1)	Save left side 
307:    LDC  3,0(6)	Load integer constant 
308:     LD  4,-5(1)	Load left into ac1 
309:    TNE  3,4,3	Op != 
* THEN
* IF
311:     LD  3,-4(1)	Load variable rand
312:     ST  3,-5(1)	Save left side 
313:    LDC  3,1(6)	Load integer constant 
314:     LD  4,-5(1)	Load left into ac1 
315:    SUB  3,4,3	Op - 
316:    LDA  4,-2(0)	Load address of base of array board
317:    SUB  3,4,3	Compute offset of value 
318:     LD  3,0(3)	Load the value 
319:     ST  3,-5(1)	Save left side 
320:    LDC  3,1(6)	Load integer constant 
321:    LDC  4,0(6)	Load 0 
322:    SUB  3,4,3	Op unary - 
323:     LD  4,-5(1)	Load left into ac1 
324:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
326:     LD  3,-4(1)	Load variable rand
327:     ST  3,-5(1)	Save left side 
328:    LDC  3,1(6)	Load integer constant 
329:     LD  4,-5(1)	Load left into ac1 
330:    SUB  3,4,3	Op - 
331:     ST  3,-5(1)	Save index 
332:    LDC  3,1(6)	Load integer constant 
333:     LD  4,-5(1)	Restore index 
334:    LDA  5,-2(0)	Load address of base of array board
335:    SUB  5,5,4	Compute offset of value 
336:     LD  4,0(5)	load lhs variable board
337:    ADD  3,4,3	op += 
338:     ST  3,0(5)	Store variable board
325:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
310:    JZR  3,28(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
339:     LD  3,-4(1)	Load variable rand
340:     ST  3,-5(1)	Save left side 
341:    LDC  3,9(6)	Load integer constant 
342:     LD  4,-5(1)	Load left into ac1 
343:    DIV  5,4,3	Op % 
344:    MUL  5,5,3	 
345:    SUB  3,4,5	 
346:     ST  3,-5(1)	Save left side 
347:    LDC  3,0(6)	Load integer constant 
348:     LD  4,-5(1)	Load left into ac1 
349:    TNE  3,4,3	Op != 
350:     ST  3,-5(1)	Save left side 
351:     LD  3,-4(1)	Load variable rand
352:     ST  3,-6(1)	Save left side 
353:    LDC  3,0(6)	Load integer constant 
354:     LD  4,-6(1)	Load left into ac1 
355:    TEQ  3,4,3	Op == 
356:     LD  4,-5(1)	Load left into ac1 
357:     OR  3,4,3	Op OR 
* THEN
* IF
359:     LD  3,-4(1)	Load variable rand
360:     ST  3,-5(1)	Save left side 
361:    LDC  3,1(6)	Load integer constant 
362:     LD  4,-5(1)	Load left into ac1 
363:    ADD  3,4,3	Op + 
364:    LDA  4,-2(0)	Load address of base of array board
365:    SUB  3,4,3	Compute offset of value 
366:     LD  3,0(3)	Load the value 
367:     ST  3,-5(1)	Save left side 
368:    LDC  3,1(6)	Load integer constant 
369:    LDC  4,0(6)	Load 0 
370:    SUB  3,4,3	Op unary - 
371:     LD  4,-5(1)	Load left into ac1 
372:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
374:     LD  3,-4(1)	Load variable rand
375:     ST  3,-5(1)	Save left side 
376:    LDC  3,1(6)	Load integer constant 
377:     LD  4,-5(1)	Load left into ac1 
378:    ADD  3,4,3	Op + 
379:     ST  3,-5(1)	Save index 
380:    LDC  3,1(6)	Load integer constant 
381:     LD  4,-5(1)	Restore index 
382:    LDA  5,-2(0)	Load address of base of array board
383:    SUB  5,5,4	Compute offset of value 
384:     LD  4,0(5)	load lhs variable board
385:    ADD  3,4,3	op += 
386:     ST  3,0(5)	Store variable board
373:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
358:    JZR  3,28(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
387:     LD  3,-4(1)	Load variable rand
388:     ST  3,-5(1)	Save left side 
389:    LDC  3,10(6)	Load integer constant 
390:     LD  4,-5(1)	Load left into ac1 
391:    DIV  5,4,3	Op % 
392:    MUL  5,5,3	 
393:    SUB  3,4,5	 
394:     ST  3,-5(1)	Save left side 
395:    LDC  3,0(6)	Load integer constant 
396:     LD  4,-5(1)	Load left into ac1 
397:    TNE  3,4,3	Op != 
398:     ST  3,-5(1)	Save left side 
399:     LD  3,-4(1)	Load variable rand
400:     ST  3,-6(1)	Save left side 
401:    LDC  3,90(6)	Load integer constant 
402:     LD  4,-6(1)	Load left into ac1 
403:    TLT  3,4,3	Op < 
404:     LD  4,-5(1)	Load left into ac1 
405:    AND  3,4,3	Op AND 
* THEN
* IF
407:     LD  3,-4(1)	Load variable rand
408:     ST  3,-5(1)	Save left side 
409:    LDC  3,9(6)	Load integer constant 
410:     LD  4,-5(1)	Load left into ac1 
411:    ADD  3,4,3	Op + 
412:    LDA  4,-2(0)	Load address of base of array board
413:    SUB  3,4,3	Compute offset of value 
414:     LD  3,0(3)	Load the value 
415:     ST  3,-5(1)	Save left side 
416:    LDC  3,1(6)	Load integer constant 
417:    LDC  4,0(6)	Load 0 
418:    SUB  3,4,3	Op unary - 
419:     LD  4,-5(1)	Load left into ac1 
420:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
422:     LD  3,-4(1)	Load variable rand
423:     ST  3,-5(1)	Save left side 
424:    LDC  3,9(6)	Load integer constant 
425:     LD  4,-5(1)	Load left into ac1 
426:    ADD  3,4,3	Op + 
427:     ST  3,-5(1)	Save index 
428:    LDC  3,1(6)	Load integer constant 
429:     LD  4,-5(1)	Restore index 
430:    LDA  5,-2(0)	Load address of base of array board
431:    SUB  5,5,4	Compute offset of value 
432:     LD  4,0(5)	load lhs variable board
433:    ADD  3,4,3	op += 
434:     ST  3,0(5)	Store variable board
421:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
406:    JZR  3,28(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
435:     LD  3,-4(1)	Load variable rand
436:     ST  3,-5(1)	Save left side 
437:    LDC  3,90(6)	Load integer constant 
438:     LD  4,-5(1)	Load left into ac1 
439:    TLT  3,4,3	Op < 
* THEN
* IF
441:     LD  3,-4(1)	Load variable rand
442:     ST  3,-5(1)	Save left side 
443:    LDC  3,10(6)	Load integer constant 
444:     LD  4,-5(1)	Load left into ac1 
445:    ADD  3,4,3	Op + 
446:    LDA  4,-2(0)	Load address of base of array board
447:    SUB  3,4,3	Compute offset of value 
448:     LD  3,0(3)	Load the value 
449:     ST  3,-5(1)	Save left side 
450:    LDC  3,1(6)	Load integer constant 
451:    LDC  4,0(6)	Load 0 
452:    SUB  3,4,3	Op unary - 
453:     LD  4,-5(1)	Load left into ac1 
454:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
456:     LD  3,-4(1)	Load variable rand
457:     ST  3,-5(1)	Save left side 
458:    LDC  3,10(6)	Load integer constant 
459:     LD  4,-5(1)	Load left into ac1 
460:    ADD  3,4,3	Op + 
461:     ST  3,-5(1)	Save index 
462:    LDC  3,1(6)	Load integer constant 
463:     LD  4,-5(1)	Restore index 
464:    LDA  5,-2(0)	Load address of base of array board
465:    SUB  5,5,4	Compute offset of value 
466:     LD  4,0(5)	load lhs variable board
467:    ADD  3,4,3	op += 
468:     ST  3,0(5)	Store variable board
455:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
440:    JZR  3,28(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
469:     LD  3,-4(1)	Load variable rand
470:     ST  3,-5(1)	Save left side 
471:    LDC  3,9(6)	Load integer constant 
472:     LD  4,-5(1)	Load left into ac1 
473:    DIV  5,4,3	Op % 
474:    MUL  5,5,3	 
475:    SUB  3,4,5	 
476:     ST  3,-5(1)	Save left side 
477:    LDC  3,0(6)	Load integer constant 
478:     LD  4,-5(1)	Load left into ac1 
479:    TNE  3,4,3	Op != 
480:     ST  3,-5(1)	Save left side 
481:     LD  3,-4(1)	Load variable rand
482:     ST  3,-6(1)	Save left side 
483:    LDC  3,90(6)	Load integer constant 
484:     LD  4,-6(1)	Load left into ac1 
485:    TLT  3,4,3	Op < 
486:     LD  4,-5(1)	Load left into ac1 
487:    AND  3,4,3	Op AND 
* THEN
* IF
489:     LD  3,-4(1)	Load variable rand
490:     ST  3,-5(1)	Save left side 
491:    LDC  3,11(6)	Load integer constant 
492:     LD  4,-5(1)	Load left into ac1 
493:    ADD  3,4,3	Op + 
494:    LDA  4,-2(0)	Load address of base of array board
495:    SUB  3,4,3	Compute offset of value 
496:     LD  3,0(3)	Load the value 
497:     ST  3,-5(1)	Save left side 
498:    LDC  3,1(6)	Load integer constant 
499:    LDC  4,0(6)	Load 0 
500:    SUB  3,4,3	Op unary - 
501:     LD  4,-5(1)	Load left into ac1 
502:    TNE  3,4,3	Op != 
* THEN
* EXPRESSION
504:     LD  3,-4(1)	Load variable rand
505:     ST  3,-5(1)	Save left side 
506:    LDC  3,11(6)	Load integer constant 
507:     LD  4,-5(1)	Load left into ac1 
508:    ADD  3,4,3	Op + 
509:     ST  3,-5(1)	Save index 
510:    LDC  3,1(6)	Load integer constant 
511:     LD  4,-5(1)	Restore index 
512:    LDA  5,-2(0)	Load address of base of array board
513:    SUB  5,5,4	Compute offset of value 
514:     LD  4,0(5)	load lhs variable board
515:    ADD  3,4,3	op += 
516:     ST  3,0(5)	Store variable board
503:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
488:    JZR  3,28(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* BREAK
517:    LDA  7,-376(7)	break 
* END COMPOUND
159:    JZR  3,358(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
518:    LDA  7,-379(7)	go to beginning of loop 
142:    LDA  7,376(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
519:    LDC  3,1(6)	Load integer constant 
520:     LD  4,-2(1)	load lhs variable i
521:    ADD  3,4,3	op += 
522:     ST  3,-2(1)	Store variable i
* END COMPOUND
523:    LDA  7,-391(7)	go to beginning of loop 
139:    LDA  7,384(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
524:    LDC  2,0(6)	Set return value to 0 
525:     LD  3,-1(1)	Load return address 
526:     LD  1,0(1)	Adjust fp 
527:    LDA  7,0(3)	Return 
* END FUNCTION CreateBoard
* FUNCTION PrintBoard
528:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
529:    LDC  3,1(6)	Load integer constant 
530:     ST  3,-2(1)	Store variable i
* EXPRESSION
*                       Begin call to  outnl
531:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
532:    LDA  1,-3(1)	Load address of new frame 
533:    LDA  3,1(7)	Return address in ac 
534:    LDA  7,-498(7)	CALL outnl
535:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* WHILE
536:     LD  3,-2(1)	Load variable i
537:     ST  3,-3(1)	Save left side 
538:    LDC  3,101(6)	Load integer constant 
539:     LD  4,-3(1)	Load left into ac1 
540:    TLT  3,4,3	Op < 
541:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
543:     LD  3,-2(1)	Load variable i
544:     ST  3,-3(1)	Save left side 
545:    LDC  3,1(6)	Load integer constant 
546:     LD  4,-3(1)	Load left into ac1 
547:    SUB  3,4,3	Op - 
548:    LDA  4,-103(0)	Load address of base of array guess
549:    SUB  3,4,3	Compute offset of value 
550:     LD  3,0(3)	Load the value 
* THEN
* COMPOUND
* IF
552:     LD  3,-2(1)	Load variable i
553:     ST  3,-3(1)	Save left side 
554:    LDC  3,1(6)	Load integer constant 
555:     LD  4,-3(1)	Load left into ac1 
556:    SUB  3,4,3	Op - 
557:    LDA  4,-2(0)	Load address of base of array board
558:    SUB  3,4,3	Compute offset of value 
559:     LD  3,0(3)	Load the value 
560:     ST  3,-3(1)	Save left side 
561:    LDC  3,1(6)	Load integer constant 
562:    LDC  4,0(6)	Load 0 
563:    SUB  3,4,3	Op unary - 
564:     LD  4,-3(1)	Load left into ac1 
565:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  outputb
567:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
568:    LDC  3,1(6)	Load Boolean constant 
569:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
570:    LDA  1,-3(1)	Load address of new frame 
571:    LDA  3,1(7)	Return address in ac 
572:    LDA  7,-555(7)	CALL outputb
573:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
566:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
575:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
576:     LD  3,-2(1)	Load variable i
577:     ST  3,-5(1)	Save left side 
578:    LDC  3,1(6)	Load integer constant 
579:     LD  4,-5(1)	Load left into ac1 
580:    SUB  3,4,3	Op - 
581:    LDA  4,-2(0)	Load address of base of array board
582:    SUB  3,4,3	Compute offset of value 
583:     LD  3,0(3)	Load the value 
584:     ST  3,-5(1)	Store parameter 
*                       Jump to output
585:    LDA  1,-3(1)	Load address of new frame 
586:    LDA  3,1(7)	Return address in ac 
587:    LDA  7,-582(7)	CALL output
588:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
574:    LDA  7,14(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
551:    JZR  3,38(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  outputb
590:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
591:    LDC  3,0(6)	Load Boolean constant 
592:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
593:    LDA  1,-3(1)	Load address of new frame 
594:    LDA  3,1(7)	Return address in ac 
595:    LDA  7,-578(7)	CALL outputb
596:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
589:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
597:     LD  3,-2(1)	Load variable i
598:     ST  3,-3(1)	Save left side 
599:    LDC  3,10(6)	Load integer constant 
600:     LD  4,-3(1)	Load left into ac1 
601:    DIV  5,4,3	Op % 
602:    MUL  5,5,3	 
603:    SUB  3,4,5	 
604:     ST  3,-3(1)	Save left side 
605:    LDC  3,0(6)	Load integer constant 
606:     LD  4,-3(1)	Load left into ac1 
607:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  outnl
609:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
610:    LDA  1,-3(1)	Load address of new frame 
611:    LDA  3,1(7)	Return address in ac 
612:    LDA  7,-576(7)	CALL outnl
613:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
608:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
614:    LDC  3,1(6)	Load integer constant 
615:     LD  4,-2(1)	load lhs variable i
616:    ADD  3,4,3	op += 
617:     ST  3,-2(1)	Store variable i
* END COMPOUND
618:    LDA  7,-83(7)	go to beginning of loop 
542:    LDA  7,76(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
619:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
620:    LDA  1,-3(1)	Load address of new frame 
621:    LDA  3,1(7)	Return address in ac 
622:    LDA  7,-586(7)	CALL outnl
623:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
624:    LDC  2,0(6)	Set return value to 0 
625:     LD  3,-1(1)	Load return address 
626:     LD  1,0(1)	Adjust fp 
627:    LDA  7,0(3)	Return 
* END FUNCTION PrintBoard
* FUNCTION Move
628:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
629:     LD  3,-2(1)	Load variable m
630:     ST  3,-3(1)	Save index 
631:    LDC  3,1(6)	Load Boolean constant 
632:     LD  4,-3(1)	Restore index 
633:    LDA  5,-103(0)	Load address of base of array guess
634:    SUB  5,5,4	Compute offset of value 
635:     ST  3,0(5)	Store variable guess
* IF
636:     LD  3,-2(1)	Load variable m
637:    LDA  4,-2(0)	Load address of base of array board
638:    SUB  3,4,3	Compute offset of value 
639:     LD  3,0(3)	Load the value 
640:     ST  3,-3(1)	Save left side 
641:    LDC  3,0(6)	Load integer constant 
642:     LD  4,-3(1)	Load left into ac1 
643:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* IF
645:     LD  3,-2(1)	Load variable m
646:     ST  3,-3(1)	Save left side 
647:    LDC  3,9(6)	Load integer constant 
648:     LD  4,-3(1)	Load left into ac1 
649:    TGT  3,4,3	Op > 
* THEN
* IF
651:     LD  3,-2(1)	Load variable m
652:     ST  3,-3(1)	Save left side 
653:    LDC  3,10(6)	Load integer constant 
654:     LD  4,-3(1)	Load left into ac1 
655:    SUB  3,4,3	Op - 
656:    LDA  4,-2(0)	Load address of base of array board
657:    SUB  3,4,3	Compute offset of value 
658:     LD  3,0(3)	Load the value 
659:     ST  3,-3(1)	Save left side 
660:    LDC  3,0(6)	Load integer constant 
661:     LD  4,-3(1)	Load left into ac1 
662:    TEQ  3,4,3	Op == 
663:     ST  3,-3(1)	Save left side 
664:     LD  3,-2(1)	Load variable m
665:     ST  3,-4(1)	Save left side 
666:    LDC  3,10(6)	Load integer constant 
667:     LD  4,-4(1)	Load left into ac1 
668:    SUB  3,4,3	Op - 
669:    LDA  4,-103(0)	Load address of base of array guess
670:    SUB  3,4,3	Compute offset of value 
671:     LD  3,0(3)	Load the value 
672:    LDC  4,1(6)	Load 1 
673:    XOR  3,3,4	Op NOT 
674:     LD  4,-3(1)	Load left into ac1 
675:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  Move
677:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
678:     LD  3,-2(1)	Load variable m
679:     ST  3,-5(1)	Save left side 
680:    LDC  3,10(6)	Load integer constant 
681:     LD  4,-5(1)	Load left into ac1 
682:    SUB  3,4,3	Op - 
683:     ST  3,-5(1)	Store parameter 
*                       Jump to Move
684:    LDA  1,-3(1)	Load address of new frame 
685:    LDA  3,1(7)	Return address in ac 
686:    LDA  7,-59(7)	CALL Move
687:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
676:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
650:    JZR  3,37(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
688:     LD  3,-2(1)	Load variable m
689:     ST  3,-3(1)	Save left side 
690:    LDC  3,10(6)	Load integer constant 
691:     LD  4,-3(1)	Load left into ac1 
692:    DIV  5,4,3	Op % 
693:    MUL  5,5,3	 
694:    SUB  3,4,5	 
695:     ST  3,-3(1)	Save left side 
696:    LDC  3,0(6)	Load integer constant 
697:     LD  4,-3(1)	Load left into ac1 
698:    TNE  3,4,3	Op != 
* THEN
* IF
700:     LD  3,-2(1)	Load variable m
701:     ST  3,-3(1)	Save left side 
702:    LDC  3,1(6)	Load integer constant 
703:     LD  4,-3(1)	Load left into ac1 
704:    SUB  3,4,3	Op - 
705:    LDA  4,-2(0)	Load address of base of array board
706:    SUB  3,4,3	Compute offset of value 
707:     LD  3,0(3)	Load the value 
708:     ST  3,-3(1)	Save left side 
709:    LDC  3,0(6)	Load integer constant 
710:     LD  4,-3(1)	Load left into ac1 
711:    TEQ  3,4,3	Op == 
712:     ST  3,-3(1)	Save left side 
713:     LD  3,-2(1)	Load variable m
714:     ST  3,-4(1)	Save left side 
715:    LDC  3,1(6)	Load integer constant 
716:     LD  4,-4(1)	Load left into ac1 
717:    SUB  3,4,3	Op - 
718:    LDA  4,-103(0)	Load address of base of array guess
719:    SUB  3,4,3	Compute offset of value 
720:     LD  3,0(3)	Load the value 
721:    LDC  4,1(6)	Load 1 
722:    XOR  3,3,4	Op NOT 
723:     LD  4,-3(1)	Load left into ac1 
724:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  Move
726:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
727:     LD  3,-2(1)	Load variable m
728:     ST  3,-5(1)	Save left side 
729:    LDC  3,1(6)	Load integer constant 
730:     LD  4,-5(1)	Load left into ac1 
731:    SUB  3,4,3	Op - 
732:     ST  3,-5(1)	Store parameter 
*                       Jump to Move
733:    LDA  1,-3(1)	Load address of new frame 
734:    LDA  3,1(7)	Return address in ac 
735:    LDA  7,-108(7)	CALL Move
736:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
725:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
699:    JZR  3,37(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
737:     LD  3,-2(1)	Load variable m
738:     ST  3,-3(1)	Save left side 
739:    LDC  3,9(6)	Load integer constant 
740:     LD  4,-3(1)	Load left into ac1 
741:    DIV  5,4,3	Op % 
742:    MUL  5,5,3	 
743:    SUB  3,4,5	 
744:     ST  3,-3(1)	Save left side 
745:    LDC  3,0(6)	Load integer constant 
746:     LD  4,-3(1)	Load left into ac1 
747:    TNE  3,4,3	Op != 
748:     ST  3,-3(1)	Save left side 
749:     LD  3,-2(1)	Load variable m
750:     ST  3,-4(1)	Save left side 
751:    LDC  3,0(6)	Load integer constant 
752:     LD  4,-4(1)	Load left into ac1 
753:    TEQ  3,4,3	Op == 
754:     LD  4,-3(1)	Load left into ac1 
755:     OR  3,4,3	Op OR 
* THEN
* IF
757:     LD  3,-2(1)	Load variable m
758:     ST  3,-3(1)	Save left side 
759:    LDC  3,1(6)	Load integer constant 
760:     LD  4,-3(1)	Load left into ac1 
761:    ADD  3,4,3	Op + 
762:    LDA  4,-2(0)	Load address of base of array board
763:    SUB  3,4,3	Compute offset of value 
764:     LD  3,0(3)	Load the value 
765:     ST  3,-3(1)	Save left side 
766:    LDC  3,0(6)	Load integer constant 
767:     LD  4,-3(1)	Load left into ac1 
768:    TEQ  3,4,3	Op == 
769:     ST  3,-3(1)	Save left side 
770:     LD  3,-2(1)	Load variable m
771:     ST  3,-4(1)	Save left side 
772:    LDC  3,1(6)	Load integer constant 
773:     LD  4,-4(1)	Load left into ac1 
774:    ADD  3,4,3	Op + 
775:    LDA  4,-103(0)	Load address of base of array guess
776:    SUB  3,4,3	Compute offset of value 
777:     LD  3,0(3)	Load the value 
778:    LDC  4,1(6)	Load 1 
779:    XOR  3,3,4	Op NOT 
780:     LD  4,-3(1)	Load left into ac1 
781:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  Move
783:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
784:     LD  3,-2(1)	Load variable m
785:     ST  3,-5(1)	Save left side 
786:    LDC  3,1(6)	Load integer constant 
787:     LD  4,-5(1)	Load left into ac1 
788:    ADD  3,4,3	Op + 
789:     ST  3,-5(1)	Store parameter 
*                       Jump to Move
790:    LDA  1,-3(1)	Load address of new frame 
791:    LDA  3,1(7)	Return address in ac 
792:    LDA  7,-165(7)	CALL Move
793:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
782:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
756:    JZR  3,37(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
794:     LD  3,-2(1)	Load variable m
795:     ST  3,-3(1)	Save left side 
796:    LDC  3,90(6)	Load integer constant 
797:     LD  4,-3(1)	Load left into ac1 
798:    TLT  3,4,3	Op < 
* THEN
* IF
800:     LD  3,-2(1)	Load variable m
801:     ST  3,-3(1)	Save left side 
802:    LDC  3,10(6)	Load integer constant 
803:     LD  4,-3(1)	Load left into ac1 
804:    ADD  3,4,3	Op + 
805:    LDA  4,-2(0)	Load address of base of array board
806:    SUB  3,4,3	Compute offset of value 
807:     LD  3,0(3)	Load the value 
808:     ST  3,-3(1)	Save left side 
809:    LDC  3,0(6)	Load integer constant 
810:     LD  4,-3(1)	Load left into ac1 
811:    TEQ  3,4,3	Op == 
812:     ST  3,-3(1)	Save left side 
813:     LD  3,-2(1)	Load variable m
814:     ST  3,-4(1)	Save left side 
815:    LDC  3,10(6)	Load integer constant 
816:     LD  4,-4(1)	Load left into ac1 
817:    ADD  3,4,3	Op + 
818:    LDA  4,-103(0)	Load address of base of array guess
819:    SUB  3,4,3	Compute offset of value 
820:     LD  3,0(3)	Load the value 
821:    LDC  4,1(6)	Load 1 
822:    XOR  3,3,4	Op NOT 
823:     LD  4,-3(1)	Load left into ac1 
824:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  Move
826:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
827:     LD  3,-2(1)	Load variable m
828:     ST  3,-5(1)	Save left side 
829:    LDC  3,10(6)	Load integer constant 
830:     LD  4,-5(1)	Load left into ac1 
831:    ADD  3,4,3	Op + 
832:     ST  3,-5(1)	Store parameter 
*                       Jump to Move
833:    LDA  1,-3(1)	Load address of new frame 
834:    LDA  3,1(7)	Return address in ac 
835:    LDA  7,-208(7)	CALL Move
836:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
825:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
799:    JZR  3,37(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
644:    JZR  3,192(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
837:    LDC  2,0(6)	Set return value to 0 
838:     LD  3,-1(1)	Load return address 
839:     LD  1,0(1)	Adjust fp 
840:    LDA  7,0(3)	Return 
* END FUNCTION Move
* FUNCTION main
841:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  input
842:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
843:    LDA  1,-5(1)	Load address of new frame 
844:    LDA  3,1(7)	Return address in ac 
845:    LDA  7,-845(7)	CALL input
846:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
847:     ST  3,0(0)	Store variable seed
* EXPRESSION
*                       Begin call to  CreateBoard
848:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to CreateBoard
849:    LDA  1,-5(1)	Load address of new frame 
850:    LDA  3,1(7)	Return address in ac 
851:    LDA  7,-764(7)	CALL CreateBoard
852:    LDA  3,0(2)	Save the result in ac 
*                       End call to CreateBoard
* WHILE
853:    LDC  3,1(6)	Load Boolean constant 
854:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  PrintBoard
856:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to PrintBoard
857:    LDA  1,-5(1)	Load address of new frame 
858:    LDA  3,1(7)	Return address in ac 
859:    LDA  7,-332(7)	CALL PrintBoard
860:    LDA  3,0(2)	Save the result in ac 
*                       End call to PrintBoard
* EXPRESSION
*                       Begin call to  input
861:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
862:    LDA  1,-5(1)	Load address of new frame 
863:    LDA  3,1(7)	Return address in ac 
864:    LDA  7,-864(7)	CALL input
865:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
866:     ST  3,-5(1)	Save left side 
867:    LDC  3,1(6)	Load integer constant 
868:     LD  4,-5(1)	Load left into ac1 
869:    SUB  3,4,3	Op - 
870:     ST  3,-3(1)	Store variable x
* EXPRESSION
*                       Begin call to  input
871:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to input
872:    LDA  1,-5(1)	Load address of new frame 
873:    LDA  3,1(7)	Return address in ac 
874:    LDA  7,-874(7)	CALL input
875:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
876:     ST  3,-5(1)	Save left side 
877:    LDC  3,1(6)	Load integer constant 
878:     LD  4,-5(1)	Load left into ac1 
879:    SUB  3,4,3	Op - 
880:     ST  3,-4(1)	Store variable y
* IF
881:     LD  3,-3(1)	Load variable x
882:     ST  3,-5(1)	Save left side 
883:    LDC  3,9(6)	Load integer constant 
884:     LD  4,-5(1)	Load left into ac1 
885:    TGT  3,4,3	Op > 
886:     ST  3,-5(1)	Save left side 
887:     LD  3,-4(1)	Load variable y
888:     ST  3,-6(1)	Save left side 
889:    LDC  3,9(6)	Load integer constant 
890:     LD  4,-6(1)	Load left into ac1 
891:    TGT  3,4,3	Op > 
892:     LD  4,-5(1)	Load left into ac1 
893:     OR  3,4,3	Op OR 
894:     ST  3,-5(1)	Save left side 
895:     LD  3,-3(1)	Load variable x
896:     ST  3,-6(1)	Save left side 
897:    LDC  3,0(6)	Load integer constant 
898:     LD  4,-6(1)	Load left into ac1 
899:    TLT  3,4,3	Op < 
900:     LD  4,-5(1)	Load left into ac1 
901:     OR  3,4,3	Op OR 
902:     ST  3,-5(1)	Save left side 
903:     LD  3,-4(1)	Load variable y
904:     ST  3,-6(1)	Save left side 
905:    LDC  3,0(6)	Load integer constant 
906:     LD  4,-6(1)	Load left into ac1 
907:    TLT  3,4,3	Op < 
908:     LD  4,-5(1)	Load left into ac1 
909:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outputc
911:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
912:    LDC  3,66(6)	Load char constant 
913:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
914:    LDA  1,-5(1)	Load address of new frame 
915:    LDA  3,1(7)	Return address in ac 
916:    LDA  7,-887(7)	CALL outputc
917:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
918:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
919:    LDC  3,89(6)	Load char constant 
920:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
921:    LDA  1,-5(1)	Load address of new frame 
922:    LDA  3,1(7)	Return address in ac 
923:    LDA  7,-894(7)	CALL outputc
924:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
925:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
926:    LDC  3,69(6)	Load char constant 
927:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
928:    LDA  1,-5(1)	Load address of new frame 
929:    LDA  3,1(7)	Return address in ac 
930:    LDA  7,-901(7)	CALL outputc
931:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
932:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
933:    LDA  1,-5(1)	Load address of new frame 
934:    LDA  3,1(7)	Return address in ac 
935:    LDA  7,-899(7)	CALL outnl
936:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* BREAK
937:    LDA  7,-83(7)	break 
* END COMPOUND
910:    JZR  3,27(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
938:     LD  3,-3(1)	Load variable x
939:     ST  3,-5(1)	Save left side 
940:    LDC  3,10(6)	Load integer constant 
941:     LD  4,-5(1)	Load left into ac1 
942:    MUL  3,4,3	Op * 
943:     ST  3,-5(1)	Save left side 
944:     LD  3,-4(1)	Load variable y
945:     LD  4,-5(1)	Load left into ac1 
946:    ADD  3,4,3	Op + 
947:    LDA  4,-2(0)	Load address of base of array board
948:    SUB  3,4,3	Compute offset of value 
949:     LD  3,0(3)	Load the value 
950:     ST  3,-5(1)	Save left side 
951:    LDC  3,1(6)	Load integer constant 
952:    LDC  4,0(6)	Load 0 
953:    SUB  3,4,3	Op unary - 
954:     LD  4,-5(1)	Load left into ac1 
955:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
957:    LDC  3,0(6)	Load integer constant 
958:     ST  3,-2(1)	Store variable i
* WHILE
959:     LD  3,-2(1)	Load variable i
960:     ST  3,-5(1)	Save left side 
961:    LDC  3,100(6)	Load integer constant 
962:     LD  4,-5(1)	Load left into ac1 
963:    TLT  3,4,3	Op < 
964:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
966:     LD  3,-2(1)	Load variable i
967:     ST  3,-5(1)	Save index 
968:    LDC  3,1(6)	Load Boolean constant 
969:     LD  4,-5(1)	Restore index 
970:    LDA  5,-103(0)	Load address of base of array guess
971:    SUB  5,5,4	Compute offset of value 
972:     ST  3,0(5)	Store variable guess
* EXPRESSION
973:    LDC  3,1(6)	Load integer constant 
974:     LD  4,-2(1)	load lhs variable i
975:    ADD  3,4,3	op += 
976:     ST  3,-2(1)	Store variable i
* END COMPOUND
977:    LDA  7,-19(7)	go to beginning of loop 
965:    LDA  7,12(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  PrintBoard
978:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to PrintBoard
979:    LDA  1,-5(1)	Load address of new frame 
980:    LDA  3,1(7)	Return address in ac 
981:    LDA  7,-454(7)	CALL PrintBoard
982:    LDA  3,0(2)	Save the result in ac 
*                       End call to PrintBoard
* EXPRESSION
*                       Begin call to  outputc
983:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
984:    LDC  3,66(6)	Load char constant 
985:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
986:    LDA  1,-5(1)	Load address of new frame 
987:    LDA  3,1(7)	Return address in ac 
988:    LDA  7,-959(7)	CALL outputc
989:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
990:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
991:    LDC  3,79(6)	Load char constant 
992:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
993:    LDA  1,-5(1)	Load address of new frame 
994:    LDA  3,1(7)	Return address in ac 
995:    LDA  7,-966(7)	CALL outputc
996:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
997:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
998:    LDC  3,79(6)	Load char constant 
999:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1000:    LDA  1,-5(1)	Load address of new frame 
1001:    LDA  3,1(7)	Return address in ac 
1002:    LDA  7,-973(7)	CALL outputc
1003:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1004:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1005:    LDC  3,77(6)	Load char constant 
1006:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1007:    LDA  1,-5(1)	Load address of new frame 
1008:    LDA  3,1(7)	Return address in ac 
1009:    LDA  7,-980(7)	CALL outputc
1010:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1011:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1012:    LDC  3,33(6)	Load char constant 
1013:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1014:    LDA  1,-5(1)	Load address of new frame 
1015:    LDA  3,1(7)	Return address in ac 
1016:    LDA  7,-987(7)	CALL outputc
1017:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
1018:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
1019:    LDA  1,-5(1)	Load address of new frame 
1020:    LDA  3,1(7)	Return address in ac 
1021:    LDA  7,-985(7)	CALL outnl
1022:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* BREAK
1023:    LDA  7,-169(7)	break 
* END COMPOUND
956:    JZR  3,67(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
1024:    LDC  3,0(6)	Load integer constant 
1025:     ST  3,-2(1)	Store variable i
* WHILE
1026:     LD  3,-2(1)	Load variable i
1027:    LDA  4,-103(0)	Load address of base of array guess
1028:    SUB  3,4,3	Compute offset of value 
1029:     LD  3,0(3)	Load the value 
1030:     ST  3,-5(1)	Save left side 
1031:    LDC  3,1(6)	Load Boolean constant 
1032:     LD  4,-5(1)	Load left into ac1 
1033:    TEQ  3,4,3	Op == 
1034:     ST  3,-5(1)	Save left side 
1035:     LD  3,-2(1)	Load variable i
1036:     ST  3,-6(1)	Save left side 
1037:    LDC  3,100(6)	Load integer constant 
1038:     LD  4,-6(1)	Load left into ac1 
1039:    TLT  3,4,3	Op < 
1040:     LD  4,-5(1)	Load left into ac1 
1041:    AND  3,4,3	Op AND 
1042:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
1044:    LDC  3,1(6)	Load integer constant 
1045:     LD  4,-2(1)	load lhs variable i
1046:    ADD  3,4,3	op += 
1047:     ST  3,-2(1)	Store variable i
1048:    LDA  7,-23(7)	go to beginning of loop 
1043:    LDA  7,5(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
1049:     LD  3,-2(1)	Load variable i
1050:     ST  3,-5(1)	Save left side 
1051:    LDC  3,100(6)	Load integer constant 
1052:     LD  4,-5(1)	Load left into ac1 
1053:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  PrintBoard
1055:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to PrintBoard
1056:    LDA  1,-5(1)	Load address of new frame 
1057:    LDA  3,1(7)	Return address in ac 
1058:    LDA  7,-531(7)	CALL PrintBoard
1059:    LDA  3,0(2)	Save the result in ac 
*                       End call to PrintBoard
* EXPRESSION
*                       Begin call to  outputc
1060:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1061:    LDC  3,89(6)	Load char constant 
1062:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1063:    LDA  1,-5(1)	Load address of new frame 
1064:    LDA  3,1(7)	Return address in ac 
1065:    LDA  7,-1036(7)	CALL outputc
1066:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1067:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1068:    LDC  3,65(6)	Load char constant 
1069:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1070:    LDA  1,-5(1)	Load address of new frame 
1071:    LDA  3,1(7)	Return address in ac 
1072:    LDA  7,-1043(7)	CALL outputc
1073:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1074:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1075:    LDC  3,89(6)	Load char constant 
1076:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1077:    LDA  1,-5(1)	Load address of new frame 
1078:    LDA  3,1(7)	Return address in ac 
1079:    LDA  7,-1050(7)	CALL outputc
1080:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
1081:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1082:    LDC  3,33(6)	Load char constant 
1083:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
1084:    LDA  1,-5(1)	Load address of new frame 
1085:    LDA  3,1(7)	Return address in ac 
1086:    LDA  7,-1057(7)	CALL outputc
1087:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
1088:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
1089:    LDA  1,-5(1)	Load address of new frame 
1090:    LDA  3,1(7)	Return address in ac 
1091:    LDA  7,-1055(7)	CALL outnl
1092:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* BREAK
1093:    LDA  7,-239(7)	break 
* END COMPOUND
1054:    JZR  3,39(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  Move
1094:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
1095:     LD  3,-3(1)	Load variable x
1096:     ST  3,-7(1)	Save left side 
1097:     LD  3,-4(1)	Load variable y
1098:     ST  3,-8(1)	Save left side 
1099:    LDC  3,10(6)	Load integer constant 
1100:     LD  4,-8(1)	Load left into ac1 
1101:    MUL  3,4,3	Op * 
1102:     LD  4,-7(1)	Load left into ac1 
1103:    ADD  3,4,3	Op + 
1104:     ST  3,-7(1)	Store parameter 
*                       Jump to Move
1105:    LDA  1,-5(1)	Load address of new frame 
1106:    LDA  3,1(7)	Return address in ac 
1107:    LDA  7,-480(7)	CALL Move
1108:    LDA  3,0(2)	Save the result in ac 
*                       End call to Move
* END COMPOUND
1109:    LDA  7,-257(7)	go to beginning of loop 
855:    LDA  7,254(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
1110:    LDC  2,0(6)	Set return value to 0 
1111:     LD  3,-1(1)	Load return address 
1112:     LD  1,0(1)	Adjust fp 
1113:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,1113(7)	Jump to init [backpatch] 
* INIT
1114:     LD  0,0(0)	Set the global pointer 
1115:    LDA  1,-203(0)	set first frame at end of globals 
1116:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
1117:    LDC  3,100(6)	load size of array board
1118:     ST  3,-1(0)	save size of array board
1119:    LDC  3,100(6)	load size of array guess
1120:     ST  3,-102(0)	save size of array guess
* END INIT GLOBALS AND STATICS
1121:    LDA  3,1(7)	Return address in ac 
1122:    LDA  7,-282(7)	Jump to main 
1123:   HALT  0,0,0	DONE! 
* END INIT
