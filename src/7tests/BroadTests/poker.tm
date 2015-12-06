* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  poker.c-
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
* FUNCTION suit
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* RETURN
 43:     LD  3,-2(1)	Load variable c
 44:     ST  3,-3(1)	Save left side 
 45:     LD  3,0(0)	Load variable numSuits
 46:     LD  4,-3(1)	Load left into ac1 
 47:    DIV  5,4,3	Op % 
 48:    MUL  5,5,3	 
 49:    SUB  3,4,5	 
 50:    LDA  2,0(3)	Copy result to rt register 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 54:    LDC  2,0(6)	Set return value to 0 
 55:     LD  3,-1(1)	Load return address 
 56:     LD  1,0(1)	Adjust fp 
 57:    LDA  7,0(3)	Return 
* END FUNCTION suit
* FUNCTION pips
 58:     ST  3,-1(1)	Store return address. 
* COMPOUND
* RETURN
 59:     LD  3,-2(1)	Load variable c
 60:     ST  3,-3(1)	Save left side 
 61:     LD  3,0(0)	Load variable numSuits
 62:     LD  4,-3(1)	Load left into ac1 
 63:    DIV  3,4,3	Op / 
 64:    LDA  2,0(3)	Copy result to rt register 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 68:    LDC  2,0(6)	Set return value to 0 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    LDA  7,0(3)	Return 
* END FUNCTION pips
* FUNCTION p
 72:     ST  3,-1(1)	Store return address. 
* COMPOUND
* RETURN
*                       Begin call to  pips
 73:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 74:     LD  3,-2(1)	Load variable a
 75:     ST  3,-6(1)	Store parameter 
*                       Jump to pips
 76:    LDA  1,-4(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-21(7)	CALL pips
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
 80:     ST  3,-4(1)	Save left side 
*                       Begin call to  pips
 81:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 82:     LD  3,-3(1)	Load variable b
 83:     ST  3,-7(1)	Store parameter 
*                       Jump to pips
 84:    LDA  1,-5(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-29(7)	CALL pips
 87:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
 88:     LD  4,-4(1)	Load left into ac1 
 89:    TEQ  3,4,3	Op == 
 90:    LDA  2,0(3)	Copy result to rt register 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 94:    LDC  2,0(6)	Set return value to 0 
 95:     LD  3,-1(1)	Load return address 
 96:     LD  1,0(1)	Adjust fp 
 97:    LDA  7,0(3)	Return 
* END FUNCTION p
* FUNCTION ppp
 98:     ST  3,-1(1)	Store return address. 
* COMPOUND
* RETURN
*                       Begin call to  p
 99:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
100:     LD  3,-2(1)	Load variable a
101:     ST  3,-7(1)	Store parameter 
*                       Load param 2
102:     LD  3,-3(1)	Load variable b
103:     ST  3,-8(1)	Store parameter 
*                       Jump to p
104:    LDA  1,-5(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-35(7)	CALL p
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
108:     ST  3,-5(1)	Save left side 
*                       Begin call to  p
109:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
110:     LD  3,-3(1)	Load variable b
111:     ST  3,-8(1)	Store parameter 
*                       Load param 2
112:     LD  3,-4(1)	Load variable c
113:     ST  3,-9(1)	Store parameter 
*                       Jump to p
114:    LDA  1,-6(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-45(7)	CALL p
117:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
118:     LD  4,-5(1)	Load left into ac1 
119:    AND  3,4,3	Op AND 
120:    LDA  2,0(3)	Copy result to rt register 
121:     LD  3,-1(1)	Load return address 
122:     LD  1,0(1)	Adjust fp 
123:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
124:    LDC  2,0(6)	Set return value to 0 
125:     LD  3,-1(1)	Load return address 
126:     LD  1,0(1)	Adjust fp 
127:    LDA  7,0(3)	Return 
* END FUNCTION ppp
* FUNCTION pppp
128:     ST  3,-1(1)	Store return address. 
* COMPOUND
* RETURN
*                       Begin call to  p
129:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
130:     LD  3,-2(1)	Load variable a
131:     ST  3,-8(1)	Store parameter 
*                       Load param 2
132:     LD  3,-3(1)	Load variable b
133:     ST  3,-9(1)	Store parameter 
*                       Jump to p
134:    LDA  1,-6(1)	Load address of new frame 
135:    LDA  3,1(7)	Return address in ac 
136:    LDA  7,-65(7)	CALL p
137:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
138:     ST  3,-6(1)	Save left side 
*                       Begin call to  p
139:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
140:     LD  3,-3(1)	Load variable b
141:     ST  3,-9(1)	Store parameter 
*                       Load param 2
142:     LD  3,-4(1)	Load variable c
143:     ST  3,-10(1)	Store parameter 
*                       Jump to p
144:    LDA  1,-7(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-75(7)	CALL p
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
148:     LD  4,-6(1)	Load left into ac1 
149:    AND  3,4,3	Op AND 
150:     ST  3,-6(1)	Save left side 
*                       Begin call to  p
151:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
152:     LD  3,-4(1)	Load variable c
153:     ST  3,-9(1)	Store parameter 
*                       Load param 2
154:     LD  3,-5(1)	Load variable d
155:     ST  3,-10(1)	Store parameter 
*                       Jump to p
156:    LDA  1,-7(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-87(7)	CALL p
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
160:     LD  4,-6(1)	Load left into ac1 
161:    AND  3,4,3	Op AND 
162:    LDA  2,0(3)	Copy result to rt register 
163:     LD  3,-1(1)	Load return address 
164:     LD  1,0(1)	Adjust fp 
165:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
166:    LDC  2,0(6)	Set return value to 0 
167:     LD  3,-1(1)	Load return address 
168:     LD  1,0(1)	Adjust fp 
169:    LDA  7,0(3)	Return 
* END FUNCTION pppp
* FUNCTION handtype
170:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  suit
171:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
172:     LD  3,-2(1)	Load variable a
173:     ST  3,-10(1)	Store parameter 
*                       Jump to suit
174:    LDA  1,-8(1)	Load address of new frame 
175:    LDA  3,1(7)	Return address in ac 
176:    LDA  7,-135(7)	CALL suit
177:    LDA  3,0(2)	Save the result in ac 
*                       End call to suit
178:     ST  3,-8(1)	Save left side 
*                       Begin call to  suit
179:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
180:     LD  3,-3(1)	Load variable b
181:     ST  3,-11(1)	Store parameter 
*                       Jump to suit
182:    LDA  1,-9(1)	Load address of new frame 
183:    LDA  3,1(7)	Return address in ac 
184:    LDA  7,-143(7)	CALL suit
185:    LDA  3,0(2)	Save the result in ac 
*                       End call to suit
186:     LD  4,-8(1)	Load left into ac1 
187:    TEQ  3,4,3	Op == 
188:     ST  3,-8(1)	Save left side 
*                       Begin call to  suit
189:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
190:     LD  3,-2(1)	Load variable a
191:     ST  3,-11(1)	Store parameter 
*                       Jump to suit
192:    LDA  1,-9(1)	Load address of new frame 
193:    LDA  3,1(7)	Return address in ac 
194:    LDA  7,-153(7)	CALL suit
195:    LDA  3,0(2)	Save the result in ac 
*                       End call to suit
196:     ST  3,-9(1)	Save left side 
*                       Begin call to  suit
197:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
198:     LD  3,-4(1)	Load variable c
199:     ST  3,-12(1)	Store parameter 
*                       Jump to suit
200:    LDA  1,-10(1)	Load address of new frame 
201:    LDA  3,1(7)	Return address in ac 
202:    LDA  7,-161(7)	CALL suit
203:    LDA  3,0(2)	Save the result in ac 
*                       End call to suit
204:     LD  4,-9(1)	Load left into ac1 
205:    TEQ  3,4,3	Op == 
206:     LD  4,-8(1)	Load left into ac1 
207:    AND  3,4,3	Op AND 
208:     ST  3,-8(1)	Save left side 
*                       Begin call to  suit
209:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
210:     LD  3,-2(1)	Load variable a
211:     ST  3,-11(1)	Store parameter 
*                       Jump to suit
212:    LDA  1,-9(1)	Load address of new frame 
213:    LDA  3,1(7)	Return address in ac 
214:    LDA  7,-173(7)	CALL suit
215:    LDA  3,0(2)	Save the result in ac 
*                       End call to suit
216:     ST  3,-9(1)	Save left side 
*                       Begin call to  suit
217:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
218:     LD  3,-5(1)	Load variable d
219:     ST  3,-12(1)	Store parameter 
*                       Jump to suit
220:    LDA  1,-10(1)	Load address of new frame 
221:    LDA  3,1(7)	Return address in ac 
222:    LDA  7,-181(7)	CALL suit
223:    LDA  3,0(2)	Save the result in ac 
*                       End call to suit
224:     LD  4,-9(1)	Load left into ac1 
225:    TEQ  3,4,3	Op == 
226:     LD  4,-8(1)	Load left into ac1 
227:    AND  3,4,3	Op AND 
228:     ST  3,-8(1)	Save left side 
*                       Begin call to  suit
229:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
230:     LD  3,-2(1)	Load variable a
231:     ST  3,-11(1)	Store parameter 
*                       Jump to suit
232:    LDA  1,-9(1)	Load address of new frame 
233:    LDA  3,1(7)	Return address in ac 
234:    LDA  7,-193(7)	CALL suit
235:    LDA  3,0(2)	Save the result in ac 
*                       End call to suit
236:     ST  3,-9(1)	Save left side 
*                       Begin call to  suit
237:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
238:     LD  3,-6(1)	Load variable e
239:     ST  3,-12(1)	Store parameter 
*                       Jump to suit
240:    LDA  1,-10(1)	Load address of new frame 
241:    LDA  3,1(7)	Return address in ac 
242:    LDA  7,-201(7)	CALL suit
243:    LDA  3,0(2)	Save the result in ac 
*                       End call to suit
244:     LD  4,-9(1)	Load left into ac1 
245:    TEQ  3,4,3	Op == 
246:     LD  4,-8(1)	Load left into ac1 
247:    AND  3,4,3	Op AND 
248:     ST  3,-7(1)	Store variable isflush
* IF
249:     LD  3,-7(1)	Load variable isflush
250:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
251:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
252:     LD  3,-2(1)	Load variable a
253:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
254:    LDA  1,-9(1)	Load address of new frame 
255:    LDA  3,1(7)	Return address in ac 
256:    LDA  7,-199(7)	CALL pips
257:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
258:     ST  3,-9(1)	Save left side 
259:    LDC  3,0(6)	Load integer constant 
260:     LD  4,-9(1)	Load left into ac1 
261:    TEQ  3,4,3	Op == 
262:     LD  4,-8(1)	Load left into ac1 
263:    AND  3,4,3	Op AND 
264:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
265:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
266:     LD  3,-3(1)	Load variable b
267:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
268:    LDA  1,-9(1)	Load address of new frame 
269:    LDA  3,1(7)	Return address in ac 
270:    LDA  7,-213(7)	CALL pips
271:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
272:     ST  3,-9(1)	Save left side 
273:     LD  3,-1(0)	Load variable numPips
274:     ST  3,-10(1)	Save left side 
275:    LDC  3,4(6)	Load integer constant 
276:     LD  4,-10(1)	Load left into ac1 
277:    SUB  3,4,3	Op - 
278:     LD  4,-9(1)	Load left into ac1 
279:    TEQ  3,4,3	Op == 
280:     LD  4,-8(1)	Load left into ac1 
281:    AND  3,4,3	Op AND 
282:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
283:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
284:     LD  3,-6(1)	Load variable e
285:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
286:    LDA  1,-9(1)	Load address of new frame 
287:    LDA  3,1(7)	Return address in ac 
288:    LDA  7,-231(7)	CALL pips
289:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
290:     ST  3,-9(1)	Save left side 
291:     LD  3,-1(0)	Load variable numPips
292:     ST  3,-10(1)	Save left side 
293:    LDC  3,1(6)	Load integer constant 
294:     LD  4,-10(1)	Load left into ac1 
295:    SUB  3,4,3	Op - 
296:     LD  4,-9(1)	Load left into ac1 
297:    TEQ  3,4,3	Op == 
298:     LD  4,-8(1)	Load left into ac1 
299:    AND  3,4,3	Op AND 
* THEN
* RETURN
301:    LDC  3,0(6)	Load integer constant 
302:    LDA  2,0(3)	Copy result to rt register 
303:     LD  3,-1(1)	Load return address 
304:     LD  1,0(1)	Adjust fp 
305:    LDA  7,0(3)	Return 
300:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
307:     LD  3,-7(1)	Load variable isflush
308:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
309:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
310:     LD  3,-2(1)	Load variable a
311:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
312:    LDA  1,-9(1)	Load address of new frame 
313:    LDA  3,1(7)	Return address in ac 
314:    LDA  7,-257(7)	CALL pips
315:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
316:     ST  3,-9(1)	Save left side 
*                       Begin call to  pips
317:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
318:     LD  3,-6(1)	Load variable e
319:     ST  3,-12(1)	Store parameter 
*                       Jump to pips
320:    LDA  1,-10(1)	Load address of new frame 
321:    LDA  3,1(7)	Return address in ac 
322:    LDA  7,-265(7)	CALL pips
323:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
324:     ST  3,-10(1)	Save left side 
325:    LDC  3,4(6)	Load integer constant 
326:     LD  4,-10(1)	Load left into ac1 
327:    SUB  3,4,3	Op - 
328:     LD  4,-9(1)	Load left into ac1 
329:    TEQ  3,4,3	Op == 
330:     LD  4,-8(1)	Load left into ac1 
331:    AND  3,4,3	Op AND 
* THEN
* RETURN
333:    LDC  3,1(6)	Load integer constant 
334:    LDA  2,0(3)	Copy result to rt register 
335:     LD  3,-1(1)	Load return address 
336:     LD  1,0(1)	Adjust fp 
337:    LDA  7,0(3)	Return 
332:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
*                       Begin call to  pppp
339:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
340:     LD  3,-2(1)	Load variable a
341:     ST  3,-10(1)	Store parameter 
*                       Load param 2
342:     LD  3,-3(1)	Load variable b
343:     ST  3,-11(1)	Store parameter 
*                       Load param 3
344:     LD  3,-4(1)	Load variable c
345:     ST  3,-12(1)	Store parameter 
*                       Load param 4
346:     LD  3,-5(1)	Load variable d
347:     ST  3,-13(1)	Store parameter 
*                       Jump to pppp
348:    LDA  1,-8(1)	Load address of new frame 
349:    LDA  3,1(7)	Return address in ac 
350:    LDA  7,-223(7)	CALL pppp
351:    LDA  3,0(2)	Save the result in ac 
*                       End call to pppp
352:     ST  3,-8(1)	Save left side 
*                       Begin call to  pppp
353:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
354:     LD  3,-3(1)	Load variable b
355:     ST  3,-11(1)	Store parameter 
*                       Load param 2
356:     LD  3,-4(1)	Load variable c
357:     ST  3,-12(1)	Store parameter 
*                       Load param 3
358:     LD  3,-5(1)	Load variable d
359:     ST  3,-13(1)	Store parameter 
*                       Load param 4
360:     LD  3,-6(1)	Load variable e
361:     ST  3,-14(1)	Store parameter 
*                       Jump to pppp
362:    LDA  1,-9(1)	Load address of new frame 
363:    LDA  3,1(7)	Return address in ac 
364:    LDA  7,-237(7)	CALL pppp
365:    LDA  3,0(2)	Save the result in ac 
*                       End call to pppp
366:     LD  4,-8(1)	Load left into ac1 
367:     OR  3,4,3	Op OR 
* THEN
* RETURN
369:    LDC  3,2(6)	Load integer constant 
370:    LDA  2,0(3)	Copy result to rt register 
371:     LD  3,-1(1)	Load return address 
372:     LD  1,0(1)	Adjust fp 
373:    LDA  7,0(3)	Return 
368:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
*                       Begin call to  ppp
375:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
376:     LD  3,-2(1)	Load variable a
377:     ST  3,-10(1)	Store parameter 
*                       Load param 2
378:     LD  3,-3(1)	Load variable b
379:     ST  3,-11(1)	Store parameter 
*                       Load param 3
380:     LD  3,-4(1)	Load variable c
381:     ST  3,-12(1)	Store parameter 
*                       Jump to ppp
382:    LDA  1,-8(1)	Load address of new frame 
383:    LDA  3,1(7)	Return address in ac 
384:    LDA  7,-287(7)	CALL ppp
385:    LDA  3,0(2)	Save the result in ac 
*                       End call to ppp
386:     ST  3,-8(1)	Save left side 
*                       Begin call to  p
387:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
388:     LD  3,-5(1)	Load variable d
389:     ST  3,-11(1)	Store parameter 
*                       Load param 2
390:     LD  3,-6(1)	Load variable e
391:     ST  3,-12(1)	Store parameter 
*                       Jump to p
392:    LDA  1,-9(1)	Load address of new frame 
393:    LDA  3,1(7)	Return address in ac 
394:    LDA  7,-323(7)	CALL p
395:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
396:     LD  4,-8(1)	Load left into ac1 
397:    AND  3,4,3	Op AND 
398:     ST  3,-8(1)	Save left side 
*                       Begin call to  p
399:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
400:     LD  3,-2(1)	Load variable a
401:     ST  3,-11(1)	Store parameter 
*                       Load param 2
402:     LD  3,-3(1)	Load variable b
403:     ST  3,-12(1)	Store parameter 
*                       Jump to p
404:    LDA  1,-9(1)	Load address of new frame 
405:    LDA  3,1(7)	Return address in ac 
406:    LDA  7,-335(7)	CALL p
407:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
408:     ST  3,-9(1)	Save left side 
*                       Begin call to  ppp
409:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
410:     LD  3,-4(1)	Load variable c
411:     ST  3,-12(1)	Store parameter 
*                       Load param 2
412:     LD  3,-5(1)	Load variable d
413:     ST  3,-13(1)	Store parameter 
*                       Load param 3
414:     LD  3,-6(1)	Load variable e
415:     ST  3,-14(1)	Store parameter 
*                       Jump to ppp
416:    LDA  1,-10(1)	Load address of new frame 
417:    LDA  3,1(7)	Return address in ac 
418:    LDA  7,-321(7)	CALL ppp
419:    LDA  3,0(2)	Save the result in ac 
*                       End call to ppp
420:     LD  4,-9(1)	Load left into ac1 
421:    AND  3,4,3	Op AND 
422:     LD  4,-8(1)	Load left into ac1 
423:     OR  3,4,3	Op OR 
* THEN
* RETURN
425:    LDC  3,3(6)	Load integer constant 
426:    LDA  2,0(3)	Copy result to rt register 
427:     LD  3,-1(1)	Load return address 
428:     LD  1,0(1)	Adjust fp 
429:    LDA  7,0(3)	Return 
424:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
431:     LD  3,-7(1)	Load variable isflush
* THEN
* RETURN
433:    LDC  3,4(6)	Load integer constant 
434:    LDA  2,0(3)	Copy result to rt register 
435:     LD  3,-1(1)	Load return address 
436:     LD  1,0(1)	Adjust fp 
437:    LDA  7,0(3)	Return 
432:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
*                       Begin call to  pips
439:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
440:     LD  3,-2(1)	Load variable a
441:     ST  3,-10(1)	Store parameter 
*                       Jump to pips
442:    LDA  1,-8(1)	Load address of new frame 
443:    LDA  3,1(7)	Return address in ac 
444:    LDA  7,-387(7)	CALL pips
445:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
446:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
447:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
448:     LD  3,-3(1)	Load variable b
449:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
450:    LDA  1,-9(1)	Load address of new frame 
451:    LDA  3,1(7)	Return address in ac 
452:    LDA  7,-395(7)	CALL pips
453:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
454:     ST  3,-9(1)	Save left side 
455:    LDC  3,1(6)	Load integer constant 
456:     LD  4,-9(1)	Load left into ac1 
457:    SUB  3,4,3	Op - 
458:     LD  4,-8(1)	Load left into ac1 
459:    TEQ  3,4,3	Op == 
460:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
461:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
462:     LD  3,-3(1)	Load variable b
463:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
464:    LDA  1,-9(1)	Load address of new frame 
465:    LDA  3,1(7)	Return address in ac 
466:    LDA  7,-409(7)	CALL pips
467:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
468:     ST  3,-9(1)	Save left side 
*                       Begin call to  pips
469:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
470:     LD  3,-4(1)	Load variable c
471:     ST  3,-12(1)	Store parameter 
*                       Jump to pips
472:    LDA  1,-10(1)	Load address of new frame 
473:    LDA  3,1(7)	Return address in ac 
474:    LDA  7,-417(7)	CALL pips
475:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
476:     ST  3,-10(1)	Save left side 
477:    LDC  3,1(6)	Load integer constant 
478:     LD  4,-10(1)	Load left into ac1 
479:    SUB  3,4,3	Op - 
480:     LD  4,-9(1)	Load left into ac1 
481:    TEQ  3,4,3	Op == 
482:     LD  4,-8(1)	Load left into ac1 
483:    AND  3,4,3	Op AND 
484:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
485:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
486:     LD  3,-4(1)	Load variable c
487:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
488:    LDA  1,-9(1)	Load address of new frame 
489:    LDA  3,1(7)	Return address in ac 
490:    LDA  7,-433(7)	CALL pips
491:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
492:     ST  3,-9(1)	Save left side 
*                       Begin call to  pips
493:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
494:     LD  3,-5(1)	Load variable d
495:     ST  3,-12(1)	Store parameter 
*                       Jump to pips
496:    LDA  1,-10(1)	Load address of new frame 
497:    LDA  3,1(7)	Return address in ac 
498:    LDA  7,-441(7)	CALL pips
499:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
500:     ST  3,-10(1)	Save left side 
501:    LDC  3,1(6)	Load integer constant 
502:     LD  4,-10(1)	Load left into ac1 
503:    SUB  3,4,3	Op - 
504:     LD  4,-9(1)	Load left into ac1 
505:    TEQ  3,4,3	Op == 
506:     LD  4,-8(1)	Load left into ac1 
507:    AND  3,4,3	Op AND 
508:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
509:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
510:     LD  3,-5(1)	Load variable d
511:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
512:    LDA  1,-9(1)	Load address of new frame 
513:    LDA  3,1(7)	Return address in ac 
514:    LDA  7,-457(7)	CALL pips
515:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
516:     ST  3,-9(1)	Save left side 
*                       Begin call to  pips
517:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
518:     LD  3,-6(1)	Load variable e
519:     ST  3,-12(1)	Store parameter 
*                       Jump to pips
520:    LDA  1,-10(1)	Load address of new frame 
521:    LDA  3,1(7)	Return address in ac 
522:    LDA  7,-465(7)	CALL pips
523:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
524:     ST  3,-10(1)	Save left side 
525:    LDC  3,1(6)	Load integer constant 
526:     LD  4,-10(1)	Load left into ac1 
527:    SUB  3,4,3	Op - 
528:     LD  4,-9(1)	Load left into ac1 
529:    TEQ  3,4,3	Op == 
530:     LD  4,-8(1)	Load left into ac1 
531:    AND  3,4,3	Op AND 
532:     ST  3,-8(1)	Save left side 
*                       Begin call to  pips
533:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
534:     LD  3,-2(1)	Load variable a
535:     ST  3,-11(1)	Store parameter 
*                       Jump to pips
536:    LDA  1,-9(1)	Load address of new frame 
537:    LDA  3,1(7)	Return address in ac 
538:    LDA  7,-481(7)	CALL pips
539:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
540:     ST  3,-9(1)	Save left side 
541:    LDC  3,0(6)	Load integer constant 
542:     LD  4,-9(1)	Load left into ac1 
543:    TEQ  3,4,3	Op == 
544:     ST  3,-9(1)	Save left side 
*                       Begin call to  pips
545:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
546:     LD  3,-3(1)	Load variable b
547:     ST  3,-12(1)	Store parameter 
*                       Jump to pips
548:    LDA  1,-10(1)	Load address of new frame 
549:    LDA  3,1(7)	Return address in ac 
550:    LDA  7,-493(7)	CALL pips
551:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
552:     ST  3,-10(1)	Save left side 
553:     LD  3,-1(0)	Load variable numPips
554:     ST  3,-11(1)	Save left side 
555:    LDC  3,4(6)	Load integer constant 
556:     LD  4,-11(1)	Load left into ac1 
557:    SUB  3,4,3	Op - 
558:     LD  4,-10(1)	Load left into ac1 
559:    TEQ  3,4,3	Op == 
560:     LD  4,-9(1)	Load left into ac1 
561:    AND  3,4,3	Op AND 
562:     ST  3,-9(1)	Save left side 
*                       Begin call to  pips
563:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
564:     LD  3,-4(1)	Load variable c
565:     ST  3,-12(1)	Store parameter 
*                       Jump to pips
566:    LDA  1,-10(1)	Load address of new frame 
567:    LDA  3,1(7)	Return address in ac 
568:    LDA  7,-511(7)	CALL pips
569:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
570:     ST  3,-10(1)	Save left side 
571:     LD  3,-1(0)	Load variable numPips
572:     ST  3,-11(1)	Save left side 
573:    LDC  3,3(6)	Load integer constant 
574:     LD  4,-11(1)	Load left into ac1 
575:    SUB  3,4,3	Op - 
576:     LD  4,-10(1)	Load left into ac1 
577:    TEQ  3,4,3	Op == 
578:     LD  4,-9(1)	Load left into ac1 
579:    AND  3,4,3	Op AND 
580:     ST  3,-9(1)	Save left side 
*                       Begin call to  pips
581:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
582:     LD  3,-5(1)	Load variable d
583:     ST  3,-12(1)	Store parameter 
*                       Jump to pips
584:    LDA  1,-10(1)	Load address of new frame 
585:    LDA  3,1(7)	Return address in ac 
586:    LDA  7,-529(7)	CALL pips
587:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
588:     ST  3,-10(1)	Save left side 
589:     LD  3,-1(0)	Load variable numPips
590:     ST  3,-11(1)	Save left side 
591:    LDC  3,2(6)	Load integer constant 
592:     LD  4,-11(1)	Load left into ac1 
593:    SUB  3,4,3	Op - 
594:     LD  4,-10(1)	Load left into ac1 
595:    TEQ  3,4,3	Op == 
596:     LD  4,-9(1)	Load left into ac1 
597:    AND  3,4,3	Op AND 
598:     ST  3,-9(1)	Save left side 
*                       Begin call to  pips
599:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
600:     LD  3,-6(1)	Load variable e
601:     ST  3,-12(1)	Store parameter 
*                       Jump to pips
602:    LDA  1,-10(1)	Load address of new frame 
603:    LDA  3,1(7)	Return address in ac 
604:    LDA  7,-547(7)	CALL pips
605:    LDA  3,0(2)	Save the result in ac 
*                       End call to pips
606:     ST  3,-10(1)	Save left side 
607:     LD  3,-1(0)	Load variable numPips
608:     ST  3,-11(1)	Save left side 
609:    LDC  3,1(6)	Load integer constant 
610:     LD  4,-11(1)	Load left into ac1 
611:    SUB  3,4,3	Op - 
612:     LD  4,-10(1)	Load left into ac1 
613:    TEQ  3,4,3	Op == 
614:     LD  4,-9(1)	Load left into ac1 
615:    AND  3,4,3	Op AND 
616:     LD  4,-8(1)	Load left into ac1 
617:     OR  3,4,3	Op OR 
* THEN
* RETURN
619:    LDC  3,5(6)	Load integer constant 
620:    LDA  2,0(3)	Copy result to rt register 
621:     LD  3,-1(1)	Load return address 
622:     LD  1,0(1)	Adjust fp 
623:    LDA  7,0(3)	Return 
618:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
*                       Begin call to  ppp
625:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
626:     LD  3,-2(1)	Load variable a
627:     ST  3,-10(1)	Store parameter 
*                       Load param 2
628:     LD  3,-3(1)	Load variable b
629:     ST  3,-11(1)	Store parameter 
*                       Load param 3
630:     LD  3,-4(1)	Load variable c
631:     ST  3,-12(1)	Store parameter 
*                       Jump to ppp
632:    LDA  1,-8(1)	Load address of new frame 
633:    LDA  3,1(7)	Return address in ac 
634:    LDA  7,-537(7)	CALL ppp
635:    LDA  3,0(2)	Save the result in ac 
*                       End call to ppp
636:     ST  3,-8(1)	Save left side 
*                       Begin call to  ppp
637:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
638:     LD  3,-3(1)	Load variable b
639:     ST  3,-11(1)	Store parameter 
*                       Load param 2
640:     LD  3,-4(1)	Load variable c
641:     ST  3,-12(1)	Store parameter 
*                       Load param 3
642:     LD  3,-5(1)	Load variable d
643:     ST  3,-13(1)	Store parameter 
*                       Jump to ppp
644:    LDA  1,-9(1)	Load address of new frame 
645:    LDA  3,1(7)	Return address in ac 
646:    LDA  7,-549(7)	CALL ppp
647:    LDA  3,0(2)	Save the result in ac 
*                       End call to ppp
648:     LD  4,-8(1)	Load left into ac1 
649:     OR  3,4,3	Op OR 
650:     ST  3,-8(1)	Save left side 
*                       Begin call to  ppp
651:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
652:     LD  3,-4(1)	Load variable c
653:     ST  3,-11(1)	Store parameter 
*                       Load param 2
654:     LD  3,-5(1)	Load variable d
655:     ST  3,-12(1)	Store parameter 
*                       Load param 3
656:     LD  3,-6(1)	Load variable e
657:     ST  3,-13(1)	Store parameter 
*                       Jump to ppp
658:    LDA  1,-9(1)	Load address of new frame 
659:    LDA  3,1(7)	Return address in ac 
660:    LDA  7,-563(7)	CALL ppp
661:    LDA  3,0(2)	Save the result in ac 
*                       End call to ppp
662:     LD  4,-8(1)	Load left into ac1 
663:     OR  3,4,3	Op OR 
* THEN
* RETURN
665:    LDC  3,6(6)	Load integer constant 
666:    LDA  2,0(3)	Copy result to rt register 
667:     LD  3,-1(1)	Load return address 
668:     LD  1,0(1)	Adjust fp 
669:    LDA  7,0(3)	Return 
664:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
*                       Begin call to  p
671:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
672:     LD  3,-2(1)	Load variable a
673:     ST  3,-10(1)	Store parameter 
*                       Load param 2
674:     LD  3,-3(1)	Load variable b
675:     ST  3,-11(1)	Store parameter 
*                       Jump to p
676:    LDA  1,-8(1)	Load address of new frame 
677:    LDA  3,1(7)	Return address in ac 
678:    LDA  7,-607(7)	CALL p
679:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
680:     ST  3,-8(1)	Save left side 
*                       Begin call to  p
681:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
682:     LD  3,-4(1)	Load variable c
683:     ST  3,-11(1)	Store parameter 
*                       Load param 2
684:     LD  3,-5(1)	Load variable d
685:     ST  3,-12(1)	Store parameter 
*                       Jump to p
686:    LDA  1,-9(1)	Load address of new frame 
687:    LDA  3,1(7)	Return address in ac 
688:    LDA  7,-617(7)	CALL p
689:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
690:     LD  4,-8(1)	Load left into ac1 
691:    AND  3,4,3	Op AND 
692:     ST  3,-8(1)	Save left side 
*                       Begin call to  p
693:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
694:     LD  3,-2(1)	Load variable a
695:     ST  3,-11(1)	Store parameter 
*                       Load param 2
696:     LD  3,-3(1)	Load variable b
697:     ST  3,-12(1)	Store parameter 
*                       Jump to p
698:    LDA  1,-9(1)	Load address of new frame 
699:    LDA  3,1(7)	Return address in ac 
700:    LDA  7,-629(7)	CALL p
701:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
702:     ST  3,-9(1)	Save left side 
*                       Begin call to  p
703:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
704:     LD  3,-5(1)	Load variable d
705:     ST  3,-12(1)	Store parameter 
*                       Load param 2
706:     LD  3,-6(1)	Load variable e
707:     ST  3,-13(1)	Store parameter 
*                       Jump to p
708:    LDA  1,-10(1)	Load address of new frame 
709:    LDA  3,1(7)	Return address in ac 
710:    LDA  7,-639(7)	CALL p
711:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
712:     LD  4,-9(1)	Load left into ac1 
713:    AND  3,4,3	Op AND 
714:     LD  4,-8(1)	Load left into ac1 
715:     OR  3,4,3	Op OR 
716:     ST  3,-8(1)	Save left side 
*                       Begin call to  p
717:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
718:     LD  3,-3(1)	Load variable b
719:     ST  3,-11(1)	Store parameter 
*                       Load param 2
720:     LD  3,-4(1)	Load variable c
721:     ST  3,-12(1)	Store parameter 
*                       Jump to p
722:    LDA  1,-9(1)	Load address of new frame 
723:    LDA  3,1(7)	Return address in ac 
724:    LDA  7,-653(7)	CALL p
725:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
726:     ST  3,-9(1)	Save left side 
*                       Begin call to  p
727:     ST  1,-10(1)	Store old fp in ghost frame 
*                       Load param 1
728:     LD  3,-5(1)	Load variable d
729:     ST  3,-12(1)	Store parameter 
*                       Load param 2
730:     LD  3,-6(1)	Load variable e
731:     ST  3,-13(1)	Store parameter 
*                       Jump to p
732:    LDA  1,-10(1)	Load address of new frame 
733:    LDA  3,1(7)	Return address in ac 
734:    LDA  7,-663(7)	CALL p
735:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
736:     LD  4,-9(1)	Load left into ac1 
737:    AND  3,4,3	Op AND 
738:     LD  4,-8(1)	Load left into ac1 
739:     OR  3,4,3	Op OR 
* THEN
* RETURN
741:    LDC  3,7(6)	Load integer constant 
742:    LDA  2,0(3)	Copy result to rt register 
743:     LD  3,-1(1)	Load return address 
744:     LD  1,0(1)	Adjust fp 
745:    LDA  7,0(3)	Return 
740:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* IF
*                       Begin call to  p
747:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
748:     LD  3,-2(1)	Load variable a
749:     ST  3,-10(1)	Store parameter 
*                       Load param 2
750:     LD  3,-3(1)	Load variable b
751:     ST  3,-11(1)	Store parameter 
*                       Jump to p
752:    LDA  1,-8(1)	Load address of new frame 
753:    LDA  3,1(7)	Return address in ac 
754:    LDA  7,-683(7)	CALL p
755:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
756:     ST  3,-8(1)	Save left side 
*                       Begin call to  p
757:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
758:     LD  3,-3(1)	Load variable b
759:     ST  3,-11(1)	Store parameter 
*                       Load param 2
760:     LD  3,-4(1)	Load variable c
761:     ST  3,-12(1)	Store parameter 
*                       Jump to p
762:    LDA  1,-9(1)	Load address of new frame 
763:    LDA  3,1(7)	Return address in ac 
764:    LDA  7,-693(7)	CALL p
765:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
766:     LD  4,-8(1)	Load left into ac1 
767:     OR  3,4,3	Op OR 
768:     ST  3,-8(1)	Save left side 
*                       Begin call to  p
769:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
770:     LD  3,-4(1)	Load variable c
771:     ST  3,-11(1)	Store parameter 
*                       Load param 2
772:     LD  3,-5(1)	Load variable d
773:     ST  3,-12(1)	Store parameter 
*                       Jump to p
774:    LDA  1,-9(1)	Load address of new frame 
775:    LDA  3,1(7)	Return address in ac 
776:    LDA  7,-705(7)	CALL p
777:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
778:     LD  4,-8(1)	Load left into ac1 
779:     OR  3,4,3	Op OR 
780:     ST  3,-8(1)	Save left side 
*                       Begin call to  p
781:     ST  1,-9(1)	Store old fp in ghost frame 
*                       Load param 1
782:     LD  3,-5(1)	Load variable d
783:     ST  3,-11(1)	Store parameter 
*                       Load param 2
784:     LD  3,-6(1)	Load variable e
785:     ST  3,-12(1)	Store parameter 
*                       Jump to p
786:    LDA  1,-9(1)	Load address of new frame 
787:    LDA  3,1(7)	Return address in ac 
788:    LDA  7,-717(7)	CALL p
789:    LDA  3,0(2)	Save the result in ac 
*                       End call to p
790:     LD  4,-8(1)	Load left into ac1 
791:     OR  3,4,3	Op OR 
* THEN
* RETURN
793:    LDC  3,8(6)	Load integer constant 
794:    LDA  2,0(3)	Copy result to rt register 
795:     LD  3,-1(1)	Load return address 
796:     LD  1,0(1)	Adjust fp 
797:    LDA  7,0(3)	Return 
792:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
799:    LDC  3,9(6)	Load integer constant 
800:    LDA  2,0(3)	Copy result to rt register 
801:     LD  3,-1(1)	Load return address 
802:     LD  1,0(1)	Adjust fp 
803:    LDA  7,0(3)	Return 
798:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
746:    LDA  7,57(7)	Jump around the ELSE [backpatch] 
* ENDIF
670:    LDA  7,133(7)	Jump around the ELSE [backpatch] 
* ENDIF
624:    LDA  7,179(7)	Jump around the ELSE [backpatch] 
* ENDIF
438:    LDA  7,365(7)	Jump around the ELSE [backpatch] 
* ENDIF
430:    LDA  7,373(7)	Jump around the ELSE [backpatch] 
* ENDIF
374:    LDA  7,429(7)	Jump around the ELSE [backpatch] 
* ENDIF
338:    LDA  7,465(7)	Jump around the ELSE [backpatch] 
* ENDIF
306:    LDA  7,497(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
804:    LDC  2,0(6)	Set return value to 0 
805:     LD  3,-1(1)	Load return address 
806:     LD  1,0(1)	Adjust fp 
807:    LDA  7,0(3)	Return 
* END FUNCTION handtype
* FUNCTION main
808:     ST  3,-1(1)	Store return address. 
* COMPOUND
809:    LDC  3,10(6)	load size of array hands
810:     ST  3,-2(1)	save size of array hands
* EXPRESSION
811:    LDC  3,0(6)	Load integer constant 
812:     ST  3,-20(1)	Store variable i
* WHILE
813:     LD  3,-20(1)	Load variable i
814:     ST  3,-21(1)	Save left side 
815:    LDC  3,10(6)	Load integer constant 
816:     LD  4,-21(1)	Load left into ac1 
817:    TLT  3,4,3	Op < 
818:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
820:     LD  3,-20(1)	Load variable i
821:     ST  3,-21(1)	Save index 
822:    LDC  3,0(6)	Load integer constant 
823:     LD  4,-21(1)	Restore index 
824:    LDA  5,-3(1)	Load address of base of array hands
825:    SUB  5,5,4	Compute offset of value 
826:     ST  3,0(5)	Store variable hands
* EXPRESSION
827:     LD  3,-20(1)	Load variable i
828:     ST  3,-21(1)	Save left side 
829:    LDC  3,1(6)	Load integer constant 
830:     LD  4,-21(1)	Load left into ac1 
831:    ADD  3,4,3	Op + 
832:     ST  3,-20(1)	Store variable i
* END COMPOUND
833:    LDA  7,-21(7)	go to beginning of loop 
819:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
834:    LDC  3,4(6)	Load integer constant 
835:     ST  3,0(0)	Store variable numSuits
* EXPRESSION
836:    LDC  3,5(6)	Load integer constant 
837:     ST  3,-1(0)	Store variable numPips
* EXPRESSION
838:     LD  3,-1(0)	Load variable numPips
839:     ST  3,-21(1)	Save left side 
840:     LD  3,0(0)	Load variable numSuits
841:     LD  4,-21(1)	Load left into ac1 
842:    MUL  3,4,3	Op * 
843:     ST  3,-21(1)	Save left side 
844:    LDC  3,1(6)	Load integer constant 
845:     LD  4,-21(1)	Load left into ac1 
846:    SUB  3,4,3	Op - 
847:     ST  3,-2(0)	Store variable numCards
* EXPRESSION
848:    LDC  3,0(6)	Load integer constant 
849:     ST  3,-19(1)	Store variable possible
* EXPRESSION
850:    LDC  3,0(6)	Load integer constant 
851:     ST  3,-13(1)	Store variable a
* WHILE
852:     LD  3,-13(1)	Load variable a
853:     ST  3,-21(1)	Save left side 
854:     LD  3,-2(0)	Load variable numCards
855:     LD  4,-21(1)	Load left into ac1 
856:    TLE  3,4,3	Op <= 
857:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
859:     ST  1,-21(1)	Store old fp in ghost frame 
*                       Load param 1
860:     LD  3,-13(1)	Load variable a
861:     ST  3,-23(1)	Store parameter 
*                       Jump to output
862:    LDA  1,-21(1)	Load address of new frame 
863:    LDA  3,1(7)	Return address in ac 
864:    LDA  7,-859(7)	CALL output
865:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
866:     ST  1,-21(1)	Store old fp in ghost frame 
*                       Jump to outnl
867:    LDA  1,-21(1)	Load address of new frame 
868:    LDA  3,1(7)	Return address in ac 
869:    LDA  7,-833(7)	CALL outnl
870:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
871:     LD  3,-13(1)	Load variable a
872:     ST  3,-21(1)	Save left side 
873:    LDC  3,1(6)	Load integer constant 
874:     LD  4,-21(1)	Load left into ac1 
875:    ADD  3,4,3	Op + 
876:     ST  3,-14(1)	Store variable b
* WHILE
877:     LD  3,-14(1)	Load variable b
878:     ST  3,-21(1)	Save left side 
879:     LD  3,-2(0)	Load variable numCards
880:     LD  4,-21(1)	Load left into ac1 
881:    TLE  3,4,3	Op <= 
882:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
884:     LD  3,-14(1)	Load variable b
885:     ST  3,-21(1)	Save left side 
886:    LDC  3,1(6)	Load integer constant 
887:     LD  4,-21(1)	Load left into ac1 
888:    ADD  3,4,3	Op + 
889:     ST  3,-15(1)	Store variable c
* WHILE
890:     LD  3,-15(1)	Load variable c
891:     ST  3,-21(1)	Save left side 
892:     LD  3,-2(0)	Load variable numCards
893:     LD  4,-21(1)	Load left into ac1 
894:    TLE  3,4,3	Op <= 
895:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
897:     LD  3,-15(1)	Load variable c
898:     ST  3,-21(1)	Save left side 
899:    LDC  3,1(6)	Load integer constant 
900:     LD  4,-21(1)	Load left into ac1 
901:    ADD  3,4,3	Op + 
902:     ST  3,-16(1)	Store variable d
* WHILE
903:     LD  3,-16(1)	Load variable d
904:     ST  3,-21(1)	Save left side 
905:     LD  3,-2(0)	Load variable numCards
906:     LD  4,-21(1)	Load left into ac1 
907:    TLE  3,4,3	Op <= 
908:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
910:     LD  3,-16(1)	Load variable d
911:     ST  3,-21(1)	Save left side 
912:    LDC  3,1(6)	Load integer constant 
913:     LD  4,-21(1)	Load left into ac1 
914:    ADD  3,4,3	Op + 
915:     ST  3,-17(1)	Store variable e
* WHILE
916:     LD  3,-17(1)	Load variable e
917:     ST  3,-21(1)	Save left side 
918:     LD  3,-2(0)	Load variable numCards
919:     LD  4,-21(1)	Load left into ac1 
920:    TLE  3,4,3	Op <= 
921:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
923:     LD  3,-19(1)	Load variable possible
924:     ST  3,-21(1)	Save left side 
925:    LDC  3,1(6)	Load integer constant 
926:     LD  4,-21(1)	Load left into ac1 
927:    ADD  3,4,3	Op + 
928:     ST  3,-19(1)	Store variable possible
* EXPRESSION
*                       Begin call to  handtype
929:     ST  1,-21(1)	Store old fp in ghost frame 
*                       Load param 1
930:     LD  3,-13(1)	Load variable a
931:     ST  3,-23(1)	Store parameter 
*                       Load param 2
932:     LD  3,-14(1)	Load variable b
933:     ST  3,-24(1)	Store parameter 
*                       Load param 3
934:     LD  3,-15(1)	Load variable c
935:     ST  3,-25(1)	Store parameter 
*                       Load param 4
936:     LD  3,-16(1)	Load variable d
937:     ST  3,-26(1)	Store parameter 
*                       Load param 5
938:     LD  3,-17(1)	Load variable e
939:     ST  3,-27(1)	Store parameter 
*                       Jump to handtype
940:    LDA  1,-21(1)	Load address of new frame 
941:    LDA  3,1(7)	Return address in ac 
942:    LDA  7,-773(7)	CALL handtype
943:    LDA  3,0(2)	Save the result in ac 
*                       End call to handtype
944:     ST  3,-18(1)	Store variable h
* EXPRESSION
945:     LD  3,-18(1)	Load variable h
946:     ST  3,-21(1)	Save index 
947:     LD  3,-18(1)	Load variable h
948:    LDA  4,-3(1)	Load address of base of array hands
949:    SUB  3,4,3	Compute offset of value 
950:     LD  3,0(3)	Load the value 
951:     ST  3,-22(1)	Save left side 
952:    LDC  3,1(6)	Load integer constant 
953:     LD  4,-22(1)	Load left into ac1 
954:    ADD  3,4,3	Op + 
955:     LD  4,-21(1)	Restore index 
956:    LDA  5,-3(1)	Load address of base of array hands
957:    SUB  5,5,4	Compute offset of value 
958:     ST  3,0(5)	Store variable hands
* EXPRESSION
959:     LD  3,-17(1)	load lhs variable e
960:    LDA  3,1(3)	increment value of e
961:     ST  3,-17(1)	Store variable e
* END COMPOUND
962:    LDA  7,-47(7)	go to beginning of loop 
922:    LDA  7,40(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
963:     LD  3,-16(1)	load lhs variable d
964:    LDA  3,1(3)	increment value of d
965:     ST  3,-16(1)	Store variable d
* END COMPOUND
966:    LDA  7,-64(7)	go to beginning of loop 
909:    LDA  7,57(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
967:     LD  3,-15(1)	load lhs variable c
968:    LDA  3,1(3)	increment value of c
969:     ST  3,-15(1)	Store variable c
* END COMPOUND
970:    LDA  7,-81(7)	go to beginning of loop 
896:    LDA  7,74(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
971:     LD  3,-14(1)	load lhs variable b
972:    LDA  3,1(3)	increment value of b
973:     ST  3,-14(1)	Store variable b
* END COMPOUND
974:    LDA  7,-98(7)	go to beginning of loop 
883:    LDA  7,91(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
975:     LD  3,-13(1)	load lhs variable a
976:    LDA  3,1(3)	increment value of a
977:     ST  3,-13(1)	Store variable a
* END COMPOUND
978:    LDA  7,-127(7)	go to beginning of loop 
858:    LDA  7,120(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
979:    LDC  3,0(6)	Load integer constant 
980:     ST  3,-18(1)	Store variable h
* WHILE
981:     LD  3,-18(1)	Load variable h
982:     ST  3,-21(1)	Save left side 
983:    LDC  3,10(6)	Load integer constant 
984:     LD  4,-21(1)	Load left into ac1 
985:    TLT  3,4,3	Op < 
986:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
988:     ST  1,-21(1)	Store old fp in ghost frame 
*                       Load param 1
989:     LD  3,-18(1)	Load variable h
990:     ST  3,-23(1)	Store parameter 
*                       Jump to output
991:    LDA  1,-21(1)	Load address of new frame 
992:    LDA  3,1(7)	Return address in ac 
993:    LDA  7,-988(7)	CALL output
994:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
995:     ST  1,-21(1)	Store old fp in ghost frame 
*                       Load param 1
996:     LD  3,-18(1)	Load variable h
997:    LDA  4,-3(1)	Load address of base of array hands
998:    SUB  3,4,3	Compute offset of value 
999:     LD  3,0(3)	Load the value 
1000:     ST  3,-23(1)	Store parameter 
*                       Jump to output
1001:    LDA  1,-21(1)	Load address of new frame 
1002:    LDA  3,1(7)	Return address in ac 
1003:    LDA  7,-998(7)	CALL output
1004:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
1005:     ST  1,-21(1)	Store old fp in ghost frame 
*                       Jump to outnl
1006:    LDA  1,-21(1)	Load address of new frame 
1007:    LDA  3,1(7)	Return address in ac 
1008:    LDA  7,-972(7)	CALL outnl
1009:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
1010:     LD  3,-18(1)	Load variable h
1011:     ST  3,-21(1)	Save left side 
1012:    LDC  3,1(6)	Load integer constant 
1013:     LD  4,-21(1)	Load left into ac1 
1014:    ADD  3,4,3	Op + 
1015:     ST  3,-18(1)	Store variable h
* END COMPOUND
1016:    LDA  7,-36(7)	go to beginning of loop 
987:    LDA  7,29(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
1017:    LDC  3,0(6)	Load integer constant 
1018:    LDA  2,0(3)	Copy result to rt register 
1019:     LD  3,-1(1)	Load return address 
1020:     LD  1,0(1)	Adjust fp 
1021:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
1022:    LDC  2,0(6)	Set return value to 0 
1023:     LD  3,-1(1)	Load return address 
1024:     LD  1,0(1)	Adjust fp 
1025:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,1025(7)	Jump to init [backpatch] 
* INIT
1026:     LD  0,0(0)	Set the global pointer 
1027:    LDA  1,-3(0)	set first frame at end of globals 
1028:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
1029:    LDA  3,1(7)	Return address in ac 
1030:    LDA  7,-223(7)	Jump to main 
1031:   HALT  0,0,0	DONE! 
* END INIT
