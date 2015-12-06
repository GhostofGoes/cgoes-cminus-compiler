* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  battleship.c-
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
* FUNCTION Print
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable what
 45:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-3(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 50:    LDC  2,0(6)	Set return value to 0 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
* END FUNCTION Print
* FUNCTION NewLine
 54:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
 55:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 56:    LDA  1,-2(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 60:    LDC  2,0(6)	Set return value to 0 
 61:     LD  3,-1(1)	Load return address 
 62:     LD  1,0(1)	Adjust fp 
 63:    LDA  7,0(3)	Return 
* END FUNCTION NewLine
* FUNCTION Display
 64:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 65:    LDC  3,0(6)	Load integer constant 
 66:     ST  3,-4(1)	Store variable r
* EXPRESSION
*                       Begin call to  NewLine
 67:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
 68:    LDA  1,-6(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-17(7)	CALL NewLine
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
*                       Begin call to  Print
 72:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 73:     LD  3,-1(0)	Load variable NumShots
 74:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
 75:    LDA  1,-6(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-36(7)	CALL Print
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
* EXPRESSION
*                       Begin call to  NewLine
 79:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
 80:    LDA  1,-6(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-29(7)	CALL NewLine
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* WHILE
 84:     LD  3,-4(1)	Load variable r
 85:     ST  3,-6(1)	Save left side 
 86:     LD  3,-3(1)	Load variable dimension
 87:     LD  4,-6(1)	Load left into ac1 
 88:    TLT  3,4,3	Op < 
 89:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 91:    LDC  3,0(6)	Load integer constant 
 92:     ST  3,-5(1)	Store variable c
* WHILE
 93:     LD  3,-5(1)	Load variable c
 94:     ST  3,-6(1)	Save left side 
 95:     LD  3,-3(1)	Load variable dimension
 96:     LD  4,-6(1)	Load left into ac1 
 97:    TLT  3,4,3	Op < 
 98:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
100:     LD  3,-4(1)	Load variable r
101:     ST  3,-6(1)	Save left side 
102:    LDC  3,10(6)	Load integer constant 
103:     LD  4,-6(1)	Load left into ac1 
104:    MUL  3,4,3	Op * 
105:     ST  3,-6(1)	Save left side 
106:     LD  3,-5(1)	Load variable c
107:     LD  4,-6(1)	Load left into ac1 
108:    ADD  3,4,3	Op + 
109:     LD  4,-2(1)	Load address of base of array arr
110:    SUB  3,4,3	Compute offset of value 
111:     LD  3,0(3)	Load the value 
112:     ST  3,-6(1)	Save left side 
113:    LDC  3,7(6)	Load integer constant 
114:     LD  4,-6(1)	Load left into ac1 
115:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  Print
117:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
118:    LDC  3,4(6)	Load integer constant 
119:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
120:    LDA  1,-6(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-81(7)	CALL Print
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
116:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  Print
125:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
126:     LD  3,-4(1)	Load variable r
127:     ST  3,-8(1)	Save left side 
128:    LDC  3,10(6)	Load integer constant 
129:     LD  4,-8(1)	Load left into ac1 
130:    MUL  3,4,3	Op * 
131:     ST  3,-8(1)	Save left side 
132:     LD  3,-5(1)	Load variable c
133:     LD  4,-8(1)	Load left into ac1 
134:    ADD  3,4,3	Op + 
135:     LD  4,-2(1)	Load address of base of array arr
136:    SUB  3,4,3	Compute offset of value 
137:     LD  3,0(3)	Load the value 
138:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
139:    LDA  1,-6(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-100(7)	CALL Print
142:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
124:    LDA  7,18(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
143:     LD  3,-5(1)	Load variable c
144:     ST  3,-6(1)	Save left side 
145:    LDC  3,1(6)	Load integer constant 
146:     LD  4,-6(1)	Load left into ac1 
147:    ADD  3,4,3	Op + 
148:     ST  3,-5(1)	Store variable c
* END COMPOUND
149:    LDA  7,-57(7)	go to beginning of loop 
 99:    LDA  7,50(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
150:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
151:    LDA  1,-6(1)	Load address of new frame 
152:    LDA  3,1(7)	Return address in ac 
153:    LDA  7,-100(7)	CALL NewLine
154:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
155:     LD  3,-4(1)	load lhs variable r
156:    LDA  3,1(3)	increment value of r
157:     ST  3,-4(1)	Store variable r
* END COMPOUND
158:    LDA  7,-75(7)	go to beginning of loop 
 90:    LDA  7,68(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
159:    LDC  2,0(6)	Set return value to 0 
160:     LD  3,-1(1)	Load return address 
161:     LD  1,0(1)	Adjust fp 
162:    LDA  7,0(3)	Return 
* END FUNCTION Display
* FUNCTION Randomize
163:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
164:     LD  3,-2(1)	Load variable seed
165:     ST  3,-4(1)	Save left side 
166:    LDC  3,2(6)	Load integer constant 
167:     LD  4,-4(1)	Load left into ac1 
168:    DIV  5,4,3	Op % 
169:    MUL  5,5,3	 
170:    SUB  3,4,5	 
171:     ST  3,-4(1)	Save left side 
172:    LDC  3,0(6)	Load integer constant 
173:     LD  4,-4(1)	Load left into ac1 
174:    TEQ  3,4,3	Op == 
175:     ST  3,-3(0)	Store variable iseven
* EXPRESSION
176:     LD  3,-3(1)	Load variable dim
177:     LD  4,-2(1)	load lhs variable seed
178:    ADD  3,4,3	op += 
179:     ST  3,-2(1)	Store variable seed
* EXPRESSION
180:    LDC  3,17(6)	Load integer constant 
181:     ST  3,-4(1)	Save left side 
182:     LD  3,-2(1)	Load variable seed
183:     LD  4,-4(1)	Load left into ac1 
184:    MUL  3,4,3	Op * 
185:     ST  3,-4(1)	Save left side 
186:    LDC  3,11(6)	Load integer constant 
187:     LD  4,-4(1)	Load left into ac1 
188:    ADD  3,4,3	Op + 
189:     ST  3,-2(1)	Store variable seed
* EXPRESSION
190:     LD  3,-2(1)	Load variable seed
191:     ST  3,-4(1)	Save left side 
192:     LD  3,-3(1)	Load variable dim
193:     ST  3,-5(1)	Save left side 
194:     LD  3,-3(1)	Load variable dim
195:     LD  4,-5(1)	Load left into ac1 
196:    MUL  3,4,3	Op * 
197:     LD  4,-4(1)	Load left into ac1 
198:    DIV  5,4,3	Op % 
199:    MUL  5,5,3	 
200:    SUB  3,4,5	 
201:     ST  3,-2(1)	Store variable seed
* RETURN
202:     LD  3,-2(1)	Load variable seed
203:    LDA  2,0(3)	Copy result to rt register 
204:     LD  3,-1(1)	Load return address 
205:     LD  1,0(1)	Adjust fp 
206:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
207:    LDC  2,0(6)	Set return value to 0 
208:     LD  3,-1(1)	Load return address 
209:     LD  1,0(1)	Adjust fp 
210:    LDA  7,0(3)	Return 
* END FUNCTION Randomize
* FUNCTION HideShip
211:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  Randomize
212:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  input
213:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Jump to input
214:    LDA  1,-10(1)	Load address of new frame 
215:    LDA  3,1(7)	Return address in ac 
216:    LDA  7,-216(7)	CALL input
217:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
218:     ST  3,-10(1)	Store parameter 
*                       Load param 2
219:     LD  3,-3(1)	Load variable dimen
220:     ST  3,-11(1)	Store parameter 
*                       Jump to Randomize
221:    LDA  1,-8(1)	Load address of new frame 
222:    LDA  3,1(7)	Return address in ac 
223:    LDA  7,-61(7)	CALL Randomize
224:    LDA  3,0(2)	Save the result in ac 
*                       End call to Randomize
225:     ST  3,-4(1)	Store variable pos
* EXPRESSION
226:     LD  3,-4(1)	Load variable pos
227:     ST  3,-8(1)	Save left side 
228:     LD  3,-3(1)	Load variable dimen
229:     LD  4,-8(1)	Load left into ac1 
230:    DIV  3,4,3	Op / 
231:     ST  3,-5(1)	Store variable row
* EXPRESSION
232:     LD  3,-4(1)	Load variable pos
233:     ST  3,-8(1)	Save left side 
234:     LD  3,-4(1)	Load variable pos
235:     ST  3,-9(1)	Save left side 
236:     LD  3,-3(1)	Load variable dimen
237:     LD  4,-9(1)	Load left into ac1 
238:    DIV  3,4,3	Op / 
239:     ST  3,-9(1)	Save left side 
240:     LD  3,-3(1)	Load variable dimen
241:     LD  4,-9(1)	Load left into ac1 
242:    MUL  3,4,3	Op * 
243:     LD  4,-8(1)	Load left into ac1 
244:    SUB  3,4,3	Op - 
245:     ST  3,-6(1)	Store variable col
* IF
246:     LD  3,-3(0)	Load variable iseven
* THEN
* COMPOUND
* IF
248:     LD  3,-6(1)	Load variable col
249:     ST  3,-8(1)	Save left side 
250:     LD  3,-3(1)	Load variable dimen
251:     ST  3,-9(1)	Save left side 
252:     LD  3,0(0)	Load variable shipsize
253:     LD  4,-9(1)	Load left into ac1 
254:    SUB  3,4,3	Op - 
255:     LD  4,-8(1)	Load left into ac1 
256:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
258:     LD  3,-3(1)	Load variable dimen
259:     ST  3,-8(1)	Save left side 
260:     LD  3,0(0)	Load variable shipsize
261:     LD  4,-8(1)	Load left into ac1 
262:    SUB  3,4,3	Op - 
263:     ST  3,-6(1)	Store variable col
257:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
264:    LDC  3,0(6)	Load integer constant 
265:     ST  3,-7(1)	Store variable i
* WHILE
266:     LD  3,-7(1)	Load variable i
267:     ST  3,-8(1)	Save left side 
268:     LD  3,0(0)	Load variable shipsize
269:     LD  4,-8(1)	Load left into ac1 
270:    TLT  3,4,3	Op < 
271:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
273:     LD  3,-5(1)	Load variable row
274:     ST  3,-8(1)	Save left side 
275:     LD  3,-3(1)	Load variable dimen
276:     LD  4,-8(1)	Load left into ac1 
277:    MUL  3,4,3	Op * 
278:     ST  3,-8(1)	Save left side 
279:     LD  3,-6(1)	Load variable col
280:     LD  4,-8(1)	Load left into ac1 
281:    ADD  3,4,3	Op + 
282:     ST  3,-8(1)	Save index 
283:    LDC  3,7(6)	Load integer constant 
284:     LD  4,-8(1)	Restore index 
285:     LD  5,-2(1)	Load address of base of array arr
286:    SUB  5,5,4	Compute offset of value 
287:     ST  3,0(5)	Store variable arr
* EXPRESSION
288:     LD  3,-6(1)	load lhs variable col
289:    LDA  3,1(3)	increment value of col
290:     ST  3,-6(1)	Store variable col
* EXPRESSION
291:     LD  3,-7(1)	load lhs variable i
292:    LDA  3,1(3)	increment value of i
293:     ST  3,-7(1)	Store variable i
* END COMPOUND
294:    LDA  7,-29(7)	go to beginning of loop 
272:    LDA  7,22(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
247:    JZR  3,48(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
296:     LD  3,-5(1)	Load variable row
297:     ST  3,-8(1)	Save left side 
298:     LD  3,-3(1)	Load variable dimen
299:     ST  3,-9(1)	Save left side 
300:     LD  3,0(0)	Load variable shipsize
301:     LD  4,-9(1)	Load left into ac1 
302:    SUB  3,4,3	Op - 
303:     LD  4,-8(1)	Load left into ac1 
304:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
306:     LD  3,-3(1)	Load variable dimen
307:     ST  3,-8(1)	Save left side 
308:     LD  3,0(0)	Load variable shipsize
309:     LD  4,-8(1)	Load left into ac1 
310:    SUB  3,4,3	Op - 
311:     ST  3,-5(1)	Store variable row
305:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
312:    LDC  3,0(6)	Load integer constant 
313:     ST  3,-7(1)	Store variable i
* WHILE
314:     LD  3,-7(1)	Load variable i
315:     ST  3,-8(1)	Save left side 
316:     LD  3,0(0)	Load variable shipsize
317:     LD  4,-8(1)	Load left into ac1 
318:    TLT  3,4,3	Op < 
319:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
321:     LD  3,-5(1)	Load variable row
322:     ST  3,-8(1)	Save left side 
323:     LD  3,-3(1)	Load variable dimen
324:     LD  4,-8(1)	Load left into ac1 
325:    MUL  3,4,3	Op * 
326:     ST  3,-8(1)	Save left side 
327:     LD  3,-6(1)	Load variable col
328:     LD  4,-8(1)	Load left into ac1 
329:    ADD  3,4,3	Op + 
330:     ST  3,-8(1)	Save index 
331:    LDC  3,7(6)	Load integer constant 
332:     LD  4,-8(1)	Restore index 
333:     LD  5,-2(1)	Load address of base of array arr
334:    SUB  5,5,4	Compute offset of value 
335:     ST  3,0(5)	Store variable arr
* EXPRESSION
336:     LD  3,-3(1)	Load variable dimen
337:     LD  4,-6(1)	load lhs variable col
338:    ADD  3,4,3	op += 
339:     ST  3,-6(1)	Store variable col
* EXPRESSION
340:     LD  3,-7(1)	load lhs variable i
341:    LDA  3,1(3)	increment value of i
342:     ST  3,-7(1)	Store variable i
* END COMPOUND
343:    LDA  7,-30(7)	go to beginning of loop 
320:    LDA  7,23(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
295:    LDA  7,48(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
344:    LDC  2,0(6)	Set return value to 0 
345:     LD  3,-1(1)	Load return address 
346:     LD  1,0(1)	Adjust fp 
347:    LDA  7,0(3)	Return 
* END FUNCTION HideShip
* FUNCTION Aim
348:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
349:    LDC  3,666(6)	Load integer constant 
350:    LDC  4,0(6)	Load 0 
351:    SUB  3,4,3	Op unary - 
352:     ST  3,-2(1)	Store variable shot
* WHILE
353:     LD  3,-2(1)	Load variable shot
354:     ST  3,-3(1)	Save left side 
355:    LDC  3,666(6)	Load integer constant 
356:    LDC  4,0(6)	Load 0 
357:    SUB  3,4,3	Op unary - 
358:     LD  4,-3(1)	Load left into ac1 
359:    TEQ  3,4,3	Op == 
360:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  input
362:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to input
363:    LDA  1,-3(1)	Load address of new frame 
364:    LDA  3,1(7)	Return address in ac 
365:    LDA  7,-365(7)	CALL input
366:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
367:     ST  3,-2(1)	Store variable shot
* IF
368:     LD  3,-2(1)	Load variable shot
369:     ST  3,-3(1)	Save left side 
370:    LDC  3,0(6)	Load integer constant 
371:     LD  4,-3(1)	Load left into ac1 
372:    TLT  3,4,3	Op < 
373:     ST  3,-3(1)	Save left side 
374:     LD  3,-2(1)	Load variable shot
375:     ST  3,-4(1)	Save left side 
376:    LDC  3,99(6)	Load integer constant 
377:     LD  4,-4(1)	Load left into ac1 
378:    TGT  3,4,3	Op > 
379:     LD  4,-3(1)	Load left into ac1 
380:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* EXPRESSION
382:    LDC  3,666(6)	Load integer constant 
383:    LDC  4,0(6)	Load 0 
384:    SUB  3,4,3	Op unary - 
385:     ST  3,-2(1)	Store variable shot
* EXPRESSION
*                       Begin call to  NewLine
386:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to NewLine
387:    LDA  1,-3(1)	Load address of new frame 
388:    LDA  3,1(7)	Return address in ac 
389:    LDA  7,-336(7)	CALL NewLine
390:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
*                       Begin call to  Print
391:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
392:     LD  3,-2(1)	Load variable shot
393:     ST  3,-5(1)	Store parameter 
*                       Jump to Print
394:    LDA  1,-3(1)	Load address of new frame 
395:    LDA  3,1(7)	Return address in ac 
396:    LDA  7,-355(7)	CALL Print
397:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
* EXPRESSION
*                       Begin call to  NewLine
398:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to NewLine
399:    LDA  1,-3(1)	Load address of new frame 
400:    LDA  3,1(7)	Return address in ac 
401:    LDA  7,-348(7)	CALL NewLine
402:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* END COMPOUND
381:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
403:    LDA  7,-51(7)	go to beginning of loop 
361:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
404:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to NewLine
405:    LDA  1,-3(1)	Load address of new frame 
406:    LDA  3,1(7)	Return address in ac 
407:    LDA  7,-354(7)	CALL NewLine
408:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* RETURN
409:     LD  3,-2(1)	Load variable shot
410:    LDA  2,0(3)	Copy result to rt register 
411:     LD  3,-1(1)	Load return address 
412:     LD  1,0(1)	Adjust fp 
413:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
414:    LDC  2,0(6)	Set return value to 0 
415:     LD  3,-1(1)	Load return address 
416:     LD  1,0(1)	Adjust fp 
417:    LDA  7,0(3)	Return 
* END FUNCTION Aim
* FUNCTION RevealShip
418:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
419:    LDC  3,0(6)	Load integer constant 
420:     ST  3,-4(1)	Store variable r
* EXPRESSION
*                       Begin call to  NewLine
421:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
422:    LDA  1,-6(1)	Load address of new frame 
423:    LDA  3,1(7)	Return address in ac 
424:    LDA  7,-371(7)	CALL NewLine
425:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* WHILE
426:     LD  3,-4(1)	Load variable r
427:     ST  3,-6(1)	Save left side 
428:     LD  3,-3(1)	Load variable dimension
429:     LD  4,-6(1)	Load left into ac1 
430:    TLT  3,4,3	Op < 
431:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
433:    LDC  3,0(6)	Load integer constant 
434:     ST  3,-5(1)	Store variable c
* WHILE
435:     LD  3,-5(1)	Load variable c
436:     ST  3,-6(1)	Save left side 
437:     LD  3,-3(1)	Load variable dimension
438:     LD  4,-6(1)	Load left into ac1 
439:    TLT  3,4,3	Op < 
440:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
442:     LD  3,-4(1)	Load variable r
443:     ST  3,-6(1)	Save left side 
444:    LDC  3,10(6)	Load integer constant 
445:     LD  4,-6(1)	Load left into ac1 
446:    MUL  3,4,3	Op * 
447:     ST  3,-6(1)	Save left side 
448:     LD  3,-5(1)	Load variable c
449:     LD  4,-6(1)	Load left into ac1 
450:    ADD  3,4,3	Op + 
451:     LD  4,-2(1)	Load address of base of array arr
452:    SUB  3,4,3	Compute offset of value 
453:     LD  3,0(3)	Load the value 
454:     ST  3,-6(1)	Save left side 
455:    LDC  3,4(6)	Load integer constant 
456:     LD  4,-6(1)	Load left into ac1 
457:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  Print
459:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
460:    LDC  3,2(6)	Load integer constant 
461:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
462:    LDA  1,-6(1)	Load address of new frame 
463:    LDA  3,1(7)	Return address in ac 
464:    LDA  7,-423(7)	CALL Print
465:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
458:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  Print
467:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
468:     LD  3,-4(1)	Load variable r
469:     ST  3,-8(1)	Save left side 
470:    LDC  3,10(6)	Load integer constant 
471:     LD  4,-8(1)	Load left into ac1 
472:    MUL  3,4,3	Op * 
473:     ST  3,-8(1)	Save left side 
474:     LD  3,-5(1)	Load variable c
475:     LD  4,-8(1)	Load left into ac1 
476:    ADD  3,4,3	Op + 
477:     LD  4,-2(1)	Load address of base of array arr
478:    SUB  3,4,3	Compute offset of value 
479:     LD  3,0(3)	Load the value 
480:     ST  3,-8(1)	Store parameter 
*                       Jump to Print
481:    LDA  1,-6(1)	Load address of new frame 
482:    LDA  3,1(7)	Return address in ac 
483:    LDA  7,-442(7)	CALL Print
484:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
466:    LDA  7,18(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
485:     LD  3,-5(1)	Load variable c
486:     ST  3,-6(1)	Save left side 
487:    LDC  3,1(6)	Load integer constant 
488:     LD  4,-6(1)	Load left into ac1 
489:    ADD  3,4,3	Op + 
490:     ST  3,-5(1)	Store variable c
* END COMPOUND
491:    LDA  7,-57(7)	go to beginning of loop 
441:    LDA  7,50(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
492:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to NewLine
493:    LDA  1,-6(1)	Load address of new frame 
494:    LDA  3,1(7)	Return address in ac 
495:    LDA  7,-442(7)	CALL NewLine
496:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
497:     LD  3,-4(1)	load lhs variable r
498:    LDA  3,1(3)	increment value of r
499:     ST  3,-4(1)	Store variable r
* END COMPOUND
500:    LDA  7,-75(7)	go to beginning of loop 
432:    LDA  7,68(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
501:    LDC  2,0(6)	Set return value to 0 
502:     LD  3,-1(1)	Load return address 
503:     LD  1,0(1)	Adjust fp 
504:    LDA  7,0(3)	Return 
* END FUNCTION RevealShip
* FUNCTION Fire
505:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
506:     LD  3,-3(1)	Load variable shot
507:     LD  4,-2(1)	Load address of base of array arr
508:    SUB  3,4,3	Compute offset of value 
509:     LD  3,0(3)	Load the value 
510:     ST  3,-4(1)	Save left side 
511:    LDC  3,7(6)	Load integer constant 
512:     LD  4,-4(1)	Load left into ac1 
513:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
515:     LD  3,-3(1)	Load variable shot
516:     ST  3,-4(1)	Save index 
517:    LDC  3,1(6)	Load integer constant 
518:     LD  4,-4(1)	Restore index 
519:     LD  5,-2(1)	Load address of base of array arr
520:    SUB  5,5,4	Compute offset of value 
521:     ST  3,0(5)	Store variable arr
* EXPRESSION
522:     LD  3,-2(0)	load lhs variable NumHits
523:    LDA  3,1(3)	increment value of NumHits
524:     ST  3,-2(0)	Store variable NumHits
* IF
525:     LD  3,-1(0)	Load variable NumShots
526:     ST  3,-4(1)	Save left side 
527:    LDC  3,1(6)	Load integer constant 
528:     LD  4,-4(1)	Load left into ac1 
529:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
531:     LD  3,-1(0)	Load variable NumShots
532:     ST  3,-4(1)	Save left side 
533:    LDC  3,1(6)	Load integer constant 
534:     LD  4,-4(1)	Load left into ac1 
535:    ADD  3,4,3	Op + 
536:     ST  3,-1(0)	Store variable NumShots
530:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
514:    JZR  3,23(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
538:     LD  3,-3(1)	Load variable shot
539:     ST  3,-4(1)	Save index 
540:    LDC  3,0(6)	Load integer constant 
541:     LD  4,-4(1)	Restore index 
542:     LD  5,-2(1)	Load address of base of array arr
543:    SUB  5,5,4	Compute offset of value 
544:     ST  3,0(5)	Store variable arr
* END COMPOUND
537:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
545:     LD  3,-2(0)	Load variable NumHits
546:    LDA  2,0(3)	Copy result to rt register 
547:     LD  3,-1(1)	Load return address 
548:     LD  1,0(1)	Adjust fp 
549:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
550:    LDC  2,0(6)	Set return value to 0 
551:     LD  3,-1(1)	Load return address 
552:     LD  1,0(1)	Adjust fp 
553:    LDA  7,0(3)	Return 
* END FUNCTION Fire
* FUNCTION main
554:     ST  3,-1(1)	Store return address. 
* COMPOUND
555:    LDC  3,100(6)	load size of array Ocean
556:     ST  3,-2(1)	save size of array Ocean
* EXPRESSION
557:    LDC  3,4(6)	Load integer constant 
558:     ST  3,0(0)	Store variable shipsize
* EXPRESSION
559:    LDC  3,0(6)	Load integer constant 
560:     ST  3,-103(1)	Store variable i
* WHILE
561:     LD  3,-103(1)	Load variable i
562:     ST  3,-106(1)	Save left side 
563:    LDC  3,100(6)	Load integer constant 
564:     LD  4,-106(1)	Load left into ac1 
565:    TLT  3,4,3	Op < 
566:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
568:     LD  3,-103(1)	Load variable i
569:     ST  3,-106(1)	Save index 
570:    LDC  3,4(6)	Load integer constant 
571:     LD  4,-106(1)	Restore index 
572:    LDA  5,-3(1)	Load address of base of array Ocean
573:    SUB  5,5,4	Compute offset of value 
574:     ST  3,0(5)	Store variable Ocean
* EXPRESSION
575:     LD  3,-103(1)	load lhs variable i
576:    LDA  3,1(3)	increment value of i
577:     ST  3,-103(1)	Store variable i
* END COMPOUND
578:    LDA  7,-18(7)	go to beginning of loop 
567:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  HideShip
579:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
580:    LDA  3,-3(1)	Load address of base of array Ocean
581:     ST  3,-108(1)	Store parameter 
*                       Load param 2
582:    LDC  3,10(6)	Load integer constant 
583:     ST  3,-109(1)	Store parameter 
*                       Jump to HideShip
584:    LDA  1,-106(1)	Load address of new frame 
585:    LDA  3,1(7)	Return address in ac 
586:    LDA  7,-376(7)	CALL HideShip
587:    LDA  3,0(2)	Save the result in ac 
*                       End call to HideShip
* EXPRESSION
588:    LDC  3,0(6)	Load Boolean constant 
589:     ST  3,-105(1)	Store variable bGotit
* EXPRESSION
590:    LDC  3,10(6)	Load integer constant 
591:     ST  3,-1(0)	Store variable NumShots
* EXPRESSION
592:    LDC  3,0(6)	Load integer constant 
593:     ST  3,-2(0)	Store variable NumHits
* WHILE
594:     LD  3,-1(0)	Load variable NumShots
595:     ST  3,-106(1)	Save left side 
596:    LDC  3,0(6)	Load integer constant 
597:     LD  4,-106(1)	Load left into ac1 
598:    TGT  3,4,3	Op > 
599:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  Display
601:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
602:    LDA  3,-3(1)	Load address of base of array Ocean
603:     ST  3,-108(1)	Store parameter 
*                       Load param 2
604:    LDC  3,10(6)	Load integer constant 
605:     ST  3,-109(1)	Store parameter 
*                       Jump to Display
606:    LDA  1,-106(1)	Load address of new frame 
607:    LDA  3,1(7)	Return address in ac 
608:    LDA  7,-545(7)	CALL Display
609:    LDA  3,0(2)	Save the result in ac 
*                       End call to Display
* EXPRESSION
*                       Begin call to  Aim
610:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Jump to Aim
611:    LDA  1,-106(1)	Load address of new frame 
612:    LDA  3,1(7)	Return address in ac 
613:    LDA  7,-266(7)	CALL Aim
614:    LDA  3,0(2)	Save the result in ac 
*                       End call to Aim
615:     ST  3,-104(1)	Store variable Shot
* IF
*                       Begin call to  Fire
616:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
617:    LDA  3,-3(1)	Load address of base of array Ocean
618:     ST  3,-108(1)	Store parameter 
*                       Load param 2
619:     LD  3,-104(1)	Load variable Shot
620:     ST  3,-109(1)	Store parameter 
*                       Jump to Fire
621:    LDA  1,-106(1)	Load address of new frame 
622:    LDA  3,1(7)	Return address in ac 
623:    LDA  7,-119(7)	CALL Fire
624:    LDA  3,0(2)	Save the result in ac 
*                       End call to Fire
625:     ST  3,-106(1)	Save left side 
626:     LD  3,0(0)	Load variable shipsize
627:     LD  4,-106(1)	Load left into ac1 
628:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
630:    LDC  3,1(6)	Load Boolean constant 
631:     ST  3,-105(1)	Store variable bGotit
* BREAK
632:    LDA  7,-33(7)	break 
* END COMPOUND
629:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
633:    LDC  3,1(6)	Load integer constant 
634:     LD  4,-1(0)	load lhs variable NumShots
635:    SUB  3,4,3	op -= 
636:     ST  3,-1(0)	Store variable NumShots
* END COMPOUND
637:    LDA  7,-44(7)	go to beginning of loop 
600:    LDA  7,37(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
638:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Jump to NewLine
639:    LDA  1,-106(1)	Load address of new frame 
640:    LDA  3,1(7)	Return address in ac 
641:    LDA  7,-588(7)	CALL NewLine
642:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
643:    LDC  3,0(6)	Load integer constant 
644:     ST  3,-103(1)	Store variable i
* WHILE
645:     LD  3,-103(1)	Load variable i
646:     ST  3,-106(1)	Save left side 
647:    LDC  3,20(6)	Load integer constant 
648:     LD  4,-106(1)	Load left into ac1 
649:    TLT  3,4,3	Op < 
650:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
652:     LD  3,-105(1)	Load variable bGotit
* THEN
* EXPRESSION
*                       Begin call to  Print
654:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
655:    LDC  3,1(6)	Load integer constant 
656:     ST  3,-108(1)	Store parameter 
*                       Jump to Print
657:    LDA  1,-106(1)	Load address of new frame 
658:    LDA  3,1(7)	Return address in ac 
659:    LDA  7,-618(7)	CALL Print
660:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
653:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  Print
662:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
663:    LDC  3,0(6)	Load integer constant 
664:     ST  3,-108(1)	Store parameter 
*                       Jump to Print
665:    LDA  1,-106(1)	Load address of new frame 
666:    LDA  3,1(7)	Return address in ac 
667:    LDA  7,-626(7)	CALL Print
668:    LDA  3,0(2)	Save the result in ac 
*                       End call to Print
661:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
669:     LD  3,-103(1)	load lhs variable i
670:    LDA  3,1(3)	increment value of i
671:     ST  3,-103(1)	Store variable i
* END COMPOUND
672:    LDA  7,-28(7)	go to beginning of loop 
651:    LDA  7,21(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  NewLine
673:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Jump to NewLine
674:    LDA  1,-106(1)	Load address of new frame 
675:    LDA  3,1(7)	Return address in ac 
676:    LDA  7,-623(7)	CALL NewLine
677:    LDA  3,0(2)	Save the result in ac 
*                       End call to NewLine
* EXPRESSION
*                       Begin call to  RevealShip
678:     ST  1,-106(1)	Store old fp in ghost frame 
*                       Load param 1
679:    LDA  3,-3(1)	Load address of base of array Ocean
680:     ST  3,-108(1)	Store parameter 
*                       Load param 2
681:    LDC  3,10(6)	Load integer constant 
682:     ST  3,-109(1)	Store parameter 
*                       Jump to RevealShip
683:    LDA  1,-106(1)	Load address of new frame 
684:    LDA  3,1(7)	Return address in ac 
685:    LDA  7,-268(7)	CALL RevealShip
686:    LDA  3,0(2)	Save the result in ac 
*                       End call to RevealShip
* END COMPOUND
* Add standard closing in case there is no return statement
687:    LDC  2,0(6)	Set return value to 0 
688:     LD  3,-1(1)	Load return address 
689:     LD  1,0(1)	Adjust fp 
690:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,690(7)	Jump to init [backpatch] 
* INIT
691:     LD  0,0(0)	Set the global pointer 
692:    LDA  1,-4(0)	set first frame at end of globals 
693:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
694:    LDA  3,1(7)	Return address in ac 
695:    LDA  7,-142(7)	Jump to main 
696:   HALT  0,0,0	DONE! 
* END INIT
