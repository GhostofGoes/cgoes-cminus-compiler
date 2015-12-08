* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  scope35.c-
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
* FUNCTION fox
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable fpa
 45:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-4(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 50:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 51:     LD  3,-3(1)	Load address of base of array fpaa
 52:     LD  3,1(3)	Load array size 
 53:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 54:    LDA  1,-4(1)	Load address of new frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    LDA  7,-51(7)	CALL output
 57:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 59:    LDC  3,0(6)	Load integer constant 
 60:     LD  4,-3(1)	Load address of base of array fpaa
 61:    SUB  3,4,3	Compute offset of value 
 62:     LD  3,0(3)	Load the value 
 63:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 64:    LDA  1,-4(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 68:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 69:    LDC  3,10(6)	Load integer constant 
 70:     LD  4,-3(1)	Load address of base of array fpaa
 71:    SUB  3,4,3	Compute offset of value 
 72:     LD  3,0(3)	Load the value 
 73:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 74:    LDA  1,-4(1)	Load address of new frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    LDA  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 78:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 79:    LDA  1,-4(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-45(7)	CALL outnl
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 83:    LDC  2,0(6)	Set return value to 0 
 84:     LD  3,-1(1)	Load return address 
 85:     LD  1,0(1)	Adjust fp 
 86:    LDA  7,0(3)	Return 
* END FUNCTION fox
* FUNCTION bat
 87:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  outputc
 88:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 89:    LDC  3,66(6)	Load char constant 
 90:     ST  3,-6(1)	Store parameter 
*                       Jump to outputc
 91:    LDA  1,-4(1)	Load address of new frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-64(7)	CALL outputc
 94:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  fox
 95:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 96:     LD  3,-2(1)	Load variable fpa
 97:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 98:     LD  3,-3(1)	Load address of base of array fpaa
 99:     ST  3,-7(1)	Store parameter 
*                       Jump to fox
100:    LDA  1,-4(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-61(7)	CALL fox
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* END COMPOUND
* Add standard closing in case there is no return statement
104:    LDC  2,0(6)	Set return value to 0 
105:     LD  3,-1(1)	Load return address 
106:     LD  1,0(1)	Adjust fp 
107:    LDA  7,0(3)	Return 
* END FUNCTION bat
* FUNCTION th
108:     ST  3,-1(1)	Store return address. 
* RETURN
109:     LD  3,-2(1)	Load variable fpa
110:    LDA  2,0(3)	Copy result to rt register 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
114:    LDC  2,0(6)	Set return value to 0 
115:     LD  3,-1(1)	Load return address 
116:     LD  1,0(1)	Adjust fp 
117:    LDA  7,0(3)	Return 
* END FUNCTION th
* FUNCTION tha
118:     ST  3,-1(1)	Store return address. 
* RETURN
119:    LDC  3,0(6)	Load integer constant 
120:     LD  4,-2(1)	Load address of base of array fpaa
121:    SUB  3,4,3	Compute offset of value 
122:     LD  3,0(3)	Load the value 
123:    LDA  2,0(3)	Copy result to rt register 
124:     LD  3,-1(1)	Load return address 
125:     LD  1,0(1)	Adjust fp 
126:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
127:    LDC  2,0(6)	Set return value to 0 
128:     LD  3,-1(1)	Load return address 
129:     LD  1,0(1)	Adjust fp 
130:    LDA  7,0(3)	Return 
* END FUNCTION tha
* FUNCTION main
131:     ST  3,-1(1)	Store return address. 
* COMPOUND
132:    LDC  3,11(6)	load size of array bb
133:     ST  3,-5(1)	save size of array bb
* EXPRESSION
134:    LDC  3,111(6)	Load integer constant 
135:     ST  3,0(0)	Store variable a
* EXPRESSION
136:    LDC  3,0(6)	Load integer constant 
137:     ST  3,-17(1)	Save index 
138:    LDC  3,110(6)	Load integer constant 
139:     LD  4,-17(1)	Restore index 
140:    LDA  5,-2(0)	Load address of base of array aa
141:    SUB  5,5,4	Compute offset of value 
142:     ST  3,0(5)	Store variable aa
* EXPRESSION
143:    LDC  3,10(6)	Load integer constant 
144:     ST  3,-17(1)	Save index 
145:    LDC  3,112(6)	Load integer constant 
146:     LD  4,-17(1)	Restore index 
147:    LDA  5,-2(0)	Load address of base of array aa
148:    SUB  5,5,4	Compute offset of value 
149:     ST  3,0(5)	Store variable aa
* EXPRESSION
150:    LDC  3,222(6)	Load integer constant 
151:     ST  3,-4(1)	Store variable b
* EXPRESSION
152:    LDC  3,0(6)	Load integer constant 
153:     ST  3,-17(1)	Save index 
154:    LDC  3,220(6)	Load integer constant 
155:     LD  4,-17(1)	Restore index 
156:    LDA  5,-6(1)	Load address of base of array bb
157:    SUB  5,5,4	Compute offset of value 
158:     ST  3,0(5)	Store variable bb
* EXPRESSION
159:    LDC  3,10(6)	Load integer constant 
160:     ST  3,-17(1)	Save index 
161:    LDC  3,222(6)	Load integer constant 
162:     LD  4,-17(1)	Restore index 
163:    LDA  5,-6(1)	Load address of base of array bb
164:    SUB  5,5,4	Compute offset of value 
165:     ST  3,0(5)	Store variable bb
* EXPRESSION
*                       Begin call to  fox
166:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
167:     LD  3,0(0)	Load variable a
168:     ST  3,-19(1)	Store parameter 
*                       Load param 2
169:    LDA  3,-2(0)	Load address of base of array aa
170:     ST  3,-20(1)	Store parameter 
*                       Jump to fox
171:    LDA  1,-17(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-132(7)	CALL fox
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  fox
175:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
176:     LD  3,-4(1)	Load variable b
177:     ST  3,-19(1)	Store parameter 
*                       Load param 2
178:    LDA  3,-6(1)	Load address of base of array bb
179:     ST  3,-20(1)	Store parameter 
*                       Jump to fox
180:    LDA  1,-17(1)	Load address of new frame 
181:    LDA  3,1(7)	Return address in ac 
182:    LDA  7,-141(7)	CALL fox
183:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* COMPOUND
184:    LDC  3,11(6)	load size of array cc
185:     ST  3,-18(1)	save size of array cc
* EXPRESSION
186:    LDC  3,333(6)	Load integer constant 
187:     ST  3,-17(1)	Store variable c
* EXPRESSION
188:    LDC  3,0(6)	Load integer constant 
189:     ST  3,-30(1)	Save index 
190:    LDC  3,330(6)	Load integer constant 
191:     LD  4,-30(1)	Restore index 
192:    LDA  5,-19(1)	Load address of base of array cc
193:    SUB  5,5,4	Compute offset of value 
194:     ST  3,0(5)	Store variable cc
* EXPRESSION
195:    LDC  3,10(6)	Load integer constant 
196:     ST  3,-30(1)	Save index 
197:    LDC  3,334(6)	Load integer constant 
198:     LD  4,-30(1)	Restore index 
199:    LDA  5,-19(1)	Load address of base of array cc
200:    SUB  5,5,4	Compute offset of value 
201:     ST  3,0(5)	Store variable cc
* EXPRESSION
*                       Begin call to  outnl
202:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Jump to outnl
203:    LDA  1,-30(1)	Load address of new frame 
204:    LDA  3,1(7)	Return address in ac 
205:    LDA  7,-169(7)	CALL outnl
206:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  fox
207:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
208:     LD  3,0(0)	Load variable a
209:     ST  3,-32(1)	Store parameter 
*                       Load param 2
210:    LDA  3,-2(0)	Load address of base of array aa
211:     ST  3,-33(1)	Store parameter 
*                       Jump to fox
212:    LDA  1,-30(1)	Load address of new frame 
213:    LDA  3,1(7)	Return address in ac 
214:    LDA  7,-173(7)	CALL fox
215:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  fox
216:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
217:     LD  3,-4(1)	Load variable b
218:     ST  3,-32(1)	Store parameter 
*                       Load param 2
219:    LDA  3,-6(1)	Load address of base of array bb
220:     ST  3,-33(1)	Store parameter 
*                       Jump to fox
221:    LDA  1,-30(1)	Load address of new frame 
222:    LDA  3,1(7)	Return address in ac 
223:    LDA  7,-182(7)	CALL fox
224:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  fox
225:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
226:     LD  3,-17(1)	Load variable c
227:     ST  3,-32(1)	Store parameter 
*                       Load param 2
228:    LDA  3,-19(1)	Load address of base of array cc
229:     ST  3,-33(1)	Store parameter 
*                       Jump to fox
230:    LDA  1,-30(1)	Load address of new frame 
231:    LDA  3,1(7)	Return address in ac 
232:    LDA  7,-191(7)	CALL fox
233:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* END COMPOUND
* COMPOUND
234:    LDC  3,11(6)	load size of array dd
235:     ST  3,-18(1)	save size of array dd
* EXPRESSION
236:    LDC  3,444(6)	Load integer constant 
237:     ST  3,-17(1)	Store variable d
* EXPRESSION
238:    LDC  3,0(6)	Load integer constant 
239:     ST  3,-30(1)	Save index 
240:    LDC  3,440(6)	Load integer constant 
241:     LD  4,-30(1)	Restore index 
242:    LDA  5,-19(1)	Load address of base of array dd
243:    SUB  5,5,4	Compute offset of value 
244:     ST  3,0(5)	Store variable dd
* EXPRESSION
245:    LDC  3,10(6)	Load integer constant 
246:     ST  3,-30(1)	Save index 
247:    LDC  3,445(6)	Load integer constant 
248:     LD  4,-30(1)	Restore index 
249:    LDA  5,-19(1)	Load address of base of array dd
250:    SUB  5,5,4	Compute offset of value 
251:     ST  3,0(5)	Store variable dd
* EXPRESSION
*                       Begin call to  outnl
252:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Jump to outnl
253:    LDA  1,-30(1)	Load address of new frame 
254:    LDA  3,1(7)	Return address in ac 
255:    LDA  7,-219(7)	CALL outnl
256:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  fox
257:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
258:     LD  3,0(0)	Load variable a
259:     ST  3,-32(1)	Store parameter 
*                       Load param 2
260:    LDA  3,-2(0)	Load address of base of array aa
261:     ST  3,-33(1)	Store parameter 
*                       Jump to fox
262:    LDA  1,-30(1)	Load address of new frame 
263:    LDA  3,1(7)	Return address in ac 
264:    LDA  7,-223(7)	CALL fox
265:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  fox
266:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
267:     LD  3,-4(1)	Load variable b
268:     ST  3,-32(1)	Store parameter 
*                       Load param 2
269:    LDA  3,-6(1)	Load address of base of array bb
270:     ST  3,-33(1)	Store parameter 
*                       Jump to fox
271:    LDA  1,-30(1)	Load address of new frame 
272:    LDA  3,1(7)	Return address in ac 
273:    LDA  7,-232(7)	CALL fox
274:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  fox
275:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
276:     LD  3,-17(1)	Load variable d
277:     ST  3,-32(1)	Store parameter 
*                       Load param 2
278:    LDA  3,-19(1)	Load address of base of array dd
279:     ST  3,-33(1)	Store parameter 
*                       Jump to fox
280:    LDA  1,-30(1)	Load address of new frame 
281:    LDA  3,1(7)	Return address in ac 
282:    LDA  7,-241(7)	CALL fox
283:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  outnl
284:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Jump to outnl
285:    LDA  1,-30(1)	Load address of new frame 
286:    LDA  3,1(7)	Return address in ac 
287:    LDA  7,-251(7)	CALL outnl
288:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  bat
289:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
290:     LD  3,0(0)	Load variable a
291:     ST  3,-32(1)	Store parameter 
*                       Load param 2
292:    LDA  3,-2(0)	Load address of base of array aa
293:     ST  3,-33(1)	Store parameter 
*                       Jump to bat
294:    LDA  1,-30(1)	Load address of new frame 
295:    LDA  3,1(7)	Return address in ac 
296:    LDA  7,-210(7)	CALL bat
297:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* EXPRESSION
*                       Begin call to  bat
298:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
299:     LD  3,-4(1)	Load variable b
300:     ST  3,-32(1)	Store parameter 
*                       Load param 2
301:    LDA  3,-6(1)	Load address of base of array bb
302:     ST  3,-33(1)	Store parameter 
*                       Jump to bat
303:    LDA  1,-30(1)	Load address of new frame 
304:    LDA  3,1(7)	Return address in ac 
305:    LDA  7,-219(7)	CALL bat
306:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* EXPRESSION
*                       Begin call to  bat
307:     ST  1,-30(1)	Store old fp in ghost frame 
*                       Load param 1
308:     LD  3,-17(1)	Load variable d
309:     ST  3,-32(1)	Store parameter 
*                       Load param 2
310:    LDA  3,-19(1)	Load address of base of array dd
311:     ST  3,-33(1)	Store parameter 
*                       Jump to bat
312:    LDA  1,-30(1)	Load address of new frame 
313:    LDA  3,1(7)	Return address in ac 
314:    LDA  7,-228(7)	CALL bat
315:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* END COMPOUND
* COMPOUND
* EXPRESSION
316:    LDC  3,555(6)	Load integer constant 
317:     ST  3,-13(0)	Store variable e
* EXPRESSION
318:    LDC  3,0(6)	Load integer constant 
319:     ST  3,-17(1)	Save index 
320:    LDC  3,550(6)	Load integer constant 
321:     LD  4,-17(1)	Restore index 
322:    LDA  5,-15(0)	Load address of base of array ee
323:    SUB  5,5,4	Compute offset of value 
324:     ST  3,0(5)	Store variable ee
* EXPRESSION
325:    LDC  3,10(6)	Load integer constant 
326:     ST  3,-17(1)	Save index 
327:    LDC  3,556(6)	Load integer constant 
328:     LD  4,-17(1)	Restore index 
329:    LDA  5,-15(0)	Load address of base of array ee
330:    SUB  5,5,4	Compute offset of value 
331:     ST  3,0(5)	Store variable ee
* EXPRESSION
*                       Begin call to  outnl
332:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
333:    LDA  1,-17(1)	Load address of new frame 
334:    LDA  3,1(7)	Return address in ac 
335:    LDA  7,-299(7)	CALL outnl
336:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  fox
337:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
338:     LD  3,0(0)	Load variable a
339:     ST  3,-19(1)	Store parameter 
*                       Load param 2
340:    LDA  3,-2(0)	Load address of base of array aa
341:     ST  3,-20(1)	Store parameter 
*                       Jump to fox
342:    LDA  1,-17(1)	Load address of new frame 
343:    LDA  3,1(7)	Return address in ac 
344:    LDA  7,-303(7)	CALL fox
345:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  fox
346:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
347:     LD  3,-4(1)	Load variable b
348:     ST  3,-19(1)	Store parameter 
*                       Load param 2
349:    LDA  3,-6(1)	Load address of base of array bb
350:     ST  3,-20(1)	Store parameter 
*                       Jump to fox
351:    LDA  1,-17(1)	Load address of new frame 
352:    LDA  3,1(7)	Return address in ac 
353:    LDA  7,-312(7)	CALL fox
354:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  fox
355:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
356:     LD  3,-13(0)	Load variable e
357:     ST  3,-19(1)	Store parameter 
*                       Load param 2
358:    LDA  3,-15(0)	Load address of base of array ee
359:     ST  3,-20(1)	Store parameter 
*                       Jump to fox
360:    LDA  1,-17(1)	Load address of new frame 
361:    LDA  3,1(7)	Return address in ac 
362:    LDA  7,-321(7)	CALL fox
363:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
* EXPRESSION
*                       Begin call to  outnl
364:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
365:    LDA  1,-17(1)	Load address of new frame 
366:    LDA  3,1(7)	Return address in ac 
367:    LDA  7,-331(7)	CALL outnl
368:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  bat
369:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
370:     LD  3,0(0)	Load variable a
371:     ST  3,-19(1)	Store parameter 
*                       Load param 2
372:    LDA  3,-2(0)	Load address of base of array aa
373:     ST  3,-20(1)	Store parameter 
*                       Jump to bat
374:    LDA  1,-17(1)	Load address of new frame 
375:    LDA  3,1(7)	Return address in ac 
376:    LDA  7,-290(7)	CALL bat
377:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* EXPRESSION
*                       Begin call to  bat
378:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
379:     LD  3,-4(1)	Load variable b
380:     ST  3,-19(1)	Store parameter 
*                       Load param 2
381:    LDA  3,-6(1)	Load address of base of array bb
382:     ST  3,-20(1)	Store parameter 
*                       Jump to bat
383:    LDA  1,-17(1)	Load address of new frame 
384:    LDA  3,1(7)	Return address in ac 
385:    LDA  7,-299(7)	CALL bat
386:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* EXPRESSION
*                       Begin call to  bat
387:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
388:     LD  3,-13(0)	Load variable e
389:     ST  3,-19(1)	Store parameter 
*                       Load param 2
390:    LDA  3,-15(0)	Load address of base of array ee
391:     ST  3,-20(1)	Store parameter 
*                       Jump to bat
392:    LDA  1,-17(1)	Load address of new frame 
393:    LDA  3,1(7)	Return address in ac 
394:    LDA  7,-308(7)	CALL bat
395:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* END COMPOUND
* EXPRESSION
*                       Begin call to  outnl
396:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
397:    LDA  1,-17(1)	Load address of new frame 
398:    LDA  3,1(7)	Return address in ac 
399:    LDA  7,-363(7)	CALL outnl
400:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
401:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  th
402:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
403:     LD  3,0(0)	Load variable a
404:     ST  3,-21(1)	Store parameter 
*                       Jump to th
405:    LDA  1,-19(1)	Load address of new frame 
406:    LDA  3,1(7)	Return address in ac 
407:    LDA  7,-300(7)	CALL th
408:    LDA  3,0(2)	Save the result in ac 
*                       End call to th
409:     ST  3,-19(1)	Store parameter 
*                       Jump to output
410:    LDA  1,-17(1)	Load address of new frame 
411:    LDA  3,1(7)	Return address in ac 
412:    LDA  7,-407(7)	CALL output
413:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
414:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  tha
415:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
416:    LDA  3,-2(0)	Load address of base of array aa
417:     ST  3,-21(1)	Store parameter 
*                       Jump to tha
418:    LDA  1,-19(1)	Load address of new frame 
419:    LDA  3,1(7)	Return address in ac 
420:    LDA  7,-303(7)	CALL tha
421:    LDA  3,0(2)	Save the result in ac 
*                       End call to tha
422:     ST  3,-19(1)	Store parameter 
*                       Jump to output
423:    LDA  1,-17(1)	Load address of new frame 
424:    LDA  3,1(7)	Return address in ac 
425:    LDA  7,-420(7)	CALL output
426:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
427:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
428:    LDA  1,-17(1)	Load address of new frame 
429:    LDA  3,1(7)	Return address in ac 
430:    LDA  7,-394(7)	CALL outnl
431:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  bat
432:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  th
433:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
434:     LD  3,0(0)	Load variable a
435:     ST  3,-21(1)	Store parameter 
*                       Jump to th
436:    LDA  1,-19(1)	Load address of new frame 
437:    LDA  3,1(7)	Return address in ac 
438:    LDA  7,-331(7)	CALL th
439:    LDA  3,0(2)	Save the result in ac 
*                       End call to th
440:     ST  3,-19(1)	Store parameter 
*                       Load param 2
441:    LDA  3,-2(0)	Load address of base of array aa
442:     ST  3,-20(1)	Store parameter 
*                       Jump to bat
443:    LDA  1,-17(1)	Load address of new frame 
444:    LDA  3,1(7)	Return address in ac 
445:    LDA  7,-359(7)	CALL bat
446:    LDA  3,0(2)	Save the result in ac 
*                       End call to bat
* EXPRESSION
*                       Begin call to  outnl
447:     ST  1,-17(1)	Store old fp in ghost frame 
*                       Jump to outnl
448:    LDA  1,-17(1)	Load address of new frame 
449:    LDA  3,1(7)	Return address in ac 
450:    LDA  7,-414(7)	CALL outnl
451:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
452:    LDC  2,0(6)	Set return value to 0 
453:     LD  3,-1(1)	Load return address 
454:     LD  1,0(1)	Adjust fp 
455:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,455(7)	Jump to init [backpatch] 
* INIT
456:     LD  0,0(0)	Set the global pointer 
457:    LDA  1,-26(0)	set first frame at end of globals 
458:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
459:    LDC  3,11(6)	load size of array aa
460:     ST  3,-1(0)	save size of array aa
461:    LDC  3,11(6)	load size of array ee-2
462:     ST  3,-14(0)	save size of array ee-2
* END INIT GLOBALS AND STATICS
463:    LDA  3,1(7)	Return address in ac 
464:    LDA  7,-334(7)	Jump to main 
465:   HALT  0,0,0	DONE! 
* END INIT
