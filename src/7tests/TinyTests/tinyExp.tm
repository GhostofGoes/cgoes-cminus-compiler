* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyExp.c-
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
* FUNCTION ident
 42:     ST  3,-1(1)	Store return address. 
* RETURN
 43:     LD  3,-2(1)	Load variable x
 44:    LDA  2,0(3)	Copy result to rt register 
 45:     LD  3,-1(1)	Load return address 
 46:     LD  1,0(1)	Adjust fp 
 47:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6)	Set return value to 0 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END FUNCTION ident
* FUNCTION main
 52:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 53:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
 54:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 55:    LDC  3,111(6)	Load integer constant 
 56:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
 57:    LDA  1,-5(1)	Load address of new frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    LDA  7,-18(7)	CALL ident
 60:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
 61:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 62:    LDA  1,-3(1)	Load address of new frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    LDA  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 66:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
 67:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 68:    LDC  3,111(6)	Load integer constant 
 69:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
 70:    LDA  1,-5(1)	Load address of new frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    LDA  7,-31(7)	CALL ident
 73:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
 74:     ST  3,-5(1)	Save left side 
 75:    LDC  3,222(6)	Load integer constant 
 76:     LD  4,-5(1)	Load left into ac1 
 77:    MUL  3,4,3	Op * 
 78:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 79:    LDA  1,-3(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 83:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 84:    LDC  3,222(6)	Load integer constant 
 85:     ST  3,-5(1)	Save left side 
*                       Begin call to  ident
 86:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 87:    LDC  3,111(6)	Load integer constant 
 88:     ST  3,-8(1)	Store parameter 
*                       Jump to ident
 89:    LDA  1,-6(1)	Load address of new frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    LDA  7,-50(7)	CALL ident
 92:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
 93:     LD  4,-5(1)	Load left into ac1 
 94:    MUL  3,4,3	Op * 
 95:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 96:    LDA  1,-3(1)	Load address of new frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    LDA  7,-93(7)	CALL output
 99:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
100:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
101:    LDA  1,-3(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-67(7)	CALL outnl
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
105:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
106:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
107:    LDC  3,111(6)	Load integer constant 
108:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
109:    LDA  1,-5(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-70(7)	CALL ident
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
113:     ST  3,-5(1)	Save left side 
114:    LDC  3,222(6)	Load integer constant 
115:     LD  4,-5(1)	Load left into ac1 
116:    MUL  3,4,3	Op * 
117:     ST  3,-5(1)	Save left side 
118:    LDC  3,333(6)	Load integer constant 
119:     LD  4,-5(1)	Load left into ac1 
120:    ADD  3,4,3	Op + 
121:     ST  3,-5(1)	Store parameter 
*                       Jump to output
122:    LDA  1,-3(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
126:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
127:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
128:    LDC  3,111(6)	Load integer constant 
129:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
130:    LDA  1,-5(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-91(7)	CALL ident
133:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
134:     ST  3,-5(1)	Save left side 
135:    LDC  3,222(6)	Load integer constant 
136:     LD  4,-5(1)	Load left into ac1 
137:    ADD  3,4,3	Op + 
138:     ST  3,-5(1)	Save left side 
139:    LDC  3,333(6)	Load integer constant 
140:     LD  4,-5(1)	Load left into ac1 
141:    MUL  3,4,3	Op * 
142:     ST  3,-5(1)	Store parameter 
*                       Jump to output
143:    LDA  1,-3(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-140(7)	CALL output
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
147:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
148:    LDA  1,-3(1)	Load address of new frame 
149:    LDA  3,1(7)	Return address in ac 
150:    LDA  7,-114(7)	CALL outnl
151:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
152:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
153:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
154:    LDC  3,111(6)	Load integer constant 
155:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
156:    LDA  1,-5(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-117(7)	CALL ident
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
160:     ST  3,-5(1)	Save left side 
161:    LDC  3,222(6)	Load integer constant 
162:     LD  4,-5(1)	Load left into ac1 
163:    ADD  3,4,3	Op + 
164:    LDC  4,0(6)	Load 0 
165:    SUB  3,4,3	Op unary - 
166:     ST  3,-5(1)	Store parameter 
*                       Jump to output
167:    LDA  1,-3(1)	Load address of new frame 
168:    LDA  3,1(7)	Return address in ac 
169:    LDA  7,-164(7)	CALL output
170:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
171:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
172:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
173:    LDC  3,111(6)	Load integer constant 
174:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
175:    LDA  1,-5(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-136(7)	CALL ident
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
179:     ST  3,-5(1)	Save left side 
180:    LDC  3,222(6)	Load integer constant 
181:     LD  4,-5(1)	Load left into ac1 
182:    ADD  3,4,3	Op + 
183:    LDC  4,0(6)	Load 0 
184:    SUB  3,4,3	Op unary - 
185:    LDC  4,0(6)	Load 0 
186:    SUB  3,4,3	Op unary - 
187:     ST  3,-5(1)	Store parameter 
*                       Jump to output
188:    LDA  1,-3(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-185(7)	CALL output
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
192:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
193:    LDA  1,-3(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-159(7)	CALL outnl
196:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
197:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
198:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
199:    LDC  3,111(6)	Load integer constant 
200:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
201:    LDA  1,-5(1)	Load address of new frame 
202:    LDA  3,1(7)	Return address in ac 
203:    LDA  7,-162(7)	CALL ident
204:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
205:     ST  3,-5(1)	Save left side 
206:    LDC  3,222(6)	Load integer constant 
207:     LD  4,-5(1)	Load left into ac1 
208:    ADD  3,4,3	Op + 
209:    LDC  4,0(6)	Load 0 
210:    SUB  3,4,3	Op unary - 
211:    LDC  4,0(6)	Load 0 
212:    SUB  3,4,3	Op unary - 
213:     ST  3,-5(1)	Save left side 
214:    LDC  3,333(6)	Load integer constant 
215:     LD  4,-5(1)	Load left into ac1 
216:    MUL  3,4,3	Op * 
217:     ST  3,-5(1)	Store parameter 
*                       Jump to output
218:    LDA  1,-3(1)	Load address of new frame 
219:    LDA  3,1(7)	Return address in ac 
220:    LDA  7,-215(7)	CALL output
221:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
222:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
223:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
224:    LDC  3,111(6)	Load integer constant 
225:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
226:    LDA  1,-5(1)	Load address of new frame 
227:    LDA  3,1(7)	Return address in ac 
228:    LDA  7,-187(7)	CALL ident
229:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
230:     ST  3,-5(1)	Save left side 
231:    LDC  3,222(6)	Load integer constant 
232:     LD  4,-5(1)	Load left into ac1 
233:    ADD  3,4,3	Op + 
234:    LDC  4,0(6)	Load 0 
235:    SUB  3,4,3	Op unary - 
236:    LDC  4,0(6)	Load 0 
237:    SUB  3,4,3	Op unary - 
238:     ST  3,-5(1)	Save left side 
239:    LDC  3,333(6)	Load integer constant 
240:     LD  4,-5(1)	Load left into ac1 
241:    MUL  3,4,3	Op * 
242:     ST  3,-5(1)	Save left side 
243:    LDC  3,444(6)	Load integer constant 
244:     LD  4,-5(1)	Load left into ac1 
245:    DIV  3,4,3	Op / 
246:     ST  3,-5(1)	Store parameter 
*                       Jump to output
247:    LDA  1,-3(1)	Load address of new frame 
248:    LDA  3,1(7)	Return address in ac 
249:    LDA  7,-244(7)	CALL output
250:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
251:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
252:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
253:    LDC  3,111(6)	Load integer constant 
254:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
255:    LDA  1,-5(1)	Load address of new frame 
256:    LDA  3,1(7)	Return address in ac 
257:    LDA  7,-216(7)	CALL ident
258:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
259:     ST  3,-5(1)	Save left side 
260:    LDC  3,222(6)	Load integer constant 
261:     LD  4,-5(1)	Load left into ac1 
262:    ADD  3,4,3	Op + 
263:    LDC  4,0(6)	Load 0 
264:    SUB  3,4,3	Op unary - 
265:    LDC  4,0(6)	Load 0 
266:    SUB  3,4,3	Op unary - 
267:     ST  3,-5(1)	Save left side 
268:    LDC  3,333(6)	Load integer constant 
269:     LD  4,-5(1)	Load left into ac1 
270:    MUL  3,4,3	Op * 
271:     ST  3,-5(1)	Save left side 
272:    LDC  3,444(6)	Load integer constant 
273:     LD  4,-5(1)	Load left into ac1 
274:    DIV  3,4,3	Op / 
275:     ST  3,-5(1)	Save left side 
276:    LDC  3,42(6)	Load integer constant 
277:     LD  4,-5(1)	Load left into ac1 
278:    DIV  5,4,3	Op % 
279:    MUL  5,5,3	 
280:    SUB  3,4,5	 
281:     ST  3,-5(1)	Store parameter 
*                       Jump to output
282:    LDA  1,-3(1)	Load address of new frame 
283:    LDA  3,1(7)	Return address in ac 
284:    LDA  7,-279(7)	CALL output
285:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
286:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
287:    LDA  1,-3(1)	Load address of new frame 
288:    LDA  3,1(7)	Return address in ac 
289:    LDA  7,-253(7)	CALL outnl
290:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
291:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
292:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
293:    LDC  3,111(6)	Load integer constant 
294:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
295:    LDA  1,-5(1)	Load address of new frame 
296:    LDA  3,1(7)	Return address in ac 
297:    LDA  7,-256(7)	CALL ident
298:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
299:     ST  3,-5(1)	Save left side 
300:    LDC  3,222(6)	Load integer constant 
301:     LD  4,-5(1)	Load left into ac1 
302:    ADD  3,4,3	Op + 
303:    LDC  4,0(6)	Load 0 
304:    SUB  3,4,3	Op unary - 
305:    LDC  4,0(6)	Load 0 
306:    SUB  3,4,3	Op unary - 
307:     ST  3,-5(1)	Save left side 
308:    LDC  3,333(6)	Load integer constant 
309:     LD  4,-5(1)	Load left into ac1 
310:    MUL  3,4,3	Op * 
311:     ST  3,-5(1)	Save left side 
312:    LDC  3,444(6)	Load integer constant 
313:     LD  4,-5(1)	Load left into ac1 
314:    DIV  3,4,3	Op / 
315:     ST  3,-5(1)	Save left side 
316:    LDC  3,42(6)	Load integer constant 
317:     LD  4,-5(1)	Load left into ac1 
318:    DIV  5,4,3	Op % 
319:    MUL  5,5,3	 
320:    SUB  3,4,5	 
321:     ST  3,-5(1)	Save left side 
322:    LDC  3,555(6)	Load integer constant 
323:     LD  4,-5(1)	Load left into ac1 
324:    ADD  3,4,3	Op + 
325:     ST  3,-5(1)	Save left side 
326:    LDC  3,666(6)	Load integer constant 
327:     LD  4,-5(1)	Load left into ac1 
328:    TLE  3,4,3	Op <= 
329:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
330:    LDA  1,-3(1)	Load address of new frame 
331:    LDA  3,1(7)	Return address in ac 
332:    LDA  7,-315(7)	CALL outputb
333:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
334:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
335:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
336:    LDC  3,111(6)	Load integer constant 
337:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
338:    LDA  1,-5(1)	Load address of new frame 
339:    LDA  3,1(7)	Return address in ac 
340:    LDA  7,-299(7)	CALL ident
341:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
342:     ST  3,-5(1)	Save left side 
343:    LDC  3,222(6)	Load integer constant 
344:     LD  4,-5(1)	Load left into ac1 
345:    ADD  3,4,3	Op + 
346:    LDC  4,0(6)	Load 0 
347:    SUB  3,4,3	Op unary - 
348:    LDC  4,0(6)	Load 0 
349:    SUB  3,4,3	Op unary - 
350:     ST  3,-5(1)	Save left side 
351:    LDC  3,333(6)	Load integer constant 
352:     LD  4,-5(1)	Load left into ac1 
353:    MUL  3,4,3	Op * 
354:     ST  3,-5(1)	Save left side 
355:    LDC  3,444(6)	Load integer constant 
356:     LD  4,-5(1)	Load left into ac1 
357:    DIV  3,4,3	Op / 
358:     ST  3,-5(1)	Save left side 
359:    LDC  3,42(6)	Load integer constant 
360:     LD  4,-5(1)	Load left into ac1 
361:    DIV  5,4,3	Op % 
362:    MUL  5,5,3	 
363:    SUB  3,4,5	 
364:     ST  3,-5(1)	Save left side 
365:    LDC  3,555(6)	Load integer constant 
366:     LD  4,-5(1)	Load left into ac1 
367:    ADD  3,4,3	Op + 
368:     ST  3,-5(1)	Save left side 
369:    LDC  3,666(6)	Load integer constant 
370:     LD  4,-5(1)	Load left into ac1 
371:    TGE  3,4,3	Op >= 
372:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
373:    LDA  1,-3(1)	Load address of new frame 
374:    LDA  3,1(7)	Return address in ac 
375:    LDA  7,-358(7)	CALL outputb
376:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
377:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
378:    LDA  1,-3(1)	Load address of new frame 
379:    LDA  3,1(7)	Return address in ac 
380:    LDA  7,-344(7)	CALL outnl
381:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
382:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
383:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
384:    LDC  3,111(6)	Load integer constant 
385:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
386:    LDA  1,-5(1)	Load address of new frame 
387:    LDA  3,1(7)	Return address in ac 
388:    LDA  7,-347(7)	CALL ident
389:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
390:     ST  3,-5(1)	Save left side 
391:    LDC  3,222(6)	Load integer constant 
392:     LD  4,-5(1)	Load left into ac1 
393:    ADD  3,4,3	Op + 
394:    LDC  4,0(6)	Load 0 
395:    SUB  3,4,3	Op unary - 
396:    LDC  4,0(6)	Load 0 
397:    SUB  3,4,3	Op unary - 
398:     ST  3,-5(1)	Save left side 
399:    LDC  3,333(6)	Load integer constant 
400:     LD  4,-5(1)	Load left into ac1 
401:    MUL  3,4,3	Op * 
402:     ST  3,-5(1)	Save left side 
403:    LDC  3,444(6)	Load integer constant 
404:     LD  4,-5(1)	Load left into ac1 
405:    DIV  3,4,3	Op / 
406:     ST  3,-5(1)	Save left side 
407:    LDC  3,42(6)	Load integer constant 
408:     LD  4,-5(1)	Load left into ac1 
409:    DIV  5,4,3	Op % 
410:    MUL  5,5,3	 
411:    SUB  3,4,5	 
412:     ST  3,-5(1)	Save left side 
413:    LDC  3,555(6)	Load integer constant 
414:     LD  4,-5(1)	Load left into ac1 
415:    ADD  3,4,3	Op + 
416:     ST  3,-5(1)	Save left side 
417:    LDC  3,666(6)	Load integer constant 
418:     LD  4,-5(1)	Load left into ac1 
419:    TLE  3,4,3	Op <= 
420:    LDC  4,1(6)	Load 1 
421:    XOR  3,3,4	Op NOT 
422:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
423:    LDA  1,-3(1)	Load address of new frame 
424:    LDA  3,1(7)	Return address in ac 
425:    LDA  7,-408(7)	CALL outputb
426:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
427:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
428:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
429:    LDC  3,111(6)	Load integer constant 
430:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
431:    LDA  1,-5(1)	Load address of new frame 
432:    LDA  3,1(7)	Return address in ac 
433:    LDA  7,-392(7)	CALL ident
434:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
435:     ST  3,-5(1)	Save left side 
436:    LDC  3,222(6)	Load integer constant 
437:     LD  4,-5(1)	Load left into ac1 
438:    ADD  3,4,3	Op + 
439:    LDC  4,0(6)	Load 0 
440:    SUB  3,4,3	Op unary - 
441:    LDC  4,0(6)	Load 0 
442:    SUB  3,4,3	Op unary - 
443:     ST  3,-5(1)	Save left side 
444:    LDC  3,333(6)	Load integer constant 
445:     LD  4,-5(1)	Load left into ac1 
446:    MUL  3,4,3	Op * 
447:     ST  3,-5(1)	Save left side 
448:    LDC  3,444(6)	Load integer constant 
449:     LD  4,-5(1)	Load left into ac1 
450:    DIV  3,4,3	Op / 
451:     ST  3,-5(1)	Save left side 
452:    LDC  3,42(6)	Load integer constant 
453:     LD  4,-5(1)	Load left into ac1 
454:    DIV  5,4,3	Op % 
455:    MUL  5,5,3	 
456:    SUB  3,4,5	 
457:     ST  3,-5(1)	Save left side 
458:    LDC  3,555(6)	Load integer constant 
459:     LD  4,-5(1)	Load left into ac1 
460:    ADD  3,4,3	Op + 
461:     ST  3,-5(1)	Save left side 
462:    LDC  3,666(6)	Load integer constant 
463:     LD  4,-5(1)	Load left into ac1 
464:    TLE  3,4,3	Op <= 
465:    LDC  4,1(6)	Load 1 
466:    XOR  3,3,4	Op NOT 
467:    LDC  4,1(6)	Load 1 
468:    XOR  3,3,4	Op NOT 
469:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
470:    LDA  1,-3(1)	Load address of new frame 
471:    LDA  3,1(7)	Return address in ac 
472:    LDA  7,-455(7)	CALL outputb
473:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
474:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
475:    LDA  1,-3(1)	Load address of new frame 
476:    LDA  3,1(7)	Return address in ac 
477:    LDA  7,-441(7)	CALL outnl
478:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
479:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
480:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
481:    LDC  3,111(6)	Load integer constant 
482:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
483:    LDA  1,-5(1)	Load address of new frame 
484:    LDA  3,1(7)	Return address in ac 
485:    LDA  7,-444(7)	CALL ident
486:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
487:     ST  3,-5(1)	Save left side 
488:    LDC  3,222(6)	Load integer constant 
489:     LD  4,-5(1)	Load left into ac1 
490:    ADD  3,4,3	Op + 
491:    LDC  4,0(6)	Load 0 
492:    SUB  3,4,3	Op unary - 
493:    LDC  4,0(6)	Load 0 
494:    SUB  3,4,3	Op unary - 
495:     ST  3,-5(1)	Save left side 
496:    LDC  3,333(6)	Load integer constant 
497:     LD  4,-5(1)	Load left into ac1 
498:    MUL  3,4,3	Op * 
499:     ST  3,-5(1)	Save left side 
500:    LDC  3,444(6)	Load integer constant 
501:     LD  4,-5(1)	Load left into ac1 
502:    DIV  3,4,3	Op / 
503:     ST  3,-5(1)	Save left side 
504:    LDC  3,42(6)	Load integer constant 
505:     LD  4,-5(1)	Load left into ac1 
506:    DIV  5,4,3	Op % 
507:    MUL  5,5,3	 
508:    SUB  3,4,5	 
509:     ST  3,-5(1)	Save left side 
510:    LDC  3,555(6)	Load integer constant 
511:     LD  4,-5(1)	Load left into ac1 
512:    ADD  3,4,3	Op + 
513:     ST  3,-5(1)	Save left side 
514:    LDC  3,666(6)	Load integer constant 
515:     LD  4,-5(1)	Load left into ac1 
516:    TLE  3,4,3	Op <= 
517:    LDC  4,1(6)	Load 1 
518:    XOR  3,3,4	Op NOT 
519:    LDC  4,1(6)	Load 1 
520:    XOR  3,3,4	Op NOT 
521:     ST  3,-5(1)	Save left side 
522:    LDC  3,777(6)	Load integer constant 
523:     ST  3,-6(1)	Save left side 
524:    LDC  3,888(6)	Load integer constant 
525:     LD  4,-6(1)	Load left into ac1 
526:    TLT  3,4,3	Op < 
527:     LD  4,-5(1)	Load left into ac1 
528:    AND  3,4,3	Op AND 
529:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
530:    LDA  1,-3(1)	Load address of new frame 
531:    LDA  3,1(7)	Return address in ac 
532:    LDA  7,-515(7)	CALL outputb
533:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
534:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
535:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
536:    LDC  3,111(6)	Load integer constant 
537:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
538:    LDA  1,-5(1)	Load address of new frame 
539:    LDA  3,1(7)	Return address in ac 
540:    LDA  7,-499(7)	CALL ident
541:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
542:     ST  3,-5(1)	Save left side 
543:    LDC  3,222(6)	Load integer constant 
544:     LD  4,-5(1)	Load left into ac1 
545:    ADD  3,4,3	Op + 
546:    LDC  4,0(6)	Load 0 
547:    SUB  3,4,3	Op unary - 
548:    LDC  4,0(6)	Load 0 
549:    SUB  3,4,3	Op unary - 
550:     ST  3,-5(1)	Save left side 
551:    LDC  3,333(6)	Load integer constant 
552:     LD  4,-5(1)	Load left into ac1 
553:    MUL  3,4,3	Op * 
554:     ST  3,-5(1)	Save left side 
555:    LDC  3,444(6)	Load integer constant 
556:     LD  4,-5(1)	Load left into ac1 
557:    DIV  3,4,3	Op / 
558:     ST  3,-5(1)	Save left side 
559:    LDC  3,42(6)	Load integer constant 
560:     LD  4,-5(1)	Load left into ac1 
561:    DIV  5,4,3	Op % 
562:    MUL  5,5,3	 
563:    SUB  3,4,5	 
564:     ST  3,-5(1)	Save left side 
565:    LDC  3,555(6)	Load integer constant 
566:     LD  4,-5(1)	Load left into ac1 
567:    ADD  3,4,3	Op + 
568:     ST  3,-5(1)	Save left side 
569:    LDC  3,666(6)	Load integer constant 
570:     LD  4,-5(1)	Load left into ac1 
571:    TLE  3,4,3	Op <= 
572:    LDC  4,1(6)	Load 1 
573:    XOR  3,3,4	Op NOT 
574:    LDC  4,1(6)	Load 1 
575:    XOR  3,3,4	Op NOT 
576:     ST  3,-5(1)	Save left side 
577:    LDC  3,777(6)	Load integer constant 
578:     ST  3,-6(1)	Save left side 
579:    LDC  3,888(6)	Load integer constant 
580:     LD  4,-6(1)	Load left into ac1 
581:    TLT  3,4,3	Op < 
582:     LD  4,-5(1)	Load left into ac1 
583:    AND  3,4,3	Op AND 
584:     ST  3,-5(1)	Save left side 
585:    LDC  3,999(6)	Load integer constant 
586:     ST  3,-6(1)	Save left side 
587:    LDC  3,1000(6)	Load integer constant 
588:     LD  4,-6(1)	Load left into ac1 
589:    TNE  3,4,3	Op != 
590:     LD  4,-5(1)	Load left into ac1 
591:     OR  3,4,3	Op OR 
592:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
593:    LDA  1,-3(1)	Load address of new frame 
594:    LDA  3,1(7)	Return address in ac 
595:    LDA  7,-578(7)	CALL outputb
596:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
597:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
598:    LDA  1,-3(1)	Load address of new frame 
599:    LDA  3,1(7)	Return address in ac 
600:    LDA  7,-564(7)	CALL outnl
601:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
602:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ident
603:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
604:    LDC  3,111(6)	Load integer constant 
605:     ST  3,-7(1)	Store parameter 
*                       Jump to ident
606:    LDA  1,-5(1)	Load address of new frame 
607:    LDA  3,1(7)	Return address in ac 
608:    LDA  7,-567(7)	CALL ident
609:    LDA  3,0(2)	Save the result in ac 
*                       End call to ident
610:     ST  3,-5(1)	Save left side 
611:    LDC  3,222(6)	Load integer constant 
612:     LD  4,-5(1)	Load left into ac1 
613:    ADD  3,4,3	Op + 
614:    LDC  4,0(6)	Load 0 
615:    SUB  3,4,3	Op unary - 
616:    LDC  4,0(6)	Load 0 
617:    SUB  3,4,3	Op unary - 
618:     ST  3,-5(1)	Save left side 
619:    LDC  3,333(6)	Load integer constant 
620:     LD  4,-5(1)	Load left into ac1 
621:    MUL  3,4,3	Op * 
622:     ST  3,-5(1)	Save left side 
623:    LDC  3,444(6)	Load integer constant 
624:     LD  4,-5(1)	Load left into ac1 
625:    DIV  3,4,3	Op / 
626:     ST  3,-5(1)	Save left side 
627:    LDC  3,42(6)	Load integer constant 
628:     LD  4,-5(1)	Load left into ac1 
629:    DIV  5,4,3	Op % 
630:    MUL  5,5,3	 
631:    SUB  3,4,5	 
632:     ST  3,-5(1)	Save left side 
633:    LDC  3,555(6)	Load integer constant 
634:     LD  4,-5(1)	Load left into ac1 
635:    ADD  3,4,3	Op + 
636:     ST  3,-5(1)	Save left side 
637:    LDC  3,666(6)	Load integer constant 
638:     LD  4,-5(1)	Load left into ac1 
639:    TLE  3,4,3	Op <= 
640:    LDC  4,1(6)	Load 1 
641:    XOR  3,3,4	Op NOT 
642:    LDC  4,1(6)	Load 1 
643:    XOR  3,3,4	Op NOT 
644:     ST  3,-5(1)	Save left side 
645:    LDC  3,777(6)	Load integer constant 
646:     ST  3,-6(1)	Save left side 
647:    LDC  3,888(6)	Load integer constant 
648:     LD  4,-6(1)	Load left into ac1 
649:    TLT  3,4,3	Op < 
650:     LD  4,-5(1)	Load left into ac1 
651:    AND  3,4,3	Op AND 
652:     ST  3,-5(1)	Save left side 
653:    LDC  3,999(6)	Load integer constant 
654:     ST  3,-6(1)	Save left side 
655:    LDC  3,1000(6)	Load integer constant 
656:     LD  4,-6(1)	Load left into ac1 
657:    TNE  3,4,3	Op != 
658:     LD  4,-5(1)	Load left into ac1 
659:     OR  3,4,3	Op OR 
660:     ST  3,-2(1)	Store variable x
661:     ST  3,-5(1)	Store parameter 
*                       Jump to outputb
662:    LDA  1,-3(1)	Load address of new frame 
663:    LDA  3,1(7)	Return address in ac 
664:    LDA  7,-647(7)	CALL outputb
665:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
666:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
667:    LDA  1,-3(1)	Load address of new frame 
668:    LDA  3,1(7)	Return address in ac 
669:    LDA  7,-633(7)	CALL outnl
670:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
671:    LDC  2,0(6)	Set return value to 0 
672:     LD  3,-1(1)	Load return address 
673:     LD  1,0(1)	Adjust fp 
674:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,674(7)	Jump to init [backpatch] 
* INIT
675:     LD  0,0(0)	Set the global pointer 
676:    LDA  1,0(0)	set first frame at end of globals 
677:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
678:    LDA  3,1(7)	Return address in ac 
679:    LDA  7,-628(7)	Jump to main 
680:   HALT  0,0,0	DONE! 
* END INIT
