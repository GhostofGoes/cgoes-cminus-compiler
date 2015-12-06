* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  mastermind.c-
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
* FUNCTION rand
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 43:     LD  3,-1(0)	Load variable n
 44:     ST  3,-2(1)	Save left side 
 45:    LDC  3,0(6)	Load integer constant 
 46:     LD  4,-2(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
 49:     LD  3,-1(0)	Load variable n
 50:    LDC  4,0(6)	Load 0 
 51:    SUB  3,4,3	Op unary - 
 52:     ST  3,-1(0)	Store variable n
 48:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 53:     LD  3,-1(0)	Load variable n
 54:     ST  3,-2(1)	Save left side 
 55:    LDC  3,128(6)	Load integer constant 
 56:     LD  4,-2(1)	Load left into ac1 
 57:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
 59:     LD  3,-1(0)	Load variable n
 60:     ST  3,-2(1)	Save left side 
 61:    LDC  3,128(6)	Load integer constant 
 62:     LD  4,-2(1)	Load left into ac1 
 63:    DIV  5,4,3	Op % 
 64:    MUL  5,5,3	 
 65:    SUB  3,4,5	 
 66:     ST  3,-1(0)	Store variable n
 58:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 67:     LD  3,-1(0)	load lhs variable n
 68:    LDA  3,1(3)	increment value of n
 69:     ST  3,-1(0)	Store variable n
* EXPRESSION
 70:     LD  3,-1(0)	Load variable n
 71:     ST  3,-2(1)	Save index 
 72:    LDC  3,1366(6)	Load integer constant 
 73:     ST  3,-3(1)	Save left side 
 74:     LD  3,-1(0)	Load variable n
 75:     ST  3,-4(1)	Save left side 
 76:    LDC  3,1(6)	Load integer constant 
 77:     LD  4,-4(1)	Load left into ac1 
 78:    SUB  3,4,3	Op - 
 79:    LDA  4,-3(0)	Load address of base of array r
 80:    SUB  3,4,3	Compute offset of value 
 81:     LD  3,0(3)	Load the value 
 82:     LD  4,-3(1)	Load left into ac1 
 83:    MUL  3,4,3	Op * 
 84:     ST  3,-3(1)	Save left side 
 85:    LDC  3,150889(6)	Load integer constant 
 86:     LD  4,-3(1)	Load left into ac1 
 87:    ADD  3,4,3	Op + 
 88:     ST  3,-3(1)	Save left side 
 89:    LDC  3,714025(6)	Load integer constant 
 90:     LD  4,-3(1)	Load left into ac1 
 91:    DIV  5,4,3	Op % 
 92:    MUL  5,5,3	 
 93:    SUB  3,4,5	 
 94:     LD  4,-2(1)	Restore index 
 95:    LDA  5,-3(0)	Load address of base of array r
 96:    SUB  5,5,4	Compute offset of value 
 97:     ST  3,0(5)	Store variable r
* RETURN
 98:     LD  3,-1(0)	Load variable n
 99:    LDA  4,-3(0)	Load address of base of array r
100:    SUB  3,4,3	Compute offset of value 
101:     LD  3,0(3)	Load the value 
102:    LDA  2,0(3)	Copy result to rt register 
103:     LD  3,-1(1)	Load return address 
104:     LD  1,0(1)	Adjust fp 
105:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
106:    LDC  2,0(6)	Set return value to 0 
107:     LD  3,-1(1)	Load return address 
108:     LD  1,0(1)	Adjust fp 
109:    LDA  7,0(3)	Return 
* END FUNCTION rand
* FUNCTION search
110:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
111:    LDC  3,0(6)	Load integer constant 
112:     ST  3,-4(1)	Store variable i
* WHILE
113:     LD  3,-4(1)	Load variable i
114:     ST  3,-5(1)	Save left side 
115:    LDC  3,4(6)	Load integer constant 
116:     LD  4,-5(1)	Load left into ac1 
117:    TLT  3,4,3	Op < 
118:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
120:     LD  3,-4(1)	Load variable i
121:     LD  4,-2(1)	Load address of base of array a
122:    SUB  3,4,3	Compute offset of value 
123:     LD  3,0(3)	Load the value 
124:     ST  3,-5(1)	Save left side 
125:     LD  3,-3(1)	Load variable k
126:     LD  4,-5(1)	Load left into ac1 
127:    TEQ  3,4,3	Op == 
* THEN
* RETURN
129:    LDC  3,1(6)	Load Boolean constant 
130:    LDA  2,0(3)	Copy result to rt register 
131:     LD  3,-1(1)	Load return address 
132:     LD  1,0(1)	Adjust fp 
133:    LDA  7,0(3)	Return 
128:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
134:     LD  3,-4(1)	load lhs variable i
135:    LDA  3,1(3)	increment value of i
136:     ST  3,-4(1)	Store variable i
* END COMPOUND
137:    LDA  7,-25(7)	go to beginning of loop 
119:    LDA  7,18(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
138:    LDC  3,0(6)	Load Boolean constant 
139:    LDA  2,0(3)	Copy result to rt register 
140:     LD  3,-1(1)	Load return address 
141:     LD  1,0(1)	Adjust fp 
142:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
143:    LDC  2,0(6)	Set return value to 0 
144:     LD  3,-1(1)	Load return address 
145:     LD  1,0(1)	Adjust fp 
146:    LDA  7,0(3)	Return 
* END FUNCTION search
* FUNCTION check
147:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
148:    LDC  3,0(6)	Load integer constant 
149:     ST  3,-4(1)	Store variable c2
150:     ST  3,-3(1)	Store variable c1
151:     ST  3,-2(1)	Store variable i
* WHILE
152:     LD  3,-2(1)	Load variable i
153:     ST  3,-5(1)	Save left side 
154:    LDC  3,4(6)	Load integer constant 
155:     LD  4,-5(1)	Load left into ac1 
156:    TLT  3,4,3	Op < 
157:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
159:     LD  3,-2(1)	Load variable i
160:    LDA  4,-132(0)	Load address of base of array known
161:    SUB  3,4,3	Compute offset of value 
162:     LD  3,0(3)	Load the value 
163:     ST  3,-5(1)	Save left side 
164:     LD  3,-2(1)	Load variable i
165:    LDA  4,-137(0)	Load address of base of array guess
166:    SUB  3,4,3	Compute offset of value 
167:     LD  3,0(3)	Load the value 
168:     LD  4,-5(1)	Load left into ac1 
169:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
171:     LD  3,-4(1)	load lhs variable c2
172:    LDA  3,1(3)	increment value of c2
173:     ST  3,-4(1)	Store variable c2
170:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
*                       Begin call to  search
175:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
176:    LDA  3,-132(0)	Load address of base of array known
177:     ST  3,-7(1)	Store parameter 
*                       Load param 2
178:     LD  3,-2(1)	Load variable i
179:    LDA  4,-137(0)	Load address of base of array guess
180:    SUB  3,4,3	Compute offset of value 
181:     LD  3,0(3)	Load the value 
182:     ST  3,-8(1)	Store parameter 
*                       Jump to search
183:    LDA  1,-5(1)	Load address of new frame 
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-76(7)	CALL search
186:    LDA  3,0(2)	Save the result in ac 
*                       End call to search
* THEN
* EXPRESSION
188:     LD  3,-3(1)	load lhs variable c1
189:    LDA  3,1(3)	increment value of c1
190:     ST  3,-3(1)	Store variable c1
187:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
174:    LDA  7,16(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
191:     LD  3,-2(1)	load lhs variable i
192:    LDA  3,1(3)	increment value of i
193:     ST  3,-2(1)	Store variable i
* END COMPOUND
194:    LDA  7,-43(7)	go to beginning of loop 
158:    LDA  7,36(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
195:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
196:     LD  3,-3(1)	Load variable c1
197:     ST  3,-7(1)	Store parameter 
*                       Jump to output
198:    LDA  1,-5(1)	Load address of new frame 
199:    LDA  3,1(7)	Return address in ac 
200:    LDA  7,-195(7)	CALL output
201:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
202:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
203:     LD  3,-4(1)	Load variable c2
204:     ST  3,-7(1)	Store parameter 
*                       Jump to output
205:    LDA  1,-5(1)	Load address of new frame 
206:    LDA  3,1(7)	Return address in ac 
207:    LDA  7,-202(7)	CALL output
208:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
209:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
210:    LDA  1,-5(1)	Load address of new frame 
211:    LDA  3,1(7)	Return address in ac 
212:    LDA  7,-176(7)	CALL outnl
213:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
214:     LD  3,-4(1)	Load variable c2
215:     ST  3,-5(1)	Save left side 
216:    LDC  3,4(6)	Load integer constant 
217:     LD  4,-5(1)	Load left into ac1 
218:    TEQ  3,4,3	Op == 
* THEN
* RETURN
220:    LDC  3,1(6)	Load Boolean constant 
221:    LDA  2,0(3)	Copy result to rt register 
222:     LD  3,-1(1)	Load return address 
223:     LD  1,0(1)	Adjust fp 
224:    LDA  7,0(3)	Return 
219:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
226:    LDC  3,0(6)	Load Boolean constant 
227:    LDA  2,0(3)	Copy result to rt register 
228:     LD  3,-1(1)	Load return address 
229:     LD  1,0(1)	Adjust fp 
230:    LDA  7,0(3)	Return 
225:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
231:    LDC  2,0(6)	Set return value to 0 
232:     LD  3,-1(1)	Load return address 
233:     LD  1,0(1)	Adjust fp 
234:    LDA  7,0(3)	Return 
* END FUNCTION check
* FUNCTION turn
235:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
236:     LD  3,0(0)	load lhs variable turns
237:    LDA  3,1(3)	increment value of turns
238:     ST  3,0(0)	Store variable turns
* EXPRESSION
*                       Begin call to  output
239:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
240:     LD  3,0(0)	Load variable turns
241:     ST  3,-5(1)	Store parameter 
*                       Jump to output
242:    LDA  1,-3(1)	Load address of new frame 
243:    LDA  3,1(7)	Return address in ac 
244:    LDA  7,-239(7)	CALL output
245:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
246:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
247:    LDA  1,-3(1)	Load address of new frame 
248:    LDA  3,1(7)	Return address in ac 
249:    LDA  7,-213(7)	CALL outnl
250:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
251:     LD  3,0(0)	Load variable turns
252:     ST  3,-3(1)	Save left side 
253:    LDC  3,20(6)	Load integer constant 
254:     LD  4,-3(1)	Load left into ac1 
255:    TLE  3,4,3	Op <= 
* THEN
* COMPOUND
* EXPRESSION
257:    LDC  3,0(6)	Load integer constant 
258:     ST  3,-2(1)	Store variable i
* WHILE
259:     LD  3,-2(1)	Load variable i
260:     ST  3,-3(1)	Save left side 
261:    LDC  3,4(6)	Load integer constant 
262:     LD  4,-3(1)	Load left into ac1 
263:    TLT  3,4,3	Op < 
264:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
266:     LD  3,-2(1)	Load variable i
267:     ST  3,-3(1)	Save index 
*                       Begin call to  input
268:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
269:    LDA  1,-4(1)	Load address of new frame 
270:    LDA  3,1(7)	Return address in ac 
271:    LDA  7,-271(7)	CALL input
272:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
273:     LD  4,-3(1)	Restore index 
274:    LDA  5,-137(0)	Load address of base of array guess
275:    SUB  5,5,4	Compute offset of value 
276:     ST  3,0(5)	Store variable guess
* IF
277:     LD  3,-2(1)	Load variable i
278:    LDA  4,-137(0)	Load address of base of array guess
279:    SUB  3,4,3	Compute offset of value 
280:     LD  3,0(3)	Load the value 
281:     ST  3,-3(1)	Save left side 
282:    LDC  3,0(6)	Load integer constant 
283:     LD  4,-3(1)	Load left into ac1 
284:    TLT  3,4,3	Op < 
* THEN
* RETURN
286:    LDC  3,0(6)	Load Boolean constant 
287:    LDA  2,0(3)	Copy result to rt register 
288:     LD  3,-1(1)	Load return address 
289:     LD  1,0(1)	Adjust fp 
290:    LDA  7,0(3)	Return 
285:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
291:     LD  3,-2(1)	Load variable i
292:    LDA  4,-137(0)	Load address of base of array guess
293:    SUB  3,4,3	Compute offset of value 
294:     LD  3,0(3)	Load the value 
295:     ST  3,-3(1)	Save left side 
296:    LDC  3,10(6)	Load integer constant 
297:     LD  4,-3(1)	Load left into ac1 
298:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
300:     LD  3,-2(1)	Load variable i
301:     ST  3,-3(1)	Save index 
302:     LD  3,-2(1)	Load variable i
303:    LDA  4,-137(0)	Load address of base of array guess
304:    SUB  3,4,3	Compute offset of value 
305:     LD  3,0(3)	Load the value 
306:     ST  3,-4(1)	Save left side 
307:    LDC  3,10(6)	Load integer constant 
308:     LD  4,-4(1)	Load left into ac1 
309:    DIV  5,4,3	Op % 
310:    MUL  5,5,3	 
311:    SUB  3,4,5	 
312:     LD  4,-3(1)	Restore index 
313:    LDA  5,-137(0)	Load address of base of array guess
314:    SUB  5,5,4	Compute offset of value 
315:     ST  3,0(5)	Store variable guess
299:    JZR  3,16(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
316:     LD  3,-2(1)	load lhs variable i
317:    LDA  3,1(3)	increment value of i
318:     ST  3,-2(1)	Store variable i
* END COMPOUND
319:    LDA  7,-61(7)	go to beginning of loop 
265:    LDA  7,54(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
*                       Begin call to  check
320:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to check
321:    LDA  1,-3(1)	Load address of new frame 
322:    LDA  3,1(7)	Return address in ac 
323:    LDA  7,-177(7)	CALL check
324:    LDA  3,0(2)	Save the result in ac 
*                       End call to check
* THEN
* COMPOUND
* EXPRESSION
326:    LDC  3,0(6)	Load integer constant 
327:     ST  3,-2(1)	Store variable i
* WHILE
328:     LD  3,-2(1)	Load variable i
329:     ST  3,-3(1)	Save left side 
330:    LDC  3,10(6)	Load integer constant 
331:     LD  4,-3(1)	Load left into ac1 
332:    TLT  3,4,3	Op < 
333:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  outputb
335:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
336:    LDC  3,1(6)	Load Boolean constant 
337:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
338:    LDA  1,-3(1)	Load address of new frame 
339:    LDA  3,1(7)	Return address in ac 
340:    LDA  7,-323(7)	CALL outputb
341:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
342:     LD  3,-2(1)	load lhs variable i
343:    LDA  3,1(3)	increment value of i
344:     ST  3,-2(1)	Store variable i
* END COMPOUND
345:    LDA  7,-18(7)	go to beginning of loop 
334:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
346:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
347:    LDA  1,-3(1)	Load address of new frame 
348:    LDA  3,1(7)	Return address in ac 
349:    LDA  7,-313(7)	CALL outnl
350:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
351:    LDC  3,0(6)	Load Boolean constant 
352:    LDA  2,0(3)	Copy result to rt register 
353:     LD  3,-1(1)	Load return address 
354:     LD  1,0(1)	Adjust fp 
355:    LDA  7,0(3)	Return 
* END COMPOUND
325:    JZR  3,31(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* RETURN
357:    LDC  3,1(6)	Load Boolean constant 
358:    LDA  2,0(3)	Copy result to rt register 
359:     LD  3,-1(1)	Load return address 
360:     LD  1,0(1)	Adjust fp 
361:    LDA  7,0(3)	Return 
* END COMPOUND
356:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
256:    JZR  3,105(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
362:    LDC  3,0(6)	Load integer constant 
363:     ST  3,-2(1)	Store variable i
* WHILE
364:     LD  3,-2(1)	Load variable i
365:     ST  3,-3(1)	Save left side 
366:    LDC  3,10(6)	Load integer constant 
367:     LD  4,-3(1)	Load left into ac1 
368:    TLT  3,4,3	Op < 
369:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  outputb
371:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
372:    LDC  3,0(6)	Load Boolean constant 
373:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
374:    LDA  1,-3(1)	Load address of new frame 
375:    LDA  3,1(7)	Return address in ac 
376:    LDA  7,-359(7)	CALL outputb
377:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
378:     LD  3,-2(1)	load lhs variable i
379:    LDA  3,1(3)	increment value of i
380:     ST  3,-2(1)	Store variable i
* END COMPOUND
381:    LDA  7,-18(7)	go to beginning of loop 
370:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
382:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
383:    LDA  1,-3(1)	Load address of new frame 
384:    LDA  3,1(7)	Return address in ac 
385:    LDA  7,-349(7)	CALL outnl
386:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
387:    LDC  3,0(6)	Load Boolean constant 
388:    LDA  2,0(3)	Copy result to rt register 
389:     LD  3,-1(1)	Load return address 
390:     LD  1,0(1)	Adjust fp 
391:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
392:    LDC  2,0(6)	Set return value to 0 
393:     LD  3,-1(1)	Load return address 
394:     LD  1,0(1)	Adjust fp 
395:    LDA  7,0(3)	Return 
* END FUNCTION turn
* FUNCTION main
396:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
397:    LDC  3,0(6)	Load integer constant 
398:     ST  3,-1(0)	Store variable n
* EXPRESSION
399:    LDC  3,0(6)	Load integer constant 
400:     ST  3,-3(1)	Save index 
*                       Begin call to  input
401:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
402:    LDA  1,-4(1)	Load address of new frame 
403:    LDA  3,1(7)	Return address in ac 
404:    LDA  7,-404(7)	CALL input
405:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
406:     LD  4,-3(1)	Restore index 
407:    LDA  5,-3(0)	Load address of base of array r
408:    SUB  5,5,4	Compute offset of value 
409:     ST  3,0(5)	Store variable r
* EXPRESSION
*                       Begin call to  outnl
410:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
411:    LDA  1,-3(1)	Load address of new frame 
412:    LDA  3,1(7)	Return address in ac 
413:    LDA  7,-377(7)	CALL outnl
414:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
415:    LDC  3,0(6)	Load integer constant 
416:     ST  3,-2(1)	Store variable i
* WHILE
417:     LD  3,-2(1)	Load variable i
418:     ST  3,-3(1)	Save left side 
419:    LDC  3,4(6)	Load integer constant 
420:     LD  4,-3(1)	Load left into ac1 
421:    TLT  3,4,3	Op < 
422:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
424:     LD  3,-2(1)	Load variable i
425:     ST  3,-3(1)	Save index 
*                       Begin call to  rand
426:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to rand
427:    LDA  1,-4(1)	Load address of new frame 
428:    LDA  3,1(7)	Return address in ac 
429:    LDA  7,-388(7)	CALL rand
430:    LDA  3,0(2)	Save the result in ac 
*                       End call to rand
431:     ST  3,-4(1)	Save left side 
432:    LDC  3,10(6)	Load integer constant 
433:     LD  4,-4(1)	Load left into ac1 
434:    DIV  5,4,3	Op % 
435:    MUL  5,5,3	 
436:    SUB  3,4,5	 
437:     LD  4,-3(1)	Restore index 
438:    LDA  5,-132(0)	Load address of base of array known
439:    SUB  5,5,4	Compute offset of value 
440:     ST  3,0(5)	Store variable known
* EXPRESSION
441:     LD  3,-2(1)	load lhs variable i
442:    LDA  3,1(3)	increment value of i
443:     ST  3,-2(1)	Store variable i
* END COMPOUND
444:    LDA  7,-28(7)	go to beginning of loop 
423:    LDA  7,21(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
445:    LDC  3,0(6)	Load integer constant 
446:     ST  3,0(0)	Store variable turns
* WHILE
*                       Begin call to  turn
447:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to turn
448:    LDA  1,-3(1)	Load address of new frame 
449:    LDA  3,1(7)	Return address in ac 
450:    LDA  7,-216(7)	CALL turn
451:    LDA  3,0(2)	Save the result in ac 
*                       End call to turn
452:    JNZ  3,1(7)	Jump to while part 
* DO
454:    LDA  7,-8(7)	go to beginning of loop 
453:    LDA  7,1(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
455:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
456:    LDA  1,-3(1)	Load address of new frame 
457:    LDA  3,1(7)	Return address in ac 
458:    LDA  7,-422(7)	CALL outnl
459:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
460:    LDC  3,0(6)	Load integer constant 
461:     ST  3,-2(1)	Store variable i
* WHILE
462:     LD  3,-2(1)	Load variable i
463:     ST  3,-3(1)	Save left side 
464:    LDC  3,4(6)	Load integer constant 
465:     LD  4,-3(1)	Load left into ac1 
466:    TLT  3,4,3	Op < 
467:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
469:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
470:     LD  3,-2(1)	Load variable i
471:    LDA  4,-132(0)	Load address of base of array known
472:    SUB  3,4,3	Compute offset of value 
473:     LD  3,0(3)	Load the value 
474:     ST  3,-5(1)	Store parameter 
*                       Jump to output
475:    LDA  1,-3(1)	Load address of new frame 
476:    LDA  3,1(7)	Return address in ac 
477:    LDA  7,-472(7)	CALL output
478:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
479:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
480:    LDA  1,-3(1)	Load address of new frame 
481:    LDA  3,1(7)	Return address in ac 
482:    LDA  7,-446(7)	CALL outnl
483:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
484:     LD  3,-2(1)	load lhs variable i
485:    LDA  3,1(3)	increment value of i
486:     ST  3,-2(1)	Store variable i
* END COMPOUND
487:    LDA  7,-26(7)	go to beginning of loop 
468:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
488:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
489:    LDA  1,-3(1)	Load address of new frame 
490:    LDA  3,1(7)	Return address in ac 
491:    LDA  7,-455(7)	CALL outnl
492:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
493:    LDC  2,0(6)	Set return value to 0 
494:     LD  3,-1(1)	Load return address 
495:     LD  1,0(1)	Adjust fp 
496:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,496(7)	Jump to init [backpatch] 
* INIT
497:     LD  0,0(0)	Set the global pointer 
498:    LDA  1,-141(0)	set first frame at end of globals 
499:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
500:    LDC  3,4(6)	load size of array guess
501:     ST  3,-136(0)	save size of array guess
502:    LDC  3,4(6)	load size of array known
503:     ST  3,-131(0)	save size of array known
504:    LDC  3,128(6)	load size of array r
505:     ST  3,-2(0)	save size of array r
* END INIT GLOBALS AND STATICS
506:    LDA  3,1(7)	Return address in ac 
507:    LDA  7,-112(7)	Jump to main 
508:   HALT  0,0,0	DONE! 
* END INIT
