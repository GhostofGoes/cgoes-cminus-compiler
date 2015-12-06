* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  c13.c-
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
 43:    LDC  3,300(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
* EXPRESSION
 45:    LDC  3,5(6)	Load integer constant 
 46:     ST  3,-303(1)	Store variable z
* EXPRESSION
 47:     LD  3,-303(1)	Load variable z
 48:     ST  3,-304(1)	Save index 
 49:    LDC  3,73(6)	Load integer constant 
 50:     LD  4,-304(1)	Restore index 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 54:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
 55:     LD  3,-303(1)	Load variable z
 56:    LDA  4,-3(1)	Load address of base of array x
 57:    SUB  3,4,3	Compute offset of value 
 58:     LD  3,0(3)	Load the value 
 59:     ST  3,-306(1)	Store parameter 
*                       Jump to output
 60:    LDA  1,-304(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 64:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
 65:    LDA  1,-304(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-31(7)	CALL outnl
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 69:    LDC  3,5(6)	Load integer constant 
 70:     ST  3,-303(1)	Store variable z
* EXPRESSION
 71:     LD  3,-303(1)	Load variable z
 72:     ST  3,-304(1)	Save index 
 73:    LDC  3,17(6)	Load integer constant 
 74:     LD  4,-304(1)	Restore index 
 75:    LDA  5,-3(1)	Load address of base of array x
 76:    SUB  5,5,4	Compute offset of value 
 77:     ST  3,0(5)	Store variable x
* EXPRESSION
 78:    LDC  3,17(6)	Load integer constant 
 79:     ST  3,-303(1)	Store variable z
* EXPRESSION
 80:     LD  3,-303(1)	Load variable z
 81:     ST  3,-304(1)	Save index 
 82:    LDC  3,5(6)	Load integer constant 
 83:     LD  4,-304(1)	Restore index 
 84:    LDA  5,-3(1)	Load address of base of array x
 85:    SUB  5,5,4	Compute offset of value 
 86:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
 88:     LD  3,-303(1)	Load variable z
 89:    LDA  4,-3(1)	Load address of base of array x
 90:    SUB  3,4,3	Compute offset of value 
 91:     LD  3,0(3)	Load the value 
 92:     ST  3,-306(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-304(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 97:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
 98:    LDA  1,-304(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-64(7)	CALL outnl
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
102:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
103:     LD  3,-303(1)	Load variable z
104:    LDA  4,-3(1)	Load address of base of array x
105:    SUB  3,4,3	Compute offset of value 
106:     LD  3,0(3)	Load the value 
107:    LDA  4,-3(1)	Load address of base of array x
108:    SUB  3,4,3	Compute offset of value 
109:     LD  3,0(3)	Load the value 
110:     ST  3,-306(1)	Store parameter 
*                       Jump to output
111:    LDA  1,-304(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-108(7)	CALL output
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
115:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
116:    LDA  1,-304(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-82(7)	CALL outnl
119:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
120:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
121:     LD  3,-303(1)	Load variable z
122:    LDA  4,-3(1)	Load address of base of array x
123:    SUB  3,4,3	Compute offset of value 
124:     LD  3,0(3)	Load the value 
125:    LDA  4,-3(1)	Load address of base of array x
126:    SUB  3,4,3	Compute offset of value 
127:     LD  3,0(3)	Load the value 
128:    LDA  4,-3(1)	Load address of base of array x
129:    SUB  3,4,3	Compute offset of value 
130:     LD  3,0(3)	Load the value 
131:     ST  3,-306(1)	Store parameter 
*                       Jump to output
132:    LDA  1,-304(1)	Load address of new frame 
133:    LDA  3,1(7)	Return address in ac 
134:    LDA  7,-129(7)	CALL output
135:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
136:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
137:    LDA  1,-304(1)	Load address of new frame 
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-103(7)	CALL outnl
140:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
141:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
142:     LD  3,-303(1)	Load variable z
143:    LDA  4,-3(1)	Load address of base of array x
144:    SUB  3,4,3	Compute offset of value 
145:     LD  3,0(3)	Load the value 
146:    LDA  4,-3(1)	Load address of base of array x
147:    SUB  3,4,3	Compute offset of value 
148:     LD  3,0(3)	Load the value 
149:    LDA  4,-3(1)	Load address of base of array x
150:    SUB  3,4,3	Compute offset of value 
151:     LD  3,0(3)	Load the value 
152:    LDA  4,-3(1)	Load address of base of array x
153:    SUB  3,4,3	Compute offset of value 
154:     LD  3,0(3)	Load the value 
155:     ST  3,-306(1)	Store parameter 
*                       Jump to output
156:    LDA  1,-304(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-153(7)	CALL output
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
160:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
161:    LDA  1,-304(1)	Load address of new frame 
162:    LDA  3,1(7)	Return address in ac 
163:    LDA  7,-127(7)	CALL outnl
164:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
165:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
166:     LD  3,-303(1)	Load variable z
167:    LDA  4,-3(1)	Load address of base of array x
168:    SUB  3,4,3	Compute offset of value 
169:     LD  3,0(3)	Load the value 
170:    LDA  4,-3(1)	Load address of base of array x
171:    SUB  3,4,3	Compute offset of value 
172:     LD  3,0(3)	Load the value 
173:    LDA  4,-3(1)	Load address of base of array x
174:    SUB  3,4,3	Compute offset of value 
175:     LD  3,0(3)	Load the value 
176:    LDA  4,-3(1)	Load address of base of array x
177:    SUB  3,4,3	Compute offset of value 
178:     LD  3,0(3)	Load the value 
179:    LDA  4,-3(1)	Load address of base of array x
180:    SUB  3,4,3	Compute offset of value 
181:     LD  3,0(3)	Load the value 
182:     ST  3,-306(1)	Store parameter 
*                       Jump to output
183:    LDA  1,-304(1)	Load address of new frame 
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-180(7)	CALL output
186:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
187:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
188:    LDA  1,-304(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-154(7)	CALL outnl
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
192:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
193:     LD  3,-303(1)	Load variable z
194:    LDA  4,-3(1)	Load address of base of array x
195:    SUB  3,4,3	Compute offset of value 
196:     LD  3,0(3)	Load the value 
197:    LDA  4,-3(1)	Load address of base of array x
198:    SUB  3,4,3	Compute offset of value 
199:     LD  3,0(3)	Load the value 
200:    LDA  4,-3(1)	Load address of base of array x
201:    SUB  3,4,3	Compute offset of value 
202:     LD  3,0(3)	Load the value 
203:    LDA  4,-3(1)	Load address of base of array x
204:    SUB  3,4,3	Compute offset of value 
205:     LD  3,0(3)	Load the value 
206:    LDA  4,-3(1)	Load address of base of array x
207:    SUB  3,4,3	Compute offset of value 
208:     LD  3,0(3)	Load the value 
209:    LDA  4,-3(1)	Load address of base of array x
210:    SUB  3,4,3	Compute offset of value 
211:     LD  3,0(3)	Load the value 
212:     ST  3,-306(1)	Store parameter 
*                       Jump to output
213:    LDA  1,-304(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-210(7)	CALL output
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
217:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
218:    LDA  1,-304(1)	Load address of new frame 
219:    LDA  3,1(7)	Return address in ac 
220:    LDA  7,-184(7)	CALL outnl
221:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
222:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
223:     LD  3,-303(1)	Load variable z
224:    LDA  4,-3(1)	Load address of base of array x
225:    SUB  3,4,3	Compute offset of value 
226:     LD  3,0(3)	Load the value 
227:    LDA  4,-3(1)	Load address of base of array x
228:    SUB  3,4,3	Compute offset of value 
229:     LD  3,0(3)	Load the value 
230:    LDA  4,-3(1)	Load address of base of array x
231:    SUB  3,4,3	Compute offset of value 
232:     LD  3,0(3)	Load the value 
233:    LDA  4,-3(1)	Load address of base of array x
234:    SUB  3,4,3	Compute offset of value 
235:     LD  3,0(3)	Load the value 
236:    LDA  4,-3(1)	Load address of base of array x
237:    SUB  3,4,3	Compute offset of value 
238:     LD  3,0(3)	Load the value 
239:    LDA  4,-3(1)	Load address of base of array x
240:    SUB  3,4,3	Compute offset of value 
241:     LD  3,0(3)	Load the value 
242:    LDA  4,-3(1)	Load address of base of array x
243:    SUB  3,4,3	Compute offset of value 
244:     LD  3,0(3)	Load the value 
245:     ST  3,-306(1)	Store parameter 
*                       Jump to output
246:    LDA  1,-304(1)	Load address of new frame 
247:    LDA  3,1(7)	Return address in ac 
248:    LDA  7,-243(7)	CALL output
249:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
250:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
251:    LDA  1,-304(1)	Load address of new frame 
252:    LDA  3,1(7)	Return address in ac 
253:    LDA  7,-217(7)	CALL outnl
254:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
255:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
256:     LD  3,-303(1)	Load variable z
257:    LDA  4,-3(1)	Load address of base of array x
258:    SUB  3,4,3	Compute offset of value 
259:     LD  3,0(3)	Load the value 
260:    LDA  4,-3(1)	Load address of base of array x
261:    SUB  3,4,3	Compute offset of value 
262:     LD  3,0(3)	Load the value 
263:    LDA  4,-3(1)	Load address of base of array x
264:    SUB  3,4,3	Compute offset of value 
265:     LD  3,0(3)	Load the value 
266:    LDA  4,-3(1)	Load address of base of array x
267:    SUB  3,4,3	Compute offset of value 
268:     LD  3,0(3)	Load the value 
269:    LDA  4,-3(1)	Load address of base of array x
270:    SUB  3,4,3	Compute offset of value 
271:     LD  3,0(3)	Load the value 
272:    LDA  4,-3(1)	Load address of base of array x
273:    SUB  3,4,3	Compute offset of value 
274:     LD  3,0(3)	Load the value 
275:    LDA  4,-3(1)	Load address of base of array x
276:    SUB  3,4,3	Compute offset of value 
277:     LD  3,0(3)	Load the value 
278:    LDA  4,-3(1)	Load address of base of array x
279:    SUB  3,4,3	Compute offset of value 
280:     LD  3,0(3)	Load the value 
281:     ST  3,-306(1)	Store parameter 
*                       Jump to output
282:    LDA  1,-304(1)	Load address of new frame 
283:    LDA  3,1(7)	Return address in ac 
284:    LDA  7,-279(7)	CALL output
285:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
286:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
287:    LDA  1,-304(1)	Load address of new frame 
288:    LDA  3,1(7)	Return address in ac 
289:    LDA  7,-253(7)	CALL outnl
290:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
291:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
292:     LD  3,-303(1)	Load variable z
293:    LDA  4,-3(1)	Load address of base of array x
294:    SUB  3,4,3	Compute offset of value 
295:     LD  3,0(3)	Load the value 
296:    LDA  4,-3(1)	Load address of base of array x
297:    SUB  3,4,3	Compute offset of value 
298:     LD  3,0(3)	Load the value 
299:    LDA  4,-3(1)	Load address of base of array x
300:    SUB  3,4,3	Compute offset of value 
301:     LD  3,0(3)	Load the value 
302:    LDA  4,-3(1)	Load address of base of array x
303:    SUB  3,4,3	Compute offset of value 
304:     LD  3,0(3)	Load the value 
305:    LDA  4,-3(1)	Load address of base of array x
306:    SUB  3,4,3	Compute offset of value 
307:     LD  3,0(3)	Load the value 
308:    LDA  4,-3(1)	Load address of base of array x
309:    SUB  3,4,3	Compute offset of value 
310:     LD  3,0(3)	Load the value 
311:    LDA  4,-3(1)	Load address of base of array x
312:    SUB  3,4,3	Compute offset of value 
313:     LD  3,0(3)	Load the value 
314:    LDA  4,-3(1)	Load address of base of array x
315:    SUB  3,4,3	Compute offset of value 
316:     LD  3,0(3)	Load the value 
317:    LDA  4,-3(1)	Load address of base of array x
318:    SUB  3,4,3	Compute offset of value 
319:     LD  3,0(3)	Load the value 
320:     ST  3,-306(1)	Store parameter 
*                       Jump to output
321:    LDA  1,-304(1)	Load address of new frame 
322:    LDA  3,1(7)	Return address in ac 
323:    LDA  7,-318(7)	CALL output
324:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
325:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
326:    LDA  1,-304(1)	Load address of new frame 
327:    LDA  3,1(7)	Return address in ac 
328:    LDA  7,-292(7)	CALL outnl
329:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
330:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Load param 1
331:     LD  3,-303(1)	Load variable z
332:    LDA  4,-3(1)	Load address of base of array x
333:    SUB  3,4,3	Compute offset of value 
334:     LD  3,0(3)	Load the value 
335:    LDA  4,-3(1)	Load address of base of array x
336:    SUB  3,4,3	Compute offset of value 
337:     LD  3,0(3)	Load the value 
338:    LDA  4,-3(1)	Load address of base of array x
339:    SUB  3,4,3	Compute offset of value 
340:     LD  3,0(3)	Load the value 
341:    LDA  4,-3(1)	Load address of base of array x
342:    SUB  3,4,3	Compute offset of value 
343:     LD  3,0(3)	Load the value 
344:    LDA  4,-3(1)	Load address of base of array x
345:    SUB  3,4,3	Compute offset of value 
346:     LD  3,0(3)	Load the value 
347:    LDA  4,-3(1)	Load address of base of array x
348:    SUB  3,4,3	Compute offset of value 
349:     LD  3,0(3)	Load the value 
350:    LDA  4,-3(1)	Load address of base of array x
351:    SUB  3,4,3	Compute offset of value 
352:     LD  3,0(3)	Load the value 
353:    LDA  4,-3(1)	Load address of base of array x
354:    SUB  3,4,3	Compute offset of value 
355:     LD  3,0(3)	Load the value 
356:    LDA  4,-3(1)	Load address of base of array x
357:    SUB  3,4,3	Compute offset of value 
358:     LD  3,0(3)	Load the value 
359:    LDA  4,-3(1)	Load address of base of array x
360:    SUB  3,4,3	Compute offset of value 
361:     LD  3,0(3)	Load the value 
362:     ST  3,-306(1)	Store parameter 
*                       Jump to output
363:    LDA  1,-304(1)	Load address of new frame 
364:    LDA  3,1(7)	Return address in ac 
365:    LDA  7,-360(7)	CALL output
366:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
367:     ST  1,-304(1)	Store old fp in ghost frame 
*                       Jump to outnl
368:    LDA  1,-304(1)	Load address of new frame 
369:    LDA  3,1(7)	Return address in ac 
370:    LDA  7,-334(7)	CALL outnl
371:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
372:    LDC  2,0(6)	Set return value to 0 
373:     LD  3,-1(1)	Load return address 
374:     LD  1,0(1)	Adjust fp 
375:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,375(7)	Jump to init [backpatch] 
* INIT
376:     LD  0,0(0)	Set the global pointer 
377:    LDA  1,0(0)	set first frame at end of globals 
378:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
379:    LDA  3,1(7)	Return address in ac 
380:    LDA  7,-339(7)	Jump to main 
381:   HALT  0,0,0	DONE! 
* END INIT
