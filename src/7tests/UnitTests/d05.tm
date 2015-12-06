* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  d05.c-
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
* FUNCTION main
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,213(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable a
* EXPRESSION
 45:    LDC  3,11(6)	Load integer constant 
 46:     ST  3,-3(1)	Store variable b
* EXPRESSION
 47:    LDC  3,4133(6)	Load integer constant 
 48:     ST  3,-4(1)	Store variable c
* EXPRESSION
*                       Begin call to  outputb
 49:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 50:     LD  3,-2(1)	Load variable a
 51:     ST  3,-7(1)	Save left side 
 52:     LD  3,-3(1)	Load variable b
 53:     LD  4,-7(1)	Load left into ac1 
 54:    TGT  3,4,3	Op > 
 55:     ST  3,-7(1)	Save left side 
 56:     LD  3,-3(1)	Load variable b
 57:     ST  3,-8(1)	Save left side 
 58:     LD  3,-4(1)	Load variable c
 59:     LD  4,-8(1)	Load left into ac1 
 60:    TLE  3,4,3	Op <= 
 61:     ST  3,-8(1)	Save left side 
 62:     LD  3,-4(1)	Load variable c
 63:     ST  3,-9(1)	Save left side 
 64:     LD  3,-2(1)	Load variable a
 65:     LD  4,-9(1)	Load left into ac1 
 66:    TGE  3,4,3	Op >= 
 67:     LD  4,-8(1)	Load left into ac1 
 68:    AND  3,4,3	Op AND 
 69:     LD  4,-7(1)	Load left into ac1 
 70:     OR  3,4,3	Op OR 
 71:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
 72:    LDA  1,-5(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-57(7)	CALL outputb
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 76:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 77:     LD  3,-2(1)	Load variable a
 78:     ST  3,-7(1)	Save left side 
 79:     LD  3,-3(1)	Load variable b
 80:     LD  4,-7(1)	Load left into ac1 
 81:    TGT  3,4,3	Op > 
 82:     ST  3,-7(1)	Save left side 
 83:     LD  3,-3(1)	Load variable b
 84:     ST  3,-8(1)	Save left side 
 85:     LD  3,-4(1)	Load variable c
 86:     LD  4,-8(1)	Load left into ac1 
 87:    TLE  3,4,3	Op <= 
 88:     LD  4,-7(1)	Load left into ac1 
 89:    AND  3,4,3	Op AND 
 90:     ST  3,-7(1)	Save left side 
 91:     LD  3,-4(1)	Load variable c
 92:     ST  3,-8(1)	Save left side 
 93:     LD  3,-2(1)	Load variable a
 94:     LD  4,-8(1)	Load left into ac1 
 95:    TGE  3,4,3	Op >= 
 96:     LD  4,-7(1)	Load left into ac1 
 97:     OR  3,4,3	Op OR 
 98:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
 99:    LDA  1,-5(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-84(7)	CALL outputb
102:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
103:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
104:     LD  3,-2(1)	Load variable a
105:     ST  3,-7(1)	Save left side 
106:     LD  3,-3(1)	Load variable b
107:     LD  4,-7(1)	Load left into ac1 
108:    TGT  3,4,3	Op > 
109:     ST  3,-7(1)	Save left side 
110:     LD  3,-3(1)	Load variable b
111:     ST  3,-8(1)	Save left side 
112:     LD  3,-4(1)	Load variable c
113:     LD  4,-8(1)	Load left into ac1 
114:    TLE  3,4,3	Op <= 
115:     LD  4,-7(1)	Load left into ac1 
116:    AND  3,4,3	Op AND 
117:     ST  3,-7(1)	Save left side 
118:     LD  3,-4(1)	Load variable c
119:     ST  3,-8(1)	Save left side 
120:     LD  3,-2(1)	Load variable a
121:     LD  4,-8(1)	Load left into ac1 
122:    TGE  3,4,3	Op >= 
123:     ST  3,-8(1)	Save left side 
124:     LD  3,-4(1)	Load variable c
125:     ST  3,-9(1)	Save left side 
126:     LD  3,-2(1)	Load variable a
127:     LD  4,-9(1)	Load left into ac1 
128:    TGE  3,4,3	Op >= 
129:     LD  4,-8(1)	Load left into ac1 
130:    AND  3,4,3	Op AND 
131:     LD  4,-7(1)	Load left into ac1 
132:     OR  3,4,3	Op OR 
133:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
134:    LDA  1,-5(1)	Load address of new frame 
135:    LDA  3,1(7)	Return address in ac 
136:    LDA  7,-119(7)	CALL outputb
137:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
138:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
139:     LD  3,-2(1)	Load variable a
140:     ST  3,-7(1)	Save left side 
141:     LD  3,-3(1)	Load variable b
142:     LD  4,-7(1)	Load left into ac1 
143:    TGT  3,4,3	Op > 
144:    LDC  4,1(6)	Load 1 
145:    XOR  3,3,4	Op NOT 
146:     ST  3,-7(1)	Save left side 
147:     LD  3,-3(1)	Load variable b
148:     ST  3,-8(1)	Save left side 
149:     LD  3,-4(1)	Load variable c
150:     LD  4,-8(1)	Load left into ac1 
151:    TLE  3,4,3	Op <= 
152:     ST  3,-8(1)	Save left side 
153:     LD  3,-4(1)	Load variable c
154:     ST  3,-9(1)	Save left side 
155:     LD  3,-2(1)	Load variable a
156:     LD  4,-9(1)	Load left into ac1 
157:    TGE  3,4,3	Op >= 
158:     LD  4,-8(1)	Load left into ac1 
159:    AND  3,4,3	Op AND 
160:     LD  4,-7(1)	Load left into ac1 
161:     OR  3,4,3	Op OR 
162:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
163:    LDA  1,-5(1)	Load address of new frame 
164:    LDA  3,1(7)	Return address in ac 
165:    LDA  7,-148(7)	CALL outputb
166:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
167:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
168:     LD  3,-2(1)	Load variable a
169:     ST  3,-7(1)	Save left side 
170:     LD  3,-3(1)	Load variable b
171:     LD  4,-7(1)	Load left into ac1 
172:    TGT  3,4,3	Op > 
173:    LDC  4,1(6)	Load 1 
174:    XOR  3,3,4	Op NOT 
175:     ST  3,-7(1)	Save left side 
176:     LD  3,-3(1)	Load variable b
177:     ST  3,-8(1)	Save left side 
178:     LD  3,-4(1)	Load variable c
179:     LD  4,-8(1)	Load left into ac1 
180:    TLE  3,4,3	Op <= 
181:     LD  4,-7(1)	Load left into ac1 
182:    AND  3,4,3	Op AND 
183:     ST  3,-7(1)	Save left side 
184:     LD  3,-4(1)	Load variable c
185:     ST  3,-8(1)	Save left side 
186:     LD  3,-2(1)	Load variable a
187:     LD  4,-8(1)	Load left into ac1 
188:    TGE  3,4,3	Op >= 
189:     LD  4,-7(1)	Load left into ac1 
190:     OR  3,4,3	Op OR 
191:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
192:    LDA  1,-5(1)	Load address of new frame 
193:    LDA  3,1(7)	Return address in ac 
194:    LDA  7,-177(7)	CALL outputb
195:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
196:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
197:    LDA  1,-5(1)	Load address of new frame 
198:    LDA  3,1(7)	Return address in ac 
199:    LDA  7,-163(7)	CALL outnl
200:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
201:    LDC  3,213(6)	Load integer constant 
202:     ST  3,-3(1)	Store variable b
* EXPRESSION
203:    LDC  3,11(6)	Load integer constant 
204:     ST  3,-4(1)	Store variable c
* EXPRESSION
205:    LDC  3,4133(6)	Load integer constant 
206:     ST  3,-2(1)	Store variable a
* EXPRESSION
*                       Begin call to  outputb
207:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
208:     LD  3,-2(1)	Load variable a
209:     ST  3,-7(1)	Save left side 
210:     LD  3,-3(1)	Load variable b
211:     LD  4,-7(1)	Load left into ac1 
212:    TGT  3,4,3	Op > 
213:     ST  3,-7(1)	Save left side 
214:     LD  3,-3(1)	Load variable b
215:     ST  3,-8(1)	Save left side 
216:     LD  3,-4(1)	Load variable c
217:     LD  4,-8(1)	Load left into ac1 
218:    TLE  3,4,3	Op <= 
219:     ST  3,-8(1)	Save left side 
220:     LD  3,-4(1)	Load variable c
221:     ST  3,-9(1)	Save left side 
222:     LD  3,-2(1)	Load variable a
223:     LD  4,-9(1)	Load left into ac1 
224:    TGE  3,4,3	Op >= 
225:     LD  4,-8(1)	Load left into ac1 
226:    AND  3,4,3	Op AND 
227:     LD  4,-7(1)	Load left into ac1 
228:     OR  3,4,3	Op OR 
229:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
230:    LDA  1,-5(1)	Load address of new frame 
231:    LDA  3,1(7)	Return address in ac 
232:    LDA  7,-215(7)	CALL outputb
233:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
234:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
235:     LD  3,-2(1)	Load variable a
236:     ST  3,-7(1)	Save left side 
237:     LD  3,-3(1)	Load variable b
238:     LD  4,-7(1)	Load left into ac1 
239:    TGT  3,4,3	Op > 
240:     ST  3,-7(1)	Save left side 
241:     LD  3,-3(1)	Load variable b
242:     ST  3,-8(1)	Save left side 
243:     LD  3,-4(1)	Load variable c
244:     LD  4,-8(1)	Load left into ac1 
245:    TLE  3,4,3	Op <= 
246:     LD  4,-7(1)	Load left into ac1 
247:    AND  3,4,3	Op AND 
248:     ST  3,-7(1)	Save left side 
249:     LD  3,-4(1)	Load variable c
250:     ST  3,-8(1)	Save left side 
251:     LD  3,-2(1)	Load variable a
252:     LD  4,-8(1)	Load left into ac1 
253:    TGE  3,4,3	Op >= 
254:     LD  4,-7(1)	Load left into ac1 
255:     OR  3,4,3	Op OR 
256:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
257:    LDA  1,-5(1)	Load address of new frame 
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-242(7)	CALL outputb
260:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
261:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
262:     LD  3,-2(1)	Load variable a
263:     ST  3,-7(1)	Save left side 
264:     LD  3,-3(1)	Load variable b
265:     LD  4,-7(1)	Load left into ac1 
266:    TGT  3,4,3	Op > 
267:     ST  3,-7(1)	Save left side 
268:     LD  3,-3(1)	Load variable b
269:     ST  3,-8(1)	Save left side 
270:     LD  3,-4(1)	Load variable c
271:     LD  4,-8(1)	Load left into ac1 
272:    TLE  3,4,3	Op <= 
273:     LD  4,-7(1)	Load left into ac1 
274:    AND  3,4,3	Op AND 
275:     ST  3,-7(1)	Save left side 
276:     LD  3,-4(1)	Load variable c
277:     ST  3,-8(1)	Save left side 
278:     LD  3,-2(1)	Load variable a
279:     LD  4,-8(1)	Load left into ac1 
280:    TGE  3,4,3	Op >= 
281:     ST  3,-8(1)	Save left side 
282:     LD  3,-4(1)	Load variable c
283:     ST  3,-9(1)	Save left side 
284:     LD  3,-2(1)	Load variable a
285:     LD  4,-9(1)	Load left into ac1 
286:    TGE  3,4,3	Op >= 
287:     LD  4,-8(1)	Load left into ac1 
288:    AND  3,4,3	Op AND 
289:     LD  4,-7(1)	Load left into ac1 
290:     OR  3,4,3	Op OR 
291:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
292:    LDA  1,-5(1)	Load address of new frame 
293:    LDA  3,1(7)	Return address in ac 
294:    LDA  7,-277(7)	CALL outputb
295:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
296:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
297:     LD  3,-2(1)	Load variable a
298:     ST  3,-7(1)	Save left side 
299:     LD  3,-3(1)	Load variable b
300:     LD  4,-7(1)	Load left into ac1 
301:    TGT  3,4,3	Op > 
302:    LDC  4,1(6)	Load 1 
303:    XOR  3,3,4	Op NOT 
304:     ST  3,-7(1)	Save left side 
305:     LD  3,-3(1)	Load variable b
306:     ST  3,-8(1)	Save left side 
307:     LD  3,-4(1)	Load variable c
308:     LD  4,-8(1)	Load left into ac1 
309:    TLE  3,4,3	Op <= 
310:     ST  3,-8(1)	Save left side 
311:     LD  3,-4(1)	Load variable c
312:     ST  3,-9(1)	Save left side 
313:     LD  3,-2(1)	Load variable a
314:     LD  4,-9(1)	Load left into ac1 
315:    TGE  3,4,3	Op >= 
316:     LD  4,-8(1)	Load left into ac1 
317:    AND  3,4,3	Op AND 
318:     LD  4,-7(1)	Load left into ac1 
319:     OR  3,4,3	Op OR 
320:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
321:    LDA  1,-5(1)	Load address of new frame 
322:    LDA  3,1(7)	Return address in ac 
323:    LDA  7,-306(7)	CALL outputb
324:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
325:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
326:     LD  3,-2(1)	Load variable a
327:     ST  3,-7(1)	Save left side 
328:     LD  3,-3(1)	Load variable b
329:     LD  4,-7(1)	Load left into ac1 
330:    TGT  3,4,3	Op > 
331:    LDC  4,1(6)	Load 1 
332:    XOR  3,3,4	Op NOT 
333:     ST  3,-7(1)	Save left side 
334:     LD  3,-3(1)	Load variable b
335:     ST  3,-8(1)	Save left side 
336:     LD  3,-4(1)	Load variable c
337:     LD  4,-8(1)	Load left into ac1 
338:    TLE  3,4,3	Op <= 
339:     LD  4,-7(1)	Load left into ac1 
340:    AND  3,4,3	Op AND 
341:     ST  3,-7(1)	Save left side 
342:     LD  3,-4(1)	Load variable c
343:     ST  3,-8(1)	Save left side 
344:     LD  3,-2(1)	Load variable a
345:     LD  4,-8(1)	Load left into ac1 
346:    TGE  3,4,3	Op >= 
347:     LD  4,-7(1)	Load left into ac1 
348:     OR  3,4,3	Op OR 
349:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
350:    LDA  1,-5(1)	Load address of new frame 
351:    LDA  3,1(7)	Return address in ac 
352:    LDA  7,-335(7)	CALL outputb
353:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
354:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
355:    LDA  1,-5(1)	Load address of new frame 
356:    LDA  3,1(7)	Return address in ac 
357:    LDA  7,-321(7)	CALL outnl
358:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
359:    LDC  3,11(6)	Load integer constant 
360:     ST  3,-3(1)	Store variable b
* EXPRESSION
361:    LDC  3,213(6)	Load integer constant 
362:     ST  3,-4(1)	Store variable c
* EXPRESSION
363:    LDC  3,4133(6)	Load integer constant 
364:     ST  3,-2(1)	Store variable a
* EXPRESSION
*                       Begin call to  outputb
365:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
366:     LD  3,-2(1)	Load variable a
367:     ST  3,-7(1)	Save left side 
368:     LD  3,-3(1)	Load variable b
369:     LD  4,-7(1)	Load left into ac1 
370:    TGT  3,4,3	Op > 
371:     ST  3,-7(1)	Save left side 
372:     LD  3,-3(1)	Load variable b
373:     ST  3,-8(1)	Save left side 
374:     LD  3,-4(1)	Load variable c
375:     LD  4,-8(1)	Load left into ac1 
376:    TLE  3,4,3	Op <= 
377:     ST  3,-8(1)	Save left side 
378:     LD  3,-4(1)	Load variable c
379:     ST  3,-9(1)	Save left side 
380:     LD  3,-2(1)	Load variable a
381:     LD  4,-9(1)	Load left into ac1 
382:    TGE  3,4,3	Op >= 
383:     LD  4,-8(1)	Load left into ac1 
384:    AND  3,4,3	Op AND 
385:     LD  4,-7(1)	Load left into ac1 
386:     OR  3,4,3	Op OR 
387:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
388:    LDA  1,-5(1)	Load address of new frame 
389:    LDA  3,1(7)	Return address in ac 
390:    LDA  7,-373(7)	CALL outputb
391:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
392:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
393:     LD  3,-2(1)	Load variable a
394:     ST  3,-7(1)	Save left side 
395:     LD  3,-3(1)	Load variable b
396:     LD  4,-7(1)	Load left into ac1 
397:    TGT  3,4,3	Op > 
398:     ST  3,-7(1)	Save left side 
399:     LD  3,-3(1)	Load variable b
400:     ST  3,-8(1)	Save left side 
401:     LD  3,-4(1)	Load variable c
402:     LD  4,-8(1)	Load left into ac1 
403:    TLE  3,4,3	Op <= 
404:     LD  4,-7(1)	Load left into ac1 
405:    AND  3,4,3	Op AND 
406:     ST  3,-7(1)	Save left side 
407:     LD  3,-4(1)	Load variable c
408:     ST  3,-8(1)	Save left side 
409:     LD  3,-2(1)	Load variable a
410:     LD  4,-8(1)	Load left into ac1 
411:    TGE  3,4,3	Op >= 
412:     LD  4,-7(1)	Load left into ac1 
413:     OR  3,4,3	Op OR 
414:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
415:    LDA  1,-5(1)	Load address of new frame 
416:    LDA  3,1(7)	Return address in ac 
417:    LDA  7,-400(7)	CALL outputb
418:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
419:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
420:     LD  3,-2(1)	Load variable a
421:     ST  3,-7(1)	Save left side 
422:     LD  3,-3(1)	Load variable b
423:     LD  4,-7(1)	Load left into ac1 
424:    TGT  3,4,3	Op > 
425:     ST  3,-7(1)	Save left side 
426:     LD  3,-3(1)	Load variable b
427:     ST  3,-8(1)	Save left side 
428:     LD  3,-4(1)	Load variable c
429:     LD  4,-8(1)	Load left into ac1 
430:    TLE  3,4,3	Op <= 
431:     LD  4,-7(1)	Load left into ac1 
432:    AND  3,4,3	Op AND 
433:     ST  3,-7(1)	Save left side 
434:     LD  3,-4(1)	Load variable c
435:     ST  3,-8(1)	Save left side 
436:     LD  3,-2(1)	Load variable a
437:     LD  4,-8(1)	Load left into ac1 
438:    TGE  3,4,3	Op >= 
439:     ST  3,-8(1)	Save left side 
440:     LD  3,-4(1)	Load variable c
441:     ST  3,-9(1)	Save left side 
442:     LD  3,-2(1)	Load variable a
443:     LD  4,-9(1)	Load left into ac1 
444:    TGE  3,4,3	Op >= 
445:     LD  4,-8(1)	Load left into ac1 
446:    AND  3,4,3	Op AND 
447:     LD  4,-7(1)	Load left into ac1 
448:     OR  3,4,3	Op OR 
449:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
450:    LDA  1,-5(1)	Load address of new frame 
451:    LDA  3,1(7)	Return address in ac 
452:    LDA  7,-435(7)	CALL outputb
453:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
454:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
455:     LD  3,-2(1)	Load variable a
456:     ST  3,-7(1)	Save left side 
457:     LD  3,-3(1)	Load variable b
458:     LD  4,-7(1)	Load left into ac1 
459:    TGT  3,4,3	Op > 
460:    LDC  4,1(6)	Load 1 
461:    XOR  3,3,4	Op NOT 
462:     ST  3,-7(1)	Save left side 
463:     LD  3,-3(1)	Load variable b
464:     ST  3,-8(1)	Save left side 
465:     LD  3,-4(1)	Load variable c
466:     LD  4,-8(1)	Load left into ac1 
467:    TLE  3,4,3	Op <= 
468:     ST  3,-8(1)	Save left side 
469:     LD  3,-4(1)	Load variable c
470:     ST  3,-9(1)	Save left side 
471:     LD  3,-2(1)	Load variable a
472:     LD  4,-9(1)	Load left into ac1 
473:    TGE  3,4,3	Op >= 
474:     LD  4,-8(1)	Load left into ac1 
475:    AND  3,4,3	Op AND 
476:     LD  4,-7(1)	Load left into ac1 
477:     OR  3,4,3	Op OR 
478:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
479:    LDA  1,-5(1)	Load address of new frame 
480:    LDA  3,1(7)	Return address in ac 
481:    LDA  7,-464(7)	CALL outputb
482:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
483:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
484:     LD  3,-2(1)	Load variable a
485:     ST  3,-7(1)	Save left side 
486:     LD  3,-3(1)	Load variable b
487:     LD  4,-7(1)	Load left into ac1 
488:    TGT  3,4,3	Op > 
489:    LDC  4,1(6)	Load 1 
490:    XOR  3,3,4	Op NOT 
491:     ST  3,-7(1)	Save left side 
492:     LD  3,-3(1)	Load variable b
493:     ST  3,-8(1)	Save left side 
494:     LD  3,-4(1)	Load variable c
495:     LD  4,-8(1)	Load left into ac1 
496:    TLE  3,4,3	Op <= 
497:     LD  4,-7(1)	Load left into ac1 
498:    AND  3,4,3	Op AND 
499:     ST  3,-7(1)	Save left side 
500:     LD  3,-4(1)	Load variable c
501:     ST  3,-8(1)	Save left side 
502:     LD  3,-2(1)	Load variable a
503:     LD  4,-8(1)	Load left into ac1 
504:    TGE  3,4,3	Op >= 
505:     LD  4,-7(1)	Load left into ac1 
506:     OR  3,4,3	Op OR 
507:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
508:    LDA  1,-5(1)	Load address of new frame 
509:    LDA  3,1(7)	Return address in ac 
510:    LDA  7,-493(7)	CALL outputb
511:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
512:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
513:    LDA  1,-5(1)	Load address of new frame 
514:    LDA  3,1(7)	Return address in ac 
515:    LDA  7,-479(7)	CALL outnl
516:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
517:    LDC  2,0(6)	Set return value to 0 
518:     LD  3,-1(1)	Load return address 
519:     LD  1,0(1)	Adjust fp 
520:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,520(7)	Jump to init [backpatch] 
* INIT
521:     LD  0,0(0)	Set the global pointer 
522:    LDA  1,0(0)	set first frame at end of globals 
523:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
524:    LDA  3,1(7)	Return address in ac 
525:    LDA  7,-484(7)	Jump to main 
526:   HALT  0,0,0	DONE! 
* END INIT
