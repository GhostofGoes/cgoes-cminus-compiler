* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  fractal.c-
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
* FUNCTION Mandelbrot
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* WHILE
 43:     LD  3,0(0)	Load variable TOP
 44:     ST  3,-3(1)	Save left side 
 45:     LD  3,-7(0)	Load variable YMax
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
 48:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 50:    LDC  3,512(6)	Load integer constant 
 51:    LDC  4,0(6)	Load 0 
 52:    SUB  3,4,3	Op unary - 
 53:     ST  3,-1(0)	Store variable LEFT
* WHILE
 54:     LD  3,-1(0)	Load variable LEFT
 55:     ST  3,-3(1)	Save left side 
 56:     LD  3,-6(0)	Load variable XMax
 57:     LD  4,-3(1)	Load left into ac1 
 58:    TLT  3,4,3	Op < 
 59:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 61:     LD  3,-1(0)	Load variable LEFT
 62:     ST  3,-5(1)	Store variable A
* EXPRESSION
 63:     LD  3,0(0)	Load variable TOP
 64:     ST  3,-4(1)	Store variable Bi
* EXPRESSION
 65:     LD  3,-5(1)	Load variable A
 66:     ST  3,-8(1)	Save left side 
 67:     LD  3,-5(1)	Load variable A
 68:     LD  4,-8(1)	Load left into ac1 
 69:    MUL  3,4,3	Op * 
 70:     ST  3,-8(1)	Save left side 
 71:    LDC  3,256(6)	Load integer constant 
 72:     LD  4,-8(1)	Load left into ac1 
 73:    DIV  3,4,3	Op / 
 74:     ST  3,-6(1)	Store variable NextA
* EXPRESSION
 75:     LD  3,-4(1)	Load variable Bi
 76:     ST  3,-8(1)	Save left side 
 77:     LD  3,-4(1)	Load variable Bi
 78:     LD  4,-8(1)	Load left into ac1 
 79:    MUL  3,4,3	Op * 
 80:     ST  3,-8(1)	Save left side 
 81:    LDC  3,256(6)	Load integer constant 
 82:     LD  4,-8(1)	Load left into ac1 
 83:    DIV  3,4,3	Op / 
 84:     ST  3,-7(1)	Store variable NextBi
* EXPRESSION
 85:     LD  3,-6(1)	Load variable NextA
 86:     ST  3,-8(1)	Save left side 
 87:     LD  3,-7(1)	Load variable NextBi
 88:     LD  4,-8(1)	Load left into ac1 
 89:    ADD  3,4,3	Op + 
 90:     ST  3,-3(1)	Store variable Len
* EXPRESSION
 91:    LDC  3,0(6)	Load integer constant 
 92:     ST  3,-8(0)	Store variable iter
* WHILE
 93:     LD  3,-3(1)	Load variable Len
 94:     ST  3,-8(1)	Save left side 
 95:    LDC  3,1024(6)	Load integer constant 
 96:     LD  4,-8(1)	Load left into ac1 
 97:    TLE  3,4,3	Op <= 
 98:     ST  3,-8(1)	Save left side 
 99:     LD  3,-8(0)	Load variable iter
100:     ST  3,-9(1)	Save left side 
101:    LDC  3,11(6)	Load integer constant 
102:     LD  4,-9(1)	Load left into ac1 
103:    TLT  3,4,3	Op < 
104:     LD  4,-8(1)	Load left into ac1 
105:    AND  3,4,3	Op AND 
106:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
108:    LDC  3,2(6)	Load integer constant 
109:     ST  3,-8(1)	Save left side 
110:     LD  3,-5(1)	Load variable A
111:     ST  3,-9(1)	Save left side 
112:     LD  3,-4(1)	Load variable Bi
113:     LD  4,-9(1)	Load left into ac1 
114:    MUL  3,4,3	Op * 
115:     LD  4,-8(1)	Load left into ac1 
116:    MUL  3,4,3	Op * 
117:     ST  3,-8(1)	Save left side 
118:    LDC  3,256(6)	Load integer constant 
119:     LD  4,-8(1)	Load left into ac1 
120:    DIV  3,4,3	Op / 
121:     ST  3,-8(1)	Save left side 
122:     LD  3,0(0)	Load variable TOP
123:     LD  4,-8(1)	Load left into ac1 
124:    ADD  3,4,3	Op + 
125:     ST  3,-4(1)	Store variable Bi
* EXPRESSION
126:     LD  3,-6(1)	Load variable NextA
127:     ST  3,-8(1)	Save left side 
128:     LD  3,-7(1)	Load variable NextBi
129:     LD  4,-8(1)	Load left into ac1 
130:    SUB  3,4,3	Op - 
131:     ST  3,-8(1)	Save left side 
132:     LD  3,-1(0)	Load variable LEFT
133:     LD  4,-8(1)	Load left into ac1 
134:    ADD  3,4,3	Op + 
135:     ST  3,-5(1)	Store variable A
* EXPRESSION
136:     LD  3,-5(1)	Load variable A
137:     ST  3,-8(1)	Save left side 
138:     LD  3,-5(1)	Load variable A
139:     LD  4,-8(1)	Load left into ac1 
140:    MUL  3,4,3	Op * 
141:     ST  3,-8(1)	Save left side 
142:    LDC  3,256(6)	Load integer constant 
143:     LD  4,-8(1)	Load left into ac1 
144:    DIV  3,4,3	Op / 
145:     ST  3,-6(1)	Store variable NextA
* EXPRESSION
146:     LD  3,-4(1)	Load variable Bi
147:     ST  3,-8(1)	Save left side 
148:     LD  3,-4(1)	Load variable Bi
149:     LD  4,-8(1)	Load left into ac1 
150:    MUL  3,4,3	Op * 
151:     ST  3,-8(1)	Save left side 
152:    LDC  3,256(6)	Load integer constant 
153:     LD  4,-8(1)	Load left into ac1 
154:    DIV  3,4,3	Op / 
155:     ST  3,-7(1)	Store variable NextBi
* EXPRESSION
156:     LD  3,-6(1)	Load variable NextA
157:     ST  3,-8(1)	Save left side 
158:     LD  3,-7(1)	Load variable NextBi
159:     LD  4,-8(1)	Load left into ac1 
160:    ADD  3,4,3	Op + 
161:     ST  3,-3(1)	Store variable Len
* EXPRESSION
162:     LD  3,-8(0)	load lhs variable iter
163:    LDA  3,1(3)	increment value of iter
164:     ST  3,-8(0)	Store variable iter
* END COMPOUND
165:    LDA  7,-73(7)	go to beginning of loop 
107:    LDA  7,58(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
166:     LD  3,-8(0)	Load variable iter
167:     ST  3,-8(1)	Save left side 
168:    LDC  3,10(6)	Load integer constant 
169:     LD  4,-8(1)	Load left into ac1 
170:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
172:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
173:     LD  3,-8(0)	Load variable iter
174:     ST  3,-10(1)	Store parameter 
*                       Jump to output
175:    LDA  1,-8(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-172(7)	CALL output
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
171:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  outputb
180:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
181:     LD  3,-8(0)	Load variable iter
182:     ST  3,-10(1)	Save left side 
183:    LDC  3,11(6)	Load integer constant 
184:     LD  4,-10(1)	Load left into ac1 
185:    TEQ  3,4,3	Op == 
186:     ST  3,-10(1)	Store parameter 
*                       Jump to outputb
187:    LDA  1,-8(1)	Load address of new frame 
188:    LDA  3,1(7)	Return address in ac 
189:    LDA  7,-172(7)	CALL outputb
190:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
179:    LDA  7,11(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
191:     LD  3,-8(0)	Load variable iter
192:     ST  3,-8(1)	Save left side 
193:    LDC  3,11(6)	Load integer constant 
194:     LD  4,-8(1)	Load left into ac1 
195:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
197:    LDC  3,0(6)	Load integer constant 
198:     ST  3,-8(1)	Save index 
199:     LD  3,-1(0)	Load variable LEFT
200:     LD  4,-8(1)	Restore index 
201:     LD  5,-2(1)	Load address of base of array JuliaVals
202:    SUB  5,5,4	Compute offset of value 
203:     ST  3,0(5)	Store variable JuliaVals
* EXPRESSION
204:    LDC  3,1(6)	Load integer constant 
205:     ST  3,-8(1)	Save index 
206:     LD  3,0(0)	Load variable TOP
207:     LD  4,-8(1)	Restore index 
208:     LD  5,-2(1)	Load address of base of array JuliaVals
209:    SUB  5,5,4	Compute offset of value 
210:     ST  3,0(5)	Store variable JuliaVals
* END COMPOUND
196:    JZR  3,14(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
211:     LD  3,-4(0)	Load variable XStep
212:     LD  4,-1(0)	load lhs variable LEFT
213:    ADD  3,4,3	op += 
214:     ST  3,-1(0)	Store variable LEFT
* END COMPOUND
215:    LDA  7,-162(7)	go to beginning of loop 
 60:    LDA  7,155(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
216:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
217:    LDA  1,-3(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-183(7)	CALL outnl
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
221:     LD  3,-5(0)	Load variable YStep
222:     LD  4,0(0)	load lhs variable TOP
223:    ADD  3,4,3	op += 
224:     ST  3,0(0)	Store variable TOP
* END COMPOUND
225:    LDA  7,-183(7)	go to beginning of loop 
 49:    LDA  7,176(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
226:    LDC  2,0(6)	Set return value to 0 
227:     LD  3,-1(1)	Load return address 
228:     LD  1,0(1)	Adjust fp 
229:    LDA  7,0(3)	Return 
* END FUNCTION Mandelbrot
* FUNCTION Julia
230:     ST  3,-1(1)	Store return address. 
* COMPOUND
* WHILE
231:     LD  3,0(0)	Load variable TOP
232:     ST  3,-4(1)	Save left side 
233:     LD  3,-7(0)	Load variable YMax
234:     LD  4,-4(1)	Load left into ac1 
235:    TLT  3,4,3	Op < 
236:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
238:    LDC  3,512(6)	Load integer constant 
239:    LDC  4,0(6)	Load 0 
240:    SUB  3,4,3	Op unary - 
241:     ST  3,-1(0)	Store variable LEFT
* WHILE
242:     LD  3,-1(0)	Load variable LEFT
243:     ST  3,-4(1)	Save left side 
244:     LD  3,-6(0)	Load variable XMax
245:     LD  4,-4(1)	Load left into ac1 
246:    TLT  3,4,3	Op < 
247:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
249:     LD  3,-1(0)	Load variable LEFT
250:     ST  3,-6(1)	Store variable A
* EXPRESSION
251:     LD  3,0(0)	Load variable TOP
252:     ST  3,-5(1)	Store variable Bi
* EXPRESSION
253:     LD  3,-6(1)	Load variable A
254:     ST  3,-9(1)	Save left side 
255:     LD  3,-6(1)	Load variable A
256:     LD  4,-9(1)	Load left into ac1 
257:    MUL  3,4,3	Op * 
258:     ST  3,-9(1)	Save left side 
259:    LDC  3,256(6)	Load integer constant 
260:     LD  4,-9(1)	Load left into ac1 
261:    DIV  3,4,3	Op / 
262:     ST  3,-7(1)	Store variable NextA
* EXPRESSION
263:     LD  3,-5(1)	Load variable Bi
264:     ST  3,-9(1)	Save left side 
265:     LD  3,-5(1)	Load variable Bi
266:     LD  4,-9(1)	Load left into ac1 
267:    MUL  3,4,3	Op * 
268:     ST  3,-9(1)	Save left side 
269:    LDC  3,256(6)	Load integer constant 
270:     LD  4,-9(1)	Load left into ac1 
271:    DIV  3,4,3	Op / 
272:     ST  3,-8(1)	Store variable NextBi
* EXPRESSION
273:     LD  3,-7(1)	Load variable NextA
274:     ST  3,-9(1)	Save left side 
275:     LD  3,-8(1)	Load variable NextBi
276:     LD  4,-9(1)	Load left into ac1 
277:    ADD  3,4,3	Op + 
278:     ST  3,-4(1)	Store variable Len
* EXPRESSION
279:    LDC  3,0(6)	Load integer constant 
280:     ST  3,-8(0)	Store variable iter
* WHILE
281:     LD  3,-4(1)	Load variable Len
282:     ST  3,-9(1)	Save left side 
283:    LDC  3,1024(6)	Load integer constant 
284:     LD  4,-9(1)	Load left into ac1 
285:    TLE  3,4,3	Op <= 
286:     ST  3,-9(1)	Save left side 
287:     LD  3,-8(0)	Load variable iter
288:     ST  3,-10(1)	Save left side 
289:    LDC  3,11(6)	Load integer constant 
290:     LD  4,-10(1)	Load left into ac1 
291:    TLT  3,4,3	Op < 
292:     LD  4,-9(1)	Load left into ac1 
293:    AND  3,4,3	Op AND 
294:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
296:    LDC  3,2(6)	Load integer constant 
297:     ST  3,-9(1)	Save left side 
298:     LD  3,-6(1)	Load variable A
299:     ST  3,-10(1)	Save left side 
300:     LD  3,-5(1)	Load variable Bi
301:     LD  4,-10(1)	Load left into ac1 
302:    MUL  3,4,3	Op * 
303:     LD  4,-9(1)	Load left into ac1 
304:    MUL  3,4,3	Op * 
305:     ST  3,-9(1)	Save left side 
306:    LDC  3,256(6)	Load integer constant 
307:     LD  4,-9(1)	Load left into ac1 
308:    DIV  3,4,3	Op / 
309:     ST  3,-9(1)	Save left side 
310:     LD  3,-3(1)	Load variable CBi
311:     LD  4,-9(1)	Load left into ac1 
312:    ADD  3,4,3	Op + 
313:     ST  3,-5(1)	Store variable Bi
* EXPRESSION
314:     LD  3,-7(1)	Load variable NextA
315:     ST  3,-9(1)	Save left side 
316:     LD  3,-8(1)	Load variable NextBi
317:     LD  4,-9(1)	Load left into ac1 
318:    SUB  3,4,3	Op - 
319:     ST  3,-9(1)	Save left side 
320:     LD  3,-2(1)	Load variable CA
321:     LD  4,-9(1)	Load left into ac1 
322:    ADD  3,4,3	Op + 
323:     ST  3,-6(1)	Store variable A
* EXPRESSION
324:     LD  3,-6(1)	Load variable A
325:     ST  3,-9(1)	Save left side 
326:     LD  3,-6(1)	Load variable A
327:     LD  4,-9(1)	Load left into ac1 
328:    MUL  3,4,3	Op * 
329:     ST  3,-9(1)	Save left side 
330:    LDC  3,256(6)	Load integer constant 
331:     LD  4,-9(1)	Load left into ac1 
332:    DIV  3,4,3	Op / 
333:     ST  3,-7(1)	Store variable NextA
* EXPRESSION
334:     LD  3,-5(1)	Load variable Bi
335:     ST  3,-9(1)	Save left side 
336:     LD  3,-5(1)	Load variable Bi
337:     LD  4,-9(1)	Load left into ac1 
338:    MUL  3,4,3	Op * 
339:     ST  3,-9(1)	Save left side 
340:    LDC  3,256(6)	Load integer constant 
341:     LD  4,-9(1)	Load left into ac1 
342:    DIV  3,4,3	Op / 
343:     ST  3,-8(1)	Store variable NextBi
* EXPRESSION
344:     LD  3,-7(1)	Load variable NextA
345:     ST  3,-9(1)	Save left side 
346:     LD  3,-8(1)	Load variable NextBi
347:     LD  4,-9(1)	Load left into ac1 
348:    ADD  3,4,3	Op + 
349:     ST  3,-4(1)	Store variable Len
* EXPRESSION
350:     LD  3,-8(0)	load lhs variable iter
351:    LDA  3,1(3)	increment value of iter
352:     ST  3,-8(0)	Store variable iter
* END COMPOUND
353:    LDA  7,-73(7)	go to beginning of loop 
295:    LDA  7,58(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
354:     LD  3,-8(0)	Load variable iter
355:     ST  3,-9(1)	Save left side 
356:    LDC  3,10(6)	Load integer constant 
357:     LD  4,-9(1)	Load left into ac1 
358:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
360:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
361:     LD  3,-8(0)	Load variable iter
362:     ST  3,-11(1)	Store parameter 
*                       Jump to output
363:    LDA  1,-9(1)	Load address of new frame 
364:    LDA  3,1(7)	Return address in ac 
365:    LDA  7,-360(7)	CALL output
366:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
359:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  outputb
368:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
369:     LD  3,-8(0)	Load variable iter
370:     ST  3,-11(1)	Save left side 
371:    LDC  3,11(6)	Load integer constant 
372:     LD  4,-11(1)	Load left into ac1 
373:    TEQ  3,4,3	Op == 
374:     ST  3,-11(1)	Store parameter 
*                       Jump to outputb
375:    LDA  1,-9(1)	Load address of new frame 
376:    LDA  3,1(7)	Return address in ac 
377:    LDA  7,-360(7)	CALL outputb
378:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
367:    LDA  7,11(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
379:     LD  3,-4(0)	Load variable XStep
380:     LD  4,-1(0)	load lhs variable LEFT
381:    ADD  3,4,3	op += 
382:     ST  3,-1(0)	Store variable LEFT
* END COMPOUND
383:    LDA  7,-142(7)	go to beginning of loop 
248:    LDA  7,135(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
384:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
385:    LDA  1,-4(1)	Load address of new frame 
386:    LDA  3,1(7)	Return address in ac 
387:    LDA  7,-351(7)	CALL outnl
388:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
389:     LD  3,-5(0)	Load variable YStep
390:     LD  4,0(0)	load lhs variable TOP
391:    ADD  3,4,3	op += 
392:     ST  3,0(0)	Store variable TOP
* END COMPOUND
393:    LDA  7,-163(7)	go to beginning of loop 
237:    LDA  7,156(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
394:    LDC  2,0(6)	Set return value to 0 
395:     LD  3,-1(1)	Load return address 
396:     LD  1,0(1)	Adjust fp 
397:    LDA  7,0(3)	Return 
* END FUNCTION Julia
* FUNCTION main
398:     ST  3,-1(1)	Store return address. 
* COMPOUND
399:    LDC  3,2(6)	load size of array JuliaVals
400:     ST  3,-2(1)	save size of array JuliaVals
* EXPRESSION
401:    LDC  3,320(6)	Load integer constant 
402:    LDC  4,0(6)	Load 0 
403:    SUB  3,4,3	Op unary - 
404:     ST  3,0(0)	Store variable TOP
* EXPRESSION
405:    LDC  3,512(6)	Load integer constant 
406:    LDC  4,0(6)	Load 0 
407:    SUB  3,4,3	Op unary - 
408:     ST  3,-1(0)	Store variable LEFT
* EXPRESSION
409:    LDC  3,640(6)	Load integer constant 
410:     ST  3,-2(0)	Store variable HEIGHT
* EXPRESSION
411:    LDC  3,716(6)	Load integer constant 
412:     ST  3,-3(0)	Store variable WIDTH
* EXPRESSION
413:     LD  3,-3(0)	Load variable WIDTH
414:     ST  3,-5(1)	Save left side 
415:    LDC  3,40(6)	Load integer constant 
416:     LD  4,-5(1)	Load left into ac1 
417:    DIV  3,4,3	Op / 
418:     ST  3,-4(0)	Store variable XStep
* EXPRESSION
419:     LD  3,-2(0)	Load variable HEIGHT
420:     ST  3,-5(1)	Save left side 
421:    LDC  3,36(6)	Load integer constant 
422:     LD  4,-5(1)	Load left into ac1 
423:    DIV  3,4,3	Op / 
424:     ST  3,-5(0)	Store variable YStep
* EXPRESSION
425:     LD  3,-1(0)	Load variable LEFT
426:     ST  3,-5(1)	Save left side 
427:     LD  3,-3(0)	Load variable WIDTH
428:     LD  4,-5(1)	Load left into ac1 
429:    ADD  3,4,3	Op + 
430:     ST  3,-6(0)	Store variable XMax
* EXPRESSION
431:     LD  3,0(0)	Load variable TOP
432:     ST  3,-5(1)	Save left side 
433:     LD  3,-2(0)	Load variable HEIGHT
434:     LD  4,-5(1)	Load left into ac1 
435:    ADD  3,4,3	Op + 
436:     ST  3,-7(0)	Store variable YMax
* EXPRESSION
*                       Begin call to  Mandelbrot
437:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
438:    LDA  3,-3(1)	Load address of base of array JuliaVals
439:     ST  3,-7(1)	Store parameter 
*                       Jump to Mandelbrot
440:    LDA  1,-5(1)	Load address of new frame 
441:    LDA  3,1(7)	Return address in ac 
442:    LDA  7,-401(7)	CALL Mandelbrot
443:    LDA  3,0(2)	Save the result in ac 
*                       End call to Mandelbrot
* EXPRESSION
*                       Begin call to  outnl
444:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
445:    LDA  1,-5(1)	Load address of new frame 
446:    LDA  3,1(7)	Return address in ac 
447:    LDA  7,-411(7)	CALL outnl
448:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
449:    LDC  3,320(6)	Load integer constant 
450:    LDC  4,0(6)	Load 0 
451:    SUB  3,4,3	Op unary - 
452:     ST  3,0(0)	Store variable TOP
* EXPRESSION
453:    LDC  3,512(6)	Load integer constant 
454:    LDC  4,0(6)	Load 0 
455:    SUB  3,4,3	Op unary - 
456:     ST  3,-1(0)	Store variable LEFT
* EXPRESSION
457:    LDC  3,640(6)	Load integer constant 
458:     ST  3,-2(0)	Store variable HEIGHT
* EXPRESSION
459:    LDC  3,716(6)	Load integer constant 
460:     ST  3,-3(0)	Store variable WIDTH
* EXPRESSION
461:     LD  3,-3(0)	Load variable WIDTH
462:     ST  3,-5(1)	Save left side 
463:    LDC  3,40(6)	Load integer constant 
464:     LD  4,-5(1)	Load left into ac1 
465:    DIV  3,4,3	Op / 
466:     ST  3,-4(0)	Store variable XStep
* EXPRESSION
467:     LD  3,-2(0)	Load variable HEIGHT
468:     ST  3,-5(1)	Save left side 
469:    LDC  3,36(6)	Load integer constant 
470:     LD  4,-5(1)	Load left into ac1 
471:    DIV  3,4,3	Op / 
472:     ST  3,-5(0)	Store variable YStep
* EXPRESSION
473:     LD  3,-1(0)	Load variable LEFT
474:     ST  3,-5(1)	Save left side 
475:     LD  3,-3(0)	Load variable WIDTH
476:     LD  4,-5(1)	Load left into ac1 
477:    ADD  3,4,3	Op + 
478:     ST  3,-6(0)	Store variable XMax
* EXPRESSION
479:     LD  3,0(0)	Load variable TOP
480:     ST  3,-5(1)	Save left side 
481:     LD  3,-2(0)	Load variable HEIGHT
482:     LD  4,-5(1)	Load left into ac1 
483:    ADD  3,4,3	Op + 
484:     ST  3,-7(0)	Store variable YMax
* EXPRESSION
*                       Begin call to  Julia
485:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
486:    LDC  3,0(6)	Load integer constant 
487:    LDA  4,-3(1)	Load address of base of array JuliaVals
488:    SUB  3,4,3	Compute offset of value 
489:     LD  3,0(3)	Load the value 
490:     ST  3,-7(1)	Store parameter 
*                       Load param 2
491:    LDC  3,1(6)	Load integer constant 
492:    LDA  4,-3(1)	Load address of base of array JuliaVals
493:    SUB  3,4,3	Compute offset of value 
494:     LD  3,0(3)	Load the value 
495:     ST  3,-8(1)	Store parameter 
*                       Jump to Julia
496:    LDA  1,-5(1)	Load address of new frame 
497:    LDA  3,1(7)	Return address in ac 
498:    LDA  7,-269(7)	CALL Julia
499:    LDA  3,0(2)	Save the result in ac 
*                       End call to Julia
* END COMPOUND
* Add standard closing in case there is no return statement
500:    LDC  2,0(6)	Set return value to 0 
501:     LD  3,-1(1)	Load return address 
502:     LD  1,0(1)	Adjust fp 
503:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,503(7)	Jump to init [backpatch] 
* INIT
504:     LD  0,0(0)	Set the global pointer 
505:    LDA  1,-9(0)	set first frame at end of globals 
506:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
507:    LDA  3,1(7)	Return address in ac 
508:    LDA  7,-111(7)	Jump to main 
509:   HALT  0,0,0	DONE! 
* END INIT
