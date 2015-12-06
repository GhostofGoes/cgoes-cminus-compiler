* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  miller.c-
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
* FUNCTION showIntArray
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-4(1)	Store variable i
* WHILE
 45:     LD  3,-4(1)	Load variable i
 46:     ST  3,-5(1)	Save left side 
 47:     LD  3,-3(1)	Load variable size
 48:     LD  4,-5(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 53:     LD  3,-4(1)	Load variable i
 54:     LD  4,-2(1)	Load address of base of array x
 55:    SUB  3,4,3	Compute offset of value 
 56:     LD  3,0(3)	Load the value 
 57:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 58:    LDA  1,-5(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 62:     LD  3,-4(1)	Load variable i
 63:     ST  3,-5(1)	Save left side 
 64:    LDC  3,1(6)	Load integer constant 
 65:     LD  4,-5(1)	Load left into ac1 
 66:    ADD  3,4,3	Op + 
 67:     ST  3,-4(1)	Store variable i
* END COMPOUND
 68:    LDA  7,-24(7)	go to beginning of loop 
 51:    LDA  7,17(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
 69:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 70:    LDA  1,-5(1)	Load address of new frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    LDA  7,-36(7)	CALL outnl
 73:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6)	Set return value to 0 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    LDA  7,0(3)	Return 
* END FUNCTION showIntArray
* FUNCTION dog
 78:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 79:     LD  3,-2(1)	Load variable a
 80:     ST  3,-2(1)	Store variable a
* EXPRESSION
 81:    LDC  3,7(6)	Load integer constant 
 82:     ST  3,-4(1)	Save index 
 83:    LDC  3,9(6)	Load integer constant 
 84:     LD  4,-3(1)	Load address of base of array b
 85:    SUB  3,4,3	Compute offset of value 
 86:     LD  3,0(3)	Load the value 
 87:     LD  4,-4(1)	Restore index 
 88:     LD  5,-3(1)	Load address of base of array b
 89:    SUB  5,5,4	Compute offset of value 
 90:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
 91:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 92:     LD  3,-2(1)	Load variable a
 93:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 94:    LDA  1,-4(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 98:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 99:    LDA  1,-4(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-65(7)	CALL outnl
102:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
103:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
104:    LDC  3,7(6)	Load integer constant 
105:     LD  4,-3(1)	Load address of base of array b
106:    SUB  3,4,3	Compute offset of value 
107:     LD  3,0(3)	Load the value 
108:     ST  3,-6(1)	Store parameter 
*                       Jump to output
109:    LDA  1,-4(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
113:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
114:    LDA  1,-4(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-80(7)	CALL outnl
117:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
118:    LDC  2,0(6)	Set return value to 0 
119:     LD  3,-1(1)	Load return address 
120:     LD  1,0(1)	Adjust fp 
121:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION getnxtindex
122:     ST  3,-1(1)	Store return address. 
* COMPOUND
* RETURN
123:     LD  3,-2(1)	Load variable x
124:     ST  3,-3(1)	Save left side 
125:    LDC  3,1(6)	Load integer constant 
126:     LD  4,-3(1)	Load left into ac1 
127:    ADD  3,4,3	Op + 
128:    LDA  2,0(3)	Copy result to rt register 
129:     LD  3,-1(1)	Load return address 
130:     LD  1,0(1)	Adjust fp 
131:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
132:    LDC  2,0(6)	Set return value to 0 
133:     LD  3,-1(1)	Load return address 
134:     LD  1,0(1)	Adjust fp 
135:    LDA  7,0(3)	Return 
* END FUNCTION getnxtindex
* FUNCTION main
136:     ST  3,-1(1)	Store return address. 
* COMPOUND
137:    LDC  3,10(6)	load size of array c
138:     ST  3,-3(1)	save size of array c
139:    LDC  3,10(6)	load size of array d
140:     ST  3,-14(1)	save size of array d
141:    LDC  3,10(6)	load size of array y
142:     ST  3,-25(1)	save size of array y
143:    LDC  3,10(6)	load size of array z
144:     ST  3,-36(1)	save size of array z
145:    LDC  3,10(6)	load size of array w
146:     ST  3,-47(1)	save size of array w
* EXPRESSION
147:    LDC  3,0(6)	Load integer constant 
148:     ST  3,-58(1)	Save index 
149:    LDC  3,3(6)	Load integer constant 
150:     LD  4,-58(1)	Restore index 
151:    LDA  5,-4(1)	Load address of base of array c
152:    SUB  5,5,4	Compute offset of value 
153:     ST  3,0(5)	Store variable c
* EXPRESSION
154:    LDC  3,3(6)	Load integer constant 
155:     ST  3,-58(1)	Save index 
156:    LDC  3,5(6)	Load integer constant 
157:     LD  4,-58(1)	Restore index 
158:    LDA  5,-15(1)	Load address of base of array d
159:    SUB  5,5,4	Compute offset of value 
160:     ST  3,0(5)	Store variable d
* EXPRESSION
161:    LDC  3,4(6)	Load integer constant 
162:     ST  3,-58(1)	Save index 
163:    LDC  3,9(6)	Load integer constant 
164:     LD  4,-58(1)	Restore index 
165:    LDA  5,-15(1)	Load address of base of array d
166:    SUB  5,5,4	Compute offset of value 
167:     ST  3,0(5)	Store variable d
* EXPRESSION
168:    LDC  3,5(6)	Load integer constant 
169:     ST  3,-58(1)	Save index 
170:    LDC  3,100(6)	Load integer constant 
171:     LD  4,-58(1)	Restore index 
172:    LDA  5,-26(1)	Load address of base of array y
173:    SUB  5,5,4	Compute offset of value 
174:     ST  3,0(5)	Store variable y
* EXPRESSION
175:    LDC  3,9(6)	Load integer constant 
176:     ST  3,-58(1)	Save index 
177:    LDC  3,50(6)	Load integer constant 
178:     LD  4,-58(1)	Restore index 
179:    LDA  5,-48(1)	Load address of base of array w
180:    SUB  5,5,4	Compute offset of value 
181:     ST  3,0(5)	Store variable w
* EXPRESSION
*                       Begin call to  dog
182:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
183:    LDC  3,5(6)	Load integer constant 
184:    LDA  4,-26(1)	Load address of base of array y
185:    SUB  3,4,3	Compute offset of value 
186:     LD  3,0(3)	Load the value 
187:     ST  3,-60(1)	Store parameter 
*                       Load param 2
188:    LDA  3,-48(1)	Load address of base of array w
189:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
190:    LDA  1,-58(1)	Load address of new frame 
191:    LDA  3,1(7)	Return address in ac 
192:    LDA  7,-115(7)	CALL dog
193:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
194:    LDC  3,9(6)	Load integer constant 
195:     ST  3,-58(1)	Save index 
196:    LDC  3,12(6)	Load integer constant 
197:     LD  4,-58(1)	Restore index 
198:    LDA  5,-48(1)	Load address of base of array w
199:    SUB  5,5,4	Compute offset of value 
200:     ST  3,0(5)	Store variable w
* EXPRESSION
*                       Begin call to  dog
201:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
202:    LDC  3,3(6)	Load integer constant 
203:    LDA  4,-15(1)	Load address of base of array d
204:    SUB  3,4,3	Compute offset of value 
205:     LD  3,0(3)	Load the value 
206:    LDA  4,-26(1)	Load address of base of array y
207:    SUB  3,4,3	Compute offset of value 
208:     LD  3,0(3)	Load the value 
209:     ST  3,-60(1)	Store parameter 
*                       Load param 2
210:    LDA  3,-48(1)	Load address of base of array w
211:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
212:    LDA  1,-58(1)	Load address of new frame 
213:    LDA  3,1(7)	Return address in ac 
214:    LDA  7,-137(7)	CALL dog
215:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
216:    LDC  3,8(6)	Load integer constant 
217:     ST  3,-58(1)	Save index 
218:    LDC  3,4(6)	Load integer constant 
219:     LD  4,-58(1)	Restore index 
220:    LDA  5,-4(1)	Load address of base of array c
221:    SUB  5,5,4	Compute offset of value 
222:     ST  3,0(5)	Store variable c
* EXPRESSION
223:    LDC  3,9(6)	Load integer constant 
224:     ST  3,-58(1)	Save index 
225:    LDC  3,25(6)	Load integer constant 
226:     LD  4,-58(1)	Restore index 
227:    LDA  5,-4(1)	Load address of base of array c
228:    SUB  5,5,4	Compute offset of value 
229:     ST  3,0(5)	Store variable c
* EXPRESSION
230:    LDC  3,9(6)	Load integer constant 
231:     ST  3,-58(1)	Save index 
232:    LDC  3,66(6)	Load integer constant 
233:     LD  4,-58(1)	Restore index 
234:    LDA  5,-26(1)	Load address of base of array y
235:    SUB  5,5,4	Compute offset of value 
236:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  dog
237:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
238:    LDC  3,8(6)	Load integer constant 
239:    LDA  4,-4(1)	Load address of base of array c
240:    SUB  3,4,3	Compute offset of value 
241:     LD  3,0(3)	Load the value 
242:    LDA  4,-15(1)	Load address of base of array d
243:    SUB  3,4,3	Compute offset of value 
244:     LD  3,0(3)	Load the value 
245:    LDA  4,-26(1)	Load address of base of array y
246:    SUB  3,4,3	Compute offset of value 
247:     LD  3,0(3)	Load the value 
248:     ST  3,-60(1)	Store parameter 
*                       Load param 2
249:    LDA  3,-4(1)	Load address of base of array c
250:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
251:    LDA  1,-58(1)	Load address of new frame 
252:    LDA  3,1(7)	Return address in ac 
253:    LDA  7,-176(7)	CALL dog
254:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
255:    LDC  3,777(6)	Load integer constant 
256:     ST  3,-2(1)	Store variable x
* EXPRESSION
257:    LDC  3,7(6)	Load integer constant 
258:     ST  3,-58(1)	Save index 
259:    LDC  3,123(6)	Load integer constant 
260:     LD  4,-58(1)	Restore index 
261:    LDA  5,-26(1)	Load address of base of array y
262:    SUB  5,5,4	Compute offset of value 
263:     ST  3,0(5)	Store variable y
* EXPRESSION
264:    LDC  3,9(6)	Load integer constant 
265:     ST  3,-58(1)	Save index 
266:    LDC  3,7(6)	Load integer constant 
267:    LDA  4,-26(1)	Load address of base of array y
268:    SUB  3,4,3	Compute offset of value 
269:     LD  3,0(3)	Load the value 
270:     LD  4,-58(1)	Restore index 
271:    LDA  5,-26(1)	Load address of base of array y
272:    SUB  5,5,4	Compute offset of value 
273:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  dog
274:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
275:     LD  3,-2(1)	Load variable x
276:     ST  3,-60(1)	Store parameter 
*                       Load param 2
277:    LDA  3,-26(1)	Load address of base of array y
278:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
279:    LDA  1,-58(1)	Load address of new frame 
280:    LDA  3,1(7)	Return address in ac 
281:    LDA  7,-204(7)	CALL dog
282:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
283:     LD  3,-2(1)	Load variable x
284:     ST  3,-2(1)	Store variable x
* EXPRESSION
285:    LDC  3,9(6)	Load integer constant 
286:     ST  3,-58(1)	Save index 
287:     LD  3,-2(1)	Load variable x
288:     LD  4,-58(1)	Restore index 
289:    LDA  5,-4(1)	Load address of base of array c
290:    SUB  5,5,4	Compute offset of value 
291:     ST  3,0(5)	Store variable c
* EXPRESSION
292:    LDC  3,888(6)	Load integer constant 
293:     ST  3,-11(0)	Store variable glx
* EXPRESSION
294:    LDC  3,7(6)	Load integer constant 
295:     ST  3,-58(1)	Save index 
296:     LD  3,-11(0)	Load variable glx
297:     LD  4,-58(1)	Restore index 
298:    LDA  5,-26(1)	Load address of base of array y
299:    SUB  5,5,4	Compute offset of value 
300:     ST  3,0(5)	Store variable y
* EXPRESSION
301:    LDC  3,6(6)	Load integer constant 
302:     ST  3,-58(1)	Save index 
303:    LDC  3,2(6)	Load integer constant 
304:     LD  4,-58(1)	Restore index 
305:    LDA  5,-15(1)	Load address of base of array d
306:    SUB  5,5,4	Compute offset of value 
307:     ST  3,0(5)	Store variable d
* EXPRESSION
308:    LDC  3,2(6)	Load integer constant 
309:     ST  3,-58(1)	Save index 
310:    LDC  3,4(6)	Load integer constant 
311:     LD  4,-58(1)	Restore index 
312:    LDA  5,-4(1)	Load address of base of array c
313:    SUB  5,5,4	Compute offset of value 
314:     ST  3,0(5)	Store variable c
* EXPRESSION
315:    LDC  3,4(6)	Load integer constant 
316:     ST  3,-58(1)	Save index 
317:    LDC  3,7(6)	Load integer constant 
318:     LD  4,-58(1)	Restore index 
319:    LDA  5,-15(1)	Load address of base of array d
320:    SUB  5,5,4	Compute offset of value 
321:     ST  3,0(5)	Store variable d
* EXPRESSION
322:    LDC  3,2(6)	Load integer constant 
323:     ST  3,-58(1)	Save index 
324:    LDC  3,6(6)	Load integer constant 
325:    LDA  4,-15(1)	Load address of base of array d
326:    SUB  3,4,3	Compute offset of value 
327:     LD  3,0(3)	Load the value 
328:    LDA  4,-4(1)	Load address of base of array c
329:    SUB  3,4,3	Compute offset of value 
330:     LD  3,0(3)	Load the value 
331:    LDA  4,-15(1)	Load address of base of array d
332:    SUB  3,4,3	Compute offset of value 
333:     LD  3,0(3)	Load the value 
334:    LDA  4,-26(1)	Load address of base of array y
335:    SUB  3,4,3	Compute offset of value 
336:     LD  3,0(3)	Load the value 
337:     LD  4,-58(1)	Restore index 
338:    LDA  5,-15(1)	Load address of base of array d
339:    SUB  5,5,4	Compute offset of value 
340:     ST  3,0(5)	Store variable d
* EXPRESSION
*                       Begin call to  dog
341:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
342:    LDC  3,8(6)	Load integer constant 
343:    LDA  4,-4(1)	Load address of base of array c
344:    SUB  3,4,3	Compute offset of value 
345:     LD  3,0(3)	Load the value 
346:    LDA  4,-15(1)	Load address of base of array d
347:    SUB  3,4,3	Compute offset of value 
348:     LD  3,0(3)	Load the value 
349:    LDA  4,-26(1)	Load address of base of array y
350:    SUB  3,4,3	Compute offset of value 
351:     LD  3,0(3)	Load the value 
352:     ST  3,-60(1)	Store parameter 
*                       Load param 2
353:    LDA  3,-4(1)	Load address of base of array c
354:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
355:    LDA  1,-58(1)	Load address of new frame 
356:    LDA  3,1(7)	Return address in ac 
357:    LDA  7,-280(7)	CALL dog
358:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
359:    LDC  3,2(6)	Load integer constant 
360:     ST  3,-58(1)	Save index 
361:    LDC  3,3(6)	Load integer constant 
362:    LDA  4,-4(1)	Load address of base of array c
363:    SUB  3,4,3	Compute offset of value 
364:     LD  3,0(3)	Load the value 
365:     LD  4,-58(1)	Restore index 
366:    LDA  5,-15(1)	Load address of base of array d
367:    SUB  5,5,4	Compute offset of value 
368:     ST  3,0(5)	Store variable d
* EXPRESSION
369:    LDC  3,7(6)	Load integer constant 
370:     ST  3,-58(1)	Save index 
371:    LDC  3,9(6)	Load integer constant 
372:    LDA  4,-26(1)	Load address of base of array y
373:    SUB  3,4,3	Compute offset of value 
374:     LD  3,0(3)	Load the value 
375:     LD  4,-58(1)	Restore index 
376:    LDA  5,-26(1)	Load address of base of array y
377:    SUB  5,5,4	Compute offset of value 
378:     ST  3,0(5)	Store variable y
* EXPRESSION
379:    LDC  3,2(6)	Load integer constant 
380:     ST  3,-58(1)	Save index 
381:    LDC  3,3(6)	Load integer constant 
382:     LD  4,-58(1)	Restore index 
383:    LDA  5,-1(0)	Load address of base of array gl
384:    SUB  5,5,4	Compute offset of value 
385:     ST  3,0(5)	Store variable gl
* EXPRESSION
386:    LDC  3,2(6)	Load integer constant 
387:    LDA  4,-1(0)	Load address of base of array gl
388:    SUB  3,4,3	Compute offset of value 
389:     LD  3,0(3)	Load the value 
390:     ST  3,-2(1)	Store variable x
* EXPRESSION
391:    LDC  3,7(6)	Load integer constant 
392:     ST  3,-58(1)	Save index 
393:    LDC  3,9(6)	Load integer constant 
394:    LDA  4,-1(0)	Load address of base of array gl
395:    SUB  3,4,3	Compute offset of value 
396:     LD  3,0(3)	Load the value 
397:     LD  4,-58(1)	Restore index 
398:    LDA  5,-26(1)	Load address of base of array y
399:    SUB  5,5,4	Compute offset of value 
400:     ST  3,0(5)	Store variable y
* EXPRESSION
401:    LDC  3,7(6)	Load integer constant 
402:     ST  3,-58(1)	Save index 
403:    LDC  3,9(6)	Load integer constant 
404:    LDA  4,-26(1)	Load address of base of array y
405:    SUB  3,4,3	Compute offset of value 
406:     LD  3,0(3)	Load the value 
407:     LD  4,-58(1)	Restore index 
408:    LDA  5,-1(0)	Load address of base of array gl
409:    SUB  5,5,4	Compute offset of value 
410:     ST  3,0(5)	Store variable gl
* EXPRESSION
411:    LDC  3,0(6)	Load integer constant 
412:     ST  3,-58(1)	Save index 
413:    LDC  3,5(6)	Load integer constant 
414:     LD  4,-58(1)	Restore index 
415:    LDA  5,-26(1)	Load address of base of array y
416:    SUB  5,5,4	Compute offset of value 
417:     ST  3,0(5)	Store variable y
* EXPRESSION
418:    LDC  3,5(6)	Load integer constant 
419:     ST  3,-58(1)	Save index 
420:    LDC  3,3(6)	Load integer constant 
421:     LD  4,-58(1)	Restore index 
422:    LDA  5,-15(1)	Load address of base of array d
423:    SUB  5,5,4	Compute offset of value 
424:     ST  3,0(5)	Store variable d
* EXPRESSION
425:    LDC  3,8(6)	Load integer constant 
426:     ST  3,-58(1)	Save index 
427:    LDC  3,0(6)	Load integer constant 
428:    LDA  4,-26(1)	Load address of base of array y
429:    SUB  3,4,3	Compute offset of value 
430:     LD  3,0(3)	Load the value 
431:    LDA  4,-15(1)	Load address of base of array d
432:    SUB  3,4,3	Compute offset of value 
433:     LD  3,0(3)	Load the value 
434:     LD  4,-58(1)	Restore index 
435:    LDA  5,-4(1)	Load address of base of array c
436:    SUB  5,5,4	Compute offset of value 
437:     ST  3,0(5)	Store variable c
* EXPRESSION
*                       Begin call to  output
438:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
439:    LDC  3,8(6)	Load integer constant 
440:    LDA  4,-4(1)	Load address of base of array c
441:    SUB  3,4,3	Compute offset of value 
442:     LD  3,0(3)	Load the value 
443:     ST  3,-60(1)	Store parameter 
*                       Jump to output
444:    LDA  1,-58(1)	Load address of new frame 
445:    LDA  3,1(7)	Return address in ac 
446:    LDA  7,-441(7)	CALL output
447:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
448:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Jump to outnl
449:    LDA  1,-58(1)	Load address of new frame 
450:    LDA  3,1(7)	Return address in ac 
451:    LDA  7,-415(7)	CALL outnl
452:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
453:    LDC  3,3(6)	Load integer constant 
454:     ST  3,-58(1)	Save index 
455:    LDC  3,4(6)	Load integer constant 
456:     LD  4,-58(1)	Restore index 
457:    LDA  5,-15(1)	Load address of base of array d
458:    SUB  5,5,4	Compute offset of value 
459:     ST  3,0(5)	Store variable d
* EXPRESSION
460:    LDC  3,4(6)	Load integer constant 
461:     ST  3,-58(1)	Save index 
462:    LDC  3,987(6)	Load integer constant 
463:     LD  4,-58(1)	Restore index 
464:    LDA  5,-26(1)	Load address of base of array y
465:    SUB  5,5,4	Compute offset of value 
466:     ST  3,0(5)	Store variable y
* EXPRESSION
467:    LDC  3,9(6)	Load integer constant 
468:     ST  3,-58(1)	Save index 
469:    LDC  3,3(6)	Load integer constant 
470:     LD  4,-58(1)	Restore index 
471:    LDA  5,-4(1)	Load address of base of array c
472:    SUB  5,5,4	Compute offset of value 
473:     LD  4,0(5)	load lhs variable c
474:    SUB  3,4,3	op -= 
475:     ST  3,0(5)	Store variable c
* EXPRESSION
*                       Begin call to  dog
476:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
477:    LDC  3,8(6)	Load integer constant 
478:    LDA  4,-4(1)	Load address of base of array c
479:    SUB  3,4,3	Compute offset of value 
480:     LD  3,0(3)	Load the value 
481:    LDA  4,-15(1)	Load address of base of array d
482:    SUB  3,4,3	Compute offset of value 
483:     LD  3,0(3)	Load the value 
484:    LDA  4,-26(1)	Load address of base of array y
485:    SUB  3,4,3	Compute offset of value 
486:     LD  3,0(3)	Load the value 
487:     ST  3,-60(1)	Store parameter 
*                       Load param 2
488:    LDA  3,-4(1)	Load address of base of array c
489:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
490:    LDA  1,-58(1)	Load address of new frame 
491:    LDA  3,1(7)	Return address in ac 
492:    LDA  7,-415(7)	CALL dog
493:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
494:    LDC  3,9(6)	Load integer constant 
495:    LDA  4,-4(1)	Load address of base of array c
496:    SUB  3,4,3	Compute offset of value 
497:     LD  3,0(3)	Load the value 
498:     LD  4,-2(1)	load lhs variable x
499:    ADD  3,4,3	op += 
500:     ST  3,-2(1)	Store variable x
* EXPRESSION
501:    LDC  3,9(6)	Load integer constant 
502:    LDA  4,-4(1)	Load address of base of array c
503:    SUB  3,4,3	Compute offset of value 
504:     LD  3,0(3)	Load the value 
505:     LD  4,-2(1)	load lhs variable x
506:    SUB  3,4,3	op -= 
507:     ST  3,-2(1)	Store variable x
* EXPRESSION
508:    LDC  3,8(6)	Load integer constant 
509:     ST  3,-58(1)	Save index 
510:    LDC  3,8(6)	Load integer constant 
511:     LD  4,-58(1)	Restore index 
512:    LDA  5,-26(1)	Load address of base of array y
513:    SUB  5,5,4	Compute offset of value 
514:     ST  3,0(5)	Store variable y
* EXPRESSION
515:    LDC  3,9(6)	Load integer constant 
516:     ST  3,-58(1)	Save index 
*                       Begin call to  getnxtindex
517:     ST  1,-59(1)	Store old fp in ghost frame 
*                       Load param 1
518:    LDC  3,7(6)	Load integer constant 
519:     ST  3,-61(1)	Store parameter 
*                       Jump to getnxtindex
520:    LDA  1,-59(1)	Load address of new frame 
521:    LDA  3,1(7)	Return address in ac 
522:    LDA  7,-401(7)	CALL getnxtindex
523:    LDA  3,0(2)	Save the result in ac 
*                       End call to getnxtindex
524:    LDA  4,-26(1)	Load address of base of array y
525:    SUB  3,4,3	Compute offset of value 
526:     LD  3,0(3)	Load the value 
527:     ST  3,-59(1)	Save left side 
528:    LDC  3,1(6)	Load integer constant 
529:     LD  4,-59(1)	Load left into ac1 
530:    ADD  3,4,3	Op + 
531:     LD  4,-58(1)	Restore index 
532:    LDA  5,-26(1)	Load address of base of array y
533:    SUB  5,5,4	Compute offset of value 
534:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  dog
535:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
536:    LDC  3,4(6)	Load integer constant 
537:    LDA  4,-26(1)	Load address of base of array y
538:    SUB  3,4,3	Compute offset of value 
539:     LD  3,0(3)	Load the value 
540:     ST  3,-60(1)	Store parameter 
*                       Load param 2
541:    LDA  3,-26(1)	Load address of base of array y
542:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
543:    LDA  1,-58(1)	Load address of new frame 
544:    LDA  3,1(7)	Return address in ac 
545:    LDA  7,-468(7)	CALL dog
546:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
547:    LDC  3,5(6)	Load integer constant 
548:     ST  3,-58(1)	Save index 
549:    LDC  3,0(6)	Load integer constant 
550:     LD  4,-58(1)	Restore index 
551:    LDA  5,-4(1)	Load address of base of array c
552:    SUB  5,5,4	Compute offset of value 
553:     ST  3,0(5)	Store variable c
* EXPRESSION
554:    LDC  3,0(6)	Load integer constant 
555:     ST  3,-58(1)	Save index 
556:    LDC  3,3(6)	Load integer constant 
557:     LD  4,-58(1)	Restore index 
558:    LDA  5,-48(1)	Load address of base of array w
559:    SUB  5,5,4	Compute offset of value 
560:     ST  3,0(5)	Store variable w
* EXPRESSION
561:    LDC  3,3(6)	Load integer constant 
562:     ST  3,-58(1)	Save index 
563:    LDC  3,9(6)	Load integer constant 
564:     LD  4,-58(1)	Restore index 
565:    LDA  5,-37(1)	Load address of base of array z
566:    SUB  5,5,4	Compute offset of value 
567:     ST  3,0(5)	Store variable z
* EXPRESSION
568:    LDC  3,9(6)	Load integer constant 
569:     ST  3,-58(1)	Save index 
570:    LDC  3,1(6)	Load integer constant 
571:     LD  4,-58(1)	Restore index 
572:    LDA  5,-26(1)	Load address of base of array y
573:    SUB  5,5,4	Compute offset of value 
574:     ST  3,0(5)	Store variable y
* EXPRESSION
575:    LDC  3,5(6)	Load integer constant 
576:    LDA  4,-4(1)	Load address of base of array c
577:    SUB  3,4,3	Compute offset of value 
578:     LD  3,0(3)	Load the value 
579:    LDA  4,-48(1)	Load address of base of array w
580:    SUB  3,4,3	Compute offset of value 
581:     LD  3,0(3)	Load the value 
582:    LDA  4,-37(1)	Load address of base of array z
583:    SUB  3,4,3	Compute offset of value 
584:     LD  3,0(3)	Load the value 
585:    LDA  4,-26(1)	Load address of base of array y
586:    SUB  3,4,3	Compute offset of value 
587:     LD  3,0(3)	Load the value 
588:     ST  3,-58(1)	Save index 
589:    LDC  3,77(6)	Load integer constant 
590:     LD  4,-58(1)	Restore index 
591:    LDA  5,-15(1)	Load address of base of array d
592:    SUB  5,5,4	Compute offset of value 
593:     ST  3,0(5)	Store variable d
* EXPRESSION
594:    LDC  3,9(6)	Load integer constant 
595:     ST  3,-58(1)	Save index 
596:    LDC  3,1(6)	Load integer constant 
597:    LDA  4,-15(1)	Load address of base of array d
598:    SUB  3,4,3	Compute offset of value 
599:     LD  3,0(3)	Load the value 
600:     LD  4,-58(1)	Restore index 
601:    LDA  5,-4(1)	Load address of base of array c
602:    SUB  5,5,4	Compute offset of value 
603:     ST  3,0(5)	Store variable c
* EXPRESSION
*                       Begin call to  dog
604:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
605:    LDC  3,66(6)	Load integer constant 
606:     ST  3,-60(1)	Store parameter 
*                       Load param 2
607:    LDA  3,-4(1)	Load address of base of array c
608:     ST  3,-61(1)	Store parameter 
*                       Jump to dog
609:    LDA  1,-58(1)	Load address of new frame 
610:    LDA  3,1(7)	Return address in ac 
611:    LDA  7,-534(7)	CALL dog
612:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* COMPOUND
* EXPRESSION
613:    LDC  3,0(6)	Load integer constant 
614:     ST  3,-58(1)	Store variable p
* WHILE
615:     LD  3,-58(1)	Load variable p
616:     ST  3,-60(1)	Save left side 
617:    LDC  3,10(6)	Load integer constant 
618:     LD  4,-60(1)	Load left into ac1 
619:    TLT  3,4,3	Op < 
620:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
622:     LD  3,-58(1)	Load variable p
623:     ST  3,-59(1)	Store variable q
* EXPRESSION
624:    LDC  3,9(6)	Load integer constant 
625:     ST  3,-60(1)	Save left side 
626:     LD  3,-59(1)	Load variable q
627:     LD  4,-60(1)	Load left into ac1 
628:    SUB  3,4,3	Op - 
629:     ST  3,-60(1)	Save index 
630:    LDC  3,1(6)	Load integer constant 
631:     LD  4,-58(1)	load lhs variable p
632:    ADD  3,4,3	op += 
633:     ST  3,-58(1)	Store variable p
634:     LD  4,-60(1)	Restore index 
635:    LDA  5,-4(1)	Load address of base of array c
636:    SUB  5,5,4	Compute offset of value 
637:     ST  3,0(5)	Store variable c
* END COMPOUND
638:    LDA  7,-24(7)	go to beginning of loop 
621:    LDA  7,17(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* EXPRESSION
*                       Begin call to  showIntArray
639:     ST  1,-58(1)	Store old fp in ghost frame 
*                       Load param 1
640:    LDA  3,-4(1)	Load address of base of array c
641:     ST  3,-60(1)	Store parameter 
*                       Load param 2
642:    LDC  3,10(6)	Load integer constant 
643:     ST  3,-61(1)	Store parameter 
*                       Jump to showIntArray
644:    LDA  1,-58(1)	Load address of new frame 
645:    LDA  3,1(7)	Return address in ac 
646:    LDA  7,-605(7)	CALL showIntArray
647:    LDA  3,0(2)	Save the result in ac 
*                       End call to showIntArray
* END COMPOUND
* Add standard closing in case there is no return statement
648:    LDC  2,0(6)	Set return value to 0 
649:     LD  3,-1(1)	Load return address 
650:     LD  1,0(1)	Adjust fp 
651:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,651(7)	Jump to init [backpatch] 
* INIT
652:     LD  0,0(0)	Set the global pointer 
653:    LDA  1,-12(0)	set first frame at end of globals 
654:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
655:    LDC  3,10(6)	load size of array gl
656:     ST  3,0(0)	save size of array gl
* END INIT GLOBALS AND STATICS
657:    LDA  3,1(7)	Return address in ac 
658:    LDA  7,-523(7)	Jump to main 
659:   HALT  0,0,0	DONE! 
* END INIT
