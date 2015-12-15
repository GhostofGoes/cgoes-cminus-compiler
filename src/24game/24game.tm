* File name:     	24game.tm
* File compiled: 	24game.c-
* Compiled using:	Cgoes Cminus Compiler (CCC)
* Author:        	Christopher Goes
* Generated at:  	Tue Dec 15 14:42:09 2015

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
* FUNCTION checkDig
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 43:     LD  3,-2(1)	Load param variable dig 
 44:     ST  3,-3(1)	Save left side 
 45:     LD  3,0(0)	Load global variable a 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TNE  3,4,3	Op != 
 48:     ST  3,-3(1)	Save left side 
 49:     LD  3,-2(1)	Load param variable dig 
 50:     ST  3,-4(1)	Save left side 
 51:     LD  3,-1(0)	Load global variable b 
 52:     LD  4,-4(1)	Load left into ac1 
 53:    TNE  3,4,3	Op != 
 54:     LD  4,-3(1)	Load left into ac1 
 55:    AND  3,4,3	Op AND 
 56:     ST  3,-3(1)	Save left side 
 57:     LD  3,-2(1)	Load param variable dig 
 58:     ST  3,-4(1)	Save left side 
 59:     LD  3,-2(0)	Load global variable c 
 60:     LD  4,-4(1)	Load left into ac1 
 61:    TNE  3,4,3	Op != 
 62:     LD  4,-3(1)	Load left into ac1 
 63:    AND  3,4,3	Op AND 
 64:     ST  3,-3(1)	Save left side 
 65:     LD  3,-2(1)	Load param variable dig 
 66:     ST  3,-4(1)	Save left side 
 67:     LD  3,-3(0)	Load global variable d 
 68:     LD  4,-4(1)	Load left into ac1 
 69:    TNE  3,4,3	Op != 
 70:     LD  4,-3(1)	Load left into ac1 
 71:    AND  3,4,3	Op AND 
* THEN
* RETURN
 73:    LDC  3,0(6)	Load Boolean constant 
 74:    LDA  2,0(3)	Save result into ret 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    LDA  7,0(3)	Return 
 72:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 79:    LDC  3,1(6)	Load Boolean constant 
 80:    LDA  2,0(3)	Save result into ret 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
 78:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6)	Set return value to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END FUNCTION checkDig
* FUNCTION checkOp
 88:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 89:     LD  3,-2(1)	Load param variable op 
 90:     ST  3,-3(1)	Save left side 
 91:    LDC  3,42(6)	Load char constant 
 92:     LD  4,-3(1)	Load left into ac1 
 93:    TNE  3,4,3	Op != 
 94:     ST  3,-3(1)	Save left side 
 95:     LD  3,-2(1)	Load param variable op 
 96:     ST  3,-4(1)	Save left side 
 97:    LDC  3,47(6)	Load char constant 
 98:     LD  4,-4(1)	Load left into ac1 
 99:    TNE  3,4,3	Op != 
100:     LD  4,-3(1)	Load left into ac1 
101:    AND  3,4,3	Op AND 
102:     ST  3,-3(1)	Save left side 
103:     LD  3,-2(1)	Load param variable op 
104:     ST  3,-4(1)	Save left side 
105:    LDC  3,43(6)	Load char constant 
106:     LD  4,-4(1)	Load left into ac1 
107:    TNE  3,4,3	Op != 
108:     LD  4,-3(1)	Load left into ac1 
109:    AND  3,4,3	Op AND 
110:     ST  3,-3(1)	Save left side 
111:     LD  3,-2(1)	Load param variable op 
112:     ST  3,-4(1)	Save left side 
113:    LDC  3,45(6)	Load char constant 
114:     LD  4,-4(1)	Load left into ac1 
115:    TNE  3,4,3	Op != 
116:     LD  4,-3(1)	Load left into ac1 
117:    AND  3,4,3	Op AND 
* THEN
* RETURN
119:    LDC  3,0(6)	Load Boolean constant 
120:    LDA  2,0(3)	Save result into ret 
121:     LD  3,-1(1)	Load return address 
122:     LD  1,0(1)	Adjust fp 
123:    LDA  7,0(3)	Return 
118:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
125:    LDC  3,1(6)	Load Boolean constant 
126:    LDA  2,0(3)	Save result into ret 
127:     LD  3,-1(1)	Load return address 
128:     LD  1,0(1)	Adjust fp 
129:    LDA  7,0(3)	Return 
124:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
130:    LDC  2,0(6)	Set return value to 0 
131:     LD  3,-1(1)	Load return address 
132:     LD  1,0(1)	Adjust fp 
133:    LDA  7,0(3)	Return 
* END FUNCTION checkOp
* FUNCTION genDigits
134:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
135:    LDC  3,9(6)	Load integer constant 
136:     ST  3,-2(1)	Store local variable range 
* EXPRESSION
137:     LD  3,-2(1)	Load local variable range 
138:    RND  3,3,6	Op ? 
139:     ST  3,-3(1)	Save left side 
140:    LDC  3,1(6)	Load integer constant 
141:     LD  4,-3(1)	Load left into ac1 
142:    ADD  3,4,3	Op + 
143:     ST  3,0(0)	Store global variable a 
* EXPRESSION
144:     LD  3,-2(1)	Load local variable range 
145:    RND  3,3,6	Op ? 
146:     ST  3,-3(1)	Save left side 
147:    LDC  3,1(6)	Load integer constant 
148:     LD  4,-3(1)	Load left into ac1 
149:    ADD  3,4,3	Op + 
150:     ST  3,-1(0)	Store global variable b 
* EXPRESSION
151:     LD  3,-2(1)	Load local variable range 
152:    RND  3,3,6	Op ? 
153:     ST  3,-3(1)	Save left side 
154:    LDC  3,1(6)	Load integer constant 
155:     LD  4,-3(1)	Load left into ac1 
156:    ADD  3,4,3	Op + 
157:     ST  3,-2(0)	Store global variable c 
* EXPRESSION
158:     LD  3,-2(1)	Load local variable range 
159:    RND  3,3,6	Op ? 
160:     ST  3,-3(1)	Save left side 
161:    LDC  3,1(6)	Load integer constant 
162:     LD  4,-3(1)	Load left into ac1 
163:    ADD  3,4,3	Op + 
164:     ST  3,-3(0)	Store global variable d 
* END COMPOUND
* Add standard closing in case there is no return statement
165:    LDC  2,0(6)	Set return value to 0 
166:     LD  3,-1(1)	Load return address 
167:     LD  1,0(1)	Adjust fp 
168:    LDA  7,0(3)	Return 
* END FUNCTION genDigits
* FUNCTION genTestDigits
169:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
170:     LD  3,-11(0)	Load global variable testCount 
171:     ST  3,0(0)	Store global variable a 
* EXPRESSION
172:     LD  3,-11(0)	Load global variable testCount 
173:     ST  3,-1(0)	Store global variable b 
* EXPRESSION
174:     LD  3,-11(0)	Load global variable testCount 
175:     ST  3,-2(0)	Store global variable c 
* EXPRESSION
176:     LD  3,-11(0)	Load global variable testCount 
177:     ST  3,-3(0)	Store global variable d 
* END COMPOUND
* Add standard closing in case there is no return statement
178:    LDC  2,0(6)	Set return value to 0 
179:     LD  3,-1(1)	Load return address 
180:     LD  1,0(1)	Adjust fp 
181:    LDA  7,0(3)	Return 
* END FUNCTION genTestDigits
* FUNCTION outputDigits
182:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
183:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
184:    LDA  1,-2(1)	Load address of new frame 
185:    LDA  3,1(7)	Save return address 
186:    LDA  7,-150(7)	CALL outnl 
187:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
188:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
189:     LD  3,0(0)	Load global variable a 
190:     ST  3,-4(1)	Store paramater 1 
*                       Jump to output
191:    LDA  1,-2(1)	Load address of new frame 
192:    LDA  3,1(7)	Save return address 
193:    LDA  7,-188(7)	CALL output 
194:    LDA  3,0(2)	Save function result 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
195:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
196:     LD  3,-1(0)	Load global variable b 
197:     ST  3,-4(1)	Store paramater 1 
*                       Jump to output
198:    LDA  1,-2(1)	Load address of new frame 
199:    LDA  3,1(7)	Save return address 
200:    LDA  7,-195(7)	CALL output 
201:    LDA  3,0(2)	Save function result 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
202:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
203:     LD  3,-2(0)	Load global variable c 
204:     ST  3,-4(1)	Store paramater 1 
*                       Jump to output
205:    LDA  1,-2(1)	Load address of new frame 
206:    LDA  3,1(7)	Save return address 
207:    LDA  7,-202(7)	CALL output 
208:    LDA  3,0(2)	Save function result 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
209:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
210:     LD  3,-3(0)	Load global variable d 
211:     ST  3,-4(1)	Store paramater 1 
*                       Jump to output
212:    LDA  1,-2(1)	Load address of new frame 
213:    LDA  3,1(7)	Save return address 
214:    LDA  7,-209(7)	CALL output 
215:    LDA  3,0(2)	Save function result 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
216:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
217:    LDA  1,-2(1)	Load address of new frame 
218:    LDA  3,1(7)	Save return address 
219:    LDA  7,-183(7)	CALL outnl 
220:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
221:    LDC  2,0(6)	Set return value to 0 
222:     LD  3,-1(1)	Load return address 
223:     LD  1,0(1)	Adjust fp 
224:    LDA  7,0(3)	Return 
* END FUNCTION outputDigits
* FUNCTION getUserExpression
225:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
* EXPRESSION
*                       Begin call to  input
226:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to input
227:    LDA  1,-2(1)	Load address of new frame 
228:    LDA  3,1(7)	Save return address 
229:    LDA  7,-229(7)	CALL input 
230:    LDA  3,0(2)	Save function result 
*                       End call to input
231:     ST  3,-4(0)	Store global variable dig1 
* EXPRESSION
* EXPRESSION
*                       Begin call to  inputc
232:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to inputc
233:    LDA  1,-2(1)	Load address of new frame 
234:    LDA  3,1(7)	Save return address 
235:    LDA  7,-211(7)	CALL inputc 
236:    LDA  3,0(2)	Save function result 
*                       End call to inputc
237:     ST  3,-8(0)	Store global variable op1 
* EXPRESSION
* EXPRESSION
*                       Begin call to  input
238:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to input
239:    LDA  1,-2(1)	Load address of new frame 
240:    LDA  3,1(7)	Save return address 
241:    LDA  7,-241(7)	CALL input 
242:    LDA  3,0(2)	Save function result 
*                       End call to input
243:     ST  3,-5(0)	Store global variable dig2 
* EXPRESSION
* EXPRESSION
*                       Begin call to  inputc
244:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to inputc
245:    LDA  1,-2(1)	Load address of new frame 
246:    LDA  3,1(7)	Save return address 
247:    LDA  7,-223(7)	CALL inputc 
248:    LDA  3,0(2)	Save function result 
*                       End call to inputc
249:     ST  3,-9(0)	Store global variable op2 
* EXPRESSION
* EXPRESSION
*                       Begin call to  input
250:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to input
251:    LDA  1,-2(1)	Load address of new frame 
252:    LDA  3,1(7)	Save return address 
253:    LDA  7,-253(7)	CALL input 
254:    LDA  3,0(2)	Save function result 
*                       End call to input
255:     ST  3,-6(0)	Store global variable dig3 
* EXPRESSION
* EXPRESSION
*                       Begin call to  inputc
256:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to inputc
257:    LDA  1,-2(1)	Load address of new frame 
258:    LDA  3,1(7)	Save return address 
259:    LDA  7,-235(7)	CALL inputc 
260:    LDA  3,0(2)	Save function result 
*                       End call to inputc
261:     ST  3,-10(0)	Store global variable op3 
* EXPRESSION
* EXPRESSION
*                       Begin call to  input
262:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to input
263:    LDA  1,-2(1)	Load address of new frame 
264:    LDA  3,1(7)	Save return address 
265:    LDA  7,-265(7)	CALL input 
266:    LDA  3,0(2)	Save function result 
*                       End call to input
267:     ST  3,-7(0)	Store global variable dig4 
* END COMPOUND
* Add standard closing in case there is no return statement
268:    LDC  2,0(6)	Set return value to 0 
269:     LD  3,-1(1)	Load return address 
270:     LD  1,0(1)	Adjust fp 
271:    LDA  7,0(3)	Return 
* END FUNCTION getUserExpression
* FUNCTION checkUserInput
272:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
* EXPRESSION
*                       Begin call to  checkDig
273:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
274:     LD  3,-4(0)	Load global variable dig1 
275:     ST  3,-4(1)	Store paramater 1 
*                       Jump to checkDig
276:    LDA  1,-2(1)	Load address of new frame 
277:    LDA  3,1(7)	Save return address 
278:    LDA  7,-237(7)	CALL checkDig 
279:    LDA  3,0(2)	Save function result 
*                       End call to checkDig
280:     ST  3,-2(1)	Save left side 
281:    LDC  3,0(6)	Load Boolean constant 
282:     LD  4,-2(1)	Load left into ac1 
283:    TEQ  3,4,3	Op == 
284:     ST  3,-2(1)	Save left side 
* EXPRESSION
*                       Begin call to  checkDig
285:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
286:     LD  3,-5(0)	Load global variable dig2 
287:     ST  3,-5(1)	Store paramater 1 
*                       Jump to checkDig
288:    LDA  1,-3(1)	Load address of new frame 
289:    LDA  3,1(7)	Save return address 
290:    LDA  7,-249(7)	CALL checkDig 
291:    LDA  3,0(2)	Save function result 
*                       End call to checkDig
292:     ST  3,-3(1)	Save left side 
293:    LDC  3,0(6)	Load Boolean constant 
294:     LD  4,-3(1)	Load left into ac1 
295:    TEQ  3,4,3	Op == 
296:     LD  4,-2(1)	Load left into ac1 
297:     OR  3,4,3	Op OR 
298:     ST  3,-2(1)	Save left side 
* EXPRESSION
*                       Begin call to  checkDig
299:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
300:     LD  3,-6(0)	Load global variable dig3 
301:     ST  3,-5(1)	Store paramater 1 
*                       Jump to checkDig
302:    LDA  1,-3(1)	Load address of new frame 
303:    LDA  3,1(7)	Save return address 
304:    LDA  7,-263(7)	CALL checkDig 
305:    LDA  3,0(2)	Save function result 
*                       End call to checkDig
306:     ST  3,-3(1)	Save left side 
307:    LDC  3,0(6)	Load Boolean constant 
308:     LD  4,-3(1)	Load left into ac1 
309:    TEQ  3,4,3	Op == 
310:     LD  4,-2(1)	Load left into ac1 
311:     OR  3,4,3	Op OR 
312:     ST  3,-2(1)	Save left side 
* EXPRESSION
*                       Begin call to  checkDig
313:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
314:     LD  3,-7(0)	Load global variable dig4 
315:     ST  3,-5(1)	Store paramater 1 
*                       Jump to checkDig
316:    LDA  1,-3(1)	Load address of new frame 
317:    LDA  3,1(7)	Save return address 
318:    LDA  7,-277(7)	CALL checkDig 
319:    LDA  3,0(2)	Save function result 
*                       End call to checkDig
320:     ST  3,-3(1)	Save left side 
321:    LDC  3,0(6)	Load Boolean constant 
322:     LD  4,-3(1)	Load left into ac1 
323:    TEQ  3,4,3	Op == 
324:     LD  4,-2(1)	Load left into ac1 
325:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outputc
327:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
328:    LDC  3,68(6)	Load char constant 
329:     ST  3,-4(1)	Store paramater 1 
*                       Jump to outputc
330:    LDA  1,-2(1)	Load address of new frame 
331:    LDA  3,1(7)	Save return address 
332:    LDA  7,-303(7)	CALL outputc 
333:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* IF
* EXPRESSION
*                       Begin call to  checkOp
334:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
335:     LD  3,-8(0)	Load global variable op1 
336:     ST  3,-4(1)	Store paramater 1 
*                       Jump to checkOp
337:    LDA  1,-2(1)	Load address of new frame 
338:    LDA  3,1(7)	Save return address 
339:    LDA  7,-252(7)	CALL checkOp 
340:    LDA  3,0(2)	Save function result 
*                       End call to checkOp
341:     ST  3,-2(1)	Save left side 
342:    LDC  3,0(6)	Load Boolean constant 
343:     LD  4,-2(1)	Load left into ac1 
344:    TEQ  3,4,3	Op == 
345:     ST  3,-2(1)	Save left side 
* EXPRESSION
*                       Begin call to  checkOp
346:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
347:     LD  3,-9(0)	Load global variable op2 
348:     ST  3,-5(1)	Store paramater 1 
*                       Jump to checkOp
349:    LDA  1,-3(1)	Load address of new frame 
350:    LDA  3,1(7)	Save return address 
351:    LDA  7,-264(7)	CALL checkOp 
352:    LDA  3,0(2)	Save function result 
*                       End call to checkOp
353:     ST  3,-3(1)	Save left side 
354:    LDC  3,0(6)	Load Boolean constant 
355:     LD  4,-3(1)	Load left into ac1 
356:    TEQ  3,4,3	Op == 
357:     LD  4,-2(1)	Load left into ac1 
358:     OR  3,4,3	Op OR 
359:     ST  3,-2(1)	Save left side 
* EXPRESSION
*                       Begin call to  checkOp
360:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
361:     LD  3,-10(0)	Load global variable op3 
362:     ST  3,-5(1)	Store paramater 1 
*                       Jump to checkOp
363:    LDA  1,-3(1)	Load address of new frame 
364:    LDA  3,1(7)	Save return address 
365:    LDA  7,-278(7)	CALL checkOp 
366:    LDA  3,0(2)	Save function result 
*                       End call to checkOp
367:     ST  3,-3(1)	Save left side 
368:    LDC  3,0(6)	Load Boolean constant 
369:     LD  4,-3(1)	Load left into ac1 
370:    TEQ  3,4,3	Op == 
371:     LD  4,-2(1)	Load left into ac1 
372:     OR  3,4,3	Op OR 
* THEN
* EXPRESSION
*                       Begin call to  outputc
374:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
375:    LDC  3,79(6)	Load char constant 
376:     ST  3,-4(1)	Store paramater 1 
*                       Jump to outputc
377:    LDA  1,-2(1)	Load address of new frame 
378:    LDA  3,1(7)	Save return address 
379:    LDA  7,-350(7)	CALL outputc 
380:    LDA  3,0(2)	Save function result 
*                       End call to outputc
373:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
381:    LDC  3,0(6)	Load Boolean constant 
382:    LDA  2,0(3)	Save result into ret 
383:     LD  3,-1(1)	Load return address 
384:     LD  1,0(1)	Adjust fp 
385:    LDA  7,0(3)	Return 
* END COMPOUND
326:    JZR  3,59(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
* EXPRESSION
*                       Begin call to  checkOp
386:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
387:     LD  3,-8(0)	Load global variable op1 
388:     ST  3,-4(1)	Store paramater 1 
*                       Jump to checkOp
389:    LDA  1,-2(1)	Load address of new frame 
390:    LDA  3,1(7)	Save return address 
391:    LDA  7,-304(7)	CALL checkOp 
392:    LDA  3,0(2)	Save function result 
*                       End call to checkOp
393:     ST  3,-2(1)	Save left side 
394:    LDC  3,0(6)	Load Boolean constant 
395:     LD  4,-2(1)	Load left into ac1 
396:    TEQ  3,4,3	Op == 
397:     ST  3,-2(1)	Save left side 
* EXPRESSION
*                       Begin call to  checkOp
398:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
399:     LD  3,-9(0)	Load global variable op2 
400:     ST  3,-5(1)	Store paramater 1 
*                       Jump to checkOp
401:    LDA  1,-3(1)	Load address of new frame 
402:    LDA  3,1(7)	Save return address 
403:    LDA  7,-316(7)	CALL checkOp 
404:    LDA  3,0(2)	Save function result 
*                       End call to checkOp
405:     ST  3,-3(1)	Save left side 
406:    LDC  3,0(6)	Load Boolean constant 
407:     LD  4,-3(1)	Load left into ac1 
408:    TEQ  3,4,3	Op == 
409:     LD  4,-2(1)	Load left into ac1 
410:     OR  3,4,3	Op OR 
411:     ST  3,-2(1)	Save left side 
* EXPRESSION
*                       Begin call to  checkOp
412:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
413:     LD  3,-10(0)	Load global variable op3 
414:     ST  3,-5(1)	Store paramater 1 
*                       Jump to checkOp
415:    LDA  1,-3(1)	Load address of new frame 
416:    LDA  3,1(7)	Save return address 
417:    LDA  7,-330(7)	CALL checkOp 
418:    LDA  3,0(2)	Save function result 
*                       End call to checkOp
419:     ST  3,-3(1)	Save left side 
420:    LDC  3,0(6)	Load Boolean constant 
421:     LD  4,-3(1)	Load left into ac1 
422:    TEQ  3,4,3	Op == 
423:     LD  4,-2(1)	Load left into ac1 
424:     OR  3,4,3	Op OR 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outputc
426:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
427:    LDC  3,79(6)	Load char constant 
428:     ST  3,-4(1)	Store paramater 1 
*                       Jump to outputc
429:    LDA  1,-2(1)	Load address of new frame 
430:    LDA  3,1(7)	Save return address 
431:    LDA  7,-402(7)	CALL outputc 
432:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* RETURN
433:    LDC  3,0(6)	Load Boolean constant 
434:    LDA  2,0(3)	Save result into ret 
435:     LD  3,-1(1)	Load return address 
436:     LD  1,0(1)	Adjust fp 
437:    LDA  7,0(3)	Return 
* END COMPOUND
425:    JZR  3,12(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
438:    LDC  3,1(6)	Load Boolean constant 
439:    LDA  2,0(3)	Save result into ret 
440:     LD  3,-1(1)	Load return address 
441:     LD  1,0(1)	Adjust fp 
442:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
443:    LDC  2,0(6)	Set return value to 0 
444:     LD  3,-1(1)	Load return address 
445:     LD  1,0(1)	Adjust fp 
446:    LDA  7,0(3)	Return 
* END FUNCTION checkUserInput
* FUNCTION evalOp
447:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
448:     LD  3,-4(1)	Load param variable op 
449:     ST  3,-5(1)	Save left side 
450:    LDC  3,43(6)	Load char constant 
451:     LD  4,-5(1)	Load left into ac1 
452:    TEQ  3,4,3	Op == 
* THEN
* RETURN
454:     LD  3,-2(1)	Load param variable x 
455:     ST  3,-5(1)	Save left side 
456:     LD  3,-3(1)	Load param variable y 
457:     LD  4,-5(1)	Load left into ac1 
458:    ADD  3,4,3	Op + 
459:    LDA  2,0(3)	Save result into ret 
460:     LD  3,-1(1)	Load return address 
461:     LD  1,0(1)	Adjust fp 
462:    LDA  7,0(3)	Return 
453:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
463:     LD  3,-4(1)	Load param variable op 
464:     ST  3,-5(1)	Save left side 
465:    LDC  3,45(6)	Load char constant 
466:     LD  4,-5(1)	Load left into ac1 
467:    TEQ  3,4,3	Op == 
* THEN
* RETURN
469:     LD  3,-2(1)	Load param variable x 
470:     ST  3,-5(1)	Save left side 
471:     LD  3,-3(1)	Load param variable y 
472:     LD  4,-5(1)	Load left into ac1 
473:    SUB  3,4,3	Op - 
474:    LDA  2,0(3)	Save result into ret 
475:     LD  3,-1(1)	Load return address 
476:     LD  1,0(1)	Adjust fp 
477:    LDA  7,0(3)	Return 
468:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
478:     LD  3,-4(1)	Load param variable op 
479:     ST  3,-5(1)	Save left side 
480:    LDC  3,42(6)	Load char constant 
481:     LD  4,-5(1)	Load left into ac1 
482:    TEQ  3,4,3	Op == 
* THEN
* RETURN
484:     LD  3,-2(1)	Load param variable x 
485:     ST  3,-5(1)	Save left side 
486:     LD  3,-3(1)	Load param variable y 
487:     LD  4,-5(1)	Load left into ac1 
488:    MUL  3,4,3	Op * 
489:    LDA  2,0(3)	Save result into ret 
490:     LD  3,-1(1)	Load return address 
491:     LD  1,0(1)	Adjust fp 
492:    LDA  7,0(3)	Return 
483:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
493:     LD  3,-4(1)	Load param variable op 
494:     ST  3,-5(1)	Save left side 
495:    LDC  3,47(6)	Load char constant 
496:     LD  4,-5(1)	Load left into ac1 
497:    TEQ  3,4,3	Op == 
* THEN
* RETURN
499:     LD  3,-2(1)	Load param variable x 
500:     ST  3,-5(1)	Save left side 
501:     LD  3,-3(1)	Load param variable y 
502:     LD  4,-5(1)	Load left into ac1 
503:    DIV  3,4,3	Op / 
504:    LDA  2,0(3)	Save result into ret 
505:     LD  3,-1(1)	Load return address 
506:     LD  1,0(1)	Adjust fp 
507:    LDA  7,0(3)	Return 
498:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
508:    LDC  2,0(6)	Set return value to 0 
509:     LD  3,-1(1)	Load return address 
510:     LD  1,0(1)	Adjust fp 
511:    LDA  7,0(3)	Return 
* END FUNCTION evalOp
* FUNCTION checkExpression
512:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
* EXPRESSION
*                       Begin call to  evalOp
513:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
514:     LD  3,-4(0)	Load global variable dig1 
515:     ST  3,-5(1)	Store paramater 1 
*                       Load param 2
516:     LD  3,-5(0)	Load global variable dig2 
517:     ST  3,-6(1)	Store paramater 2 
*                       Load param 3
518:     LD  3,-8(0)	Load global variable op1 
519:     ST  3,-7(1)	Store paramater 3 
*                       Jump to evalOp
520:    LDA  1,-3(1)	Load address of new frame 
521:    LDA  3,1(7)	Save return address 
522:    LDA  7,-76(7)	CALL evalOp 
523:    LDA  3,0(2)	Save function result 
*                       End call to evalOp
524:     ST  3,-2(1)	Store local variable res 
* EXPRESSION
* EXPRESSION
*                       Begin call to  evalOp
525:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
526:     LD  3,-2(1)	Load local variable res 
527:     ST  3,-5(1)	Store paramater 1 
*                       Load param 2
528:     LD  3,-6(0)	Load global variable dig3 
529:     ST  3,-6(1)	Store paramater 2 
*                       Load param 3
530:     LD  3,-9(0)	Load global variable op2 
531:     ST  3,-7(1)	Store paramater 3 
*                       Jump to evalOp
532:    LDA  1,-3(1)	Load address of new frame 
533:    LDA  3,1(7)	Save return address 
534:    LDA  7,-88(7)	CALL evalOp 
535:    LDA  3,0(2)	Save function result 
*                       End call to evalOp
536:     ST  3,-2(1)	Store local variable res 
* EXPRESSION
* EXPRESSION
*                       Begin call to  evalOp
537:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
538:     LD  3,-2(1)	Load local variable res 
539:     ST  3,-5(1)	Store paramater 1 
*                       Load param 2
540:     LD  3,-7(0)	Load global variable dig4 
541:     ST  3,-6(1)	Store paramater 2 
*                       Load param 3
542:     LD  3,-10(0)	Load global variable op3 
543:     ST  3,-7(1)	Store paramater 3 
*                       Jump to evalOp
544:    LDA  1,-3(1)	Load address of new frame 
545:    LDA  3,1(7)	Save return address 
546:    LDA  7,-100(7)	CALL evalOp 
547:    LDA  3,0(2)	Save function result 
*                       End call to evalOp
548:     ST  3,-2(1)	Store local variable res 
* IF
549:     LD  3,-2(1)	Load local variable res 
550:     ST  3,-3(1)	Save left side 
551:    LDC  3,24(6)	Load integer constant 
552:     LD  4,-3(1)	Load left into ac1 
553:    TNE  3,4,3	Op != 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outputc
555:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
556:    LDC  3,82(6)	Load char constant 
557:     ST  3,-5(1)	Store paramater 1 
*                       Jump to outputc
558:    LDA  1,-3(1)	Load address of new frame 
559:    LDA  3,1(7)	Save return address 
560:    LDA  7,-531(7)	CALL outputc 
561:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
562:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
563:    LDC  3,61(6)	Load char constant 
564:     ST  3,-5(1)	Store paramater 1 
*                       Jump to outputc
565:    LDA  1,-3(1)	Load address of new frame 
566:    LDA  3,1(7)	Save return address 
567:    LDA  7,-538(7)	CALL outputc 
568:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  output
569:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
570:     LD  3,-2(1)	Load local variable res 
571:     ST  3,-5(1)	Store paramater 1 
*                       Jump to output
572:    LDA  1,-3(1)	Load address of new frame 
573:    LDA  3,1(7)	Save return address 
574:    LDA  7,-569(7)	CALL output 
575:    LDA  3,0(2)	Save function result 
*                       End call to output
* RETURN
576:    LDC  3,0(6)	Load Boolean constant 
577:    LDA  2,0(3)	Save result into ret 
578:     LD  3,-1(1)	Load return address 
579:     LD  1,0(1)	Adjust fp 
580:    LDA  7,0(3)	Return 
* END COMPOUND
554:    JZR  3,27(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
*                       Begin call to  outputc
582:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
583:    LDC  3,82(6)	Load char constant 
584:     ST  3,-5(1)	Store paramater 1 
*                       Jump to outputc
585:    LDA  1,-3(1)	Load address of new frame 
586:    LDA  3,1(7)	Save return address 
587:    LDA  7,-558(7)	CALL outputc 
588:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
589:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
590:    LDC  3,61(6)	Load char constant 
591:     ST  3,-5(1)	Store paramater 1 
*                       Jump to outputc
592:    LDA  1,-3(1)	Load address of new frame 
593:    LDA  3,1(7)	Save return address 
594:    LDA  7,-565(7)	CALL outputc 
595:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  output
596:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
597:     LD  3,-2(1)	Load local variable res 
598:     ST  3,-5(1)	Store paramater 1 
*                       Jump to output
599:    LDA  1,-3(1)	Load address of new frame 
600:    LDA  3,1(7)	Save return address 
601:    LDA  7,-596(7)	CALL output 
602:    LDA  3,0(2)	Save function result 
*                       End call to output
* RETURN
603:    LDC  3,1(6)	Load Boolean constant 
604:    LDA  2,0(3)	Save result into ret 
605:     LD  3,-1(1)	Load return address 
606:     LD  1,0(1)	Adjust fp 
607:    LDA  7,0(3)	Return 
* END COMPOUND
581:    LDA  7,26(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
608:    LDC  2,0(6)	Set return value to 0 
609:     LD  3,-1(1)	Load return address 
610:     LD  1,0(1)	Adjust fp 
611:    LDA  7,0(3)	Return 
* END FUNCTION checkExpression
* FUNCTION main
612:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
613:    LDC  3,1(6)	Load Boolean constant 
614:     ST  3,-4(1)	Store local variable again 
* EXPRESSION
615:    LDC  3,1(6)	Load integer constant 
616:     ST  3,-11(0)	Store global variable testCount 
* EXPRESSION
*                       Begin call to  outputc
617:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
618:    LDC  3,84(6)	Load char constant 
619:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
620:    LDA  1,-6(1)	Load address of new frame 
621:    LDA  3,1(7)	Save return address 
622:    LDA  7,-593(7)	CALL outputc 
623:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
624:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
625:    LDC  3,63(6)	Load char constant 
626:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
627:    LDA  1,-6(1)	Load address of new frame 
628:    LDA  3,1(7)	Save return address 
629:    LDA  7,-600(7)	CALL outputc 
630:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
631:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
632:    LDA  1,-6(1)	Load address of new frame 
633:    LDA  3,1(7)	Save return address 
634:    LDA  7,-598(7)	CALL outnl 
635:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* IF
* EXPRESSION
*                       Begin call to  inputc
636:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to inputc
637:    LDA  1,-6(1)	Load address of new frame 
638:    LDA  3,1(7)	Save return address 
639:    LDA  7,-615(7)	CALL inputc 
640:    LDA  3,0(2)	Save function result 
*                       End call to inputc
641:     ST  3,-6(1)	Save left side 
642:    LDC  3,121(6)	Load char constant 
643:     LD  4,-6(1)	Load left into ac1 
644:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* WHILE
646:     LD  3,-11(0)	Load global variable testCount 
647:     ST  3,-6(1)	Save left side 
648:    LDC  3,10(6)	Load integer constant 
649:     LD  4,-6(1)	Load left into ac1 
650:    TLT  3,4,3	Op < 
651:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  genTestDigits
653:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to genTestDigits
654:    LDA  1,-6(1)	Load address of new frame 
655:    LDA  3,1(7)	Save return address 
656:    LDA  7,-488(7)	CALL genTestDigits 
657:    LDA  3,0(2)	Save function result 
*                       End call to genTestDigits
* EXPRESSION
*                       Begin call to  outputDigits
658:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outputDigits
659:    LDA  1,-6(1)	Load address of new frame 
660:    LDA  3,1(7)	Save return address 
661:    LDA  7,-480(7)	CALL outputDigits 
662:    LDA  3,0(2)	Save function result 
*                       End call to outputDigits
* EXPRESSION
*                       Begin call to  getUserExpression
663:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to getUserExpression
664:    LDA  1,-6(1)	Load address of new frame 
665:    LDA  3,1(7)	Save return address 
666:    LDA  7,-442(7)	CALL getUserExpression 
667:    LDA  3,0(2)	Save function result 
*                       End call to getUserExpression
* EXPRESSION
* EXPRESSION
*                       Begin call to  checkUserInput
668:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to checkUserInput
669:    LDA  1,-6(1)	Load address of new frame 
670:    LDA  3,1(7)	Save return address 
671:    LDA  7,-400(7)	CALL checkUserInput 
672:    LDA  3,0(2)	Save function result 
*                       End call to checkUserInput
673:     ST  3,-2(1)	Store local variable inputCheck 
* IF
674:     LD  3,-2(1)	Load local variable inputCheck 
675:    LDC  4,1(6)	Load 1 
676:    XOR  3,3,4	Op NOT 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
678:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
679:    LDA  1,-6(1)	Load address of new frame 
680:    LDA  3,1(7)	Save return address 
681:    LDA  7,-645(7)	CALL outnl 
682:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputc
683:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
684:    LDC  3,66(6)	Load char constant 
685:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
686:    LDA  1,-6(1)	Load address of new frame 
687:    LDA  3,1(7)	Save return address 
688:    LDA  7,-659(7)	CALL outputc 
689:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
690:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
691:    LDC  3,65(6)	Load char constant 
692:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
693:    LDA  1,-6(1)	Load address of new frame 
694:    LDA  3,1(7)	Save return address 
695:    LDA  7,-666(7)	CALL outputc 
696:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
697:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
698:    LDC  3,68(6)	Load char constant 
699:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
700:    LDA  1,-6(1)	Load address of new frame 
701:    LDA  3,1(7)	Save return address 
702:    LDA  7,-673(7)	CALL outputc 
703:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
704:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
705:    LDC  3,33(6)	Load char constant 
706:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
707:    LDA  1,-6(1)	Load address of new frame 
708:    LDA  3,1(7)	Save return address 
709:    LDA  7,-680(7)	CALL outputc 
710:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
711:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
712:    LDA  1,-6(1)	Load address of new frame 
713:    LDA  3,1(7)	Save return address 
714:    LDA  7,-678(7)	CALL outnl 
715:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* END COMPOUND
677:    JZR  3,39(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
* EXPRESSION
*                       Begin call to  checkExpression
717:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to checkExpression
718:    LDA  1,-6(1)	Load address of new frame 
719:    LDA  3,1(7)	Save return address 
720:    LDA  7,-209(7)	CALL checkExpression 
721:    LDA  3,0(2)	Save function result 
*                       End call to checkExpression
722:     ST  3,-3(1)	Store local variable expressionEval 
* IF
723:     LD  3,-3(1)	Load local variable expressionEval 
724:     ST  3,-6(1)	Save left side 
725:    LDC  3,0(6)	Load Boolean constant 
726:     LD  4,-6(1)	Load left into ac1 
727:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
729:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
730:    LDA  1,-6(1)	Load address of new frame 
731:    LDA  3,1(7)	Save return address 
732:    LDA  7,-696(7)	CALL outnl 
733:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputc
734:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
735:    LDC  3,78(6)	Load char constant 
736:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
737:    LDA  1,-6(1)	Load address of new frame 
738:    LDA  3,1(7)	Save return address 
739:    LDA  7,-710(7)	CALL outputc 
740:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
741:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
742:    LDC  3,79(6)	Load char constant 
743:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
744:    LDA  1,-6(1)	Load address of new frame 
745:    LDA  3,1(7)	Save return address 
746:    LDA  7,-717(7)	CALL outputc 
747:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
748:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
749:    LDC  3,33(6)	Load char constant 
750:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
751:    LDA  1,-6(1)	Load address of new frame 
752:    LDA  3,1(7)	Save return address 
753:    LDA  7,-724(7)	CALL outputc 
754:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
755:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
756:    LDA  1,-6(1)	Load address of new frame 
757:    LDA  3,1(7)	Save return address 
758:    LDA  7,-722(7)	CALL outnl 
759:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* END COMPOUND
728:    JZR  3,32(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
761:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
762:    LDA  1,-6(1)	Load address of new frame 
763:    LDA  3,1(7)	Save return address 
764:    LDA  7,-728(7)	CALL outnl 
765:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputc
766:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
767:    LDC  3,89(6)	Load char constant 
768:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
769:    LDA  1,-6(1)	Load address of new frame 
770:    LDA  3,1(7)	Save return address 
771:    LDA  7,-742(7)	CALL outputc 
772:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
773:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
774:    LDC  3,69(6)	Load char constant 
775:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
776:    LDA  1,-6(1)	Load address of new frame 
777:    LDA  3,1(7)	Save return address 
778:    LDA  7,-749(7)	CALL outputc 
779:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
780:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
781:    LDC  3,83(6)	Load char constant 
782:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
783:    LDA  1,-6(1)	Load address of new frame 
784:    LDA  3,1(7)	Save return address 
785:    LDA  7,-756(7)	CALL outputc 
786:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
787:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
788:    LDC  3,33(6)	Load char constant 
789:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
790:    LDA  1,-6(1)	Load address of new frame 
791:    LDA  3,1(7)	Save return address 
792:    LDA  7,-763(7)	CALL outputc 
793:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
794:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
795:    LDA  1,-6(1)	Load address of new frame 
796:    LDA  3,1(7)	Save return address 
797:    LDA  7,-761(7)	CALL outnl 
798:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* END COMPOUND
760:    LDA  7,38(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
716:    LDA  7,82(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
799:     LD  3,-11(0)	Load global variable testCount 
800:    LDA  3,1(3)	increment value of testCount 
801:     ST  3,-11(0)	Store global variable testCount 
* END COMPOUND
802:    LDA  7,-157(7)	go to beginning of loop 
652:    LDA  7,150(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
645:    JZR  3,158(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* WHILE
804:     LD  3,-4(1)	Load local variable again 
805:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  genDigits
807:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to genDigits
808:    LDA  1,-6(1)	Load address of new frame 
809:    LDA  3,1(7)	Save return address 
810:    LDA  7,-677(7)	CALL genDigits 
811:    LDA  3,0(2)	Save function result 
*                       End call to genDigits
* EXPRESSION
*                       Begin call to  outputDigits
812:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outputDigits
813:    LDA  1,-6(1)	Load address of new frame 
814:    LDA  3,1(7)	Save return address 
815:    LDA  7,-634(7)	CALL outputDigits 
816:    LDA  3,0(2)	Save function result 
*                       End call to outputDigits
* EXPRESSION
*                       Begin call to  getUserExpression
817:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to getUserExpression
818:    LDA  1,-6(1)	Load address of new frame 
819:    LDA  3,1(7)	Save return address 
820:    LDA  7,-596(7)	CALL getUserExpression 
821:    LDA  3,0(2)	Save function result 
*                       End call to getUserExpression
* EXPRESSION
* EXPRESSION
*                       Begin call to  checkUserInput
822:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to checkUserInput
823:    LDA  1,-6(1)	Load address of new frame 
824:    LDA  3,1(7)	Save return address 
825:    LDA  7,-554(7)	CALL checkUserInput 
826:    LDA  3,0(2)	Save function result 
*                       End call to checkUserInput
827:     ST  3,-2(1)	Store local variable inputCheck 
* IF
828:     LD  3,-2(1)	Load local variable inputCheck 
829:    LDC  4,1(6)	Load 1 
830:    XOR  3,3,4	Op NOT 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
832:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
833:    LDA  1,-6(1)	Load address of new frame 
834:    LDA  3,1(7)	Save return address 
835:    LDA  7,-799(7)	CALL outnl 
836:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputc
837:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
838:    LDC  3,66(6)	Load char constant 
839:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
840:    LDA  1,-6(1)	Load address of new frame 
841:    LDA  3,1(7)	Save return address 
842:    LDA  7,-813(7)	CALL outputc 
843:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
844:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
845:    LDC  3,65(6)	Load char constant 
846:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
847:    LDA  1,-6(1)	Load address of new frame 
848:    LDA  3,1(7)	Save return address 
849:    LDA  7,-820(7)	CALL outputc 
850:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
851:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
852:    LDC  3,68(6)	Load char constant 
853:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
854:    LDA  1,-6(1)	Load address of new frame 
855:    LDA  3,1(7)	Save return address 
856:    LDA  7,-827(7)	CALL outputc 
857:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
858:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
859:    LDC  3,33(6)	Load char constant 
860:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
861:    LDA  1,-6(1)	Load address of new frame 
862:    LDA  3,1(7)	Save return address 
863:    LDA  7,-834(7)	CALL outputc 
864:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
865:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
866:    LDA  1,-6(1)	Load address of new frame 
867:    LDA  3,1(7)	Save return address 
868:    LDA  7,-832(7)	CALL outnl 
869:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* END COMPOUND
831:    JZR  3,39(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
* EXPRESSION
*                       Begin call to  checkExpression
871:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to checkExpression
872:    LDA  1,-6(1)	Load address of new frame 
873:    LDA  3,1(7)	Save return address 
874:    LDA  7,-363(7)	CALL checkExpression 
875:    LDA  3,0(2)	Save function result 
*                       End call to checkExpression
876:     ST  3,-3(1)	Store local variable expressionEval 
* IF
877:     LD  3,-3(1)	Load local variable expressionEval 
878:     ST  3,-6(1)	Save left side 
879:    LDC  3,0(6)	Load Boolean constant 
880:     LD  4,-6(1)	Load left into ac1 
881:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
883:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
884:    LDA  1,-6(1)	Load address of new frame 
885:    LDA  3,1(7)	Save return address 
886:    LDA  7,-850(7)	CALL outnl 
887:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputc
888:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
889:    LDC  3,78(6)	Load char constant 
890:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
891:    LDA  1,-6(1)	Load address of new frame 
892:    LDA  3,1(7)	Save return address 
893:    LDA  7,-864(7)	CALL outputc 
894:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
895:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
896:    LDC  3,79(6)	Load char constant 
897:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
898:    LDA  1,-6(1)	Load address of new frame 
899:    LDA  3,1(7)	Save return address 
900:    LDA  7,-871(7)	CALL outputc 
901:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
902:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
903:    LDC  3,33(6)	Load char constant 
904:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
905:    LDA  1,-6(1)	Load address of new frame 
906:    LDA  3,1(7)	Save return address 
907:    LDA  7,-878(7)	CALL outputc 
908:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
909:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
910:    LDA  1,-6(1)	Load address of new frame 
911:    LDA  3,1(7)	Save return address 
912:    LDA  7,-876(7)	CALL outnl 
913:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* END COMPOUND
882:    JZR  3,32(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
*                       Begin call to  outnl
915:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
916:    LDA  1,-6(1)	Load address of new frame 
917:    LDA  3,1(7)	Save return address 
918:    LDA  7,-882(7)	CALL outnl 
919:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputc
920:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
921:    LDC  3,89(6)	Load char constant 
922:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
923:    LDA  1,-6(1)	Load address of new frame 
924:    LDA  3,1(7)	Save return address 
925:    LDA  7,-896(7)	CALL outputc 
926:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
927:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
928:    LDC  3,69(6)	Load char constant 
929:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
930:    LDA  1,-6(1)	Load address of new frame 
931:    LDA  3,1(7)	Save return address 
932:    LDA  7,-903(7)	CALL outputc 
933:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
934:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
935:    LDC  3,83(6)	Load char constant 
936:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
937:    LDA  1,-6(1)	Load address of new frame 
938:    LDA  3,1(7)	Save return address 
939:    LDA  7,-910(7)	CALL outputc 
940:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
941:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
942:    LDC  3,33(6)	Load char constant 
943:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
944:    LDA  1,-6(1)	Load address of new frame 
945:    LDA  3,1(7)	Save return address 
946:    LDA  7,-917(7)	CALL outputc 
947:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
948:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
949:    LDA  1,-6(1)	Load address of new frame 
950:    LDA  3,1(7)	Save return address 
951:    LDA  7,-915(7)	CALL outnl 
952:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* END COMPOUND
914:    LDA  7,38(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
870:    LDA  7,82(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outputc
953:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
954:    LDC  3,65(6)	Load char constant 
955:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
956:    LDA  1,-6(1)	Load address of new frame 
957:    LDA  3,1(7)	Save return address 
958:    LDA  7,-929(7)	CALL outputc 
959:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outputc
960:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
961:    LDC  3,63(6)	Load char constant 
962:     ST  3,-8(1)	Store paramater 1 
*                       Jump to outputc
963:    LDA  1,-6(1)	Load address of new frame 
964:    LDA  3,1(7)	Save return address 
965:    LDA  7,-936(7)	CALL outputc 
966:    LDA  3,0(2)	Save function result 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
967:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
968:    LDA  1,-6(1)	Load address of new frame 
969:    LDA  3,1(7)	Save return address 
970:    LDA  7,-934(7)	CALL outnl 
971:    LDA  3,0(2)	Save function result 
*                       End call to outnl
* IF
* EXPRESSION
*                       Begin call to  inputc
972:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to inputc
973:    LDA  1,-6(1)	Load address of new frame 
974:    LDA  3,1(7)	Save return address 
975:    LDA  7,-951(7)	CALL inputc 
976:    LDA  3,0(2)	Save function result 
*                       End call to inputc
977:     ST  3,-6(1)	Save left side 
978:    LDC  3,121(6)	Load char constant 
979:     LD  4,-6(1)	Load left into ac1 
980:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
982:    LDC  3,1(6)	Load Boolean constant 
983:     ST  3,-4(1)	Store local variable again 
981:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
985:    LDC  3,0(6)	Load Boolean constant 
986:     ST  3,-4(1)	Store local variable again 
984:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
987:    LDA  7,-184(7)	go to beginning of loop 
806:    LDA  7,181(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
803:    LDA  7,184(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
988:     LD  3,-1(1)	Load return address 
989:     LD  1,0(1)	Adjust fp 
990:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
991:    LDC  2,0(6)	Set return value to 0 
992:     LD  3,-1(1)	Load return address 
993:     LD  1,0(1)	Adjust fp 
994:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,994(7)	Jump to init 
* INIT
995:     LD  0,0(0)	Set global pointer 
996:    LDA  1,-12(0)	Set frame to end of globals 
997:     ST  1,0(1)	Store old frame pointer 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
998:    LDA  3,1(7)	Save return address 
999:    LDA  7,-388(7)	Jump to main 
1000:   HALT  0,0,0	Fin. 
* END INIT
