* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tictactoe.c-
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
* FUNCTION move
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
* WHILE
 45:     LD  3,-2(1)	Load variable i
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,9(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
 52:     LD  3,-2(1)	Load variable i
 53:    LDA  4,-1(0)	Load address of base of array board
 54:    SUB  3,4,3	Compute offset of value 
 55:     LD  3,0(3)	Load the value 
 56:     ST  3,-3(1)	Save left side 
 57:    LDC  3,1(6)	Load integer constant 
 58:    LDC  4,0(6)	Load 0 
 59:    SUB  3,4,3	Op unary - 
 60:     LD  4,-3(1)	Load left into ac1 
 61:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* BREAK
 63:    LDA  7,-13(7)	break 
* END COMPOUND
 62:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 64:     LD  3,-2(1)	load lhs variable i
 65:    LDA  3,1(3)	increment value of i
 66:     ST  3,-2(1)	Store variable i
* END COMPOUND
 67:    LDA  7,-23(7)	go to beginning of loop 
 51:    LDA  7,16(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
 68:     LD  3,-2(1)	Load variable i
 69:     ST  3,-3(1)	Save left side 
 70:    LDC  3,9(6)	Load integer constant 
 71:     LD  4,-3(1)	Load left into ac1 
 72:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* EXPRESSION
 74:     LD  3,-2(1)	Load variable i
 75:     ST  3,-3(1)	Save index 
 76:    LDC  3,2(6)	Load integer constant 
 77:     LD  4,-3(1)	Restore index 
 78:    LDA  5,-1(0)	Load address of base of array board
 79:    SUB  5,5,4	Compute offset of value 
 80:     ST  3,0(5)	Store variable board
* EXPRESSION
 81:    LDC  3,1(6)	Load Boolean constant 
 82:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
 73:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
 84:    LDC  3,0(6)	Load Boolean constant 
 85:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
 83:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 86:    LDC  2,0(6)	Set return value to 0 
 87:     LD  3,-1(1)	Load return address 
 88:     LD  1,0(1)	Adjust fp 
 89:    LDA  7,0(3)	Return 
* END FUNCTION move
* FUNCTION win
 90:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 91:    LDC  3,0(6)	Load integer constant 
 92:    LDA  4,-1(0)	Load address of base of array board
 93:    SUB  3,4,3	Compute offset of value 
 94:     LD  3,0(3)	Load the value 
 95:     ST  3,-2(1)	Save left side 
 96:    LDC  3,2(6)	Load integer constant 
 97:     LD  4,-2(1)	Load left into ac1 
 98:    TEQ  3,4,3	Op == 
 99:     ST  3,-2(1)	Save left side 
100:    LDC  3,1(6)	Load integer constant 
101:    LDA  4,-1(0)	Load address of base of array board
102:    SUB  3,4,3	Compute offset of value 
103:     LD  3,0(3)	Load the value 
104:     ST  3,-3(1)	Save left side 
105:    LDC  3,2(6)	Load integer constant 
106:     LD  4,-3(1)	Load left into ac1 
107:    TEQ  3,4,3	Op == 
108:     LD  4,-2(1)	Load left into ac1 
109:    AND  3,4,3	Op AND 
110:     ST  3,-2(1)	Save left side 
111:    LDC  3,6(6)	Load integer constant 
112:    LDA  4,-1(0)	Load address of base of array board
113:    SUB  3,4,3	Compute offset of value 
114:     LD  3,0(3)	Load the value 
115:     ST  3,-3(1)	Save left side 
116:    LDC  3,2(6)	Load integer constant 
117:     LD  4,-3(1)	Load left into ac1 
118:    TEQ  3,4,3	Op == 
119:     ST  3,-3(1)	Save left side 
120:    LDC  3,4(6)	Load integer constant 
121:    LDA  4,-1(0)	Load address of base of array board
122:    SUB  3,4,3	Compute offset of value 
123:     LD  3,0(3)	Load the value 
124:     ST  3,-4(1)	Save left side 
125:    LDC  3,2(6)	Load integer constant 
126:     LD  4,-4(1)	Load left into ac1 
127:    TEQ  3,4,3	Op == 
128:     LD  4,-3(1)	Load left into ac1 
129:    AND  3,4,3	Op AND 
130:     LD  4,-2(1)	Load left into ac1 
131:     OR  3,4,3	Op OR 
132:     ST  3,-2(1)	Save left side 
133:    LDC  3,8(6)	Load integer constant 
134:    LDA  4,-1(0)	Load address of base of array board
135:    SUB  3,4,3	Compute offset of value 
136:     LD  3,0(3)	Load the value 
137:     ST  3,-3(1)	Save left side 
138:    LDC  3,2(6)	Load integer constant 
139:     LD  4,-3(1)	Load left into ac1 
140:    TEQ  3,4,3	Op == 
141:     ST  3,-3(1)	Save left side 
142:    LDC  3,5(6)	Load integer constant 
143:    LDA  4,-1(0)	Load address of base of array board
144:    SUB  3,4,3	Compute offset of value 
145:     LD  3,0(3)	Load the value 
146:     ST  3,-4(1)	Save left side 
147:    LDC  3,2(6)	Load integer constant 
148:     LD  4,-4(1)	Load left into ac1 
149:    TEQ  3,4,3	Op == 
150:     LD  4,-3(1)	Load left into ac1 
151:    AND  3,4,3	Op AND 
152:     LD  4,-2(1)	Load left into ac1 
153:     OR  3,4,3	Op OR 
154:     ST  3,-2(1)	Save left side 
155:    LDC  3,2(6)	Load integer constant 
156:    LDA  4,-1(0)	Load address of base of array board
157:    SUB  3,4,3	Compute offset of value 
158:     LD  3,0(3)	Load the value 
159:     ST  3,-3(1)	Save left side 
160:    LDC  3,1(6)	Load integer constant 
161:    LDC  4,0(6)	Load 0 
162:    SUB  3,4,3	Op unary - 
163:     LD  4,-3(1)	Load left into ac1 
164:    TEQ  3,4,3	Op == 
165:     LD  4,-2(1)	Load left into ac1 
166:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
168:    LDC  3,2(6)	Load integer constant 
169:     ST  3,-2(1)	Save index 
170:    LDC  3,2(6)	Load integer constant 
171:     LD  4,-2(1)	Restore index 
172:    LDA  5,-1(0)	Load address of base of array board
173:    SUB  5,5,4	Compute offset of value 
174:     ST  3,0(5)	Store variable board
* EXPRESSION
175:    LDC  3,0(6)	Load Boolean constant 
176:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
167:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
178:    LDC  3,0(6)	Load integer constant 
179:    LDA  4,-1(0)	Load address of base of array board
180:    SUB  3,4,3	Compute offset of value 
181:     LD  3,0(3)	Load the value 
182:     ST  3,-2(1)	Save left side 
183:    LDC  3,2(6)	Load integer constant 
184:     LD  4,-2(1)	Load left into ac1 
185:    TEQ  3,4,3	Op == 
186:     ST  3,-2(1)	Save left side 
187:    LDC  3,2(6)	Load integer constant 
188:    LDA  4,-1(0)	Load address of base of array board
189:    SUB  3,4,3	Compute offset of value 
190:     LD  3,0(3)	Load the value 
191:     ST  3,-3(1)	Save left side 
192:    LDC  3,2(6)	Load integer constant 
193:     LD  4,-3(1)	Load left into ac1 
194:    TEQ  3,4,3	Op == 
195:     LD  4,-2(1)	Load left into ac1 
196:    AND  3,4,3	Op AND 
197:     ST  3,-2(1)	Save left side 
198:    LDC  3,4(6)	Load integer constant 
199:    LDA  4,-1(0)	Load address of base of array board
200:    SUB  3,4,3	Compute offset of value 
201:     LD  3,0(3)	Load the value 
202:     ST  3,-3(1)	Save left side 
203:    LDC  3,2(6)	Load integer constant 
204:     LD  4,-3(1)	Load left into ac1 
205:    TEQ  3,4,3	Op == 
206:     ST  3,-3(1)	Save left side 
207:    LDC  3,7(6)	Load integer constant 
208:    LDA  4,-1(0)	Load address of base of array board
209:    SUB  3,4,3	Compute offset of value 
210:     LD  3,0(3)	Load the value 
211:     ST  3,-4(1)	Save left side 
212:    LDC  3,2(6)	Load integer constant 
213:     LD  4,-4(1)	Load left into ac1 
214:    TEQ  3,4,3	Op == 
215:     LD  4,-3(1)	Load left into ac1 
216:    AND  3,4,3	Op AND 
217:     LD  4,-2(1)	Load left into ac1 
218:     OR  3,4,3	Op OR 
219:     ST  3,-2(1)	Save left side 
220:    LDC  3,1(6)	Load integer constant 
221:    LDA  4,-1(0)	Load address of base of array board
222:    SUB  3,4,3	Compute offset of value 
223:     LD  3,0(3)	Load the value 
224:     ST  3,-3(1)	Save left side 
225:    LDC  3,1(6)	Load integer constant 
226:    LDC  4,0(6)	Load 0 
227:    SUB  3,4,3	Op unary - 
228:     LD  4,-3(1)	Load left into ac1 
229:    TEQ  3,4,3	Op == 
230:     LD  4,-2(1)	Load left into ac1 
231:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
233:    LDC  3,1(6)	Load integer constant 
234:     ST  3,-2(1)	Save index 
235:    LDC  3,2(6)	Load integer constant 
236:     LD  4,-2(1)	Restore index 
237:    LDA  5,-1(0)	Load address of base of array board
238:    SUB  5,5,4	Compute offset of value 
239:     ST  3,0(5)	Store variable board
* EXPRESSION
240:    LDC  3,0(6)	Load Boolean constant 
241:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
232:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
243:    LDC  3,2(6)	Load integer constant 
244:    LDA  4,-1(0)	Load address of base of array board
245:    SUB  3,4,3	Compute offset of value 
246:     LD  3,0(3)	Load the value 
247:     ST  3,-2(1)	Save left side 
248:    LDC  3,2(6)	Load integer constant 
249:     LD  4,-2(1)	Load left into ac1 
250:    TEQ  3,4,3	Op == 
251:     ST  3,-2(1)	Save left side 
252:    LDC  3,1(6)	Load integer constant 
253:    LDA  4,-1(0)	Load address of base of array board
254:    SUB  3,4,3	Compute offset of value 
255:     LD  3,0(3)	Load the value 
256:     ST  3,-3(1)	Save left side 
257:    LDC  3,2(6)	Load integer constant 
258:     LD  4,-3(1)	Load left into ac1 
259:    TEQ  3,4,3	Op == 
260:     LD  4,-2(1)	Load left into ac1 
261:    AND  3,4,3	Op AND 
262:     ST  3,-2(1)	Save left side 
263:    LDC  3,6(6)	Load integer constant 
264:    LDA  4,-1(0)	Load address of base of array board
265:    SUB  3,4,3	Compute offset of value 
266:     LD  3,0(3)	Load the value 
267:     ST  3,-3(1)	Save left side 
268:    LDC  3,2(6)	Load integer constant 
269:     LD  4,-3(1)	Load left into ac1 
270:    TEQ  3,4,3	Op == 
271:     ST  3,-3(1)	Save left side 
272:    LDC  3,3(6)	Load integer constant 
273:    LDA  4,-1(0)	Load address of base of array board
274:    SUB  3,4,3	Compute offset of value 
275:     LD  3,0(3)	Load the value 
276:     ST  3,-4(1)	Save left side 
277:    LDC  3,2(6)	Load integer constant 
278:     LD  4,-4(1)	Load left into ac1 
279:    TEQ  3,4,3	Op == 
280:     LD  4,-3(1)	Load left into ac1 
281:    AND  3,4,3	Op AND 
282:     LD  4,-2(1)	Load left into ac1 
283:     OR  3,4,3	Op OR 
284:     ST  3,-2(1)	Save left side 
285:    LDC  3,4(6)	Load integer constant 
286:    LDA  4,-1(0)	Load address of base of array board
287:    SUB  3,4,3	Compute offset of value 
288:     LD  3,0(3)	Load the value 
289:     ST  3,-3(1)	Save left side 
290:    LDC  3,2(6)	Load integer constant 
291:     LD  4,-3(1)	Load left into ac1 
292:    TEQ  3,4,3	Op == 
293:     ST  3,-3(1)	Save left side 
294:    LDC  3,8(6)	Load integer constant 
295:    LDA  4,-1(0)	Load address of base of array board
296:    SUB  3,4,3	Compute offset of value 
297:     LD  3,0(3)	Load the value 
298:     ST  3,-4(1)	Save left side 
299:    LDC  3,2(6)	Load integer constant 
300:     LD  4,-4(1)	Load left into ac1 
301:    TEQ  3,4,3	Op == 
302:     LD  4,-3(1)	Load left into ac1 
303:    AND  3,4,3	Op AND 
304:     LD  4,-2(1)	Load left into ac1 
305:     OR  3,4,3	Op OR 
306:     ST  3,-2(1)	Save left side 
307:    LDC  3,0(6)	Load integer constant 
308:    LDA  4,-1(0)	Load address of base of array board
309:    SUB  3,4,3	Compute offset of value 
310:     LD  3,0(3)	Load the value 
311:     ST  3,-3(1)	Save left side 
312:    LDC  3,1(6)	Load integer constant 
313:    LDC  4,0(6)	Load 0 
314:    SUB  3,4,3	Op unary - 
315:     LD  4,-3(1)	Load left into ac1 
316:    TEQ  3,4,3	Op == 
317:     LD  4,-2(1)	Load left into ac1 
318:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
320:    LDC  3,0(6)	Load integer constant 
321:     ST  3,-2(1)	Save index 
322:    LDC  3,2(6)	Load integer constant 
323:     LD  4,-2(1)	Restore index 
324:    LDA  5,-1(0)	Load address of base of array board
325:    SUB  5,5,4	Compute offset of value 
326:     ST  3,0(5)	Store variable board
* EXPRESSION
327:    LDC  3,0(6)	Load Boolean constant 
328:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
319:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
330:    LDC  3,3(6)	Load integer constant 
331:    LDA  4,-1(0)	Load address of base of array board
332:    SUB  3,4,3	Compute offset of value 
333:     LD  3,0(3)	Load the value 
334:     ST  3,-2(1)	Save left side 
335:    LDC  3,2(6)	Load integer constant 
336:     LD  4,-2(1)	Load left into ac1 
337:    TEQ  3,4,3	Op == 
338:     ST  3,-2(1)	Save left side 
339:    LDC  3,4(6)	Load integer constant 
340:    LDA  4,-1(0)	Load address of base of array board
341:    SUB  3,4,3	Compute offset of value 
342:     LD  3,0(3)	Load the value 
343:     ST  3,-3(1)	Save left side 
344:    LDC  3,2(6)	Load integer constant 
345:     LD  4,-3(1)	Load left into ac1 
346:    TEQ  3,4,3	Op == 
347:     LD  4,-2(1)	Load left into ac1 
348:    AND  3,4,3	Op AND 
349:     ST  3,-2(1)	Save left side 
350:    LDC  3,2(6)	Load integer constant 
351:    LDA  4,-1(0)	Load address of base of array board
352:    SUB  3,4,3	Compute offset of value 
353:     LD  3,0(3)	Load the value 
354:     ST  3,-3(1)	Save left side 
355:    LDC  3,2(6)	Load integer constant 
356:     LD  4,-3(1)	Load left into ac1 
357:    TEQ  3,4,3	Op == 
358:     ST  3,-3(1)	Save left side 
359:    LDC  3,8(6)	Load integer constant 
360:    LDA  4,-1(0)	Load address of base of array board
361:    SUB  3,4,3	Compute offset of value 
362:     LD  3,0(3)	Load the value 
363:     ST  3,-4(1)	Save left side 
364:    LDC  3,2(6)	Load integer constant 
365:     LD  4,-4(1)	Load left into ac1 
366:    TEQ  3,4,3	Op == 
367:     LD  4,-3(1)	Load left into ac1 
368:    AND  3,4,3	Op AND 
369:     LD  4,-2(1)	Load left into ac1 
370:     OR  3,4,3	Op OR 
371:     ST  3,-2(1)	Save left side 
372:    LDC  3,5(6)	Load integer constant 
373:    LDA  4,-1(0)	Load address of base of array board
374:    SUB  3,4,3	Compute offset of value 
375:     LD  3,0(3)	Load the value 
376:     ST  3,-3(1)	Save left side 
377:    LDC  3,1(6)	Load integer constant 
378:    LDC  4,0(6)	Load 0 
379:    SUB  3,4,3	Op unary - 
380:     LD  4,-3(1)	Load left into ac1 
381:    TEQ  3,4,3	Op == 
382:     LD  4,-2(1)	Load left into ac1 
383:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
385:    LDC  3,5(6)	Load integer constant 
386:     ST  3,-2(1)	Save index 
387:    LDC  3,2(6)	Load integer constant 
388:     LD  4,-2(1)	Restore index 
389:    LDA  5,-1(0)	Load address of base of array board
390:    SUB  5,5,4	Compute offset of value 
391:     ST  3,0(5)	Store variable board
* EXPRESSION
392:    LDC  3,0(6)	Load Boolean constant 
393:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
384:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
395:    LDC  3,3(6)	Load integer constant 
396:    LDA  4,-1(0)	Load address of base of array board
397:    SUB  3,4,3	Compute offset of value 
398:     LD  3,0(3)	Load the value 
399:     ST  3,-2(1)	Save left side 
400:    LDC  3,2(6)	Load integer constant 
401:     LD  4,-2(1)	Load left into ac1 
402:    TEQ  3,4,3	Op == 
403:     ST  3,-2(1)	Save left side 
404:    LDC  3,5(6)	Load integer constant 
405:    LDA  4,-1(0)	Load address of base of array board
406:    SUB  3,4,3	Compute offset of value 
407:     LD  3,0(3)	Load the value 
408:     ST  3,-3(1)	Save left side 
409:    LDC  3,2(6)	Load integer constant 
410:     LD  4,-3(1)	Load left into ac1 
411:    TEQ  3,4,3	Op == 
412:     LD  4,-2(1)	Load left into ac1 
413:    AND  3,4,3	Op AND 
414:     ST  3,-2(1)	Save left side 
415:    LDC  3,0(6)	Load integer constant 
416:    LDA  4,-1(0)	Load address of base of array board
417:    SUB  3,4,3	Compute offset of value 
418:     LD  3,0(3)	Load the value 
419:     ST  3,-3(1)	Save left side 
420:    LDC  3,2(6)	Load integer constant 
421:     LD  4,-3(1)	Load left into ac1 
422:    TEQ  3,4,3	Op == 
423:     ST  3,-3(1)	Save left side 
424:    LDC  3,8(6)	Load integer constant 
425:    LDA  4,-1(0)	Load address of base of array board
426:    SUB  3,4,3	Compute offset of value 
427:     LD  3,0(3)	Load the value 
428:     ST  3,-4(1)	Save left side 
429:    LDC  3,2(6)	Load integer constant 
430:     LD  4,-4(1)	Load left into ac1 
431:    TEQ  3,4,3	Op == 
432:     LD  4,-3(1)	Load left into ac1 
433:    AND  3,4,3	Op AND 
434:     LD  4,-2(1)	Load left into ac1 
435:     OR  3,4,3	Op OR 
436:     ST  3,-2(1)	Save left side 
437:    LDC  3,2(6)	Load integer constant 
438:    LDA  4,-1(0)	Load address of base of array board
439:    SUB  3,4,3	Compute offset of value 
440:     LD  3,0(3)	Load the value 
441:     ST  3,-3(1)	Save left side 
442:    LDC  3,2(6)	Load integer constant 
443:     LD  4,-3(1)	Load left into ac1 
444:    TEQ  3,4,3	Op == 
445:     ST  3,-3(1)	Save left side 
446:    LDC  3,6(6)	Load integer constant 
447:    LDA  4,-1(0)	Load address of base of array board
448:    SUB  3,4,3	Compute offset of value 
449:     LD  3,0(3)	Load the value 
450:     ST  3,-4(1)	Save left side 
451:    LDC  3,2(6)	Load integer constant 
452:     LD  4,-4(1)	Load left into ac1 
453:    TEQ  3,4,3	Op == 
454:     LD  4,-3(1)	Load left into ac1 
455:    AND  3,4,3	Op AND 
456:     LD  4,-2(1)	Load left into ac1 
457:     OR  3,4,3	Op OR 
458:     ST  3,-2(1)	Save left side 
459:    LDC  3,1(6)	Load integer constant 
460:    LDA  4,-1(0)	Load address of base of array board
461:    SUB  3,4,3	Compute offset of value 
462:     LD  3,0(3)	Load the value 
463:     ST  3,-3(1)	Save left side 
464:    LDC  3,2(6)	Load integer constant 
465:     LD  4,-3(1)	Load left into ac1 
466:    TEQ  3,4,3	Op == 
467:     ST  3,-3(1)	Save left side 
468:    LDC  3,7(6)	Load integer constant 
469:    LDA  4,-1(0)	Load address of base of array board
470:    SUB  3,4,3	Compute offset of value 
471:     LD  3,0(3)	Load the value 
472:     ST  3,-4(1)	Save left side 
473:    LDC  3,2(6)	Load integer constant 
474:     LD  4,-4(1)	Load left into ac1 
475:    TEQ  3,4,3	Op == 
476:     LD  4,-3(1)	Load left into ac1 
477:    AND  3,4,3	Op AND 
478:     LD  4,-2(1)	Load left into ac1 
479:     OR  3,4,3	Op OR 
480:     ST  3,-2(1)	Save left side 
481:    LDC  3,4(6)	Load integer constant 
482:    LDA  4,-1(0)	Load address of base of array board
483:    SUB  3,4,3	Compute offset of value 
484:     LD  3,0(3)	Load the value 
485:     ST  3,-3(1)	Save left side 
486:    LDC  3,1(6)	Load integer constant 
487:    LDC  4,0(6)	Load 0 
488:    SUB  3,4,3	Op unary - 
489:     LD  4,-3(1)	Load left into ac1 
490:    TEQ  3,4,3	Op == 
491:     LD  4,-2(1)	Load left into ac1 
492:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
494:    LDC  3,4(6)	Load integer constant 
495:     ST  3,-2(1)	Save index 
496:    LDC  3,2(6)	Load integer constant 
497:     LD  4,-2(1)	Restore index 
498:    LDA  5,-1(0)	Load address of base of array board
499:    SUB  5,5,4	Compute offset of value 
500:     ST  3,0(5)	Store variable board
* EXPRESSION
501:    LDC  3,0(6)	Load Boolean constant 
502:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
493:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
504:    LDC  3,4(6)	Load integer constant 
505:    LDA  4,-1(0)	Load address of base of array board
506:    SUB  3,4,3	Compute offset of value 
507:     LD  3,0(3)	Load the value 
508:     ST  3,-2(1)	Save left side 
509:    LDC  3,2(6)	Load integer constant 
510:     LD  4,-2(1)	Load left into ac1 
511:    TEQ  3,4,3	Op == 
512:     ST  3,-2(1)	Save left side 
513:    LDC  3,5(6)	Load integer constant 
514:    LDA  4,-1(0)	Load address of base of array board
515:    SUB  3,4,3	Compute offset of value 
516:     LD  3,0(3)	Load the value 
517:     ST  3,-3(1)	Save left side 
518:    LDC  3,2(6)	Load integer constant 
519:     LD  4,-3(1)	Load left into ac1 
520:    TEQ  3,4,3	Op == 
521:     LD  4,-2(1)	Load left into ac1 
522:    AND  3,4,3	Op AND 
523:     ST  3,-2(1)	Save left side 
524:    LDC  3,0(6)	Load integer constant 
525:    LDA  4,-1(0)	Load address of base of array board
526:    SUB  3,4,3	Compute offset of value 
527:     LD  3,0(3)	Load the value 
528:     ST  3,-3(1)	Save left side 
529:    LDC  3,2(6)	Load integer constant 
530:     LD  4,-3(1)	Load left into ac1 
531:    TEQ  3,4,3	Op == 
532:     ST  3,-3(1)	Save left side 
533:    LDC  3,6(6)	Load integer constant 
534:    LDA  4,-1(0)	Load address of base of array board
535:    SUB  3,4,3	Compute offset of value 
536:     LD  3,0(3)	Load the value 
537:     ST  3,-4(1)	Save left side 
538:    LDC  3,2(6)	Load integer constant 
539:     LD  4,-4(1)	Load left into ac1 
540:    TEQ  3,4,3	Op == 
541:     LD  4,-3(1)	Load left into ac1 
542:    AND  3,4,3	Op AND 
543:     LD  4,-2(1)	Load left into ac1 
544:     OR  3,4,3	Op OR 
545:     ST  3,-2(1)	Save left side 
546:    LDC  3,3(6)	Load integer constant 
547:    LDA  4,-1(0)	Load address of base of array board
548:    SUB  3,4,3	Compute offset of value 
549:     LD  3,0(3)	Load the value 
550:     ST  3,-3(1)	Save left side 
551:    LDC  3,1(6)	Load integer constant 
552:    LDC  4,0(6)	Load 0 
553:    SUB  3,4,3	Op unary - 
554:     LD  4,-3(1)	Load left into ac1 
555:    TEQ  3,4,3	Op == 
556:     LD  4,-2(1)	Load left into ac1 
557:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
559:    LDC  3,3(6)	Load integer constant 
560:     ST  3,-2(1)	Save index 
561:    LDC  3,2(6)	Load integer constant 
562:     LD  4,-2(1)	Restore index 
563:    LDA  5,-1(0)	Load address of base of array board
564:    SUB  5,5,4	Compute offset of value 
565:     ST  3,0(5)	Store variable board
* EXPRESSION
566:    LDC  3,0(6)	Load Boolean constant 
567:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
558:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
569:    LDC  3,6(6)	Load integer constant 
570:    LDA  4,-1(0)	Load address of base of array board
571:    SUB  3,4,3	Compute offset of value 
572:     LD  3,0(3)	Load the value 
573:     ST  3,-2(1)	Save left side 
574:    LDC  3,2(6)	Load integer constant 
575:     LD  4,-2(1)	Load left into ac1 
576:    TEQ  3,4,3	Op == 
577:     ST  3,-2(1)	Save left side 
578:    LDC  3,7(6)	Load integer constant 
579:    LDA  4,-1(0)	Load address of base of array board
580:    SUB  3,4,3	Compute offset of value 
581:     LD  3,0(3)	Load the value 
582:     ST  3,-3(1)	Save left side 
583:    LDC  3,2(6)	Load integer constant 
584:     LD  4,-3(1)	Load left into ac1 
585:    TEQ  3,4,3	Op == 
586:     LD  4,-2(1)	Load left into ac1 
587:    AND  3,4,3	Op AND 
588:     ST  3,-2(1)	Save left side 
589:    LDC  3,0(6)	Load integer constant 
590:    LDA  4,-1(0)	Load address of base of array board
591:    SUB  3,4,3	Compute offset of value 
592:     LD  3,0(3)	Load the value 
593:     ST  3,-3(1)	Save left side 
594:    LDC  3,2(6)	Load integer constant 
595:     LD  4,-3(1)	Load left into ac1 
596:    TEQ  3,4,3	Op == 
597:     ST  3,-3(1)	Save left side 
598:    LDC  3,4(6)	Load integer constant 
599:    LDA  4,-1(0)	Load address of base of array board
600:    SUB  3,4,3	Compute offset of value 
601:     LD  3,0(3)	Load the value 
602:     ST  3,-4(1)	Save left side 
603:    LDC  3,2(6)	Load integer constant 
604:     LD  4,-4(1)	Load left into ac1 
605:    TEQ  3,4,3	Op == 
606:     LD  4,-3(1)	Load left into ac1 
607:    AND  3,4,3	Op AND 
608:     LD  4,-2(1)	Load left into ac1 
609:     OR  3,4,3	Op OR 
610:     ST  3,-2(1)	Save left side 
611:    LDC  3,2(6)	Load integer constant 
612:    LDA  4,-1(0)	Load address of base of array board
613:    SUB  3,4,3	Compute offset of value 
614:     LD  3,0(3)	Load the value 
615:     ST  3,-3(1)	Save left side 
616:    LDC  3,2(6)	Load integer constant 
617:     LD  4,-3(1)	Load left into ac1 
618:    TEQ  3,4,3	Op == 
619:     ST  3,-3(1)	Save left side 
620:    LDC  3,5(6)	Load integer constant 
621:    LDA  4,-1(0)	Load address of base of array board
622:    SUB  3,4,3	Compute offset of value 
623:     LD  3,0(3)	Load the value 
624:     ST  3,-4(1)	Save left side 
625:    LDC  3,2(6)	Load integer constant 
626:     LD  4,-4(1)	Load left into ac1 
627:    TEQ  3,4,3	Op == 
628:     LD  4,-3(1)	Load left into ac1 
629:    AND  3,4,3	Op AND 
630:     LD  4,-2(1)	Load left into ac1 
631:     OR  3,4,3	Op OR 
632:     ST  3,-2(1)	Save left side 
633:    LDC  3,8(6)	Load integer constant 
634:    LDA  4,-1(0)	Load address of base of array board
635:    SUB  3,4,3	Compute offset of value 
636:     LD  3,0(3)	Load the value 
637:     ST  3,-3(1)	Save left side 
638:    LDC  3,1(6)	Load integer constant 
639:    LDC  4,0(6)	Load 0 
640:    SUB  3,4,3	Op unary - 
641:     LD  4,-3(1)	Load left into ac1 
642:    TEQ  3,4,3	Op == 
643:     LD  4,-2(1)	Load left into ac1 
644:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
646:    LDC  3,8(6)	Load integer constant 
647:     ST  3,-2(1)	Save index 
648:    LDC  3,2(6)	Load integer constant 
649:     LD  4,-2(1)	Restore index 
650:    LDA  5,-1(0)	Load address of base of array board
651:    SUB  5,5,4	Compute offset of value 
652:     ST  3,0(5)	Store variable board
* EXPRESSION
653:    LDC  3,0(6)	Load Boolean constant 
654:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
645:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
656:    LDC  3,6(6)	Load integer constant 
657:    LDA  4,-1(0)	Load address of base of array board
658:    SUB  3,4,3	Compute offset of value 
659:     LD  3,0(3)	Load the value 
660:     ST  3,-2(1)	Save left side 
661:    LDC  3,2(6)	Load integer constant 
662:     LD  4,-2(1)	Load left into ac1 
663:    TEQ  3,4,3	Op == 
664:     ST  3,-2(1)	Save left side 
665:    LDC  3,8(6)	Load integer constant 
666:    LDA  4,-1(0)	Load address of base of array board
667:    SUB  3,4,3	Compute offset of value 
668:     LD  3,0(3)	Load the value 
669:     ST  3,-3(1)	Save left side 
670:    LDC  3,2(6)	Load integer constant 
671:     LD  4,-3(1)	Load left into ac1 
672:    TEQ  3,4,3	Op == 
673:     LD  4,-2(1)	Load left into ac1 
674:    AND  3,4,3	Op AND 
675:     ST  3,-2(1)	Save left side 
676:    LDC  3,4(6)	Load integer constant 
677:    LDA  4,-1(0)	Load address of base of array board
678:    SUB  3,4,3	Compute offset of value 
679:     LD  3,0(3)	Load the value 
680:     ST  3,-3(1)	Save left side 
681:    LDC  3,2(6)	Load integer constant 
682:     LD  4,-3(1)	Load left into ac1 
683:    TEQ  3,4,3	Op == 
684:     ST  3,-3(1)	Save left side 
685:    LDC  3,1(6)	Load integer constant 
686:    LDA  4,-1(0)	Load address of base of array board
687:    SUB  3,4,3	Compute offset of value 
688:     LD  3,0(3)	Load the value 
689:     ST  3,-4(1)	Save left side 
690:    LDC  3,2(6)	Load integer constant 
691:     LD  4,-4(1)	Load left into ac1 
692:    TEQ  3,4,3	Op == 
693:     LD  4,-3(1)	Load left into ac1 
694:    AND  3,4,3	Op AND 
695:     LD  4,-2(1)	Load left into ac1 
696:     OR  3,4,3	Op OR 
697:     ST  3,-2(1)	Save left side 
698:    LDC  3,7(6)	Load integer constant 
699:    LDA  4,-1(0)	Load address of base of array board
700:    SUB  3,4,3	Compute offset of value 
701:     LD  3,0(3)	Load the value 
702:     ST  3,-3(1)	Save left side 
703:    LDC  3,1(6)	Load integer constant 
704:    LDC  4,0(6)	Load 0 
705:    SUB  3,4,3	Op unary - 
706:     LD  4,-3(1)	Load left into ac1 
707:    TEQ  3,4,3	Op == 
708:     LD  4,-2(1)	Load left into ac1 
709:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
711:    LDC  3,7(6)	Load integer constant 
712:     ST  3,-2(1)	Save index 
713:    LDC  3,2(6)	Load integer constant 
714:     LD  4,-2(1)	Restore index 
715:    LDA  5,-1(0)	Load address of base of array board
716:    SUB  5,5,4	Compute offset of value 
717:     ST  3,0(5)	Store variable board
* EXPRESSION
718:    LDC  3,0(6)	Load Boolean constant 
719:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
710:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
721:    LDC  3,7(6)	Load integer constant 
722:    LDA  4,-1(0)	Load address of base of array board
723:    SUB  3,4,3	Compute offset of value 
724:     LD  3,0(3)	Load the value 
725:     ST  3,-2(1)	Save left side 
726:    LDC  3,2(6)	Load integer constant 
727:     LD  4,-2(1)	Load left into ac1 
728:    TEQ  3,4,3	Op == 
729:     ST  3,-2(1)	Save left side 
730:    LDC  3,8(6)	Load integer constant 
731:    LDA  4,-1(0)	Load address of base of array board
732:    SUB  3,4,3	Compute offset of value 
733:     LD  3,0(3)	Load the value 
734:     ST  3,-3(1)	Save left side 
735:    LDC  3,2(6)	Load integer constant 
736:     LD  4,-3(1)	Load left into ac1 
737:    TEQ  3,4,3	Op == 
738:     LD  4,-2(1)	Load left into ac1 
739:    AND  3,4,3	Op AND 
740:     ST  3,-2(1)	Save left side 
741:    LDC  3,4(6)	Load integer constant 
742:    LDA  4,-1(0)	Load address of base of array board
743:    SUB  3,4,3	Compute offset of value 
744:     LD  3,0(3)	Load the value 
745:     ST  3,-3(1)	Save left side 
746:    LDC  3,2(6)	Load integer constant 
747:     LD  4,-3(1)	Load left into ac1 
748:    TEQ  3,4,3	Op == 
749:     ST  3,-3(1)	Save left side 
750:    LDC  3,2(6)	Load integer constant 
751:    LDA  4,-1(0)	Load address of base of array board
752:    SUB  3,4,3	Compute offset of value 
753:     LD  3,0(3)	Load the value 
754:     ST  3,-4(1)	Save left side 
755:    LDC  3,2(6)	Load integer constant 
756:     LD  4,-4(1)	Load left into ac1 
757:    TEQ  3,4,3	Op == 
758:     LD  4,-3(1)	Load left into ac1 
759:    AND  3,4,3	Op AND 
760:     LD  4,-2(1)	Load left into ac1 
761:     OR  3,4,3	Op OR 
762:     ST  3,-2(1)	Save left side 
763:    LDC  3,0(6)	Load integer constant 
764:    LDA  4,-1(0)	Load address of base of array board
765:    SUB  3,4,3	Compute offset of value 
766:     LD  3,0(3)	Load the value 
767:     ST  3,-3(1)	Save left side 
768:    LDC  3,2(6)	Load integer constant 
769:     LD  4,-3(1)	Load left into ac1 
770:    TEQ  3,4,3	Op == 
771:     ST  3,-3(1)	Save left side 
772:    LDC  3,3(6)	Load integer constant 
773:    LDA  4,-1(0)	Load address of base of array board
774:    SUB  3,4,3	Compute offset of value 
775:     LD  3,0(3)	Load the value 
776:     ST  3,-4(1)	Save left side 
777:    LDC  3,2(6)	Load integer constant 
778:     LD  4,-4(1)	Load left into ac1 
779:    TEQ  3,4,3	Op == 
780:     LD  4,-3(1)	Load left into ac1 
781:    AND  3,4,3	Op AND 
782:     LD  4,-2(1)	Load left into ac1 
783:     OR  3,4,3	Op OR 
784:     ST  3,-2(1)	Save left side 
785:    LDC  3,6(6)	Load integer constant 
786:    LDA  4,-1(0)	Load address of base of array board
787:    SUB  3,4,3	Compute offset of value 
788:     LD  3,0(3)	Load the value 
789:     ST  3,-3(1)	Save left side 
790:    LDC  3,1(6)	Load integer constant 
791:    LDC  4,0(6)	Load 0 
792:    SUB  3,4,3	Op unary - 
793:     LD  4,-3(1)	Load left into ac1 
794:    TEQ  3,4,3	Op == 
795:     LD  4,-2(1)	Load left into ac1 
796:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
798:    LDC  3,6(6)	Load integer constant 
799:     ST  3,-2(1)	Save index 
800:    LDC  3,2(6)	Load integer constant 
801:     LD  4,-2(1)	Restore index 
802:    LDA  5,-1(0)	Load address of base of array board
803:    SUB  5,5,4	Compute offset of value 
804:     ST  3,0(5)	Store variable board
* EXPRESSION
805:    LDC  3,0(6)	Load Boolean constant 
806:     ST  3,-10(0)	Store variable gamenotdone
* END COMPOUND
797:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
720:    LDA  7,86(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
655:    LDA  7,151(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
568:    LDA  7,238(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
503:    LDA  7,303(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
394:    LDA  7,412(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
329:    LDA  7,477(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
242:    LDA  7,564(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
177:    LDA  7,629(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
807:     LD  3,-10(0)	Load variable gamenotdone
808:     ST  3,-2(1)	Save left side 
809:    LDC  3,0(6)	Load Boolean constant 
810:     LD  4,-2(1)	Load left into ac1 
811:    TNE  3,4,3	Op != 
* THEN
* COMPOUND
* RETURN
813:    LDC  3,0(6)	Load Boolean constant 
814:    LDA  2,0(3)	Copy result to rt register 
815:     LD  3,-1(1)	Load return address 
816:     LD  1,0(1)	Adjust fp 
817:    LDA  7,0(3)	Return 
* END COMPOUND
812:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
818:    LDC  3,1(6)	Load Boolean constant 
819:    LDA  2,0(3)	Copy result to rt register 
820:     LD  3,-1(1)	Load return address 
821:     LD  1,0(1)	Adjust fp 
822:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
823:    LDC  2,0(6)	Set return value to 0 
824:     LD  3,-1(1)	Load return address 
825:     LD  1,0(1)	Adjust fp 
826:    LDA  7,0(3)	Return 
* END FUNCTION win
* FUNCTION blockplayer
827:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
828:    LDC  3,0(6)	Load Boolean constant 
829:     ST  3,-2(1)	Store variable blocked
* IF
830:    LDC  3,0(6)	Load integer constant 
831:    LDA  4,-1(0)	Load address of base of array board
832:    SUB  3,4,3	Compute offset of value 
833:     LD  3,0(3)	Load the value 
834:     ST  3,-3(1)	Save left side 
835:    LDC  3,1(6)	Load integer constant 
836:     LD  4,-3(1)	Load left into ac1 
837:    TEQ  3,4,3	Op == 
838:     ST  3,-3(1)	Save left side 
839:    LDC  3,1(6)	Load integer constant 
840:    LDA  4,-1(0)	Load address of base of array board
841:    SUB  3,4,3	Compute offset of value 
842:     LD  3,0(3)	Load the value 
843:     ST  3,-4(1)	Save left side 
844:    LDC  3,1(6)	Load integer constant 
845:     LD  4,-4(1)	Load left into ac1 
846:    TEQ  3,4,3	Op == 
847:     LD  4,-3(1)	Load left into ac1 
848:    AND  3,4,3	Op AND 
849:     ST  3,-3(1)	Save left side 
850:    LDC  3,6(6)	Load integer constant 
851:    LDA  4,-1(0)	Load address of base of array board
852:    SUB  3,4,3	Compute offset of value 
853:     LD  3,0(3)	Load the value 
854:     ST  3,-4(1)	Save left side 
855:    LDC  3,1(6)	Load integer constant 
856:     LD  4,-4(1)	Load left into ac1 
857:    TEQ  3,4,3	Op == 
858:     ST  3,-4(1)	Save left side 
859:    LDC  3,4(6)	Load integer constant 
860:    LDA  4,-1(0)	Load address of base of array board
861:    SUB  3,4,3	Compute offset of value 
862:     LD  3,0(3)	Load the value 
863:     ST  3,-5(1)	Save left side 
864:    LDC  3,1(6)	Load integer constant 
865:     LD  4,-5(1)	Load left into ac1 
866:    TEQ  3,4,3	Op == 
867:     LD  4,-4(1)	Load left into ac1 
868:    AND  3,4,3	Op AND 
869:     LD  4,-3(1)	Load left into ac1 
870:     OR  3,4,3	Op OR 
871:     ST  3,-3(1)	Save left side 
872:    LDC  3,8(6)	Load integer constant 
873:    LDA  4,-1(0)	Load address of base of array board
874:    SUB  3,4,3	Compute offset of value 
875:     LD  3,0(3)	Load the value 
876:     ST  3,-4(1)	Save left side 
877:    LDC  3,1(6)	Load integer constant 
878:     LD  4,-4(1)	Load left into ac1 
879:    TEQ  3,4,3	Op == 
880:     ST  3,-4(1)	Save left side 
881:    LDC  3,5(6)	Load integer constant 
882:    LDA  4,-1(0)	Load address of base of array board
883:    SUB  3,4,3	Compute offset of value 
884:     LD  3,0(3)	Load the value 
885:     ST  3,-5(1)	Save left side 
886:    LDC  3,1(6)	Load integer constant 
887:     LD  4,-5(1)	Load left into ac1 
888:    TEQ  3,4,3	Op == 
889:     LD  4,-4(1)	Load left into ac1 
890:    AND  3,4,3	Op AND 
891:     LD  4,-3(1)	Load left into ac1 
892:     OR  3,4,3	Op OR 
893:     ST  3,-3(1)	Save left side 
894:    LDC  3,2(6)	Load integer constant 
895:    LDA  4,-1(0)	Load address of base of array board
896:    SUB  3,4,3	Compute offset of value 
897:     LD  3,0(3)	Load the value 
898:     ST  3,-4(1)	Save left side 
899:    LDC  3,1(6)	Load integer constant 
900:    LDC  4,0(6)	Load 0 
901:    SUB  3,4,3	Op unary - 
902:     LD  4,-4(1)	Load left into ac1 
903:    TEQ  3,4,3	Op == 
904:     LD  4,-3(1)	Load left into ac1 
905:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
907:    LDC  3,2(6)	Load integer constant 
908:     ST  3,-3(1)	Save index 
909:    LDC  3,2(6)	Load integer constant 
910:     LD  4,-3(1)	Restore index 
911:    LDA  5,-1(0)	Load address of base of array board
912:    SUB  5,5,4	Compute offset of value 
913:     ST  3,0(5)	Store variable board
* EXPRESSION
914:    LDC  3,1(6)	Load Boolean constant 
915:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
906:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
917:    LDC  3,0(6)	Load integer constant 
918:    LDA  4,-1(0)	Load address of base of array board
919:    SUB  3,4,3	Compute offset of value 
920:     LD  3,0(3)	Load the value 
921:     ST  3,-3(1)	Save left side 
922:    LDC  3,1(6)	Load integer constant 
923:     LD  4,-3(1)	Load left into ac1 
924:    TEQ  3,4,3	Op == 
925:     ST  3,-3(1)	Save left side 
926:    LDC  3,2(6)	Load integer constant 
927:    LDA  4,-1(0)	Load address of base of array board
928:    SUB  3,4,3	Compute offset of value 
929:     LD  3,0(3)	Load the value 
930:     ST  3,-4(1)	Save left side 
931:    LDC  3,1(6)	Load integer constant 
932:     LD  4,-4(1)	Load left into ac1 
933:    TEQ  3,4,3	Op == 
934:     LD  4,-3(1)	Load left into ac1 
935:    AND  3,4,3	Op AND 
936:     ST  3,-3(1)	Save left side 
937:    LDC  3,4(6)	Load integer constant 
938:    LDA  4,-1(0)	Load address of base of array board
939:    SUB  3,4,3	Compute offset of value 
940:     LD  3,0(3)	Load the value 
941:     ST  3,-4(1)	Save left side 
942:    LDC  3,1(6)	Load integer constant 
943:     LD  4,-4(1)	Load left into ac1 
944:    TEQ  3,4,3	Op == 
945:     ST  3,-4(1)	Save left side 
946:    LDC  3,7(6)	Load integer constant 
947:    LDA  4,-1(0)	Load address of base of array board
948:    SUB  3,4,3	Compute offset of value 
949:     LD  3,0(3)	Load the value 
950:     ST  3,-5(1)	Save left side 
951:    LDC  3,1(6)	Load integer constant 
952:     LD  4,-5(1)	Load left into ac1 
953:    TEQ  3,4,3	Op == 
954:     LD  4,-4(1)	Load left into ac1 
955:    AND  3,4,3	Op AND 
956:     LD  4,-3(1)	Load left into ac1 
957:     OR  3,4,3	Op OR 
958:     ST  3,-3(1)	Save left side 
959:    LDC  3,1(6)	Load integer constant 
960:    LDA  4,-1(0)	Load address of base of array board
961:    SUB  3,4,3	Compute offset of value 
962:     LD  3,0(3)	Load the value 
963:     ST  3,-4(1)	Save left side 
964:    LDC  3,1(6)	Load integer constant 
965:    LDC  4,0(6)	Load 0 
966:    SUB  3,4,3	Op unary - 
967:     LD  4,-4(1)	Load left into ac1 
968:    TEQ  3,4,3	Op == 
969:     LD  4,-3(1)	Load left into ac1 
970:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
972:    LDC  3,1(6)	Load integer constant 
973:     ST  3,-3(1)	Save index 
974:    LDC  3,2(6)	Load integer constant 
975:     LD  4,-3(1)	Restore index 
976:    LDA  5,-1(0)	Load address of base of array board
977:    SUB  5,5,4	Compute offset of value 
978:     ST  3,0(5)	Store variable board
* EXPRESSION
979:    LDC  3,1(6)	Load Boolean constant 
980:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
971:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
982:    LDC  3,2(6)	Load integer constant 
983:    LDA  4,-1(0)	Load address of base of array board
984:    SUB  3,4,3	Compute offset of value 
985:     LD  3,0(3)	Load the value 
986:     ST  3,-3(1)	Save left side 
987:    LDC  3,1(6)	Load integer constant 
988:     LD  4,-3(1)	Load left into ac1 
989:    TEQ  3,4,3	Op == 
990:     ST  3,-3(1)	Save left side 
991:    LDC  3,1(6)	Load integer constant 
992:    LDA  4,-1(0)	Load address of base of array board
993:    SUB  3,4,3	Compute offset of value 
994:     LD  3,0(3)	Load the value 
995:     ST  3,-4(1)	Save left side 
996:    LDC  3,1(6)	Load integer constant 
997:     LD  4,-4(1)	Load left into ac1 
998:    TEQ  3,4,3	Op == 
999:     LD  4,-3(1)	Load left into ac1 
1000:    AND  3,4,3	Op AND 
1001:     ST  3,-3(1)	Save left side 
1002:    LDC  3,6(6)	Load integer constant 
1003:    LDA  4,-1(0)	Load address of base of array board
1004:    SUB  3,4,3	Compute offset of value 
1005:     LD  3,0(3)	Load the value 
1006:     ST  3,-4(1)	Save left side 
1007:    LDC  3,1(6)	Load integer constant 
1008:     LD  4,-4(1)	Load left into ac1 
1009:    TEQ  3,4,3	Op == 
1010:     ST  3,-4(1)	Save left side 
1011:    LDC  3,3(6)	Load integer constant 
1012:    LDA  4,-1(0)	Load address of base of array board
1013:    SUB  3,4,3	Compute offset of value 
1014:     LD  3,0(3)	Load the value 
1015:     ST  3,-5(1)	Save left side 
1016:    LDC  3,1(6)	Load integer constant 
1017:     LD  4,-5(1)	Load left into ac1 
1018:    TEQ  3,4,3	Op == 
1019:     LD  4,-4(1)	Load left into ac1 
1020:    AND  3,4,3	Op AND 
1021:     LD  4,-3(1)	Load left into ac1 
1022:     OR  3,4,3	Op OR 
1023:     ST  3,-3(1)	Save left side 
1024:    LDC  3,4(6)	Load integer constant 
1025:    LDA  4,-1(0)	Load address of base of array board
1026:    SUB  3,4,3	Compute offset of value 
1027:     LD  3,0(3)	Load the value 
1028:     ST  3,-4(1)	Save left side 
1029:    LDC  3,1(6)	Load integer constant 
1030:     LD  4,-4(1)	Load left into ac1 
1031:    TEQ  3,4,3	Op == 
1032:     ST  3,-4(1)	Save left side 
1033:    LDC  3,8(6)	Load integer constant 
1034:    LDA  4,-1(0)	Load address of base of array board
1035:    SUB  3,4,3	Compute offset of value 
1036:     LD  3,0(3)	Load the value 
1037:     ST  3,-5(1)	Save left side 
1038:    LDC  3,1(6)	Load integer constant 
1039:     LD  4,-5(1)	Load left into ac1 
1040:    TEQ  3,4,3	Op == 
1041:     LD  4,-4(1)	Load left into ac1 
1042:    AND  3,4,3	Op AND 
1043:     LD  4,-3(1)	Load left into ac1 
1044:     OR  3,4,3	Op OR 
1045:     ST  3,-3(1)	Save left side 
1046:    LDC  3,0(6)	Load integer constant 
1047:    LDA  4,-1(0)	Load address of base of array board
1048:    SUB  3,4,3	Compute offset of value 
1049:     LD  3,0(3)	Load the value 
1050:     ST  3,-4(1)	Save left side 
1051:    LDC  3,1(6)	Load integer constant 
1052:    LDC  4,0(6)	Load 0 
1053:    SUB  3,4,3	Op unary - 
1054:     LD  4,-4(1)	Load left into ac1 
1055:    TEQ  3,4,3	Op == 
1056:     LD  4,-3(1)	Load left into ac1 
1057:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
1059:    LDC  3,0(6)	Load integer constant 
1060:     ST  3,-3(1)	Save index 
1061:    LDC  3,2(6)	Load integer constant 
1062:     LD  4,-3(1)	Restore index 
1063:    LDA  5,-1(0)	Load address of base of array board
1064:    SUB  5,5,4	Compute offset of value 
1065:     ST  3,0(5)	Store variable board
* EXPRESSION
1066:    LDC  3,1(6)	Load Boolean constant 
1067:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1058:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
1069:    LDC  3,3(6)	Load integer constant 
1070:    LDA  4,-1(0)	Load address of base of array board
1071:    SUB  3,4,3	Compute offset of value 
1072:     LD  3,0(3)	Load the value 
1073:     ST  3,-3(1)	Save left side 
1074:    LDC  3,1(6)	Load integer constant 
1075:     LD  4,-3(1)	Load left into ac1 
1076:    TEQ  3,4,3	Op == 
1077:     ST  3,-3(1)	Save left side 
1078:    LDC  3,4(6)	Load integer constant 
1079:    LDA  4,-1(0)	Load address of base of array board
1080:    SUB  3,4,3	Compute offset of value 
1081:     LD  3,0(3)	Load the value 
1082:     ST  3,-4(1)	Save left side 
1083:    LDC  3,1(6)	Load integer constant 
1084:     LD  4,-4(1)	Load left into ac1 
1085:    TEQ  3,4,3	Op == 
1086:     LD  4,-3(1)	Load left into ac1 
1087:    AND  3,4,3	Op AND 
1088:     ST  3,-3(1)	Save left side 
1089:    LDC  3,2(6)	Load integer constant 
1090:    LDA  4,-1(0)	Load address of base of array board
1091:    SUB  3,4,3	Compute offset of value 
1092:     LD  3,0(3)	Load the value 
1093:     ST  3,-4(1)	Save left side 
1094:    LDC  3,1(6)	Load integer constant 
1095:     LD  4,-4(1)	Load left into ac1 
1096:    TEQ  3,4,3	Op == 
1097:     ST  3,-4(1)	Save left side 
1098:    LDC  3,8(6)	Load integer constant 
1099:    LDA  4,-1(0)	Load address of base of array board
1100:    SUB  3,4,3	Compute offset of value 
1101:     LD  3,0(3)	Load the value 
1102:     ST  3,-5(1)	Save left side 
1103:    LDC  3,1(6)	Load integer constant 
1104:     LD  4,-5(1)	Load left into ac1 
1105:    TEQ  3,4,3	Op == 
1106:     LD  4,-4(1)	Load left into ac1 
1107:    AND  3,4,3	Op AND 
1108:     LD  4,-3(1)	Load left into ac1 
1109:     OR  3,4,3	Op OR 
1110:     ST  3,-3(1)	Save left side 
1111:    LDC  3,5(6)	Load integer constant 
1112:    LDA  4,-1(0)	Load address of base of array board
1113:    SUB  3,4,3	Compute offset of value 
1114:     LD  3,0(3)	Load the value 
1115:     ST  3,-4(1)	Save left side 
1116:    LDC  3,1(6)	Load integer constant 
1117:    LDC  4,0(6)	Load 0 
1118:    SUB  3,4,3	Op unary - 
1119:     LD  4,-4(1)	Load left into ac1 
1120:    TEQ  3,4,3	Op == 
1121:     LD  4,-3(1)	Load left into ac1 
1122:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
1124:    LDC  3,5(6)	Load integer constant 
1125:     ST  3,-3(1)	Save index 
1126:    LDC  3,2(6)	Load integer constant 
1127:     LD  4,-3(1)	Restore index 
1128:    LDA  5,-1(0)	Load address of base of array board
1129:    SUB  5,5,4	Compute offset of value 
1130:     ST  3,0(5)	Store variable board
* EXPRESSION
1131:    LDC  3,1(6)	Load Boolean constant 
1132:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1123:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
1134:    LDC  3,3(6)	Load integer constant 
1135:    LDA  4,-1(0)	Load address of base of array board
1136:    SUB  3,4,3	Compute offset of value 
1137:     LD  3,0(3)	Load the value 
1138:     ST  3,-3(1)	Save left side 
1139:    LDC  3,1(6)	Load integer constant 
1140:     LD  4,-3(1)	Load left into ac1 
1141:    TEQ  3,4,3	Op == 
1142:     ST  3,-3(1)	Save left side 
1143:    LDC  3,5(6)	Load integer constant 
1144:    LDA  4,-1(0)	Load address of base of array board
1145:    SUB  3,4,3	Compute offset of value 
1146:     LD  3,0(3)	Load the value 
1147:     ST  3,-4(1)	Save left side 
1148:    LDC  3,1(6)	Load integer constant 
1149:     LD  4,-4(1)	Load left into ac1 
1150:    TEQ  3,4,3	Op == 
1151:     LD  4,-3(1)	Load left into ac1 
1152:    AND  3,4,3	Op AND 
1153:     ST  3,-3(1)	Save left side 
1154:    LDC  3,0(6)	Load integer constant 
1155:    LDA  4,-1(0)	Load address of base of array board
1156:    SUB  3,4,3	Compute offset of value 
1157:     LD  3,0(3)	Load the value 
1158:     ST  3,-4(1)	Save left side 
1159:    LDC  3,1(6)	Load integer constant 
1160:     LD  4,-4(1)	Load left into ac1 
1161:    TEQ  3,4,3	Op == 
1162:     ST  3,-4(1)	Save left side 
1163:    LDC  3,8(6)	Load integer constant 
1164:    LDA  4,-1(0)	Load address of base of array board
1165:    SUB  3,4,3	Compute offset of value 
1166:     LD  3,0(3)	Load the value 
1167:     ST  3,-5(1)	Save left side 
1168:    LDC  3,1(6)	Load integer constant 
1169:     LD  4,-5(1)	Load left into ac1 
1170:    TEQ  3,4,3	Op == 
1171:     LD  4,-4(1)	Load left into ac1 
1172:    AND  3,4,3	Op AND 
1173:     LD  4,-3(1)	Load left into ac1 
1174:     OR  3,4,3	Op OR 
1175:     ST  3,-3(1)	Save left side 
1176:    LDC  3,2(6)	Load integer constant 
1177:    LDA  4,-1(0)	Load address of base of array board
1178:    SUB  3,4,3	Compute offset of value 
1179:     LD  3,0(3)	Load the value 
1180:     ST  3,-4(1)	Save left side 
1181:    LDC  3,1(6)	Load integer constant 
1182:     LD  4,-4(1)	Load left into ac1 
1183:    TEQ  3,4,3	Op == 
1184:     ST  3,-4(1)	Save left side 
1185:    LDC  3,6(6)	Load integer constant 
1186:    LDA  4,-1(0)	Load address of base of array board
1187:    SUB  3,4,3	Compute offset of value 
1188:     LD  3,0(3)	Load the value 
1189:     ST  3,-5(1)	Save left side 
1190:    LDC  3,1(6)	Load integer constant 
1191:     LD  4,-5(1)	Load left into ac1 
1192:    TEQ  3,4,3	Op == 
1193:     LD  4,-4(1)	Load left into ac1 
1194:    AND  3,4,3	Op AND 
1195:     LD  4,-3(1)	Load left into ac1 
1196:     OR  3,4,3	Op OR 
1197:     ST  3,-3(1)	Save left side 
1198:    LDC  3,1(6)	Load integer constant 
1199:    LDA  4,-1(0)	Load address of base of array board
1200:    SUB  3,4,3	Compute offset of value 
1201:     LD  3,0(3)	Load the value 
1202:     ST  3,-4(1)	Save left side 
1203:    LDC  3,1(6)	Load integer constant 
1204:     LD  4,-4(1)	Load left into ac1 
1205:    TEQ  3,4,3	Op == 
1206:     ST  3,-4(1)	Save left side 
1207:    LDC  3,7(6)	Load integer constant 
1208:    LDA  4,-1(0)	Load address of base of array board
1209:    SUB  3,4,3	Compute offset of value 
1210:     LD  3,0(3)	Load the value 
1211:     ST  3,-5(1)	Save left side 
1212:    LDC  3,1(6)	Load integer constant 
1213:     LD  4,-5(1)	Load left into ac1 
1214:    TEQ  3,4,3	Op == 
1215:     LD  4,-4(1)	Load left into ac1 
1216:    AND  3,4,3	Op AND 
1217:     LD  4,-3(1)	Load left into ac1 
1218:     OR  3,4,3	Op OR 
1219:     ST  3,-3(1)	Save left side 
1220:    LDC  3,4(6)	Load integer constant 
1221:    LDA  4,-1(0)	Load address of base of array board
1222:    SUB  3,4,3	Compute offset of value 
1223:     LD  3,0(3)	Load the value 
1224:     ST  3,-4(1)	Save left side 
1225:    LDC  3,1(6)	Load integer constant 
1226:    LDC  4,0(6)	Load 0 
1227:    SUB  3,4,3	Op unary - 
1228:     LD  4,-4(1)	Load left into ac1 
1229:    TEQ  3,4,3	Op == 
1230:     LD  4,-3(1)	Load left into ac1 
1231:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
1233:    LDC  3,4(6)	Load integer constant 
1234:     ST  3,-3(1)	Save index 
1235:    LDC  3,2(6)	Load integer constant 
1236:     LD  4,-3(1)	Restore index 
1237:    LDA  5,-1(0)	Load address of base of array board
1238:    SUB  5,5,4	Compute offset of value 
1239:     ST  3,0(5)	Store variable board
* EXPRESSION
1240:    LDC  3,1(6)	Load Boolean constant 
1241:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1232:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
1243:    LDC  3,4(6)	Load integer constant 
1244:    LDA  4,-1(0)	Load address of base of array board
1245:    SUB  3,4,3	Compute offset of value 
1246:     LD  3,0(3)	Load the value 
1247:     ST  3,-3(1)	Save left side 
1248:    LDC  3,1(6)	Load integer constant 
1249:     LD  4,-3(1)	Load left into ac1 
1250:    TEQ  3,4,3	Op == 
1251:     ST  3,-3(1)	Save left side 
1252:    LDC  3,5(6)	Load integer constant 
1253:    LDA  4,-1(0)	Load address of base of array board
1254:    SUB  3,4,3	Compute offset of value 
1255:     LD  3,0(3)	Load the value 
1256:     ST  3,-4(1)	Save left side 
1257:    LDC  3,1(6)	Load integer constant 
1258:     LD  4,-4(1)	Load left into ac1 
1259:    TEQ  3,4,3	Op == 
1260:     LD  4,-3(1)	Load left into ac1 
1261:    AND  3,4,3	Op AND 
1262:     ST  3,-3(1)	Save left side 
1263:    LDC  3,0(6)	Load integer constant 
1264:    LDA  4,-1(0)	Load address of base of array board
1265:    SUB  3,4,3	Compute offset of value 
1266:     LD  3,0(3)	Load the value 
1267:     ST  3,-4(1)	Save left side 
1268:    LDC  3,1(6)	Load integer constant 
1269:     LD  4,-4(1)	Load left into ac1 
1270:    TEQ  3,4,3	Op == 
1271:     ST  3,-4(1)	Save left side 
1272:    LDC  3,6(6)	Load integer constant 
1273:    LDA  4,-1(0)	Load address of base of array board
1274:    SUB  3,4,3	Compute offset of value 
1275:     LD  3,0(3)	Load the value 
1276:     ST  3,-5(1)	Save left side 
1277:    LDC  3,1(6)	Load integer constant 
1278:     LD  4,-5(1)	Load left into ac1 
1279:    TEQ  3,4,3	Op == 
1280:     LD  4,-4(1)	Load left into ac1 
1281:    AND  3,4,3	Op AND 
1282:     LD  4,-3(1)	Load left into ac1 
1283:     OR  3,4,3	Op OR 
1284:     ST  3,-3(1)	Save left side 
1285:    LDC  3,3(6)	Load integer constant 
1286:    LDA  4,-1(0)	Load address of base of array board
1287:    SUB  3,4,3	Compute offset of value 
1288:     LD  3,0(3)	Load the value 
1289:     ST  3,-4(1)	Save left side 
1290:    LDC  3,1(6)	Load integer constant 
1291:    LDC  4,0(6)	Load 0 
1292:    SUB  3,4,3	Op unary - 
1293:     LD  4,-4(1)	Load left into ac1 
1294:    TEQ  3,4,3	Op == 
1295:     LD  4,-3(1)	Load left into ac1 
1296:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
1298:    LDC  3,3(6)	Load integer constant 
1299:     ST  3,-3(1)	Save index 
1300:    LDC  3,2(6)	Load integer constant 
1301:     LD  4,-3(1)	Restore index 
1302:    LDA  5,-1(0)	Load address of base of array board
1303:    SUB  5,5,4	Compute offset of value 
1304:     ST  3,0(5)	Store variable board
* EXPRESSION
1305:    LDC  3,1(6)	Load Boolean constant 
1306:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1297:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
1308:    LDC  3,6(6)	Load integer constant 
1309:    LDA  4,-1(0)	Load address of base of array board
1310:    SUB  3,4,3	Compute offset of value 
1311:     LD  3,0(3)	Load the value 
1312:     ST  3,-3(1)	Save left side 
1313:    LDC  3,1(6)	Load integer constant 
1314:     LD  4,-3(1)	Load left into ac1 
1315:    TEQ  3,4,3	Op == 
1316:     ST  3,-3(1)	Save left side 
1317:    LDC  3,7(6)	Load integer constant 
1318:    LDA  4,-1(0)	Load address of base of array board
1319:    SUB  3,4,3	Compute offset of value 
1320:     LD  3,0(3)	Load the value 
1321:     ST  3,-4(1)	Save left side 
1322:    LDC  3,1(6)	Load integer constant 
1323:     LD  4,-4(1)	Load left into ac1 
1324:    TEQ  3,4,3	Op == 
1325:     LD  4,-3(1)	Load left into ac1 
1326:    AND  3,4,3	Op AND 
1327:     ST  3,-3(1)	Save left side 
1328:    LDC  3,0(6)	Load integer constant 
1329:    LDA  4,-1(0)	Load address of base of array board
1330:    SUB  3,4,3	Compute offset of value 
1331:     LD  3,0(3)	Load the value 
1332:     ST  3,-4(1)	Save left side 
1333:    LDC  3,1(6)	Load integer constant 
1334:     LD  4,-4(1)	Load left into ac1 
1335:    TEQ  3,4,3	Op == 
1336:     ST  3,-4(1)	Save left side 
1337:    LDC  3,4(6)	Load integer constant 
1338:    LDA  4,-1(0)	Load address of base of array board
1339:    SUB  3,4,3	Compute offset of value 
1340:     LD  3,0(3)	Load the value 
1341:     ST  3,-5(1)	Save left side 
1342:    LDC  3,1(6)	Load integer constant 
1343:     LD  4,-5(1)	Load left into ac1 
1344:    TEQ  3,4,3	Op == 
1345:     LD  4,-4(1)	Load left into ac1 
1346:    AND  3,4,3	Op AND 
1347:     LD  4,-3(1)	Load left into ac1 
1348:     OR  3,4,3	Op OR 
1349:     ST  3,-3(1)	Save left side 
1350:    LDC  3,2(6)	Load integer constant 
1351:    LDA  4,-1(0)	Load address of base of array board
1352:    SUB  3,4,3	Compute offset of value 
1353:     LD  3,0(3)	Load the value 
1354:     ST  3,-4(1)	Save left side 
1355:    LDC  3,1(6)	Load integer constant 
1356:     LD  4,-4(1)	Load left into ac1 
1357:    TEQ  3,4,3	Op == 
1358:     ST  3,-4(1)	Save left side 
1359:    LDC  3,5(6)	Load integer constant 
1360:    LDA  4,-1(0)	Load address of base of array board
1361:    SUB  3,4,3	Compute offset of value 
1362:     LD  3,0(3)	Load the value 
1363:     ST  3,-5(1)	Save left side 
1364:    LDC  3,1(6)	Load integer constant 
1365:     LD  4,-5(1)	Load left into ac1 
1366:    TEQ  3,4,3	Op == 
1367:     LD  4,-4(1)	Load left into ac1 
1368:    AND  3,4,3	Op AND 
1369:     LD  4,-3(1)	Load left into ac1 
1370:     OR  3,4,3	Op OR 
1371:     ST  3,-3(1)	Save left side 
1372:    LDC  3,8(6)	Load integer constant 
1373:    LDA  4,-1(0)	Load address of base of array board
1374:    SUB  3,4,3	Compute offset of value 
1375:     LD  3,0(3)	Load the value 
1376:     ST  3,-4(1)	Save left side 
1377:    LDC  3,1(6)	Load integer constant 
1378:    LDC  4,0(6)	Load 0 
1379:    SUB  3,4,3	Op unary - 
1380:     LD  4,-4(1)	Load left into ac1 
1381:    TEQ  3,4,3	Op == 
1382:     LD  4,-3(1)	Load left into ac1 
1383:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
1385:    LDC  3,8(6)	Load integer constant 
1386:     ST  3,-3(1)	Save index 
1387:    LDC  3,2(6)	Load integer constant 
1388:     LD  4,-3(1)	Restore index 
1389:    LDA  5,-1(0)	Load address of base of array board
1390:    SUB  5,5,4	Compute offset of value 
1391:     ST  3,0(5)	Store variable board
* EXPRESSION
1392:    LDC  3,1(6)	Load Boolean constant 
1393:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1384:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
1395:    LDC  3,6(6)	Load integer constant 
1396:    LDA  4,-1(0)	Load address of base of array board
1397:    SUB  3,4,3	Compute offset of value 
1398:     LD  3,0(3)	Load the value 
1399:     ST  3,-3(1)	Save left side 
1400:    LDC  3,1(6)	Load integer constant 
1401:     LD  4,-3(1)	Load left into ac1 
1402:    TEQ  3,4,3	Op == 
1403:     ST  3,-3(1)	Save left side 
1404:    LDC  3,8(6)	Load integer constant 
1405:    LDA  4,-1(0)	Load address of base of array board
1406:    SUB  3,4,3	Compute offset of value 
1407:     LD  3,0(3)	Load the value 
1408:     ST  3,-4(1)	Save left side 
1409:    LDC  3,1(6)	Load integer constant 
1410:     LD  4,-4(1)	Load left into ac1 
1411:    TEQ  3,4,3	Op == 
1412:     LD  4,-3(1)	Load left into ac1 
1413:    AND  3,4,3	Op AND 
1414:     ST  3,-3(1)	Save left side 
1415:    LDC  3,4(6)	Load integer constant 
1416:    LDA  4,-1(0)	Load address of base of array board
1417:    SUB  3,4,3	Compute offset of value 
1418:     LD  3,0(3)	Load the value 
1419:     ST  3,-4(1)	Save left side 
1420:    LDC  3,1(6)	Load integer constant 
1421:     LD  4,-4(1)	Load left into ac1 
1422:    TEQ  3,4,3	Op == 
1423:     ST  3,-4(1)	Save left side 
1424:    LDC  3,1(6)	Load integer constant 
1425:    LDA  4,-1(0)	Load address of base of array board
1426:    SUB  3,4,3	Compute offset of value 
1427:     LD  3,0(3)	Load the value 
1428:     ST  3,-5(1)	Save left side 
1429:    LDC  3,1(6)	Load integer constant 
1430:     LD  4,-5(1)	Load left into ac1 
1431:    TEQ  3,4,3	Op == 
1432:     LD  4,-4(1)	Load left into ac1 
1433:    AND  3,4,3	Op AND 
1434:     LD  4,-3(1)	Load left into ac1 
1435:     OR  3,4,3	Op OR 
1436:     ST  3,-3(1)	Save left side 
1437:    LDC  3,7(6)	Load integer constant 
1438:    LDA  4,-1(0)	Load address of base of array board
1439:    SUB  3,4,3	Compute offset of value 
1440:     LD  3,0(3)	Load the value 
1441:     ST  3,-4(1)	Save left side 
1442:    LDC  3,1(6)	Load integer constant 
1443:    LDC  4,0(6)	Load 0 
1444:    SUB  3,4,3	Op unary - 
1445:     LD  4,-4(1)	Load left into ac1 
1446:    TEQ  3,4,3	Op == 
1447:     LD  4,-3(1)	Load left into ac1 
1448:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
1450:    LDC  3,7(6)	Load integer constant 
1451:     ST  3,-3(1)	Save index 
1452:    LDC  3,2(6)	Load integer constant 
1453:     LD  4,-3(1)	Restore index 
1454:    LDA  5,-1(0)	Load address of base of array board
1455:    SUB  5,5,4	Compute offset of value 
1456:     ST  3,0(5)	Store variable board
* EXPRESSION
1457:    LDC  3,1(6)	Load Boolean constant 
1458:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1449:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
1460:    LDC  3,7(6)	Load integer constant 
1461:    LDA  4,-1(0)	Load address of base of array board
1462:    SUB  3,4,3	Compute offset of value 
1463:     LD  3,0(3)	Load the value 
1464:     ST  3,-3(1)	Save left side 
1465:    LDC  3,1(6)	Load integer constant 
1466:     LD  4,-3(1)	Load left into ac1 
1467:    TEQ  3,4,3	Op == 
1468:     ST  3,-3(1)	Save left side 
1469:    LDC  3,8(6)	Load integer constant 
1470:    LDA  4,-1(0)	Load address of base of array board
1471:    SUB  3,4,3	Compute offset of value 
1472:     LD  3,0(3)	Load the value 
1473:     ST  3,-4(1)	Save left side 
1474:    LDC  3,1(6)	Load integer constant 
1475:     LD  4,-4(1)	Load left into ac1 
1476:    TEQ  3,4,3	Op == 
1477:     LD  4,-3(1)	Load left into ac1 
1478:    AND  3,4,3	Op AND 
1479:     ST  3,-3(1)	Save left side 
1480:    LDC  3,4(6)	Load integer constant 
1481:    LDA  4,-1(0)	Load address of base of array board
1482:    SUB  3,4,3	Compute offset of value 
1483:     LD  3,0(3)	Load the value 
1484:     ST  3,-4(1)	Save left side 
1485:    LDC  3,1(6)	Load integer constant 
1486:     LD  4,-4(1)	Load left into ac1 
1487:    TEQ  3,4,3	Op == 
1488:     ST  3,-4(1)	Save left side 
1489:    LDC  3,2(6)	Load integer constant 
1490:    LDA  4,-1(0)	Load address of base of array board
1491:    SUB  3,4,3	Compute offset of value 
1492:     LD  3,0(3)	Load the value 
1493:     ST  3,-5(1)	Save left side 
1494:    LDC  3,1(6)	Load integer constant 
1495:     LD  4,-5(1)	Load left into ac1 
1496:    TEQ  3,4,3	Op == 
1497:     LD  4,-4(1)	Load left into ac1 
1498:    AND  3,4,3	Op AND 
1499:     LD  4,-3(1)	Load left into ac1 
1500:     OR  3,4,3	Op OR 
1501:     ST  3,-3(1)	Save left side 
1502:    LDC  3,0(6)	Load integer constant 
1503:    LDA  4,-1(0)	Load address of base of array board
1504:    SUB  3,4,3	Compute offset of value 
1505:     LD  3,0(3)	Load the value 
1506:     ST  3,-4(1)	Save left side 
1507:    LDC  3,1(6)	Load integer constant 
1508:     LD  4,-4(1)	Load left into ac1 
1509:    TEQ  3,4,3	Op == 
1510:     ST  3,-4(1)	Save left side 
1511:    LDC  3,3(6)	Load integer constant 
1512:    LDA  4,-1(0)	Load address of base of array board
1513:    SUB  3,4,3	Compute offset of value 
1514:     LD  3,0(3)	Load the value 
1515:     ST  3,-5(1)	Save left side 
1516:    LDC  3,1(6)	Load integer constant 
1517:     LD  4,-5(1)	Load left into ac1 
1518:    TEQ  3,4,3	Op == 
1519:     LD  4,-4(1)	Load left into ac1 
1520:    AND  3,4,3	Op AND 
1521:     LD  4,-3(1)	Load left into ac1 
1522:     OR  3,4,3	Op OR 
1523:     ST  3,-3(1)	Save left side 
1524:    LDC  3,6(6)	Load integer constant 
1525:    LDA  4,-1(0)	Load address of base of array board
1526:    SUB  3,4,3	Compute offset of value 
1527:     LD  3,0(3)	Load the value 
1528:     ST  3,-4(1)	Save left side 
1529:    LDC  3,1(6)	Load integer constant 
1530:    LDC  4,0(6)	Load 0 
1531:    SUB  3,4,3	Op unary - 
1532:     LD  4,-4(1)	Load left into ac1 
1533:    TEQ  3,4,3	Op == 
1534:     LD  4,-3(1)	Load left into ac1 
1535:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
1537:    LDC  3,6(6)	Load integer constant 
1538:     ST  3,-3(1)	Save index 
1539:    LDC  3,2(6)	Load integer constant 
1540:     LD  4,-3(1)	Restore index 
1541:    LDA  5,-1(0)	Load address of base of array board
1542:    SUB  5,5,4	Compute offset of value 
1543:     ST  3,0(5)	Store variable board
* EXPRESSION
1544:    LDC  3,1(6)	Load Boolean constant 
1545:     ST  3,-2(1)	Store variable blocked
* END COMPOUND
1536:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
1459:    LDA  7,86(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1394:    LDA  7,151(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1307:    LDA  7,238(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1242:    LDA  7,303(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1133:    LDA  7,412(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
1068:    LDA  7,477(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
981:    LDA  7,564(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
916:    LDA  7,629(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
1546:     LD  3,-2(1)	Load variable blocked
1547:    LDA  2,0(3)	Copy result to rt register 
1548:     LD  3,-1(1)	Load return address 
1549:     LD  1,0(1)	Adjust fp 
1550:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
1551:    LDC  2,0(6)	Set return value to 0 
1552:     LD  3,-1(1)	Load return address 
1553:     LD  1,0(1)	Adjust fp 
1554:    LDA  7,0(3)	Return 
* END FUNCTION blockplayer
* FUNCTION placey
1555:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
*                       Begin call to  win
1556:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to win
1557:    LDA  1,-2(1)	Load address of new frame 
1558:    LDA  3,1(7)	Return address in ac 
1559:    LDA  7,-1470(7)	CALL win
1560:    LDA  3,0(2)	Save the result in ac 
*                       End call to win
1561:    LDC  4,1(6)	Load 1 
1562:    XOR  3,3,4	Op NOT 
* THEN
* COMPOUND
* IF
*                       Begin call to  blockplayer
1564:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to blockplayer
1565:    LDA  1,-2(1)	Load address of new frame 
1566:    LDA  3,1(7)	Return address in ac 
1567:    LDA  7,-741(7)	CALL blockplayer
1568:    LDA  3,0(2)	Save the result in ac 
*                       End call to blockplayer
1569:    LDC  4,1(6)	Load 1 
1570:    XOR  3,3,4	Op NOT 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  move
1572:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to move
1573:    LDA  1,-2(1)	Load address of new frame 
1574:    LDA  3,1(7)	Return address in ac 
1575:    LDA  7,-1534(7)	CALL move
1576:    LDA  3,0(2)	Save the result in ac 
*                       End call to move
* END COMPOUND
1571:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
1563:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
1577:    LDC  2,0(6)	Set return value to 0 
1578:     LD  3,-1(1)	Load return address 
1579:     LD  1,0(1)	Adjust fp 
1580:    LDA  7,0(3)	Return 
* END FUNCTION placey
* FUNCTION xingrid
1581:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
1582:    LDC  3,0(6)	Load Boolean constant 
1583:     ST  3,-3(1)	Store variable retval
* IF
1584:     LD  3,-2(1)	Load variable x
1585:     ST  3,-4(1)	Save left side 
1586:    LDC  3,0(6)	Load integer constant 
1587:     LD  4,-4(1)	Load left into ac1 
1588:    TGE  3,4,3	Op >= 
1589:     ST  3,-4(1)	Save left side 
1590:     LD  3,-2(1)	Load variable x
1591:     ST  3,-5(1)	Save left side 
1592:    LDC  3,8(6)	Load integer constant 
1593:     LD  4,-5(1)	Load left into ac1 
1594:    TLE  3,4,3	Op <= 
1595:     LD  4,-4(1)	Load left into ac1 
1596:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* IF
1598:     LD  3,-2(1)	Load variable x
1599:    LDA  4,-1(0)	Load address of base of array board
1600:    SUB  3,4,3	Compute offset of value 
1601:     LD  3,0(3)	Load the value 
1602:     ST  3,-4(1)	Save left side 
1603:    LDC  3,1(6)	Load integer constant 
1604:     LD  4,-4(1)	Load left into ac1 
1605:    TNE  3,4,3	Op != 
1606:     ST  3,-4(1)	Save left side 
1607:     LD  3,-2(1)	Load variable x
1608:    LDA  4,-1(0)	Load address of base of array board
1609:    SUB  3,4,3	Compute offset of value 
1610:     LD  3,0(3)	Load the value 
1611:     ST  3,-5(1)	Save left side 
1612:    LDC  3,2(6)	Load integer constant 
1613:     LD  4,-5(1)	Load left into ac1 
1614:    TNE  3,4,3	Op != 
1615:     LD  4,-4(1)	Load left into ac1 
1616:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
1618:     LD  3,-2(1)	Load variable x
1619:     ST  3,-4(1)	Save index 
1620:    LDC  3,1(6)	Load integer constant 
1621:     LD  4,-4(1)	Restore index 
1622:    LDA  5,-1(0)	Load address of base of array board
1623:    SUB  5,5,4	Compute offset of value 
1624:     ST  3,0(5)	Store variable board
* EXPRESSION
1625:    LDC  3,1(6)	Load Boolean constant 
1626:     ST  3,-3(1)	Store variable retval
* END COMPOUND
1617:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
1597:    JZR  3,29(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
1627:     LD  3,-3(1)	Load variable retval
1628:    LDA  2,0(3)	Copy result to rt register 
1629:     LD  3,-1(1)	Load return address 
1630:     LD  1,0(1)	Adjust fp 
1631:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
1632:    LDC  2,0(6)	Set return value to 0 
1633:     LD  3,-1(1)	Load return address 
1634:     LD  1,0(1)	Adjust fp 
1635:    LDA  7,0(3)	Return 
* END FUNCTION xingrid
* FUNCTION printboard
1636:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
1637:    LDC  3,0(6)	Load integer constant 
1638:     ST  3,-2(1)	Store variable i
* WHILE
1639:     LD  3,-2(1)	Load variable i
1640:     ST  3,-3(1)	Save left side 
1641:    LDC  3,9(6)	Load integer constant 
1642:     LD  4,-3(1)	Load left into ac1 
1643:    TLT  3,4,3	Op < 
1644:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
1646:     LD  3,-2(1)	Load variable i
1647:    LDA  4,-1(0)	Load address of base of array board
1648:    SUB  3,4,3	Compute offset of value 
1649:     LD  3,0(3)	Load the value 
1650:     ST  3,-3(1)	Save left side 
1651:    LDC  3,1(6)	Load integer constant 
1652:     LD  4,-3(1)	Load left into ac1 
1653:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outputb
1655:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
1656:    LDC  3,1(6)	Load Boolean constant 
1657:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
1658:    LDA  1,-3(1)	Load address of new frame 
1659:    LDA  3,1(7)	Return address in ac 
1660:    LDA  7,-1643(7)	CALL outputb
1661:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* END COMPOUND
1654:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
1663:     LD  3,-2(1)	Load variable i
1664:    LDA  4,-1(0)	Load address of base of array board
1665:    SUB  3,4,3	Compute offset of value 
1666:     LD  3,0(3)	Load the value 
1667:     ST  3,-3(1)	Save left side 
1668:    LDC  3,2(6)	Load integer constant 
1669:     LD  4,-3(1)	Load left into ac1 
1670:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outputb
1672:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
1673:    LDC  3,0(6)	Load Boolean constant 
1674:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
1675:    LDA  1,-3(1)	Load address of new frame 
1676:    LDA  3,1(7)	Return address in ac 
1677:    LDA  7,-1660(7)	CALL outputb
1678:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* END COMPOUND
1671:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
*                       Begin call to  output
1680:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
1681:     LD  3,-2(1)	Load variable i
1682:     ST  3,-5(1)	Store parameter 
*                       Jump to output
1683:    LDA  1,-3(1)	Load address of new frame 
1684:    LDA  3,1(7)	Return address in ac 
1685:    LDA  7,-1680(7)	CALL output
1686:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
1679:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
1662:    LDA  7,24(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
1687:     LD  3,-2(1)	Load variable i
1688:     ST  3,-3(1)	Save left side 
1689:    LDC  3,2(6)	Load integer constant 
1690:     LD  4,-3(1)	Load left into ac1 
1691:    TEQ  3,4,3	Op == 
1692:     ST  3,-3(1)	Save left side 
1693:     LD  3,-2(1)	Load variable i
1694:     ST  3,-4(1)	Save left side 
1695:    LDC  3,5(6)	Load integer constant 
1696:     LD  4,-4(1)	Load left into ac1 
1697:    TEQ  3,4,3	Op == 
1698:     LD  4,-3(1)	Load left into ac1 
1699:     OR  3,4,3	Op OR 
1700:     ST  3,-3(1)	Save left side 
1701:     LD  3,-2(1)	Load variable i
1702:     ST  3,-4(1)	Save left side 
1703:    LDC  3,8(6)	Load integer constant 
1704:     LD  4,-4(1)	Load left into ac1 
1705:    TEQ  3,4,3	Op == 
1706:     LD  4,-3(1)	Load left into ac1 
1707:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
1709:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
1710:    LDA  1,-3(1)	Load address of new frame 
1711:    LDA  3,1(7)	Return address in ac 
1712:    LDA  7,-1676(7)	CALL outnl
1713:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
1708:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
1714:     LD  3,-2(1)	load lhs variable i
1715:    LDA  3,1(3)	increment value of i
1716:     ST  3,-2(1)	Store variable i
* END COMPOUND
1717:    LDA  7,-79(7)	go to beginning of loop 
1645:    LDA  7,72(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
1718:    LDC  2,0(6)	Set return value to 0 
1719:     LD  3,-1(1)	Load return address 
1720:     LD  1,0(1)	Adjust fp 
1721:    LDA  7,0(3)	Return 
* END FUNCTION printboard
* FUNCTION finished
1722:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
1723:    LDC  3,0(6)	Load integer constant 
1724:     ST  3,-2(1)	Store variable i
* IF
1725:    LDC  3,0(6)	Load integer constant 
1726:    LDA  4,-1(0)	Load address of base of array board
1727:    SUB  3,4,3	Compute offset of value 
1728:     LD  3,0(3)	Load the value 
1729:     ST  3,-3(1)	Save left side 
1730:    LDC  3,1(6)	Load integer constant 
1731:    LDC  4,0(6)	Load 0 
1732:    SUB  3,4,3	Op unary - 
1733:     LD  4,-3(1)	Load left into ac1 
1734:    TNE  3,4,3	Op != 
1735:     ST  3,-3(1)	Save left side 
1736:    LDC  3,0(6)	Load integer constant 
1737:    LDA  4,-1(0)	Load address of base of array board
1738:    SUB  3,4,3	Compute offset of value 
1739:     LD  3,0(3)	Load the value 
1740:     ST  3,-4(1)	Save left side 
1741:    LDC  3,1(6)	Load integer constant 
1742:    LDA  4,-1(0)	Load address of base of array board
1743:    SUB  3,4,3	Compute offset of value 
1744:     LD  3,0(3)	Load the value 
1745:     LD  4,-4(1)	Load left into ac1 
1746:    TEQ  3,4,3	Op == 
1747:     ST  3,-4(1)	Save left side 
1748:    LDC  3,0(6)	Load integer constant 
1749:    LDA  4,-1(0)	Load address of base of array board
1750:    SUB  3,4,3	Compute offset of value 
1751:     LD  3,0(3)	Load the value 
1752:     ST  3,-5(1)	Save left side 
1753:    LDC  3,2(6)	Load integer constant 
1754:    LDA  4,-1(0)	Load address of base of array board
1755:    SUB  3,4,3	Compute offset of value 
1756:     LD  3,0(3)	Load the value 
1757:     LD  4,-5(1)	Load left into ac1 
1758:    TEQ  3,4,3	Op == 
1759:     LD  4,-4(1)	Load left into ac1 
1760:    AND  3,4,3	Op AND 
1761:     ST  3,-4(1)	Save left side 
1762:    LDC  3,0(6)	Load integer constant 
1763:    LDA  4,-1(0)	Load address of base of array board
1764:    SUB  3,4,3	Compute offset of value 
1765:     LD  3,0(3)	Load the value 
1766:     ST  3,-5(1)	Save left side 
1767:    LDC  3,4(6)	Load integer constant 
1768:    LDA  4,-1(0)	Load address of base of array board
1769:    SUB  3,4,3	Compute offset of value 
1770:     LD  3,0(3)	Load the value 
1771:     LD  4,-5(1)	Load left into ac1 
1772:    TEQ  3,4,3	Op == 
1773:     ST  3,-5(1)	Save left side 
1774:    LDC  3,0(6)	Load integer constant 
1775:    LDA  4,-1(0)	Load address of base of array board
1776:    SUB  3,4,3	Compute offset of value 
1777:     LD  3,0(3)	Load the value 
1778:     ST  3,-6(1)	Save left side 
1779:    LDC  3,8(6)	Load integer constant 
1780:    LDA  4,-1(0)	Load address of base of array board
1781:    SUB  3,4,3	Compute offset of value 
1782:     LD  3,0(3)	Load the value 
1783:     LD  4,-6(1)	Load left into ac1 
1784:    TEQ  3,4,3	Op == 
1785:     LD  4,-5(1)	Load left into ac1 
1786:    AND  3,4,3	Op AND 
1787:     LD  4,-4(1)	Load left into ac1 
1788:     OR  3,4,3	Op OR 
1789:     ST  3,-4(1)	Save left side 
1790:    LDC  3,0(6)	Load integer constant 
1791:    LDA  4,-1(0)	Load address of base of array board
1792:    SUB  3,4,3	Compute offset of value 
1793:     LD  3,0(3)	Load the value 
1794:     ST  3,-5(1)	Save left side 
1795:    LDC  3,3(6)	Load integer constant 
1796:    LDA  4,-1(0)	Load address of base of array board
1797:    SUB  3,4,3	Compute offset of value 
1798:     LD  3,0(3)	Load the value 
1799:     LD  4,-5(1)	Load left into ac1 
1800:    TEQ  3,4,3	Op == 
1801:     ST  3,-5(1)	Save left side 
1802:    LDC  3,0(6)	Load integer constant 
1803:    LDA  4,-1(0)	Load address of base of array board
1804:    SUB  3,4,3	Compute offset of value 
1805:     LD  3,0(3)	Load the value 
1806:     ST  3,-6(1)	Save left side 
1807:    LDC  3,6(6)	Load integer constant 
1808:    LDA  4,-1(0)	Load address of base of array board
1809:    SUB  3,4,3	Compute offset of value 
1810:     LD  3,0(3)	Load the value 
1811:     LD  4,-6(1)	Load left into ac1 
1812:    TEQ  3,4,3	Op == 
1813:     LD  4,-5(1)	Load left into ac1 
1814:    AND  3,4,3	Op AND 
1815:     LD  4,-4(1)	Load left into ac1 
1816:     OR  3,4,3	Op OR 
1817:     LD  4,-3(1)	Load left into ac1 
1818:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* RETURN
1820:    LDC  3,1(6)	Load Boolean constant 
1821:    LDA  2,0(3)	Copy result to rt register 
1822:     LD  3,-1(1)	Load return address 
1823:     LD  1,0(1)	Adjust fp 
1824:    LDA  7,0(3)	Return 
* END COMPOUND
1819:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
1825:    LDC  3,1(6)	Load integer constant 
1826:    LDA  4,-1(0)	Load address of base of array board
1827:    SUB  3,4,3	Compute offset of value 
1828:     LD  3,0(3)	Load the value 
1829:     ST  3,-3(1)	Save left side 
1830:    LDC  3,1(6)	Load integer constant 
1831:    LDC  4,0(6)	Load 0 
1832:    SUB  3,4,3	Op unary - 
1833:     LD  4,-3(1)	Load left into ac1 
1834:    TNE  3,4,3	Op != 
1835:     ST  3,-3(1)	Save left side 
1836:    LDC  3,1(6)	Load integer constant 
1837:    LDA  4,-1(0)	Load address of base of array board
1838:    SUB  3,4,3	Compute offset of value 
1839:     LD  3,0(3)	Load the value 
1840:     ST  3,-4(1)	Save left side 
1841:    LDC  3,4(6)	Load integer constant 
1842:    LDA  4,-1(0)	Load address of base of array board
1843:    SUB  3,4,3	Compute offset of value 
1844:     LD  3,0(3)	Load the value 
1845:     LD  4,-4(1)	Load left into ac1 
1846:    TEQ  3,4,3	Op == 
1847:     ST  3,-4(1)	Save left side 
1848:    LDC  3,1(6)	Load integer constant 
1849:    LDA  4,-1(0)	Load address of base of array board
1850:    SUB  3,4,3	Compute offset of value 
1851:     LD  3,0(3)	Load the value 
1852:     ST  3,-5(1)	Save left side 
1853:    LDC  3,7(6)	Load integer constant 
1854:    LDA  4,-1(0)	Load address of base of array board
1855:    SUB  3,4,3	Compute offset of value 
1856:     LD  3,0(3)	Load the value 
1857:     LD  4,-5(1)	Load left into ac1 
1858:    TEQ  3,4,3	Op == 
1859:     LD  4,-4(1)	Load left into ac1 
1860:    AND  3,4,3	Op AND 
1861:     LD  4,-3(1)	Load left into ac1 
1862:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* RETURN
1864:    LDC  3,1(6)	Load Boolean constant 
1865:    LDA  2,0(3)	Copy result to rt register 
1866:     LD  3,-1(1)	Load return address 
1867:     LD  1,0(1)	Adjust fp 
1868:    LDA  7,0(3)	Return 
* END COMPOUND
1863:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
1869:    LDC  3,2(6)	Load integer constant 
1870:    LDA  4,-1(0)	Load address of base of array board
1871:    SUB  3,4,3	Compute offset of value 
1872:     LD  3,0(3)	Load the value 
1873:     ST  3,-3(1)	Save left side 
1874:    LDC  3,1(6)	Load integer constant 
1875:    LDC  4,0(6)	Load 0 
1876:    SUB  3,4,3	Op unary - 
1877:     LD  4,-3(1)	Load left into ac1 
1878:    TNE  3,4,3	Op != 
1879:     ST  3,-3(1)	Save left side 
1880:    LDC  3,2(6)	Load integer constant 
1881:    LDA  4,-1(0)	Load address of base of array board
1882:    SUB  3,4,3	Compute offset of value 
1883:     LD  3,0(3)	Load the value 
1884:     ST  3,-4(1)	Save left side 
1885:    LDC  3,4(6)	Load integer constant 
1886:    LDA  4,-1(0)	Load address of base of array board
1887:    SUB  3,4,3	Compute offset of value 
1888:     LD  3,0(3)	Load the value 
1889:     LD  4,-4(1)	Load left into ac1 
1890:    TEQ  3,4,3	Op == 
1891:     ST  3,-4(1)	Save left side 
1892:    LDC  3,2(6)	Load integer constant 
1893:    LDA  4,-1(0)	Load address of base of array board
1894:    SUB  3,4,3	Compute offset of value 
1895:     LD  3,0(3)	Load the value 
1896:     ST  3,-5(1)	Save left side 
1897:    LDC  3,6(6)	Load integer constant 
1898:    LDA  4,-1(0)	Load address of base of array board
1899:    SUB  3,4,3	Compute offset of value 
1900:     LD  3,0(3)	Load the value 
1901:     LD  4,-5(1)	Load left into ac1 
1902:    TEQ  3,4,3	Op == 
1903:     LD  4,-4(1)	Load left into ac1 
1904:    AND  3,4,3	Op AND 
1905:     ST  3,-4(1)	Save left side 
1906:    LDC  3,2(6)	Load integer constant 
1907:    LDA  4,-1(0)	Load address of base of array board
1908:    SUB  3,4,3	Compute offset of value 
1909:     LD  3,0(3)	Load the value 
1910:     ST  3,-5(1)	Save left side 
1911:    LDC  3,5(6)	Load integer constant 
1912:    LDA  4,-1(0)	Load address of base of array board
1913:    SUB  3,4,3	Compute offset of value 
1914:     LD  3,0(3)	Load the value 
1915:     LD  4,-5(1)	Load left into ac1 
1916:    TEQ  3,4,3	Op == 
1917:     ST  3,-5(1)	Save left side 
1918:    LDC  3,2(6)	Load integer constant 
1919:    LDA  4,-1(0)	Load address of base of array board
1920:    SUB  3,4,3	Compute offset of value 
1921:     LD  3,0(3)	Load the value 
1922:     ST  3,-6(1)	Save left side 
1923:    LDC  3,8(6)	Load integer constant 
1924:    LDA  4,-1(0)	Load address of base of array board
1925:    SUB  3,4,3	Compute offset of value 
1926:     LD  3,0(3)	Load the value 
1927:     LD  4,-6(1)	Load left into ac1 
1928:    TEQ  3,4,3	Op == 
1929:     LD  4,-5(1)	Load left into ac1 
1930:    AND  3,4,3	Op AND 
1931:     LD  4,-4(1)	Load left into ac1 
1932:     OR  3,4,3	Op OR 
1933:     LD  4,-3(1)	Load left into ac1 
1934:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* RETURN
1936:    LDC  3,1(6)	Load Boolean constant 
1937:    LDA  2,0(3)	Copy result to rt register 
1938:     LD  3,-1(1)	Load return address 
1939:     LD  1,0(1)	Adjust fp 
1940:    LDA  7,0(3)	Return 
* END COMPOUND
1935:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
1941:    LDC  3,3(6)	Load integer constant 
1942:    LDA  4,-1(0)	Load address of base of array board
1943:    SUB  3,4,3	Compute offset of value 
1944:     LD  3,0(3)	Load the value 
1945:     ST  3,-3(1)	Save left side 
1946:    LDC  3,1(6)	Load integer constant 
1947:    LDC  4,0(6)	Load 0 
1948:    SUB  3,4,3	Op unary - 
1949:     LD  4,-3(1)	Load left into ac1 
1950:    TNE  3,4,3	Op != 
1951:     ST  3,-3(1)	Save left side 
1952:    LDC  3,3(6)	Load integer constant 
1953:    LDA  4,-1(0)	Load address of base of array board
1954:    SUB  3,4,3	Compute offset of value 
1955:     LD  3,0(3)	Load the value 
1956:     ST  3,-4(1)	Save left side 
1957:    LDC  3,4(6)	Load integer constant 
1958:    LDA  4,-1(0)	Load address of base of array board
1959:    SUB  3,4,3	Compute offset of value 
1960:     LD  3,0(3)	Load the value 
1961:     LD  4,-4(1)	Load left into ac1 
1962:    TEQ  3,4,3	Op == 
1963:     ST  3,-4(1)	Save left side 
1964:    LDC  3,3(6)	Load integer constant 
1965:    LDA  4,-1(0)	Load address of base of array board
1966:    SUB  3,4,3	Compute offset of value 
1967:     LD  3,0(3)	Load the value 
1968:     ST  3,-5(1)	Save left side 
1969:    LDC  3,5(6)	Load integer constant 
1970:    LDA  4,-1(0)	Load address of base of array board
1971:    SUB  3,4,3	Compute offset of value 
1972:     LD  3,0(3)	Load the value 
1973:     LD  4,-5(1)	Load left into ac1 
1974:    TEQ  3,4,3	Op == 
1975:     LD  4,-4(1)	Load left into ac1 
1976:    AND  3,4,3	Op AND 
1977:     LD  4,-3(1)	Load left into ac1 
1978:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* RETURN
1980:    LDC  3,1(6)	Load Boolean constant 
1981:    LDA  2,0(3)	Copy result to rt register 
1982:     LD  3,-1(1)	Load return address 
1983:     LD  1,0(1)	Adjust fp 
1984:    LDA  7,0(3)	Return 
* END COMPOUND
1979:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
1985:    LDC  3,6(6)	Load integer constant 
1986:    LDA  4,-1(0)	Load address of base of array board
1987:    SUB  3,4,3	Compute offset of value 
1988:     LD  3,0(3)	Load the value 
1989:     ST  3,-3(1)	Save left side 
1990:    LDC  3,1(6)	Load integer constant 
1991:    LDC  4,0(6)	Load 0 
1992:    SUB  3,4,3	Op unary - 
1993:     LD  4,-3(1)	Load left into ac1 
1994:    TNE  3,4,3	Op != 
1995:     ST  3,-3(1)	Save left side 
1996:    LDC  3,6(6)	Load integer constant 
1997:    LDA  4,-1(0)	Load address of base of array board
1998:    SUB  3,4,3	Compute offset of value 
1999:     LD  3,0(3)	Load the value 
2000:     ST  3,-4(1)	Save left side 
2001:    LDC  3,7(6)	Load integer constant 
2002:    LDA  4,-1(0)	Load address of base of array board
2003:    SUB  3,4,3	Compute offset of value 
2004:     LD  3,0(3)	Load the value 
2005:     LD  4,-4(1)	Load left into ac1 
2006:    TEQ  3,4,3	Op == 
2007:     ST  3,-4(1)	Save left side 
2008:    LDC  3,6(6)	Load integer constant 
2009:    LDA  4,-1(0)	Load address of base of array board
2010:    SUB  3,4,3	Compute offset of value 
2011:     LD  3,0(3)	Load the value 
2012:     ST  3,-5(1)	Save left side 
2013:    LDC  3,8(6)	Load integer constant 
2014:    LDA  4,-1(0)	Load address of base of array board
2015:    SUB  3,4,3	Compute offset of value 
2016:     LD  3,0(3)	Load the value 
2017:     LD  4,-5(1)	Load left into ac1 
2018:    TEQ  3,4,3	Op == 
2019:     LD  4,-4(1)	Load left into ac1 
2020:    AND  3,4,3	Op AND 
2021:     LD  4,-3(1)	Load left into ac1 
2022:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* RETURN
2024:    LDC  3,1(6)	Load Boolean constant 
2025:    LDA  2,0(3)	Copy result to rt register 
2026:     LD  3,-1(1)	Load return address 
2027:     LD  1,0(1)	Adjust fp 
2028:    LDA  7,0(3)	Return 
* END COMPOUND
2023:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* WHILE
2029:     LD  3,-2(1)	Load variable i
2030:    LDA  4,-1(0)	Load address of base of array board
2031:    SUB  3,4,3	Compute offset of value 
2032:     LD  3,0(3)	Load the value 
2033:     ST  3,-3(1)	Save left side 
2034:    LDC  3,1(6)	Load integer constant 
2035:    LDC  4,0(6)	Load 0 
2036:    SUB  3,4,3	Op unary - 
2037:     LD  4,-3(1)	Load left into ac1 
2038:    TNE  3,4,3	Op != 
2039:     ST  3,-3(1)	Save left side 
2040:     LD  3,-2(1)	Load variable i
2041:     ST  3,-4(1)	Save left side 
2042:    LDC  3,9(6)	Load integer constant 
2043:     LD  4,-4(1)	Load left into ac1 
2044:    TLT  3,4,3	Op < 
2045:     LD  4,-3(1)	Load left into ac1 
2046:    AND  3,4,3	Op AND 
2047:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
2049:     LD  3,-2(1)	load lhs variable i
2050:    LDA  3,1(3)	increment value of i
2051:     ST  3,-2(1)	Store variable i
* END COMPOUND
2052:    LDA  7,-24(7)	go to beginning of loop 
2048:    LDA  7,4(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
2053:     LD  3,-2(1)	Load variable i
2054:     ST  3,-3(1)	Save left side 
2055:    LDC  3,9(6)	Load integer constant 
2056:     LD  4,-3(1)	Load left into ac1 
2057:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* RETURN
2059:    LDC  3,1(6)	Load Boolean constant 
2060:    LDA  2,0(3)	Copy result to rt register 
2061:     LD  3,-1(1)	Load return address 
2062:     LD  1,0(1)	Adjust fp 
2063:    LDA  7,0(3)	Return 
* END COMPOUND
2058:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* RETURN
2065:    LDC  3,0(6)	Load Boolean constant 
2066:    LDA  2,0(3)	Copy result to rt register 
2067:     LD  3,-1(1)	Load return address 
2068:     LD  1,0(1)	Adjust fp 
2069:    LDA  7,0(3)	Return 
* END COMPOUND
2064:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
2070:    LDC  2,0(6)	Set return value to 0 
2071:     LD  3,-1(1)	Load return address 
2072:     LD  1,0(1)	Adjust fp 
2073:    LDA  7,0(3)	Return 
* END FUNCTION finished
* FUNCTION playgame
2074:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
2075:    LDC  3,9(6)	Load integer constant 
2076:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  outnl
2077:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2078:    LDA  1,-3(1)	Load address of new frame 
2079:    LDA  3,1(7)	Return address in ac 
2080:    LDA  7,-2044(7)	CALL outnl
2081:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  printboard
2082:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to printboard
2083:    LDA  1,-3(1)	Load address of new frame 
2084:    LDA  3,1(7)	Return address in ac 
2085:    LDA  7,-450(7)	CALL printboard
2086:    LDA  3,0(2)	Save the result in ac 
*                       End call to printboard
* WHILE
*                       Begin call to  finished
2087:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to finished
2088:    LDA  1,-3(1)	Load address of new frame 
2089:    LDA  3,1(7)	Return address in ac 
2090:    LDA  7,-369(7)	CALL finished
2091:    LDA  3,0(2)	Save the result in ac 
*                       End call to finished
2092:    LDC  4,1(6)	Load 1 
2093:    XOR  3,3,4	Op NOT 
2094:     ST  3,-3(1)	Save left side 
2095:     LD  3,-10(0)	Load variable gamenotdone
2096:     ST  3,-4(1)	Save left side 
2097:    LDC  3,1(6)	Load Boolean constant 
2098:     LD  4,-4(1)	Load left into ac1 
2099:    TEQ  3,4,3	Op == 
2100:     LD  4,-3(1)	Load left into ac1 
2101:    AND  3,4,3	Op AND 
2102:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  input
2104:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to input
2105:    LDA  1,-3(1)	Load address of new frame 
2106:    LDA  3,1(7)	Return address in ac 
2107:    LDA  7,-2107(7)	CALL input
2108:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
2109:     ST  3,-2(1)	Store variable x
* IF
*                       Begin call to  xingrid
2110:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
2111:     LD  3,-2(1)	Load variable x
2112:     ST  3,-5(1)	Store parameter 
*                       Jump to xingrid
2113:    LDA  1,-3(1)	Load address of new frame 
2114:    LDA  3,1(7)	Return address in ac 
2115:    LDA  7,-535(7)	CALL xingrid
2116:    LDA  3,0(2)	Save the result in ac 
*                       End call to xingrid
2117:     ST  3,-3(1)	Save left side 
*                       Begin call to  finished
2118:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to finished
2119:    LDA  1,-4(1)	Load address of new frame 
2120:    LDA  3,1(7)	Return address in ac 
2121:    LDA  7,-400(7)	CALL finished
2122:    LDA  3,0(2)	Save the result in ac 
*                       End call to finished
2123:    LDC  4,1(6)	Load 1 
2124:    XOR  3,3,4	Op NOT 
2125:     LD  4,-3(1)	Load left into ac1 
2126:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  placey
2128:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to placey
2129:    LDA  1,-3(1)	Load address of new frame 
2130:    LDA  3,1(7)	Return address in ac 
2131:    LDA  7,-577(7)	CALL placey
2132:    LDA  3,0(2)	Save the result in ac 
*                       End call to placey
* EXPRESSION
*                       Begin call to  outnl
2133:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2134:    LDA  1,-3(1)	Load address of new frame 
2135:    LDA  3,1(7)	Return address in ac 
2136:    LDA  7,-2100(7)	CALL outnl
2137:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  printboard
2138:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to printboard
2139:    LDA  1,-3(1)	Load address of new frame 
2140:    LDA  3,1(7)	Return address in ac 
2141:    LDA  7,-506(7)	CALL printboard
2142:    LDA  3,0(2)	Save the result in ac 
*                       End call to printboard
* EXPRESSION
*                       Begin call to  outnl
2143:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2144:    LDA  1,-3(1)	Load address of new frame 
2145:    LDA  3,1(7)	Return address in ac 
2146:    LDA  7,-2110(7)	CALL outnl
2147:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
2127:    JZR  3,20(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
2148:    LDA  7,-62(7)	go to beginning of loop 
2103:    LDA  7,45(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
2149:    LDC  2,0(6)	Set return value to 0 
2150:     LD  3,-1(1)	Load return address 
2151:     LD  1,0(1)	Adjust fp 
2152:    LDA  7,0(3)	Return 
* END FUNCTION playgame
* FUNCTION main
2153:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
2154:    LDC  3,0(6)	Load integer constant 
2155:     ST  3,-2(1)	Store variable i
* WHILE
2156:     LD  3,-2(1)	Load variable i
2157:     ST  3,-3(1)	Save left side 
2158:    LDC  3,9(6)	Load integer constant 
2159:     LD  4,-3(1)	Load left into ac1 
2160:    TLT  3,4,3	Op < 
2161:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
2163:     LD  3,-2(1)	Load variable i
2164:     ST  3,-3(1)	Save index 
2165:    LDC  3,1(6)	Load integer constant 
2166:    LDC  4,0(6)	Load 0 
2167:    SUB  3,4,3	Op unary - 
2168:     LD  4,-3(1)	Restore index 
2169:    LDA  5,-1(0)	Load address of base of array board
2170:    SUB  5,5,4	Compute offset of value 
2171:     ST  3,0(5)	Store variable board
* EXPRESSION
2172:     LD  3,-2(1)	load lhs variable i
2173:    LDA  3,1(3)	increment value of i
2174:     ST  3,-2(1)	Store variable i
* END COMPOUND
2175:    LDA  7,-20(7)	go to beginning of loop 
2162:    LDA  7,13(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
2176:    LDC  3,1(6)	Load Boolean constant 
2177:     ST  3,-10(0)	Store variable gamenotdone
* EXPRESSION
*                       Begin call to  playgame
2178:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to playgame
2179:    LDA  1,-3(1)	Load address of new frame 
2180:    LDA  3,1(7)	Return address in ac 
2181:    LDA  7,-108(7)	CALL playgame
2182:    LDA  3,0(2)	Save the result in ac 
*                       End call to playgame
* EXPRESSION
*                       Begin call to  outnl
2183:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2184:    LDA  1,-3(1)	Load address of new frame 
2185:    LDA  3,1(7)	Return address in ac 
2186:    LDA  7,-2150(7)	CALL outnl
2187:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  printboard
2188:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to printboard
2189:    LDA  1,-3(1)	Load address of new frame 
2190:    LDA  3,1(7)	Return address in ac 
2191:    LDA  7,-556(7)	CALL printboard
2192:    LDA  3,0(2)	Save the result in ac 
*                       End call to printboard
* EXPRESSION
*                       Begin call to  outnl
2193:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
2194:    LDA  1,-3(1)	Load address of new frame 
2195:    LDA  3,1(7)	Return address in ac 
2196:    LDA  7,-2160(7)	CALL outnl
2197:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
2198:    LDC  2,0(6)	Set return value to 0 
2199:     LD  3,-1(1)	Load return address 
2200:     LD  1,0(1)	Adjust fp 
2201:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,2201(7)	Jump to init [backpatch] 
* INIT
2202:     LD  0,0(0)	Set the global pointer 
2203:    LDA  1,-11(0)	set first frame at end of globals 
2204:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
2205:    LDC  3,9(6)	load size of array board
2206:     ST  3,0(0)	save size of array board
* END INIT GLOBALS AND STATICS
2207:    LDA  3,1(7)	Return address in ac 
2208:    LDA  7,-56(7)	Jump to main 
2209:   HALT  0,0,0	DONE! 
* END INIT
