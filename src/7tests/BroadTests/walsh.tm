* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  walsh.c-
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
* FUNCTION pow
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,1(6)	Load integer constant 
 44:     ST  3,-5(1)	Store variable ans
* EXPRESSION
 45:     LD  3,-2(1)	Load variable n
 46:     ST  3,-4(1)	Store variable sqr
* WHILE
 47:    LDC  3,1(6)	Load Boolean constant 
 48:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
 50:     LD  3,-3(1)	Load variable p
 51:     ST  3,-6(1)	Save left side 
 52:    LDC  3,2(6)	Load integer constant 
 53:     LD  4,-6(1)	Load left into ac1 
 54:    DIV  5,4,3	Op % 
 55:    MUL  5,5,3	 
 56:    SUB  3,4,5	 
 57:     ST  3,-6(1)	Save left side 
 58:    LDC  3,1(6)	Load integer constant 
 59:     LD  4,-6(1)	Load left into ac1 
 60:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
 62:     LD  3,-5(1)	Load variable ans
 63:     ST  3,-6(1)	Save left side 
 64:     LD  3,-4(1)	Load variable sqr
 65:     LD  4,-6(1)	Load left into ac1 
 66:    MUL  3,4,3	Op * 
 67:     ST  3,-5(1)	Store variable ans
 61:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 68:     LD  3,-3(1)	Load variable p
 69:     ST  3,-6(1)	Save left side 
 70:    LDC  3,2(6)	Load integer constant 
 71:     LD  4,-6(1)	Load left into ac1 
 72:    DIV  3,4,3	Op / 
 73:     ST  3,-3(1)	Store variable p
* IF
 74:     LD  3,-3(1)	Load variable p
 75:     ST  3,-6(1)	Save left side 
 76:    LDC  3,0(6)	Load integer constant 
 77:     LD  4,-6(1)	Load left into ac1 
 78:    TEQ  3,4,3	Op == 
* THEN
* RETURN
 80:     LD  3,-5(1)	Load variable ans
 81:    LDA  2,0(3)	Copy result to rt register 
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    LDA  7,0(3)	Return 
 79:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 85:     LD  3,-4(1)	Load variable sqr
 86:     ST  3,-6(1)	Save left side 
 87:     LD  3,-4(1)	Load variable sqr
 88:     LD  4,-6(1)	Load left into ac1 
 89:    MUL  3,4,3	Op * 
 90:     ST  3,-4(1)	Store variable sqr
* END COMPOUND
 91:    LDA  7,-45(7)	go to beginning of loop 
 49:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
 92:    LDC  2,0(6)	Set return value to 0 
 93:     LD  3,-1(1)	Load return address 
 94:     LD  1,0(1)	Adjust fp 
 95:    LDA  7,0(3)	Return 
* END FUNCTION pow
* FUNCTION getFunc
 96:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
*                       Begin call to  input
 97:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to input
 98:    LDA  1,-6(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-100(7)	CALL input
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
102:     ST  3,-3(1)	Store variable numbits
103:     ST  3,-6(1)	Save left side 
104:    LDC  3,0(6)	Load integer constant 
105:     LD  4,-6(1)	Load left into ac1 
106:    TEQ  3,4,3	Op == 
* THEN
* RETURN
108:    LDC  3,0(6)	Load integer constant 
109:    LDA  2,0(3)	Copy result to rt register 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
107:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  pow
113:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
114:    LDC  3,2(6)	Load integer constant 
115:     ST  3,-8(1)	Store parameter 
*                       Load param 2
116:     LD  3,-3(1)	Load variable numbits
117:     ST  3,-9(1)	Store parameter 
*                       Jump to pow
118:    LDA  1,-6(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-79(7)	CALL pow
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to pow
122:     ST  3,-5(1)	Store variable size
* EXPRESSION
123:    LDC  3,0(6)	Load integer constant 
124:     ST  3,-4(1)	Store variable i
* WHILE
125:     LD  3,-4(1)	Load variable i
126:     ST  3,-6(1)	Save left side 
127:     LD  3,-5(1)	Load variable size
128:     LD  4,-6(1)	Load left into ac1 
129:    TLT  3,4,3	Op < 
130:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
132:     LD  3,-4(1)	Load variable i
133:     ST  3,-6(1)	Save index 
*                       Begin call to  input
134:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to input
135:    LDA  1,-7(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-137(7)	CALL input
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
139:     LD  4,-6(1)	Restore index 
140:     LD  5,-2(1)	Load address of base of array f
141:    SUB  5,5,4	Compute offset of value 
142:     ST  3,0(5)	Store variable f
* EXPRESSION
143:     LD  3,-4(1)	Load variable i
144:     ST  3,-6(1)	Save left side 
145:    LDC  3,1(6)	Load integer constant 
146:     LD  4,-6(1)	Load left into ac1 
147:    ADD  3,4,3	Op + 
148:     ST  3,-4(1)	Store variable i
* END COMPOUND
149:    LDA  7,-25(7)	go to beginning of loop 
131:    LDA  7,18(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
150:     LD  3,-3(1)	Load variable numbits
151:    LDA  2,0(3)	Copy result to rt register 
152:     LD  3,-1(1)	Load return address 
153:     LD  1,0(1)	Adjust fp 
154:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
155:    LDC  2,0(6)	Set return value to 0 
156:     LD  3,-1(1)	Load return address 
157:     LD  1,0(1)	Adjust fp 
158:    LDA  7,0(3)	Return 
* END FUNCTION getFunc
* FUNCTION printFunc
159:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
160:    LDC  3,0(6)	Load integer constant 
161:     ST  3,-4(1)	Store variable i
* WHILE
162:     LD  3,-4(1)	Load variable i
163:     ST  3,-5(1)	Save left side 
164:     LD  3,-3(1)	Load variable size
165:     LD  4,-5(1)	Load left into ac1 
166:    TLT  3,4,3	Op < 
167:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
169:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
170:     LD  3,-4(1)	Load variable i
171:     LD  4,-2(1)	Load address of base of array f
172:    SUB  3,4,3	Compute offset of value 
173:     LD  3,0(3)	Load the value 
174:     ST  3,-7(1)	Store parameter 
*                       Jump to output
175:    LDA  1,-5(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-172(7)	CALL output
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
179:     LD  3,-4(1)	Load variable i
180:     ST  3,-5(1)	Save left side 
181:    LDC  3,1(6)	Load integer constant 
182:     LD  4,-5(1)	Load left into ac1 
183:    ADD  3,4,3	Op + 
184:     ST  3,-4(1)	Store variable i
* END COMPOUND
185:    LDA  7,-24(7)	go to beginning of loop 
168:    LDA  7,17(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
186:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
187:    LDA  1,-5(1)	Load address of new frame 
188:    LDA  3,1(7)	Return address in ac 
189:    LDA  7,-153(7)	CALL outnl
190:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
191:    LDC  2,0(6)	Set return value to 0 
192:     LD  3,-1(1)	Load return address 
193:     LD  1,0(1)	Adjust fp 
194:    LDA  7,0(3)	Return 
* END FUNCTION printFunc
* FUNCTION fwt
195:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
196:     LD  3,-4(1)	Load variable size
197:     ST  3,-8(1)	Save left side 
198:    LDC  3,2(6)	Load integer constant 
199:     LD  4,-8(1)	Load left into ac1 
200:    DIV  3,4,3	Op / 
201:     ST  3,-4(1)	Store variable size
* IF
202:     LD  3,-4(1)	Load variable size
203:     ST  3,-8(1)	Save left side 
204:    LDC  3,1(6)	Load integer constant 
205:     LD  4,-8(1)	Load left into ac1 
206:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  fwt
208:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
209:     LD  3,-2(1)	Load address of base of array w
210:     ST  3,-10(1)	Store parameter 
*                       Load param 2
211:     LD  3,-3(1)	Load variable start
212:     ST  3,-11(1)	Store parameter 
*                       Load param 3
213:     LD  3,-4(1)	Load variable size
214:     ST  3,-12(1)	Store parameter 
*                       Jump to fwt
215:    LDA  1,-8(1)	Load address of new frame 
216:    LDA  3,1(7)	Return address in ac 
217:    LDA  7,-23(7)	CALL fwt
218:    LDA  3,0(2)	Save the result in ac 
*                       End call to fwt
* EXPRESSION
*                       Begin call to  fwt
219:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
220:     LD  3,-2(1)	Load address of base of array w
221:     ST  3,-10(1)	Store parameter 
*                       Load param 2
222:     LD  3,-3(1)	Load variable start
223:     ST  3,-11(1)	Save left side 
224:     LD  3,-4(1)	Load variable size
225:     LD  4,-11(1)	Load left into ac1 
226:    ADD  3,4,3	Op + 
227:     ST  3,-11(1)	Store parameter 
*                       Load param 3
228:     LD  3,-4(1)	Load variable size
229:     ST  3,-12(1)	Store parameter 
*                       Jump to fwt
230:    LDA  1,-8(1)	Load address of new frame 
231:    LDA  3,1(7)	Return address in ac 
232:    LDA  7,-38(7)	CALL fwt
233:    LDA  3,0(2)	Save the result in ac 
*                       End call to fwt
* END COMPOUND
207:    JZR  3,26(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
234:     LD  3,-3(1)	Load variable start
235:     ST  3,-5(1)	Store variable a
* EXPRESSION
236:     LD  3,-3(1)	Load variable start
237:     ST  3,-8(1)	Save left side 
238:     LD  3,-4(1)	Load variable size
239:     LD  4,-8(1)	Load left into ac1 
240:    ADD  3,4,3	Op + 
241:     ST  3,-6(1)	Store variable b
* WHILE
242:     LD  3,-5(1)	Load variable a
243:     ST  3,-8(1)	Save left side 
244:     LD  3,-3(1)	Load variable start
245:     ST  3,-9(1)	Save left side 
246:     LD  3,-4(1)	Load variable size
247:     LD  4,-9(1)	Load left into ac1 
248:    ADD  3,4,3	Op + 
249:     LD  4,-8(1)	Load left into ac1 
250:    TLT  3,4,3	Op < 
251:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
253:     LD  3,-5(1)	Load variable a
254:     LD  4,-2(1)	Load address of base of array w
255:    SUB  3,4,3	Compute offset of value 
256:     LD  3,0(3)	Load the value 
257:     ST  3,-7(1)	Store variable tmp
* EXPRESSION
258:     LD  3,-5(1)	Load variable a
259:     ST  3,-8(1)	Save index 
260:     LD  3,-5(1)	Load variable a
261:     LD  4,-2(1)	Load address of base of array w
262:    SUB  3,4,3	Compute offset of value 
263:     LD  3,0(3)	Load the value 
264:     ST  3,-9(1)	Save left side 
265:     LD  3,-6(1)	Load variable b
266:     LD  4,-2(1)	Load address of base of array w
267:    SUB  3,4,3	Compute offset of value 
268:     LD  3,0(3)	Load the value 
269:     LD  4,-9(1)	Load left into ac1 
270:    ADD  3,4,3	Op + 
271:     LD  4,-8(1)	Restore index 
272:     LD  5,-2(1)	Load address of base of array w
273:    SUB  5,5,4	Compute offset of value 
274:     ST  3,0(5)	Store variable w
* EXPRESSION
275:     LD  3,-6(1)	Load variable b
276:     ST  3,-8(1)	Save index 
277:     LD  3,-7(1)	Load variable tmp
278:     ST  3,-9(1)	Save left side 
279:     LD  3,-6(1)	Load variable b
280:     LD  4,-2(1)	Load address of base of array w
281:    SUB  3,4,3	Compute offset of value 
282:     LD  3,0(3)	Load the value 
283:     LD  4,-9(1)	Load left into ac1 
284:    SUB  3,4,3	Op - 
285:     LD  4,-8(1)	Restore index 
286:     LD  5,-2(1)	Load address of base of array w
287:    SUB  5,5,4	Compute offset of value 
288:     ST  3,0(5)	Store variable w
* EXPRESSION
289:     LD  3,-5(1)	Load variable a
290:     ST  3,-8(1)	Save left side 
291:    LDC  3,1(6)	Load integer constant 
292:     LD  4,-8(1)	Load left into ac1 
293:    ADD  3,4,3	Op + 
294:     ST  3,-5(1)	Store variable a
* EXPRESSION
295:     LD  3,-6(1)	Load variable b
296:     ST  3,-8(1)	Save left side 
297:    LDC  3,1(6)	Load integer constant 
298:     LD  4,-8(1)	Load left into ac1 
299:    ADD  3,4,3	Op + 
300:     ST  3,-6(1)	Store variable b
* END COMPOUND
301:    LDA  7,-60(7)	go to beginning of loop 
252:    LDA  7,49(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
302:    LDC  2,0(6)	Set return value to 0 
303:     LD  3,-1(1)	Load return address 
304:     LD  1,0(1)	Adjust fp 
305:    LDA  7,0(3)	Return 
* END FUNCTION fwt
* FUNCTION div
306:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
307:    LDC  3,0(6)	Load integer constant 
308:     ST  3,-4(1)	Store variable i
* WHILE
309:     LD  3,-4(1)	Load variable i
310:     ST  3,-5(1)	Save left side 
311:     LD  3,-3(1)	Load variable size
312:     LD  4,-5(1)	Load left into ac1 
313:    TLT  3,4,3	Op < 
314:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
316:     LD  3,-4(1)	Load variable i
317:     ST  3,-5(1)	Save index 
318:     LD  3,-4(1)	Load variable i
319:     LD  4,-2(1)	Load address of base of array f
320:    SUB  3,4,3	Compute offset of value 
321:     LD  3,0(3)	Load the value 
322:     ST  3,-6(1)	Save left side 
323:     LD  3,-3(1)	Load variable size
324:     LD  4,-6(1)	Load left into ac1 
325:    DIV  3,4,3	Op / 
326:     LD  4,-5(1)	Restore index 
327:     LD  5,-2(1)	Load address of base of array f
328:    SUB  5,5,4	Compute offset of value 
329:     ST  3,0(5)	Store variable f
* EXPRESSION
330:     LD  3,-4(1)	load lhs variable i
331:    LDA  3,1(3)	increment value of i
332:     ST  3,-4(1)	Store variable i
* END COMPOUND
333:    LDA  7,-25(7)	go to beginning of loop 
315:    LDA  7,18(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
334:    LDC  2,0(6)	Set return value to 0 
335:     LD  3,-1(1)	Load return address 
336:     LD  1,0(1)	Adjust fp 
337:    LDA  7,0(3)	Return 
* END FUNCTION div
* FUNCTION main
338:     ST  3,-1(1)	Store return address. 
* COMPOUND
339:    LDC  3,256(6)	load size of array f
340:     ST  3,-2(1)	save size of array f
* WHILE
341:    LDC  3,1(6)	Load Boolean constant 
342:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
*                       Begin call to  getFunc
344:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
345:    LDA  3,-3(1)	Load address of base of array f
346:     ST  3,-265(1)	Store parameter 
*                       Jump to getFunc
347:    LDA  1,-263(1)	Load address of new frame 
348:    LDA  3,1(7)	Return address in ac 
349:    LDA  7,-254(7)	CALL getFunc
350:    LDA  3,0(2)	Save the result in ac 
*                       End call to getFunc
351:     ST  3,-261(1)	Store variable numbits
352:     ST  3,-263(1)	Save left side 
353:    LDC  3,0(6)	Load integer constant 
354:     LD  4,-263(1)	Load left into ac1 
355:    TEQ  3,4,3	Op == 
* THEN
* RETURN
357:    LDC  3,0(6)	Load integer constant 
358:    LDA  2,0(3)	Copy result to rt register 
359:     LD  3,-1(1)	Load return address 
360:     LD  1,0(1)	Adjust fp 
361:    LDA  7,0(3)	Return 
356:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  pow
362:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
363:    LDC  3,2(6)	Load integer constant 
364:     ST  3,-265(1)	Store parameter 
*                       Load param 2
365:     LD  3,-261(1)	Load variable numbits
366:     ST  3,-266(1)	Store parameter 
*                       Jump to pow
367:    LDA  1,-263(1)	Load address of new frame 
368:    LDA  3,1(7)	Return address in ac 
369:    LDA  7,-328(7)	CALL pow
370:    LDA  3,0(2)	Save the result in ac 
*                       End call to pow
371:     ST  3,-260(1)	Store variable size
* EXPRESSION
372:     LD  3,-260(1)	Load variable size
373:     ST  3,-263(1)	Save left side 
374:    LDC  3,2(6)	Load integer constant 
375:     LD  4,-263(1)	Load left into ac1 
376:    DIV  3,4,3	Op / 
377:     ST  3,-262(1)	Store variable half
* EXPRESSION
*                       Begin call to  fwt
378:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
379:    LDA  3,-3(1)	Load address of base of array f
380:     ST  3,-265(1)	Store parameter 
*                       Load param 2
381:    LDC  3,0(6)	Load integer constant 
382:     ST  3,-266(1)	Store parameter 
*                       Load param 3
383:     LD  3,-260(1)	Load variable size
384:     ST  3,-267(1)	Store parameter 
*                       Jump to fwt
385:    LDA  1,-263(1)	Load address of new frame 
386:    LDA  3,1(7)	Return address in ac 
387:    LDA  7,-193(7)	CALL fwt
388:    LDA  3,0(2)	Save the result in ac 
*                       End call to fwt
* EXPRESSION
*                       Begin call to  printFunc
389:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
390:    LDA  3,-3(1)	Load address of base of array f
391:     ST  3,-265(1)	Store parameter 
*                       Load param 2
392:     LD  3,-260(1)	Load variable size
393:     ST  3,-266(1)	Store parameter 
*                       Jump to printFunc
394:    LDA  1,-263(1)	Load address of new frame 
395:    LDA  3,1(7)	Return address in ac 
396:    LDA  7,-238(7)	CALL printFunc
397:    LDA  3,0(2)	Save the result in ac 
*                       End call to printFunc
* EXPRESSION
*                       Begin call to  fwt
398:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
399:    LDA  3,-3(1)	Load address of base of array f
400:     ST  3,-265(1)	Store parameter 
*                       Load param 2
401:    LDC  3,0(6)	Load integer constant 
402:     ST  3,-266(1)	Store parameter 
*                       Load param 3
403:     LD  3,-260(1)	Load variable size
404:     ST  3,-267(1)	Store parameter 
*                       Jump to fwt
405:    LDA  1,-263(1)	Load address of new frame 
406:    LDA  3,1(7)	Return address in ac 
407:    LDA  7,-213(7)	CALL fwt
408:    LDA  3,0(2)	Save the result in ac 
*                       End call to fwt
* EXPRESSION
*                       Begin call to  div
409:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
410:    LDA  3,-3(1)	Load address of base of array f
411:     ST  3,-265(1)	Store parameter 
*                       Load param 2
412:     LD  3,-260(1)	Load variable size
413:     ST  3,-266(1)	Store parameter 
*                       Jump to div
414:    LDA  1,-263(1)	Load address of new frame 
415:    LDA  3,1(7)	Return address in ac 
416:    LDA  7,-111(7)	CALL div
417:    LDA  3,0(2)	Save the result in ac 
*                       End call to div
* EXPRESSION
*                       Begin call to  printFunc
418:     ST  1,-263(1)	Store old fp in ghost frame 
*                       Load param 1
419:    LDA  3,-3(1)	Load address of base of array f
420:     ST  3,-265(1)	Store parameter 
*                       Load param 2
421:     LD  3,-260(1)	Load variable size
422:     ST  3,-266(1)	Store parameter 
*                       Jump to printFunc
423:    LDA  1,-263(1)	Load address of new frame 
424:    LDA  3,1(7)	Return address in ac 
425:    LDA  7,-267(7)	CALL printFunc
426:    LDA  3,0(2)	Save the result in ac 
*                       End call to printFunc
* END COMPOUND
427:    LDA  7,-87(7)	go to beginning of loop 
343:    LDA  7,84(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
428:    LDC  3,0(6)	Load integer constant 
429:    LDA  2,0(3)	Copy result to rt register 
430:     LD  3,-1(1)	Load return address 
431:     LD  1,0(1)	Adjust fp 
432:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
433:    LDC  2,0(6)	Set return value to 0 
434:     LD  3,-1(1)	Load return address 
435:     LD  1,0(1)	Adjust fp 
436:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,436(7)	Jump to init [backpatch] 
* INIT
437:     LD  0,0(0)	Set the global pointer 
438:    LDA  1,0(0)	set first frame at end of globals 
439:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
440:    LDA  3,1(7)	Return address in ac 
441:    LDA  7,-104(7)	Jump to main 
442:   HALT  0,0,0	DONE! 
* END INIT
