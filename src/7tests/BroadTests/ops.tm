* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  ops.c-
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
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-6(1)	Save index 
 45:    LDC  3,50(6)	Load integer constant 
 46:     LD  4,-6(1)	Restore index 
 47:    LDA  5,-1(0)	Load address of base of array y
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable y
* EXPRESSION
 50:    LDC  3,5(6)	Load integer constant 
 51:     ST  3,-6(1)	Save index 
 52:    LDC  3,1(6)	Load integer constant 
 53:     LD  4,-6(1)	Restore index 
 54:    LDA  5,-1(0)	Load address of base of array y
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,0(5)	Store variable y
* EXPRESSION
 57:    LDC  3,8(6)	Load integer constant 
 58:     ST  3,-6(1)	Save index 
 59:    LDC  3,2(6)	Load integer constant 
 60:     LD  4,-6(1)	Restore index 
 61:    LDA  5,-1(0)	Load address of base of array y
 62:    SUB  5,5,4	Compute offset of value 
 63:     ST  3,0(5)	Store variable y
* EXPRESSION
 64:    LDC  3,50(6)	Load integer constant 
 65:     ST  3,-2(1)	Store variable a
* EXPRESSION
 66:    LDC  3,1(6)	Load integer constant 
 67:     ST  3,-3(1)	Store variable b
* EXPRESSION
 68:    LDC  3,8(6)	Load integer constant 
 69:     ST  3,-4(1)	Store variable c
* EXPRESSION
 70:    LDC  3,0(6)	Load Boolean constant 
 71:     ST  3,-11(0)	Store variable x
* EXPRESSION
 72:    LDC  3,1(6)	Load Boolean constant 
 73:     ST  3,-5(1)	Store variable z
* EXPRESSION
*                       Begin call to  outputb
 74:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 75:     LD  3,-2(1)	Load variable a
 76:     ST  3,-8(1)	Save left side 
 77:    LDC  3,1(6)	Load integer constant 
 78:     LD  4,-8(1)	Load left into ac1 
 79:    TLE  3,4,3	Op <= 
 80:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
 81:    LDA  1,-6(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-66(7)	CALL outputb
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 85:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 86:     LD  3,-3(1)	Load variable b
 87:     ST  3,-8(1)	Save left side 
 88:    LDC  3,50(6)	Load integer constant 
 89:     LD  4,-8(1)	Load left into ac1 
 90:    TLE  3,4,3	Op <= 
 91:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
 92:    LDA  1,-6(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-77(7)	CALL outputb
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 96:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 97:    LDC  3,50(6)	Load integer constant 
 98:     ST  3,-8(1)	Save left side 
 99:    LDC  3,50(6)	Load integer constant 
100:     LD  4,-8(1)	Load left into ac1 
101:    TLE  3,4,3	Op <= 
102:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
103:    LDA  1,-6(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-88(7)	CALL outputb
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
107:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
108:    LDA  1,-6(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-74(7)	CALL outnl
111:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
112:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
113:    LDC  3,50(6)	Load integer constant 
114:     ST  3,-8(1)	Save left side 
115:    LDC  3,1(6)	Load integer constant 
116:     LD  4,-8(1)	Load left into ac1 
117:    TLT  3,4,3	Op < 
118:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
119:    LDA  1,-6(1)	Load address of new frame 
120:    LDA  3,1(7)	Return address in ac 
121:    LDA  7,-104(7)	CALL outputb
122:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
123:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
124:     LD  3,-3(1)	Load variable b
125:     ST  3,-8(1)	Save left side 
126:     LD  3,-2(1)	Load variable a
127:     LD  4,-8(1)	Load left into ac1 
128:    TLT  3,4,3	Op < 
129:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
130:    LDA  1,-6(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-115(7)	CALL outputb
133:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
134:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
135:     LD  3,-2(1)	Load variable a
136:     ST  3,-8(1)	Save left side 
137:     LD  3,-2(1)	Load variable a
138:     LD  4,-8(1)	Load left into ac1 
139:    TLT  3,4,3	Op < 
140:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
141:    LDA  1,-6(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-126(7)	CALL outputb
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
145:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
146:    LDA  1,-6(1)	Load address of new frame 
147:    LDA  3,1(7)	Return address in ac 
148:    LDA  7,-112(7)	CALL outnl
149:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
150:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
151:    LDC  3,50(6)	Load integer constant 
152:     ST  3,-8(1)	Save left side 
153:    LDC  3,1(6)	Load integer constant 
154:     LD  4,-8(1)	Load left into ac1 
155:    TGT  3,4,3	Op > 
156:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
157:    LDA  1,-6(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-142(7)	CALL outputb
160:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
161:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
162:    LDC  3,1(6)	Load integer constant 
163:     ST  3,-8(1)	Save left side 
164:    LDC  3,50(6)	Load integer constant 
165:     LD  4,-8(1)	Load left into ac1 
166:    TGT  3,4,3	Op > 
167:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
168:    LDA  1,-6(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-153(7)	CALL outputb
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
172:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
173:    LDC  3,50(6)	Load integer constant 
174:     ST  3,-8(1)	Save left side 
175:    LDC  3,50(6)	Load integer constant 
176:     LD  4,-8(1)	Load left into ac1 
177:    TGT  3,4,3	Op > 
178:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
179:    LDA  1,-6(1)	Load address of new frame 
180:    LDA  3,1(7)	Return address in ac 
181:    LDA  7,-164(7)	CALL outputb
182:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
183:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
184:    LDA  1,-6(1)	Load address of new frame 
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-150(7)	CALL outnl
187:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
188:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
189:    LDC  3,50(6)	Load integer constant 
190:     ST  3,-8(1)	Save left side 
191:    LDC  3,1(6)	Load integer constant 
192:     LD  4,-8(1)	Load left into ac1 
193:    TGE  3,4,3	Op >= 
194:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
195:    LDA  1,-6(1)	Load address of new frame 
196:    LDA  3,1(7)	Return address in ac 
197:    LDA  7,-180(7)	CALL outputb
198:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
199:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
200:    LDC  3,1(6)	Load integer constant 
201:     ST  3,-8(1)	Save left side 
202:    LDC  3,50(6)	Load integer constant 
203:     LD  4,-8(1)	Load left into ac1 
204:    TGE  3,4,3	Op >= 
205:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
206:    LDA  1,-6(1)	Load address of new frame 
207:    LDA  3,1(7)	Return address in ac 
208:    LDA  7,-191(7)	CALL outputb
209:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
210:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
211:    LDC  3,50(6)	Load integer constant 
212:     ST  3,-8(1)	Save left side 
213:    LDC  3,50(6)	Load integer constant 
214:     LD  4,-8(1)	Load left into ac1 
215:    TGE  3,4,3	Op >= 
216:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
217:    LDA  1,-6(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-202(7)	CALL outputb
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
221:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
222:    LDA  1,-6(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-188(7)	CALL outnl
225:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
226:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
227:    LDC  3,0(6)	Load integer constant 
228:    LDA  4,-1(0)	Load address of base of array y
229:    SUB  3,4,3	Compute offset of value 
230:     LD  3,0(3)	Load the value 
231:     ST  3,-8(1)	Save left side 
232:     LD  3,-3(1)	Load variable b
233:     LD  4,-8(1)	Load left into ac1 
234:    TEQ  3,4,3	Op == 
235:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
236:    LDA  1,-6(1)	Load address of new frame 
237:    LDA  3,1(7)	Return address in ac 
238:    LDA  7,-221(7)	CALL outputb
239:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
240:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
241:     LD  3,-2(1)	Load variable a
242:     ST  3,-8(1)	Save left side 
243:     LD  3,-3(1)	Load variable b
244:     LD  4,-8(1)	Load left into ac1 
245:    TEQ  3,4,3	Op == 
246:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
247:    LDA  1,-6(1)	Load address of new frame 
248:    LDA  3,1(7)	Return address in ac 
249:    LDA  7,-232(7)	CALL outputb
250:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
251:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
252:     LD  3,-3(1)	Load variable b
253:     ST  3,-8(1)	Save left side 
254:     LD  3,-3(1)	Load variable b
255:     LD  4,-8(1)	Load left into ac1 
256:    TEQ  3,4,3	Op == 
257:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
258:    LDA  1,-6(1)	Load address of new frame 
259:    LDA  3,1(7)	Return address in ac 
260:    LDA  7,-243(7)	CALL outputb
261:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
262:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
263:    LDA  1,-6(1)	Load address of new frame 
264:    LDA  3,1(7)	Return address in ac 
265:    LDA  7,-229(7)	CALL outnl
266:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
267:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
268:    LDC  3,0(6)	Load integer constant 
269:    LDA  4,-1(0)	Load address of base of array y
270:    SUB  3,4,3	Compute offset of value 
271:     LD  3,0(3)	Load the value 
272:     ST  3,-8(1)	Save left side 
273:     LD  3,-2(1)	Load variable a
274:     LD  4,-8(1)	Load left into ac1 
275:    TNE  3,4,3	Op != 
276:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
277:    LDA  1,-6(1)	Load address of new frame 
278:    LDA  3,1(7)	Return address in ac 
279:    LDA  7,-262(7)	CALL outputb
280:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
281:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
282:    LDC  3,0(6)	Load integer constant 
283:    LDA  4,-1(0)	Load address of base of array y
284:    SUB  3,4,3	Compute offset of value 
285:     LD  3,0(3)	Load the value 
286:     ST  3,-8(1)	Save left side 
287:     LD  3,-3(1)	Load variable b
288:     LD  4,-8(1)	Load left into ac1 
289:    TNE  3,4,3	Op != 
290:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
291:    LDA  1,-6(1)	Load address of new frame 
292:    LDA  3,1(7)	Return address in ac 
293:    LDA  7,-276(7)	CALL outputb
294:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
295:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
296:     LD  3,-2(1)	Load variable a
297:     ST  3,-8(1)	Save left side 
298:     LD  3,-3(1)	Load variable b
299:     LD  4,-8(1)	Load left into ac1 
300:    TNE  3,4,3	Op != 
301:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
302:    LDA  1,-6(1)	Load address of new frame 
303:    LDA  3,1(7)	Return address in ac 
304:    LDA  7,-287(7)	CALL outputb
305:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
306:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
307:     LD  3,-3(1)	Load variable b
308:     ST  3,-8(1)	Save left side 
309:     LD  3,-3(1)	Load variable b
310:     LD  4,-8(1)	Load left into ac1 
311:    TNE  3,4,3	Op != 
312:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
313:    LDA  1,-6(1)	Load address of new frame 
314:    LDA  3,1(7)	Return address in ac 
315:    LDA  7,-298(7)	CALL outputb
316:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
317:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
318:    LDA  1,-6(1)	Load address of new frame 
319:    LDA  3,1(7)	Return address in ac 
320:    LDA  7,-284(7)	CALL outnl
321:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
322:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
323:    LDC  3,1(6)	Load Boolean constant 
324:     ST  3,-8(1)	Save left side 
325:    LDC  3,1(6)	Load Boolean constant 
326:     LD  4,-8(1)	Load left into ac1 
327:    AND  3,4,3	Op AND 
328:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
329:    LDA  1,-6(1)	Load address of new frame 
330:    LDA  3,1(7)	Return address in ac 
331:    LDA  7,-314(7)	CALL outputb
332:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
333:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
334:    LDC  3,1(6)	Load Boolean constant 
335:     ST  3,-8(1)	Save left side 
336:    LDC  3,0(6)	Load Boolean constant 
337:     LD  4,-8(1)	Load left into ac1 
338:    AND  3,4,3	Op AND 
339:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
340:    LDA  1,-6(1)	Load address of new frame 
341:    LDA  3,1(7)	Return address in ac 
342:    LDA  7,-325(7)	CALL outputb
343:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
344:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
345:    LDC  3,0(6)	Load Boolean constant 
346:     ST  3,-8(1)	Save left side 
347:    LDC  3,1(6)	Load Boolean constant 
348:     LD  4,-8(1)	Load left into ac1 
349:    AND  3,4,3	Op AND 
350:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
351:    LDA  1,-6(1)	Load address of new frame 
352:    LDA  3,1(7)	Return address in ac 
353:    LDA  7,-336(7)	CALL outputb
354:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
355:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
356:    LDC  3,0(6)	Load Boolean constant 
357:     ST  3,-8(1)	Save left side 
358:    LDC  3,0(6)	Load Boolean constant 
359:     LD  4,-8(1)	Load left into ac1 
360:    AND  3,4,3	Op AND 
361:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
362:    LDA  1,-6(1)	Load address of new frame 
363:    LDA  3,1(7)	Return address in ac 
364:    LDA  7,-347(7)	CALL outputb
365:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
366:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
367:    LDA  1,-6(1)	Load address of new frame 
368:    LDA  3,1(7)	Return address in ac 
369:    LDA  7,-333(7)	CALL outnl
370:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
371:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
372:    LDC  3,1(6)	Load Boolean constant 
373:     ST  3,-8(1)	Save left side 
374:    LDC  3,1(6)	Load Boolean constant 
375:     LD  4,-8(1)	Load left into ac1 
376:     OR  3,4,3	Op OR 
377:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
378:    LDA  1,-6(1)	Load address of new frame 
379:    LDA  3,1(7)	Return address in ac 
380:    LDA  7,-363(7)	CALL outputb
381:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
382:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
383:     LD  3,-5(1)	Load variable z
384:     ST  3,-8(1)	Save left side 
385:    LDC  3,0(6)	Load Boolean constant 
386:     LD  4,-8(1)	Load left into ac1 
387:     OR  3,4,3	Op OR 
388:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
389:    LDA  1,-6(1)	Load address of new frame 
390:    LDA  3,1(7)	Return address in ac 
391:    LDA  7,-374(7)	CALL outputb
392:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
393:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
394:    LDC  3,0(6)	Load Boolean constant 
395:     ST  3,-8(1)	Save left side 
396:    LDC  3,1(6)	Load Boolean constant 
397:     LD  4,-8(1)	Load left into ac1 
398:     OR  3,4,3	Op OR 
399:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
400:    LDA  1,-6(1)	Load address of new frame 
401:    LDA  3,1(7)	Return address in ac 
402:    LDA  7,-385(7)	CALL outputb
403:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
404:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
405:    LDC  3,0(6)	Load Boolean constant 
406:     ST  3,-8(1)	Save left side 
407:    LDC  3,0(6)	Load Boolean constant 
408:     LD  4,-8(1)	Load left into ac1 
409:     OR  3,4,3	Op OR 
410:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
411:    LDA  1,-6(1)	Load address of new frame 
412:    LDA  3,1(7)	Return address in ac 
413:    LDA  7,-396(7)	CALL outputb
414:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
415:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
416:    LDA  1,-6(1)	Load address of new frame 
417:    LDA  3,1(7)	Return address in ac 
418:    LDA  7,-382(7)	CALL outnl
419:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
420:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
421:    LDC  3,1(6)	Load Boolean constant 
422:    LDC  4,1(6)	Load 1 
423:    XOR  3,3,4	Op NOT 
424:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
425:    LDA  1,-6(1)	Load address of new frame 
426:    LDA  3,1(7)	Return address in ac 
427:    LDA  7,-410(7)	CALL outputb
428:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
429:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
430:     LD  3,-11(0)	Load variable x
431:    LDC  4,1(6)	Load 1 
432:    XOR  3,3,4	Op NOT 
433:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
434:    LDA  1,-6(1)	Load address of new frame 
435:    LDA  3,1(7)	Return address in ac 
436:    LDA  7,-419(7)	CALL outputb
437:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
438:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
439:    LDA  1,-6(1)	Load address of new frame 
440:    LDA  3,1(7)	Return address in ac 
441:    LDA  7,-405(7)	CALL outnl
442:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
443:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
444:    LDC  3,5(6)	Load integer constant 
445:     ST  3,-8(1)	Save left side 
446:    LDC  3,50(6)	Load integer constant 
447:     LD  4,-8(1)	Load left into ac1 
448:    ADD  3,4,3	Op + 
449:     ST  3,-8(1)	Store parameter 
*                       Jump to output
450:    LDA  1,-6(1)	Load address of new frame 
451:    LDA  3,1(7)	Return address in ac 
452:    LDA  7,-447(7)	CALL output
453:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
454:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
455:     LD  3,-4(1)	Load variable c
456:    LDA  4,-1(0)	Load address of base of array y
457:    SUB  3,4,3	Compute offset of value 
458:     LD  3,0(3)	Load the value 
459:     ST  3,-8(1)	Save left side 
460:    LDC  3,50(6)	Load integer constant 
461:     LD  4,-8(1)	Load left into ac1 
462:    ADD  3,4,3	Op + 
463:     ST  3,-8(1)	Store parameter 
*                       Jump to output
464:    LDA  1,-6(1)	Load address of new frame 
465:    LDA  3,1(7)	Return address in ac 
466:    LDA  7,-461(7)	CALL output
467:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
468:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
469:    LDA  1,-6(1)	Load address of new frame 
470:    LDA  3,1(7)	Return address in ac 
471:    LDA  7,-435(7)	CALL outnl
472:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
473:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
474:    LDC  3,5(6)	Load integer constant 
475:     ST  3,-8(1)	Save left side 
476:    LDC  3,50(6)	Load integer constant 
477:     LD  4,-8(1)	Load left into ac1 
478:    SUB  3,4,3	Op - 
479:     ST  3,-8(1)	Store parameter 
*                       Jump to output
480:    LDA  1,-6(1)	Load address of new frame 
481:    LDA  3,1(7)	Return address in ac 
482:    LDA  7,-477(7)	CALL output
483:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
484:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
485:    LDC  3,30(6)	Load integer constant 
486:     ST  3,-8(1)	Save left side 
487:    LDC  3,5(6)	Load integer constant 
488:     LD  4,-8(1)	Load left into ac1 
489:    SUB  3,4,3	Op - 
490:     ST  3,-8(1)	Save left side 
491:    LDC  3,50(6)	Load integer constant 
492:     LD  4,-8(1)	Load left into ac1 
493:    SUB  3,4,3	Op - 
494:     ST  3,-8(1)	Store parameter 
*                       Jump to output
495:    LDA  1,-6(1)	Load address of new frame 
496:    LDA  3,1(7)	Return address in ac 
497:    LDA  7,-492(7)	CALL output
498:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
499:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
500:    LDA  1,-6(1)	Load address of new frame 
501:    LDA  3,1(7)	Return address in ac 
502:    LDA  7,-466(7)	CALL outnl
503:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
504:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
505:     LD  3,-2(1)	Load variable a
506:    LDC  4,0(6)	Load 0 
507:    SUB  3,4,3	Op unary - 
508:     ST  3,-8(1)	Store parameter 
*                       Jump to output
509:    LDA  1,-6(1)	Load address of new frame 
510:    LDA  3,1(7)	Return address in ac 
511:    LDA  7,-506(7)	CALL output
512:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
513:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
514:    LDC  3,0(6)	Load integer constant 
515:    LDC  4,0(6)	Load 0 
516:    SUB  3,4,3	Op unary - 
517:     ST  3,-8(1)	Store parameter 
*                       Jump to output
518:    LDA  1,-6(1)	Load address of new frame 
519:    LDA  3,1(7)	Return address in ac 
520:    LDA  7,-515(7)	CALL output
521:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
522:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
523:    LDC  3,1(6)	Load integer constant 
524:    LDC  4,0(6)	Load 0 
525:    SUB  3,4,3	Op unary - 
526:     ST  3,-8(1)	Store parameter 
*                       Jump to output
527:    LDA  1,-6(1)	Load address of new frame 
528:    LDA  3,1(7)	Return address in ac 
529:    LDA  7,-524(7)	CALL output
530:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
531:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
532:    LDA  1,-6(1)	Load address of new frame 
533:    LDA  3,1(7)	Return address in ac 
534:    LDA  7,-498(7)	CALL outnl
535:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
536:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
537:    LDC  3,2(6)	Load integer constant 
538:     ST  3,-8(1)	Save left side 
539:    LDC  3,3(6)	Load integer constant 
540:     LD  4,-8(1)	Load left into ac1 
541:    MUL  3,4,3	Op * 
542:     ST  3,-8(1)	Save left side 
543:    LDC  3,5(6)	Load integer constant 
544:     LD  4,-8(1)	Load left into ac1 
545:    MUL  3,4,3	Op * 
546:     ST  3,-8(1)	Save left side 
547:    LDC  3,7(6)	Load integer constant 
548:     LD  4,-8(1)	Load left into ac1 
549:    MUL  3,4,3	Op * 
550:     ST  3,-8(1)	Save left side 
551:    LDC  3,11(6)	Load integer constant 
552:     LD  4,-8(1)	Load left into ac1 
553:    MUL  3,4,3	Op * 
554:     ST  3,-8(1)	Store parameter 
*                       Jump to output
555:    LDA  1,-6(1)	Load address of new frame 
556:    LDA  3,1(7)	Return address in ac 
557:    LDA  7,-552(7)	CALL output
558:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
559:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
560:    LDC  3,50(6)	Load integer constant 
561:     ST  3,-8(1)	Save left side 
562:    LDC  3,8(6)	Load integer constant 
563:    LDA  4,-1(0)	Load address of base of array y
564:    SUB  3,4,3	Compute offset of value 
565:     LD  3,0(3)	Load the value 
566:     LD  4,-8(1)	Load left into ac1 
567:    MUL  3,4,3	Op * 
568:     ST  3,-8(1)	Store parameter 
*                       Jump to output
569:    LDA  1,-6(1)	Load address of new frame 
570:    LDA  3,1(7)	Return address in ac 
571:    LDA  7,-566(7)	CALL output
572:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
573:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
574:    LDC  3,8(6)	Load integer constant 
575:    LDA  4,-1(0)	Load address of base of array y
576:    SUB  3,4,3	Compute offset of value 
577:     LD  3,0(3)	Load the value 
578:     ST  3,-8(1)	Save left side 
579:    LDC  3,50(6)	Load integer constant 
580:     LD  4,-8(1)	Load left into ac1 
581:    MUL  3,4,3	Op * 
582:     ST  3,-8(1)	Store parameter 
*                       Jump to output
583:    LDA  1,-6(1)	Load address of new frame 
584:    LDA  3,1(7)	Return address in ac 
585:    LDA  7,-580(7)	CALL output
586:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
587:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
588:    LDA  1,-6(1)	Load address of new frame 
589:    LDA  3,1(7)	Return address in ac 
590:    LDA  7,-554(7)	CALL outnl
591:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
592:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
593:    LDC  3,50(6)	Load integer constant 
594:     ST  3,-8(1)	Save left side 
595:    LDC  3,8(6)	Load integer constant 
596:    LDA  4,-1(0)	Load address of base of array y
597:    SUB  3,4,3	Compute offset of value 
598:     LD  3,0(3)	Load the value 
599:     LD  4,-8(1)	Load left into ac1 
600:    DIV  3,4,3	Op / 
601:     ST  3,-8(1)	Store parameter 
*                       Jump to output
602:    LDA  1,-6(1)	Load address of new frame 
603:    LDA  3,1(7)	Return address in ac 
604:    LDA  7,-599(7)	CALL output
605:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
606:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
607:    LDC  3,8(6)	Load integer constant 
608:    LDA  4,-1(0)	Load address of base of array y
609:    SUB  3,4,3	Compute offset of value 
610:     LD  3,0(3)	Load the value 
611:     ST  3,-8(1)	Save left side 
612:    LDC  3,50(6)	Load integer constant 
613:     LD  4,-8(1)	Load left into ac1 
614:    DIV  3,4,3	Op / 
615:     ST  3,-8(1)	Store parameter 
*                       Jump to output
616:    LDA  1,-6(1)	Load address of new frame 
617:    LDA  3,1(7)	Return address in ac 
618:    LDA  7,-613(7)	CALL output
619:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
620:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
621:    LDC  3,8(6)	Load integer constant 
622:    LDA  4,-1(0)	Load address of base of array y
623:    SUB  3,4,3	Compute offset of value 
624:     LD  3,0(3)	Load the value 
625:     ST  3,-8(1)	Save left side 
626:     LD  3,-3(1)	Load variable b
627:     LD  4,-8(1)	Load left into ac1 
628:    DIV  3,4,3	Op / 
629:     ST  3,-8(1)	Store parameter 
*                       Jump to output
630:    LDA  1,-6(1)	Load address of new frame 
631:    LDA  3,1(7)	Return address in ac 
632:    LDA  7,-627(7)	CALL output
633:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
634:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
635:    LDC  3,210(6)	Load integer constant 
636:     ST  3,-8(1)	Save left side 
637:    LDC  3,7(6)	Load integer constant 
638:     LD  4,-8(1)	Load left into ac1 
639:    DIV  3,4,3	Op / 
640:     ST  3,-8(1)	Save left side 
641:    LDC  3,3(6)	Load integer constant 
642:     LD  4,-8(1)	Load left into ac1 
643:    DIV  3,4,3	Op / 
644:     ST  3,-8(1)	Store parameter 
*                       Jump to output
645:    LDA  1,-6(1)	Load address of new frame 
646:    LDA  3,1(7)	Return address in ac 
647:    LDA  7,-642(7)	CALL output
648:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
649:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
650:    LDA  1,-6(1)	Load address of new frame 
651:    LDA  3,1(7)	Return address in ac 
652:    LDA  7,-616(7)	CALL outnl
653:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
654:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
655:    LDC  3,211(6)	Load integer constant 
656:     ST  3,-8(1)	Save left side 
657:    LDC  3,7(6)	Load integer constant 
658:     LD  4,-8(1)	Load left into ac1 
659:    DIV  5,4,3	Op % 
660:    MUL  5,5,3	 
661:    SUB  3,4,5	 
662:     ST  3,-8(1)	Store parameter 
*                       Jump to output
663:    LDA  1,-6(1)	Load address of new frame 
664:    LDA  3,1(7)	Return address in ac 
665:    LDA  7,-660(7)	CALL output
666:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
667:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
668:    LDC  3,211(6)	Load integer constant 
669:     ST  3,-8(1)	Save left side 
670:    LDC  3,6(6)	Load integer constant 
671:     LD  4,-8(1)	Load left into ac1 
672:    DIV  5,4,3	Op % 
673:    MUL  5,5,3	 
674:    SUB  3,4,5	 
675:     ST  3,-8(1)	Store parameter 
*                       Jump to output
676:    LDA  1,-6(1)	Load address of new frame 
677:    LDA  3,1(7)	Return address in ac 
678:    LDA  7,-673(7)	CALL output
679:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
680:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
681:    LDC  3,211(6)	Load integer constant 
682:     ST  3,-8(1)	Save left side 
683:    LDC  3,5(6)	Load integer constant 
684:     LD  4,-8(1)	Load left into ac1 
685:    DIV  5,4,3	Op % 
686:    MUL  5,5,3	 
687:    SUB  3,4,5	 
688:     ST  3,-8(1)	Store parameter 
*                       Jump to output
689:    LDA  1,-6(1)	Load address of new frame 
690:    LDA  3,1(7)	Return address in ac 
691:    LDA  7,-686(7)	CALL output
692:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
693:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
694:    LDC  3,211(6)	Load integer constant 
695:     ST  3,-8(1)	Save left side 
696:    LDC  3,4(6)	Load integer constant 
697:     LD  4,-8(1)	Load left into ac1 
698:    DIV  5,4,3	Op % 
699:    MUL  5,5,3	 
700:    SUB  3,4,5	 
701:     ST  3,-8(1)	Store parameter 
*                       Jump to output
702:    LDA  1,-6(1)	Load address of new frame 
703:    LDA  3,1(7)	Return address in ac 
704:    LDA  7,-699(7)	CALL output
705:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
706:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
707:    LDC  3,211(6)	Load integer constant 
708:     ST  3,-8(1)	Save left side 
709:    LDC  3,100(6)	Load integer constant 
710:     LD  4,-8(1)	Load left into ac1 
711:    DIV  5,4,3	Op % 
712:    MUL  5,5,3	 
713:    SUB  3,4,5	 
714:     ST  3,-8(1)	Save left side 
715:    LDC  3,3(6)	Load integer constant 
716:     LD  4,-8(1)	Load left into ac1 
717:    DIV  5,4,3	Op % 
718:    MUL  5,5,3	 
719:    SUB  3,4,5	 
720:     ST  3,-8(1)	Store parameter 
*                       Jump to output
721:    LDA  1,-6(1)	Load address of new frame 
722:    LDA  3,1(7)	Return address in ac 
723:    LDA  7,-718(7)	CALL output
724:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
725:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
726:    LDA  1,-6(1)	Load address of new frame 
727:    LDA  3,1(7)	Return address in ac 
728:    LDA  7,-692(7)	CALL outnl
729:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
730:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
731:    LDC  3,43(6)	Load integer constant 
732:     ST  3,-4(1)	Store variable c
733:     ST  3,-3(1)	Store variable b
734:     ST  3,-2(1)	Store variable a
735:     ST  3,-8(1)	Store parameter 
*                       Jump to output
736:    LDA  1,-6(1)	Load address of new frame 
737:    LDA  3,1(7)	Return address in ac 
738:    LDA  7,-733(7)	CALL output
739:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
740:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
741:     LD  3,-2(1)	Load variable a
742:     ST  3,-8(1)	Store parameter 
*                       Jump to output
743:    LDA  1,-6(1)	Load address of new frame 
744:    LDA  3,1(7)	Return address in ac 
745:    LDA  7,-740(7)	CALL output
746:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
747:    LDC  3,3(6)	Load integer constant 
748:     ST  3,-3(1)	Store variable b
749:     ST  3,-6(1)	Save left side 
750:    LDC  3,4(6)	Load integer constant 
751:     ST  3,-4(1)	Store variable c
752:     LD  4,-6(1)	Load left into ac1 
753:    MUL  3,4,3	Op * 
754:     ST  3,-2(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
755:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
756:     LD  3,-2(1)	Load variable a
757:     ST  3,-8(1)	Store parameter 
*                       Jump to output
758:    LDA  1,-6(1)	Load address of new frame 
759:    LDA  3,1(7)	Return address in ac 
760:    LDA  7,-755(7)	CALL output
761:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
762:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
763:    LDA  1,-6(1)	Load address of new frame 
764:    LDA  3,1(7)	Return address in ac 
765:    LDA  7,-729(7)	CALL outnl
766:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
767:    LDC  3,44(6)	Load integer constant 
768:     ST  3,-2(1)	Store variable a
* EXPRESSION
769:    LDC  3,2(6)	Load integer constant 
770:     ST  3,-3(1)	Store variable b
* EXPRESSION
*                       Begin call to  output
771:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
772:     LD  3,-3(1)	Load variable b
773:     LD  4,-2(1)	load lhs variable a
774:    ADD  3,4,3	op += 
775:     ST  3,-2(1)	Store variable a
776:     ST  3,-8(1)	Store parameter 
*                       Jump to output
777:    LDA  1,-6(1)	Load address of new frame 
778:    LDA  3,1(7)	Return address in ac 
779:    LDA  7,-774(7)	CALL output
780:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
781:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
782:     LD  3,-3(1)	Load variable b
783:     LD  4,-2(1)	load lhs variable a
784:    SUB  3,4,3	op -= 
785:     ST  3,-2(1)	Store variable a
786:     ST  3,-8(1)	Store parameter 
*                       Jump to output
787:    LDA  1,-6(1)	Load address of new frame 
788:    LDA  3,1(7)	Return address in ac 
789:    LDA  7,-784(7)	CALL output
790:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
791:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
792:     LD  3,-2(1)	Load variable a
793:     LD  4,-2(1)	load lhs variable a
794:    SUB  3,4,3	op -= 
795:     ST  3,-2(1)	Store variable a
796:     ST  3,-8(1)	Store parameter 
*                       Jump to output
797:    LDA  1,-6(1)	Load address of new frame 
798:    LDA  3,1(7)	Return address in ac 
799:    LDA  7,-794(7)	CALL output
800:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
801:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
802:    LDC  3,10(6)	Load integer constant 
803:     LD  4,-3(1)	load lhs variable b
804:    ADD  3,4,3	op += 
805:     ST  3,-3(1)	Store variable b
806:     LD  4,-2(1)	load lhs variable a
807:    ADD  3,4,3	op += 
808:     ST  3,-2(1)	Store variable a
809:     ST  3,-8(1)	Store parameter 
*                       Jump to output
810:    LDA  1,-6(1)	Load address of new frame 
811:    LDA  3,1(7)	Return address in ac 
812:    LDA  7,-807(7)	CALL output
813:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
814:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
815:    LDA  1,-6(1)	Load address of new frame 
816:    LDA  3,1(7)	Return address in ac 
817:    LDA  7,-781(7)	CALL outnl
818:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
819:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
820:    LDC  3,3(6)	Load integer constant 
821:     ST  3,-8(1)	Save left side 
822:    LDC  3,4(6)	Load integer constant 
823:     LD  4,-8(1)	Load left into ac1 
824:    SUB  3,4,3	Op - 
825:     ST  3,-8(1)	Save left side 
826:    LDC  3,5(6)	Load integer constant 
827:     LD  4,-8(1)	Load left into ac1 
828:    SUB  3,4,3	Op - 
829:     ST  3,-8(1)	Store parameter 
*                       Jump to output
830:    LDA  1,-6(1)	Load address of new frame 
831:    LDA  3,1(7)	Return address in ac 
832:    LDA  7,-827(7)	CALL output
833:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
834:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
835:    LDC  3,211(6)	Load integer constant 
836:     ST  3,-8(1)	Save left side 
837:    LDC  3,17(6)	Load integer constant 
838:     LD  4,-8(1)	Load left into ac1 
839:    DIV  3,4,3	Op / 
840:     ST  3,-8(1)	Save left side 
841:    LDC  3,5(6)	Load integer constant 
842:     LD  4,-8(1)	Load left into ac1 
843:    DIV  3,4,3	Op / 
844:     ST  3,-8(1)	Store parameter 
*                       Jump to output
845:    LDA  1,-6(1)	Load address of new frame 
846:    LDA  3,1(7)	Return address in ac 
847:    LDA  7,-842(7)	CALL output
848:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
849:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
850:    LDC  3,211(6)	Load integer constant 
851:     ST  3,-8(1)	Save left side 
852:    LDC  3,17(6)	Load integer constant 
853:     ST  3,-9(1)	Save left side 
854:    LDC  3,5(6)	Load integer constant 
855:     LD  4,-9(1)	Load left into ac1 
856:    DIV  3,4,3	Op / 
857:     LD  4,-8(1)	Load left into ac1 
858:    DIV  3,4,3	Op / 
859:     ST  3,-8(1)	Store parameter 
*                       Jump to output
860:    LDA  1,-6(1)	Load address of new frame 
861:    LDA  3,1(7)	Return address in ac 
862:    LDA  7,-857(7)	CALL output
863:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
864:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
865:    LDC  3,1(6)	Load Boolean constant 
866:     ST  3,-8(1)	Save left side 
867:    LDC  3,0(6)	Load Boolean constant 
868:     LD  4,-8(1)	Load left into ac1 
869:     OR  3,4,3	Op OR 
870:     ST  3,-8(1)	Save left side 
871:    LDC  3,0(6)	Load Boolean constant 
872:     LD  4,-8(1)	Load left into ac1 
873:    AND  3,4,3	Op AND 
874:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
875:    LDA  1,-6(1)	Load address of new frame 
876:    LDA  3,1(7)	Return address in ac 
877:    LDA  7,-860(7)	CALL outputb
878:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
879:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
880:    LDC  3,1(6)	Load Boolean constant 
881:     ST  3,-8(1)	Save left side 
882:    LDC  3,0(6)	Load Boolean constant 
883:     ST  3,-9(1)	Save left side 
884:    LDC  3,0(6)	Load Boolean constant 
885:     LD  4,-9(1)	Load left into ac1 
886:    AND  3,4,3	Op AND 
887:     LD  4,-8(1)	Load left into ac1 
888:     OR  3,4,3	Op OR 
889:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
890:    LDA  1,-6(1)	Load address of new frame 
891:    LDA  3,1(7)	Return address in ac 
892:    LDA  7,-875(7)	CALL outputb
893:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
894:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
895:    LDC  3,1(6)	Load Boolean constant 
896:     ST  3,-8(1)	Save left side 
897:    LDC  3,0(6)	Load Boolean constant 
898:     ST  3,-9(1)	Save left side 
899:    LDC  3,0(6)	Load Boolean constant 
900:     LD  4,-9(1)	Load left into ac1 
901:    AND  3,4,3	Op AND 
902:     LD  4,-8(1)	Load left into ac1 
903:     OR  3,4,3	Op OR 
904:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
905:    LDA  1,-6(1)	Load address of new frame 
906:    LDA  3,1(7)	Return address in ac 
907:    LDA  7,-890(7)	CALL outputb
908:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
909:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
910:    LDA  1,-6(1)	Load address of new frame 
911:    LDA  3,1(7)	Return address in ac 
912:    LDA  7,-876(7)	CALL outnl
913:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
914:    LDC  2,0(6)	Set return value to 0 
915:     LD  3,-1(1)	Load return address 
916:     LD  1,0(1)	Adjust fp 
917:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,917(7)	Jump to init [backpatch] 
* INIT
918:     LD  0,0(0)	Set the global pointer 
919:    LDA  1,-12(0)	set first frame at end of globals 
920:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
921:    LDC  3,10(6)	load size of array y
922:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
923:    LDA  3,1(7)	Return address in ac 
924:    LDA  7,-883(7)	Jump to main 
925:   HALT  0,0,0	DONE! 
* END INIT
