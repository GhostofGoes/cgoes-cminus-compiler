* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  assign6.c-
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
* FUNCTION dog
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,10(6)	load size of array b
 44:     ST  3,-5(1)	save size of array b
* EXPRESSION
 45:    LDC  3,777(6)	Load integer constant 
 46:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 48:     LD  3,-4(1)	Load variable a
 49:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 50:    LDA  1,-17(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 54:    LDC  3,666(6)	Load integer constant 
 55:     LD  4,-4(1)	load lhs variable a
 56:    ADD  3,4,3	op += 
 57:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 59:     LD  3,-4(1)	Load variable a
 60:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 61:    LDA  1,-17(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-58(7)	CALL output
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 65:    LDC  3,666(6)	Load integer constant 
 66:     LD  4,-4(1)	load lhs variable a
 67:    SUB  3,4,3	op -= 
 68:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 70:     LD  3,-4(1)	Load variable a
 71:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 72:    LDA  1,-17(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 76:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
 77:    LDA  1,-17(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-43(7)	CALL outnl
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 81:    LDC  3,777(6)	Load integer constant 
 82:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
 83:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 84:     LD  3,0(0)	Load variable g
 85:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 86:    LDA  1,-17(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-83(7)	CALL output
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 90:    LDC  3,666(6)	Load integer constant 
 91:     LD  4,0(0)	load lhs variable g
 92:    ADD  3,4,3	op += 
 93:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
 94:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
 95:     LD  3,0(0)	Load variable g
 96:     ST  3,-19(1)	Store parameter 
*                       Jump to output
 97:    LDA  1,-17(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-94(7)	CALL output
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
101:    LDC  3,666(6)	Load integer constant 
102:     LD  4,0(0)	load lhs variable g
103:    SUB  3,4,3	op -= 
104:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
105:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
106:     LD  3,0(0)	Load variable g
107:     ST  3,-19(1)	Store parameter 
*                       Jump to output
108:    LDA  1,-17(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-105(7)	CALL output
111:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
112:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
113:    LDA  1,-17(1)	Load address of new frame 
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-79(7)	CALL outnl
116:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
117:    LDC  3,777(6)	Load integer constant 
118:     ST  3,-2(1)	Store variable p
* EXPRESSION
*                       Begin call to  output
119:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
120:     LD  3,-2(1)	Load variable p
121:     ST  3,-19(1)	Store parameter 
*                       Jump to output
122:    LDA  1,-17(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
126:    LDC  3,666(6)	Load integer constant 
127:     LD  4,-2(1)	load lhs variable p
128:    ADD  3,4,3	op += 
129:     ST  3,-2(1)	Store variable p
* EXPRESSION
*                       Begin call to  output
130:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
131:     LD  3,-2(1)	Load variable p
132:     ST  3,-19(1)	Store parameter 
*                       Jump to output
133:    LDA  1,-17(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
137:    LDC  3,666(6)	Load integer constant 
138:     LD  4,-2(1)	load lhs variable p
139:    SUB  3,4,3	op -= 
140:     ST  3,-2(1)	Store variable p
* EXPRESSION
*                       Begin call to  output
141:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
142:     LD  3,-2(1)	Load variable p
143:     ST  3,-19(1)	Store parameter 
*                       Jump to output
144:    LDA  1,-17(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-141(7)	CALL output
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
148:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
149:    LDA  1,-17(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-115(7)	CALL outnl
152:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
153:    LDC  3,1(6)	Load integer constant 
154:     ST  3,-17(1)	Save index 
155:    LDC  3,777(6)	Load integer constant 
156:     LD  4,-17(1)	Restore index 
157:    LDA  5,-6(1)	Load address of base of array b
158:    SUB  5,5,4	Compute offset of value 
159:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
160:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
161:    LDC  3,1(6)	Load integer constant 
162:    LDA  4,-6(1)	Load address of base of array b
163:    SUB  3,4,3	Compute offset of value 
164:     LD  3,0(3)	Load the value 
165:     ST  3,-19(1)	Store parameter 
*                       Jump to output
166:    LDA  1,-17(1)	Load address of new frame 
167:    LDA  3,1(7)	Return address in ac 
168:    LDA  7,-163(7)	CALL output
169:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
170:    LDC  3,1(6)	Load integer constant 
171:     ST  3,-17(1)	Save index 
172:    LDC  3,666(6)	Load integer constant 
173:     LD  4,-17(1)	Restore index 
174:    LDA  5,-6(1)	Load address of base of array b
175:    SUB  5,5,4	Compute offset of value 
176:     LD  4,0(5)	load lhs variable b
177:    ADD  3,4,3	op += 
178:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
179:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
180:    LDC  3,1(6)	Load integer constant 
181:    LDA  4,-6(1)	Load address of base of array b
182:    SUB  3,4,3	Compute offset of value 
183:     LD  3,0(3)	Load the value 
184:     ST  3,-19(1)	Store parameter 
*                       Jump to output
185:    LDA  1,-17(1)	Load address of new frame 
186:    LDA  3,1(7)	Return address in ac 
187:    LDA  7,-182(7)	CALL output
188:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
189:    LDC  3,1(6)	Load integer constant 
190:     ST  3,-17(1)	Save index 
191:    LDC  3,666(6)	Load integer constant 
192:     LD  4,-17(1)	Restore index 
193:    LDA  5,-6(1)	Load address of base of array b
194:    SUB  5,5,4	Compute offset of value 
195:     LD  4,0(5)	load lhs variable b
196:    SUB  3,4,3	op -= 
197:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
198:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
199:    LDC  3,1(6)	Load integer constant 
200:    LDA  4,-6(1)	Load address of base of array b
201:    SUB  3,4,3	Compute offset of value 
202:     LD  3,0(3)	Load the value 
203:     ST  3,-19(1)	Store parameter 
*                       Jump to output
204:    LDA  1,-17(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-201(7)	CALL output
207:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
208:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
209:    LDA  1,-17(1)	Load address of new frame 
210:    LDA  3,1(7)	Return address in ac 
211:    LDA  7,-175(7)	CALL outnl
212:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
213:    LDC  3,1(6)	Load integer constant 
214:     ST  3,-17(1)	Save index 
215:    LDC  3,777(6)	Load integer constant 
216:     LD  4,-17(1)	Restore index 
217:    LDA  5,-2(0)	Load address of base of array h
218:    SUB  5,5,4	Compute offset of value 
219:     ST  3,0(5)	Store variable h
* EXPRESSION
*                       Begin call to  output
220:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
221:    LDC  3,1(6)	Load integer constant 
222:    LDA  4,-2(0)	Load address of base of array h
223:    SUB  3,4,3	Compute offset of value 
224:     LD  3,0(3)	Load the value 
225:     ST  3,-19(1)	Store parameter 
*                       Jump to output
226:    LDA  1,-17(1)	Load address of new frame 
227:    LDA  3,1(7)	Return address in ac 
228:    LDA  7,-223(7)	CALL output
229:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
230:    LDC  3,1(6)	Load integer constant 
231:     ST  3,-17(1)	Save index 
232:    LDC  3,666(6)	Load integer constant 
233:     LD  4,-17(1)	Restore index 
234:    LDA  5,-2(0)	Load address of base of array h
235:    SUB  5,5,4	Compute offset of value 
236:     LD  4,0(5)	load lhs variable h
237:    ADD  3,4,3	op += 
238:     ST  3,0(5)	Store variable h
* EXPRESSION
*                       Begin call to  output
239:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
240:    LDC  3,1(6)	Load integer constant 
241:    LDA  4,-2(0)	Load address of base of array h
242:    SUB  3,4,3	Compute offset of value 
243:     LD  3,0(3)	Load the value 
244:     ST  3,-19(1)	Store parameter 
*                       Jump to output
245:    LDA  1,-17(1)	Load address of new frame 
246:    LDA  3,1(7)	Return address in ac 
247:    LDA  7,-242(7)	CALL output
248:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
249:    LDC  3,1(6)	Load integer constant 
250:     ST  3,-17(1)	Save index 
251:    LDC  3,666(6)	Load integer constant 
252:     LD  4,-17(1)	Restore index 
253:    LDA  5,-2(0)	Load address of base of array h
254:    SUB  5,5,4	Compute offset of value 
255:     LD  4,0(5)	load lhs variable h
256:    SUB  3,4,3	op -= 
257:     ST  3,0(5)	Store variable h
* EXPRESSION
*                       Begin call to  output
258:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
259:    LDC  3,1(6)	Load integer constant 
260:    LDA  4,-2(0)	Load address of base of array h
261:    SUB  3,4,3	Compute offset of value 
262:     LD  3,0(3)	Load the value 
263:     ST  3,-19(1)	Store parameter 
*                       Jump to output
264:    LDA  1,-17(1)	Load address of new frame 
265:    LDA  3,1(7)	Return address in ac 
266:    LDA  7,-261(7)	CALL output
267:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
268:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
269:    LDA  1,-17(1)	Load address of new frame 
270:    LDA  3,1(7)	Return address in ac 
271:    LDA  7,-235(7)	CALL outnl
272:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
273:    LDC  3,1(6)	Load integer constant 
274:     ST  3,-17(1)	Save index 
275:    LDC  3,777(6)	Load integer constant 
276:     LD  4,-17(1)	Restore index 
277:     LD  5,-3(1)	Load address of base of array q
278:    SUB  5,5,4	Compute offset of value 
279:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
280:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
281:    LDC  3,1(6)	Load integer constant 
282:     LD  4,-3(1)	Load address of base of array q
283:    SUB  3,4,3	Compute offset of value 
284:     LD  3,0(3)	Load the value 
285:     ST  3,-19(1)	Store parameter 
*                       Jump to output
286:    LDA  1,-17(1)	Load address of new frame 
287:    LDA  3,1(7)	Return address in ac 
288:    LDA  7,-283(7)	CALL output
289:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
290:    LDC  3,1(6)	Load integer constant 
291:     ST  3,-17(1)	Save index 
292:    LDC  3,666(6)	Load integer constant 
293:     LD  4,-17(1)	Restore index 
294:     LD  5,-3(1)	Load address of base of array q
295:    SUB  5,5,4	Compute offset of value 
296:     LD  4,0(5)	load lhs variable q
297:    ADD  3,4,3	op += 
298:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
299:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
300:    LDC  3,1(6)	Load integer constant 
301:     LD  4,-3(1)	Load address of base of array q
302:    SUB  3,4,3	Compute offset of value 
303:     LD  3,0(3)	Load the value 
304:     ST  3,-19(1)	Store parameter 
*                       Jump to output
305:    LDA  1,-17(1)	Load address of new frame 
306:    LDA  3,1(7)	Return address in ac 
307:    LDA  7,-302(7)	CALL output
308:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
309:    LDC  3,1(6)	Load integer constant 
310:     ST  3,-17(1)	Save index 
311:    LDC  3,666(6)	Load integer constant 
312:     LD  4,-17(1)	Restore index 
313:     LD  5,-3(1)	Load address of base of array q
314:    SUB  5,5,4	Compute offset of value 
315:     LD  4,0(5)	load lhs variable q
316:    SUB  3,4,3	op -= 
317:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
318:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
319:    LDC  3,1(6)	Load integer constant 
320:     LD  4,-3(1)	Load address of base of array q
321:    SUB  3,4,3	Compute offset of value 
322:     LD  3,0(3)	Load the value 
323:     ST  3,-19(1)	Store parameter 
*                       Jump to output
324:    LDA  1,-17(1)	Load address of new frame 
325:    LDA  3,1(7)	Return address in ac 
326:    LDA  7,-321(7)	CALL output
327:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
328:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
329:    LDA  1,-17(1)	Load address of new frame 
330:    LDA  3,1(7)	Return address in ac 
331:    LDA  7,-295(7)	CALL outnl
332:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
333:    LDC  3,1(6)	Load integer constant 
334:     ST  3,-17(1)	Save index 
335:    LDC  3,3(6)	Load integer constant 
336:     LD  4,-17(1)	Restore index 
337:    LDA  5,-6(1)	Load address of base of array b
338:    SUB  5,5,4	Compute offset of value 
339:     ST  3,0(5)	Store variable b
* EXPRESSION
340:    LDC  3,1(6)	Load integer constant 
341:    LDA  4,-6(1)	Load address of base of array b
342:    SUB  3,4,3	Compute offset of value 
343:     LD  3,0(3)	Load the value 
344:     ST  3,-17(1)	Save left side 
345:    LDC  3,1(6)	Load integer constant 
346:     LD  4,-17(1)	Load left into ac1 
347:    ADD  3,4,3	Op + 
348:     ST  3,-17(1)	Save index 
349:    LDC  3,777(6)	Load integer constant 
350:     LD  4,-17(1)	Restore index 
351:     LD  5,-3(1)	Load address of base of array q
352:    SUB  5,5,4	Compute offset of value 
353:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
354:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
355:    LDC  3,1(6)	Load integer constant 
356:    LDA  4,-6(1)	Load address of base of array b
357:    SUB  3,4,3	Compute offset of value 
358:     LD  3,0(3)	Load the value 
359:     ST  3,-19(1)	Save left side 
360:    LDC  3,1(6)	Load integer constant 
361:     LD  4,-19(1)	Load left into ac1 
362:    ADD  3,4,3	Op + 
363:     LD  4,-3(1)	Load address of base of array q
364:    SUB  3,4,3	Compute offset of value 
365:     LD  3,0(3)	Load the value 
366:     ST  3,-19(1)	Store parameter 
*                       Jump to output
367:    LDA  1,-17(1)	Load address of new frame 
368:    LDA  3,1(7)	Return address in ac 
369:    LDA  7,-364(7)	CALL output
370:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
371:    LDC  3,1(6)	Load integer constant 
372:    LDA  4,-6(1)	Load address of base of array b
373:    SUB  3,4,3	Compute offset of value 
374:     LD  3,0(3)	Load the value 
375:     ST  3,-17(1)	Save left side 
376:    LDC  3,1(6)	Load integer constant 
377:     LD  4,-17(1)	Load left into ac1 
378:    ADD  3,4,3	Op + 
379:     ST  3,-17(1)	Save index 
380:    LDC  3,666(6)	Load integer constant 
381:     LD  4,-17(1)	Restore index 
382:     LD  5,-3(1)	Load address of base of array q
383:    SUB  5,5,4	Compute offset of value 
384:     LD  4,0(5)	load lhs variable q
385:    ADD  3,4,3	op += 
386:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
387:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
388:    LDC  3,1(6)	Load integer constant 
389:    LDA  4,-6(1)	Load address of base of array b
390:    SUB  3,4,3	Compute offset of value 
391:     LD  3,0(3)	Load the value 
392:     ST  3,-19(1)	Save left side 
393:    LDC  3,1(6)	Load integer constant 
394:     LD  4,-19(1)	Load left into ac1 
395:    ADD  3,4,3	Op + 
396:     LD  4,-3(1)	Load address of base of array q
397:    SUB  3,4,3	Compute offset of value 
398:     LD  3,0(3)	Load the value 
399:     ST  3,-19(1)	Store parameter 
*                       Jump to output
400:    LDA  1,-17(1)	Load address of new frame 
401:    LDA  3,1(7)	Return address in ac 
402:    LDA  7,-397(7)	CALL output
403:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
404:    LDC  3,1(6)	Load integer constant 
405:    LDA  4,-6(1)	Load address of base of array b
406:    SUB  3,4,3	Compute offset of value 
407:     LD  3,0(3)	Load the value 
408:     ST  3,-17(1)	Save left side 
409:    LDC  3,1(6)	Load integer constant 
410:     LD  4,-17(1)	Load left into ac1 
411:    ADD  3,4,3	Op + 
412:     ST  3,-17(1)	Save index 
413:    LDC  3,666(6)	Load integer constant 
414:     LD  4,-17(1)	Restore index 
415:     LD  5,-3(1)	Load address of base of array q
416:    SUB  5,5,4	Compute offset of value 
417:     LD  4,0(5)	load lhs variable q
418:    SUB  3,4,3	op -= 
419:     ST  3,0(5)	Store variable q
* EXPRESSION
*                       Begin call to  output
420:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
421:    LDC  3,1(6)	Load integer constant 
422:    LDA  4,-6(1)	Load address of base of array b
423:    SUB  3,4,3	Compute offset of value 
424:     LD  3,0(3)	Load the value 
425:     ST  3,-19(1)	Save left side 
426:    LDC  3,1(6)	Load integer constant 
427:     LD  4,-19(1)	Load left into ac1 
428:    ADD  3,4,3	Op + 
429:     LD  4,-3(1)	Load address of base of array q
430:    SUB  3,4,3	Compute offset of value 
431:     LD  3,0(3)	Load the value 
432:     ST  3,-19(1)	Store parameter 
*                       Jump to output
433:    LDA  1,-17(1)	Load address of new frame 
434:    LDA  3,1(7)	Return address in ac 
435:    LDA  7,-430(7)	CALL output
436:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
437:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
438:    LDA  1,-17(1)	Load address of new frame 
439:    LDA  3,1(7)	Return address in ac 
440:    LDA  7,-404(7)	CALL outnl
441:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
442:    LDC  3,777(6)	Load integer constant 
443:     ST  3,-4(1)	Store variable a
444:     ST  3,-16(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
445:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
446:     LD  3,-16(1)	Load variable x
447:     ST  3,-19(1)	Store parameter 
*                       Jump to output
448:    LDA  1,-17(1)	Load address of new frame 
449:    LDA  3,1(7)	Return address in ac 
450:    LDA  7,-445(7)	CALL output
451:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
452:    LDC  3,666(6)	Load integer constant 
453:     LD  4,-4(1)	load lhs variable a
454:    ADD  3,4,3	op += 
455:     ST  3,-4(1)	Store variable a
456:     ST  3,-16(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
457:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
458:     LD  3,-16(1)	Load variable x
459:     ST  3,-19(1)	Store parameter 
*                       Jump to output
460:    LDA  1,-17(1)	Load address of new frame 
461:    LDA  3,1(7)	Return address in ac 
462:    LDA  7,-457(7)	CALL output
463:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
464:    LDC  3,666(6)	Load integer constant 
465:     LD  4,-4(1)	load lhs variable a
466:    SUB  3,4,3	op -= 
467:     ST  3,-4(1)	Store variable a
468:     ST  3,-16(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
469:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
470:     LD  3,-16(1)	Load variable x
471:     ST  3,-19(1)	Store parameter 
*                       Jump to output
472:    LDA  1,-17(1)	Load address of new frame 
473:    LDA  3,1(7)	Return address in ac 
474:    LDA  7,-469(7)	CALL output
475:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
476:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
477:    LDA  1,-17(1)	Load address of new frame 
478:    LDA  3,1(7)	Return address in ac 
479:    LDA  7,-443(7)	CALL outnl
480:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
481:    LDC  3,1(6)	Load integer constant 
482:     ST  3,-17(1)	Save index 
483:    LDC  3,2(6)	Load integer constant 
484:     ST  3,-18(1)	Save index 
485:    LDC  3,777(6)	Load integer constant 
486:     LD  4,-18(1)	Restore index 
487:    LDA  5,-6(1)	Load address of base of array b
488:    SUB  5,5,4	Compute offset of value 
489:     ST  3,0(5)	Store variable b
490:     LD  4,-17(1)	Restore index 
491:    LDA  5,-6(1)	Load address of base of array b
492:    SUB  5,5,4	Compute offset of value 
493:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
494:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
495:    LDC  3,1(6)	Load integer constant 
496:    LDA  4,-6(1)	Load address of base of array b
497:    SUB  3,4,3	Compute offset of value 
498:     LD  3,0(3)	Load the value 
499:     ST  3,-19(1)	Store parameter 
*                       Jump to output
500:    LDA  1,-17(1)	Load address of new frame 
501:    LDA  3,1(7)	Return address in ac 
502:    LDA  7,-497(7)	CALL output
503:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
504:    LDC  3,1(6)	Load integer constant 
505:     ST  3,-17(1)	Save index 
506:    LDC  3,2(6)	Load integer constant 
507:     ST  3,-18(1)	Save index 
508:    LDC  3,666(6)	Load integer constant 
509:     LD  4,-18(1)	Restore index 
510:    LDA  5,-6(1)	Load address of base of array b
511:    SUB  5,5,4	Compute offset of value 
512:     LD  4,0(5)	load lhs variable b
513:    ADD  3,4,3	op += 
514:     ST  3,0(5)	Store variable b
515:     LD  4,-17(1)	Restore index 
516:    LDA  5,-6(1)	Load address of base of array b
517:    SUB  5,5,4	Compute offset of value 
518:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
519:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
520:    LDC  3,1(6)	Load integer constant 
521:    LDA  4,-6(1)	Load address of base of array b
522:    SUB  3,4,3	Compute offset of value 
523:     LD  3,0(3)	Load the value 
524:     ST  3,-19(1)	Store parameter 
*                       Jump to output
525:    LDA  1,-17(1)	Load address of new frame 
526:    LDA  3,1(7)	Return address in ac 
527:    LDA  7,-522(7)	CALL output
528:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
529:    LDC  3,1(6)	Load integer constant 
530:     ST  3,-17(1)	Save index 
531:    LDC  3,2(6)	Load integer constant 
532:     ST  3,-18(1)	Save index 
533:    LDC  3,666(6)	Load integer constant 
534:     LD  4,-18(1)	Restore index 
535:    LDA  5,-6(1)	Load address of base of array b
536:    SUB  5,5,4	Compute offset of value 
537:     LD  4,0(5)	load lhs variable b
538:    SUB  3,4,3	op -= 
539:     ST  3,0(5)	Store variable b
540:     LD  4,-17(1)	Restore index 
541:    LDA  5,-6(1)	Load address of base of array b
542:    SUB  5,5,4	Compute offset of value 
543:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
544:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
545:    LDC  3,1(6)	Load integer constant 
546:    LDA  4,-6(1)	Load address of base of array b
547:    SUB  3,4,3	Compute offset of value 
548:     LD  3,0(3)	Load the value 
549:     ST  3,-19(1)	Store parameter 
*                       Jump to output
550:    LDA  1,-17(1)	Load address of new frame 
551:    LDA  3,1(7)	Return address in ac 
552:    LDA  7,-547(7)	CALL output
553:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
554:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
555:    LDA  1,-17(1)	Load address of new frame 
556:    LDA  3,1(7)	Return address in ac 
557:    LDA  7,-521(7)	CALL outnl
558:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
559:     LD  3,-4(1)	Load variable a
560:     ST  3,-17(1)	Save left side 
561:     LD  3,-16(1)	Load variable x
562:     LD  4,-17(1)	Load left into ac1 
563:    MUL  3,4,3	Op * 
564:     LD  4,-4(1)	load lhs variable a
565:    ADD  3,4,3	op += 
566:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
567:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
568:     LD  3,-4(1)	Load variable a
569:     ST  3,-19(1)	Store parameter 
*                       Jump to output
570:    LDA  1,-17(1)	Load address of new frame 
571:    LDA  3,1(7)	Return address in ac 
572:    LDA  7,-567(7)	CALL output
573:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
574:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
575:    LDA  1,-17(1)	Load address of new frame 
576:    LDA  3,1(7)	Return address in ac 
577:    LDA  7,-541(7)	CALL outnl
578:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
579:    LDC  2,0(6)	Set return value to 0 
580:     LD  3,-1(1)	Load return address 
581:     LD  1,0(1)	Adjust fp 
582:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION main
583:     ST  3,-1(1)	Store return address. 
* COMPOUND
584:    LDC  3,20(6)	load size of array qq
585:     ST  3,-3(1)	save size of array qq
* EXPRESSION
586:    LDC  3,888(6)	Load integer constant 
587:     ST  3,-2(1)	Store variable pp
* EXPRESSION
588:    LDC  3,1(6)	Load integer constant 
589:     ST  3,-24(1)	Save index 
590:    LDC  3,999(6)	Load integer constant 
591:     LD  4,-24(1)	Restore index 
592:    LDA  5,-4(1)	Load address of base of array qq
593:    SUB  5,5,4	Compute offset of value 
594:     ST  3,0(5)	Store variable qq
* EXPRESSION
*                       Begin call to  dog
595:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
596:     LD  3,-2(1)	Load variable pp
597:     ST  3,-26(1)	Store parameter 
*                       Load param 2
598:    LDA  3,-4(1)	Load address of base of array qq
599:     ST  3,-27(1)	Store parameter 
*                       Jump to dog
600:    LDA  1,-24(1)	Load address of new frame 
601:    LDA  3,1(7)	Return address in ac 
602:    LDA  7,-561(7)	CALL dog
603:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
604:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
605:     LD  3,-2(1)	Load variable pp
606:     ST  3,-26(1)	Store parameter 
*                       Jump to output
607:    LDA  1,-24(1)	Load address of new frame 
608:    LDA  3,1(7)	Return address in ac 
609:    LDA  7,-604(7)	CALL output
610:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
611:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
612:    LDC  3,1(6)	Load integer constant 
613:    LDA  4,-4(1)	Load address of base of array qq
614:    SUB  3,4,3	Compute offset of value 
615:     LD  3,0(3)	Load the value 
616:     ST  3,-26(1)	Store parameter 
*                       Jump to output
617:    LDA  1,-24(1)	Load address of new frame 
618:    LDA  3,1(7)	Return address in ac 
619:    LDA  7,-614(7)	CALL output
620:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
621:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Jump to outnl
622:    LDA  1,-24(1)	Load address of new frame 
623:    LDA  3,1(7)	Return address in ac 
624:    LDA  7,-588(7)	CALL outnl
625:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
626:    LDC  2,0(6)	Set return value to 0 
627:     LD  3,-1(1)	Load return address 
628:     LD  1,0(1)	Adjust fp 
629:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,629(7)	Jump to init [backpatch] 
* INIT
630:     LD  0,0(0)	Set the global pointer 
631:    LDA  1,-12(0)	set first frame at end of globals 
632:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
633:    LDC  3,10(6)	load size of array h
634:     ST  3,-1(0)	save size of array h
* END INIT GLOBALS AND STATICS
635:    LDA  3,1(7)	Return address in ac 
636:    LDA  7,-54(7)	Jump to main 
637:   HALT  0,0,0	DONE! 
* END INIT
