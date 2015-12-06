* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyOps.c-
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
430:    LDC  3,0(6)	Load Boolean constant 
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
*                       Begin call to  outputb
438:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
439:     LD  3,-11(0)	Load variable x
440:    LDC  4,1(6)	Load 1 
441:    XOR  3,3,4	Op NOT 
442:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
443:    LDA  1,-6(1)	Load address of new frame 
444:    LDA  3,1(7)	Return address in ac 
445:    LDA  7,-428(7)	CALL outputb
446:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
447:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
448:     LD  3,-11(0)	Load variable x
449:    LDC  4,1(6)	Load 1 
450:    XOR  3,3,4	Op NOT 
451:    LDC  4,1(6)	Load 1 
452:    XOR  3,3,4	Op NOT 
453:    LDC  4,1(6)	Load 1 
454:    XOR  3,3,4	Op NOT 
455:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
456:    LDA  1,-6(1)	Load address of new frame 
457:    LDA  3,1(7)	Return address in ac 
458:    LDA  7,-441(7)	CALL outputb
459:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
460:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
461:    LDA  1,-6(1)	Load address of new frame 
462:    LDA  3,1(7)	Return address in ac 
463:    LDA  7,-427(7)	CALL outnl
464:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
465:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
466:    LDC  3,5(6)	Load integer constant 
467:     ST  3,-8(1)	Save left side 
468:    LDC  3,50(6)	Load integer constant 
469:     LD  4,-8(1)	Load left into ac1 
470:    ADD  3,4,3	Op + 
471:     ST  3,-8(1)	Store parameter 
*                       Jump to output
472:    LDA  1,-6(1)	Load address of new frame 
473:    LDA  3,1(7)	Return address in ac 
474:    LDA  7,-469(7)	CALL output
475:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
476:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
477:     LD  3,-4(1)	Load variable c
478:    LDA  4,-1(0)	Load address of base of array y
479:    SUB  3,4,3	Compute offset of value 
480:     LD  3,0(3)	Load the value 
481:     ST  3,-8(1)	Save left side 
482:    LDC  3,50(6)	Load integer constant 
483:     LD  4,-8(1)	Load left into ac1 
484:    ADD  3,4,3	Op + 
485:     ST  3,-8(1)	Store parameter 
*                       Jump to output
486:    LDA  1,-6(1)	Load address of new frame 
487:    LDA  3,1(7)	Return address in ac 
488:    LDA  7,-483(7)	CALL output
489:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
490:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
491:    LDA  1,-6(1)	Load address of new frame 
492:    LDA  3,1(7)	Return address in ac 
493:    LDA  7,-457(7)	CALL outnl
494:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
495:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
496:    LDC  3,5(6)	Load integer constant 
497:     ST  3,-8(1)	Save left side 
498:    LDC  3,50(6)	Load integer constant 
499:     LD  4,-8(1)	Load left into ac1 
500:    SUB  3,4,3	Op - 
501:     ST  3,-8(1)	Store parameter 
*                       Jump to output
502:    LDA  1,-6(1)	Load address of new frame 
503:    LDA  3,1(7)	Return address in ac 
504:    LDA  7,-499(7)	CALL output
505:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
506:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
507:    LDC  3,30(6)	Load integer constant 
508:     ST  3,-8(1)	Save left side 
509:    LDC  3,5(6)	Load integer constant 
510:     LD  4,-8(1)	Load left into ac1 
511:    SUB  3,4,3	Op - 
512:     ST  3,-8(1)	Save left side 
513:    LDC  3,50(6)	Load integer constant 
514:     LD  4,-8(1)	Load left into ac1 
515:    SUB  3,4,3	Op - 
516:     ST  3,-8(1)	Store parameter 
*                       Jump to output
517:    LDA  1,-6(1)	Load address of new frame 
518:    LDA  3,1(7)	Return address in ac 
519:    LDA  7,-514(7)	CALL output
520:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
521:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
522:    LDA  1,-6(1)	Load address of new frame 
523:    LDA  3,1(7)	Return address in ac 
524:    LDA  7,-488(7)	CALL outnl
525:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
526:    LDC  3,50(6)	Load integer constant 
527:     ST  3,-2(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
528:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
529:     LD  3,-2(1)	Load variable a
530:    LDC  4,0(6)	Load 0 
531:    SUB  3,4,3	Op unary - 
532:     ST  3,-8(1)	Store parameter 
*                       Jump to output
533:    LDA  1,-6(1)	Load address of new frame 
534:    LDA  3,1(7)	Return address in ac 
535:    LDA  7,-530(7)	CALL output
536:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
537:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
538:     LD  3,-2(1)	Load variable a
539:    LDC  4,0(6)	Load 0 
540:    SUB  3,4,3	Op unary - 
541:    LDC  4,0(6)	Load 0 
542:    SUB  3,4,3	Op unary - 
543:     ST  3,-8(1)	Store parameter 
*                       Jump to output
544:    LDA  1,-6(1)	Load address of new frame 
545:    LDA  3,1(7)	Return address in ac 
546:    LDA  7,-541(7)	CALL output
547:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
548:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
549:     LD  3,-2(1)	Load variable a
550:    LDC  4,0(6)	Load 0 
551:    SUB  3,4,3	Op unary - 
552:     ST  3,-8(1)	Store parameter 
*                       Jump to output
553:    LDA  1,-6(1)	Load address of new frame 
554:    LDA  3,1(7)	Return address in ac 
555:    LDA  7,-550(7)	CALL output
556:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
557:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
558:    LDC  3,0(6)	Load integer constant 
559:    LDC  4,0(6)	Load 0 
560:    SUB  3,4,3	Op unary - 
561:     ST  3,-8(1)	Store parameter 
*                       Jump to output
562:    LDA  1,-6(1)	Load address of new frame 
563:    LDA  3,1(7)	Return address in ac 
564:    LDA  7,-559(7)	CALL output
565:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
566:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
567:    LDC  3,1(6)	Load integer constant 
568:    LDC  4,0(6)	Load 0 
569:    SUB  3,4,3	Op unary - 
570:     ST  3,-8(1)	Store parameter 
*                       Jump to output
571:    LDA  1,-6(1)	Load address of new frame 
572:    LDA  3,1(7)	Return address in ac 
573:    LDA  7,-568(7)	CALL output
574:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
575:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
576:    LDA  1,-6(1)	Load address of new frame 
577:    LDA  3,1(7)	Return address in ac 
578:    LDA  7,-542(7)	CALL outnl
579:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
580:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
581:    LDC  3,2(6)	Load integer constant 
582:     ST  3,-8(1)	Save left side 
583:    LDC  3,3(6)	Load integer constant 
584:     LD  4,-8(1)	Load left into ac1 
585:    MUL  3,4,3	Op * 
586:     ST  3,-8(1)	Save left side 
587:    LDC  3,5(6)	Load integer constant 
588:     LD  4,-8(1)	Load left into ac1 
589:    MUL  3,4,3	Op * 
590:     ST  3,-8(1)	Save left side 
591:    LDC  3,7(6)	Load integer constant 
592:     LD  4,-8(1)	Load left into ac1 
593:    MUL  3,4,3	Op * 
594:     ST  3,-8(1)	Save left side 
595:    LDC  3,11(6)	Load integer constant 
596:     LD  4,-8(1)	Load left into ac1 
597:    MUL  3,4,3	Op * 
598:     ST  3,-8(1)	Store parameter 
*                       Jump to output
599:    LDA  1,-6(1)	Load address of new frame 
600:    LDA  3,1(7)	Return address in ac 
601:    LDA  7,-596(7)	CALL output
602:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
603:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
604:    LDC  3,50(6)	Load integer constant 
605:     ST  3,-8(1)	Save left side 
606:    LDC  3,8(6)	Load integer constant 
607:    LDA  4,-1(0)	Load address of base of array y
608:    SUB  3,4,3	Compute offset of value 
609:     LD  3,0(3)	Load the value 
610:     LD  4,-8(1)	Load left into ac1 
611:    MUL  3,4,3	Op * 
612:     ST  3,-8(1)	Store parameter 
*                       Jump to output
613:    LDA  1,-6(1)	Load address of new frame 
614:    LDA  3,1(7)	Return address in ac 
615:    LDA  7,-610(7)	CALL output
616:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
617:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
618:    LDC  3,8(6)	Load integer constant 
619:    LDA  4,-1(0)	Load address of base of array y
620:    SUB  3,4,3	Compute offset of value 
621:     LD  3,0(3)	Load the value 
622:     ST  3,-8(1)	Save left side 
623:    LDC  3,50(6)	Load integer constant 
624:     LD  4,-8(1)	Load left into ac1 
625:    MUL  3,4,3	Op * 
626:     ST  3,-8(1)	Store parameter 
*                       Jump to output
627:    LDA  1,-6(1)	Load address of new frame 
628:    LDA  3,1(7)	Return address in ac 
629:    LDA  7,-624(7)	CALL output
630:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
631:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
632:    LDA  1,-6(1)	Load address of new frame 
633:    LDA  3,1(7)	Return address in ac 
634:    LDA  7,-598(7)	CALL outnl
635:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
636:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
637:    LDC  3,50(6)	Load integer constant 
638:     ST  3,-8(1)	Save left side 
639:    LDC  3,8(6)	Load integer constant 
640:    LDA  4,-1(0)	Load address of base of array y
641:    SUB  3,4,3	Compute offset of value 
642:     LD  3,0(3)	Load the value 
643:     LD  4,-8(1)	Load left into ac1 
644:    DIV  3,4,3	Op / 
645:     ST  3,-8(1)	Store parameter 
*                       Jump to output
646:    LDA  1,-6(1)	Load address of new frame 
647:    LDA  3,1(7)	Return address in ac 
648:    LDA  7,-643(7)	CALL output
649:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
650:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
651:    LDC  3,8(6)	Load integer constant 
652:    LDA  4,-1(0)	Load address of base of array y
653:    SUB  3,4,3	Compute offset of value 
654:     LD  3,0(3)	Load the value 
655:     ST  3,-8(1)	Save left side 
656:    LDC  3,50(6)	Load integer constant 
657:     LD  4,-8(1)	Load left into ac1 
658:    DIV  3,4,3	Op / 
659:     ST  3,-8(1)	Store parameter 
*                       Jump to output
660:    LDA  1,-6(1)	Load address of new frame 
661:    LDA  3,1(7)	Return address in ac 
662:    LDA  7,-657(7)	CALL output
663:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
664:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
665:    LDC  3,8(6)	Load integer constant 
666:    LDA  4,-1(0)	Load address of base of array y
667:    SUB  3,4,3	Compute offset of value 
668:     LD  3,0(3)	Load the value 
669:     ST  3,-8(1)	Save left side 
670:     LD  3,-3(1)	Load variable b
671:     LD  4,-8(1)	Load left into ac1 
672:    DIV  3,4,3	Op / 
673:     ST  3,-8(1)	Store parameter 
*                       Jump to output
674:    LDA  1,-6(1)	Load address of new frame 
675:    LDA  3,1(7)	Return address in ac 
676:    LDA  7,-671(7)	CALL output
677:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
678:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
679:    LDC  3,210(6)	Load integer constant 
680:     ST  3,-8(1)	Save left side 
681:    LDC  3,7(6)	Load integer constant 
682:     LD  4,-8(1)	Load left into ac1 
683:    DIV  3,4,3	Op / 
684:     ST  3,-8(1)	Save left side 
685:    LDC  3,3(6)	Load integer constant 
686:     LD  4,-8(1)	Load left into ac1 
687:    DIV  3,4,3	Op / 
688:     ST  3,-8(1)	Store parameter 
*                       Jump to output
689:    LDA  1,-6(1)	Load address of new frame 
690:    LDA  3,1(7)	Return address in ac 
691:    LDA  7,-686(7)	CALL output
692:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
693:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
694:    LDA  1,-6(1)	Load address of new frame 
695:    LDA  3,1(7)	Return address in ac 
696:    LDA  7,-660(7)	CALL outnl
697:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
698:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
699:    LDC  3,211(6)	Load integer constant 
700:     ST  3,-8(1)	Save left side 
701:    LDC  3,7(6)	Load integer constant 
702:     LD  4,-8(1)	Load left into ac1 
703:    DIV  5,4,3	Op % 
704:    MUL  5,5,3	 
705:    SUB  3,4,5	 
706:     ST  3,-8(1)	Store parameter 
*                       Jump to output
707:    LDA  1,-6(1)	Load address of new frame 
708:    LDA  3,1(7)	Return address in ac 
709:    LDA  7,-704(7)	CALL output
710:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
711:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
712:    LDC  3,211(6)	Load integer constant 
713:     ST  3,-8(1)	Save left side 
714:    LDC  3,6(6)	Load integer constant 
715:     LD  4,-8(1)	Load left into ac1 
716:    DIV  5,4,3	Op % 
717:    MUL  5,5,3	 
718:    SUB  3,4,5	 
719:     ST  3,-8(1)	Store parameter 
*                       Jump to output
720:    LDA  1,-6(1)	Load address of new frame 
721:    LDA  3,1(7)	Return address in ac 
722:    LDA  7,-717(7)	CALL output
723:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
724:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
725:    LDC  3,211(6)	Load integer constant 
726:     ST  3,-8(1)	Save left side 
727:    LDC  3,5(6)	Load integer constant 
728:     LD  4,-8(1)	Load left into ac1 
729:    DIV  5,4,3	Op % 
730:    MUL  5,5,3	 
731:    SUB  3,4,5	 
732:     ST  3,-8(1)	Store parameter 
*                       Jump to output
733:    LDA  1,-6(1)	Load address of new frame 
734:    LDA  3,1(7)	Return address in ac 
735:    LDA  7,-730(7)	CALL output
736:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
737:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
738:    LDC  3,211(6)	Load integer constant 
739:     ST  3,-8(1)	Save left side 
740:    LDC  3,4(6)	Load integer constant 
741:     LD  4,-8(1)	Load left into ac1 
742:    DIV  5,4,3	Op % 
743:    MUL  5,5,3	 
744:    SUB  3,4,5	 
745:     ST  3,-8(1)	Store parameter 
*                       Jump to output
746:    LDA  1,-6(1)	Load address of new frame 
747:    LDA  3,1(7)	Return address in ac 
748:    LDA  7,-743(7)	CALL output
749:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
750:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
751:    LDC  3,211(6)	Load integer constant 
752:     ST  3,-8(1)	Save left side 
753:    LDC  3,211(6)	Load integer constant 
754:     ST  3,-9(1)	Save left side 
755:    LDC  3,4(6)	Load integer constant 
756:     LD  4,-9(1)	Load left into ac1 
757:    DIV  3,4,3	Op / 
758:     ST  3,-9(1)	Save left side 
759:    LDC  3,4(6)	Load integer constant 
760:     LD  4,-9(1)	Load left into ac1 
761:    MUL  3,4,3	Op * 
762:     LD  4,-8(1)	Load left into ac1 
763:    SUB  3,4,3	Op - 
764:     ST  3,-8(1)	Store parameter 
*                       Jump to output
765:    LDA  1,-6(1)	Load address of new frame 
766:    LDA  3,1(7)	Return address in ac 
767:    LDA  7,-762(7)	CALL output
768:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
769:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
770:    LDC  3,211(6)	Load integer constant 
771:     ST  3,-8(1)	Save left side 
772:    LDC  3,100(6)	Load integer constant 
773:     LD  4,-8(1)	Load left into ac1 
774:    DIV  5,4,3	Op % 
775:    MUL  5,5,3	 
776:    SUB  3,4,5	 
777:     ST  3,-8(1)	Save left side 
778:    LDC  3,3(6)	Load integer constant 
779:     LD  4,-8(1)	Load left into ac1 
780:    DIV  5,4,3	Op % 
781:    MUL  5,5,3	 
782:    SUB  3,4,5	 
783:     ST  3,-8(1)	Store parameter 
*                       Jump to output
784:    LDA  1,-6(1)	Load address of new frame 
785:    LDA  3,1(7)	Return address in ac 
786:    LDA  7,-781(7)	CALL output
787:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
788:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
789:    LDA  1,-6(1)	Load address of new frame 
790:    LDA  3,1(7)	Return address in ac 
791:    LDA  7,-755(7)	CALL outnl
792:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
793:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
794:    LDC  3,43(6)	Load integer constant 
795:     ST  3,-4(1)	Store variable c
796:     ST  3,-3(1)	Store variable b
797:     ST  3,-2(1)	Store variable a
798:     ST  3,-8(1)	Store parameter 
*                       Jump to output
799:    LDA  1,-6(1)	Load address of new frame 
800:    LDA  3,1(7)	Return address in ac 
801:    LDA  7,-796(7)	CALL output
802:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
803:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
804:     LD  3,-2(1)	Load variable a
805:     ST  3,-8(1)	Store parameter 
*                       Jump to output
806:    LDA  1,-6(1)	Load address of new frame 
807:    LDA  3,1(7)	Return address in ac 
808:    LDA  7,-803(7)	CALL output
809:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
810:    LDC  3,3(6)	Load integer constant 
811:     ST  3,-3(1)	Store variable b
812:     ST  3,-6(1)	Save left side 
813:    LDC  3,4(6)	Load integer constant 
814:     ST  3,-4(1)	Store variable c
815:     LD  4,-6(1)	Load left into ac1 
816:    MUL  3,4,3	Op * 
817:     ST  3,-2(1)	Store variable a
* EXPRESSION
*                       Begin call to  output
818:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
819:     LD  3,-2(1)	Load variable a
820:     ST  3,-8(1)	Store parameter 
*                       Jump to output
821:    LDA  1,-6(1)	Load address of new frame 
822:    LDA  3,1(7)	Return address in ac 
823:    LDA  7,-818(7)	CALL output
824:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
825:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
826:    LDA  1,-6(1)	Load address of new frame 
827:    LDA  3,1(7)	Return address in ac 
828:    LDA  7,-792(7)	CALL outnl
829:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
830:    LDC  3,44(6)	Load integer constant 
831:     ST  3,-2(1)	Store variable a
* EXPRESSION
832:    LDC  3,2(6)	Load integer constant 
833:     ST  3,-3(1)	Store variable b
* EXPRESSION
*                       Begin call to  output
834:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
835:     LD  3,-3(1)	Load variable b
836:     LD  4,-2(1)	load lhs variable a
837:    ADD  3,4,3	op += 
838:     ST  3,-2(1)	Store variable a
839:     ST  3,-8(1)	Store parameter 
*                       Jump to output
840:    LDA  1,-6(1)	Load address of new frame 
841:    LDA  3,1(7)	Return address in ac 
842:    LDA  7,-837(7)	CALL output
843:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
844:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
845:     LD  3,-3(1)	Load variable b
846:     LD  4,-2(1)	load lhs variable a
847:    SUB  3,4,3	op -= 
848:     ST  3,-2(1)	Store variable a
849:     ST  3,-8(1)	Store parameter 
*                       Jump to output
850:    LDA  1,-6(1)	Load address of new frame 
851:    LDA  3,1(7)	Return address in ac 
852:    LDA  7,-847(7)	CALL output
853:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
854:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
855:     LD  3,-2(1)	Load variable a
856:     LD  4,-2(1)	load lhs variable a
857:    SUB  3,4,3	op -= 
858:     ST  3,-2(1)	Store variable a
859:     ST  3,-8(1)	Store parameter 
*                       Jump to output
860:    LDA  1,-6(1)	Load address of new frame 
861:    LDA  3,1(7)	Return address in ac 
862:    LDA  7,-857(7)	CALL output
863:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
864:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
865:    LDC  3,10(6)	Load integer constant 
866:     LD  4,-3(1)	load lhs variable b
867:    ADD  3,4,3	op += 
868:     ST  3,-3(1)	Store variable b
869:     LD  4,-2(1)	load lhs variable a
870:    ADD  3,4,3	op += 
871:     ST  3,-2(1)	Store variable a
872:     ST  3,-8(1)	Store parameter 
*                       Jump to output
873:    LDA  1,-6(1)	Load address of new frame 
874:    LDA  3,1(7)	Return address in ac 
875:    LDA  7,-870(7)	CALL output
876:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
877:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
878:    LDA  1,-6(1)	Load address of new frame 
879:    LDA  3,1(7)	Return address in ac 
880:    LDA  7,-844(7)	CALL outnl
881:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
882:    LDC  3,44(6)	Load integer constant 
883:     ST  3,-2(1)	Store variable a
* EXPRESSION
884:    LDC  3,2(6)	Load integer constant 
885:     ST  3,-3(1)	Store variable b
* EXPRESSION
*                       Begin call to  output
886:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
887:     LD  3,-3(1)	Load variable b
888:     LD  4,-2(1)	load lhs variable a
889:    MUL  3,4,3	op *= 
890:     ST  3,-2(1)	Store variable a
891:     ST  3,-8(1)	Store parameter 
*                       Jump to output
892:    LDA  1,-6(1)	Load address of new frame 
893:    LDA  3,1(7)	Return address in ac 
894:    LDA  7,-889(7)	CALL output
895:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
896:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
897:     LD  3,-3(1)	Load variable b
898:     LD  4,-2(1)	load lhs variable a
899:    DIV  3,4,3	op /= 
900:     ST  3,-2(1)	Store variable a
901:     ST  3,-8(1)	Store parameter 
*                       Jump to output
902:    LDA  1,-6(1)	Load address of new frame 
903:    LDA  3,1(7)	Return address in ac 
904:    LDA  7,-899(7)	CALL output
905:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
906:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
907:    LDC  3,2(6)	Load integer constant 
908:     LD  4,-2(1)	load lhs variable a
909:    DIV  3,4,3	op /= 
910:     ST  3,-2(1)	Store variable a
911:     LD  4,-2(1)	load lhs variable a
912:    DIV  3,4,3	op /= 
913:     ST  3,-2(1)	Store variable a
914:     ST  3,-8(1)	Store parameter 
*                       Jump to output
915:    LDA  1,-6(1)	Load address of new frame 
916:    LDA  3,1(7)	Return address in ac 
917:    LDA  7,-912(7)	CALL output
918:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
919:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
920:    LDC  3,10(6)	Load integer constant 
921:     LD  4,-3(1)	load lhs variable b
922:    MUL  3,4,3	op *= 
923:     ST  3,-3(1)	Store variable b
924:     LD  4,-2(1)	load lhs variable a
925:    MUL  3,4,3	op *= 
926:     ST  3,-2(1)	Store variable a
927:     ST  3,-8(1)	Store parameter 
*                       Jump to output
928:    LDA  1,-6(1)	Load address of new frame 
929:    LDA  3,1(7)	Return address in ac 
930:    LDA  7,-925(7)	CALL output
931:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
932:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
933:    LDA  1,-6(1)	Load address of new frame 
934:    LDA  3,1(7)	Return address in ac 
935:    LDA  7,-899(7)	CALL outnl
936:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
937:    LDC  3,44(6)	Load integer constant 
938:     ST  3,-2(1)	Store variable a
* EXPRESSION
939:    LDC  3,2(6)	Load integer constant 
940:     ST  3,-3(1)	Store variable b
* EXPRESSION
*                       Begin call to  output
941:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
942:     LD  3,-2(1)	load lhs variable a
943:    LDA  3,1(3)	increment value of a
944:     ST  3,-2(1)	Store variable a
945:     ST  3,-8(1)	Store parameter 
*                       Jump to output
946:    LDA  1,-6(1)	Load address of new frame 
947:    LDA  3,1(7)	Return address in ac 
948:    LDA  7,-943(7)	CALL output
949:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
950:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
951:     LD  3,-3(1)	load lhs variable b
952:    LDA  3,-1(3)	decrement value of b
953:     ST  3,-3(1)	Store variable b
954:     ST  3,-8(1)	Store parameter 
*                       Jump to output
955:    LDA  1,-6(1)	Load address of new frame 
956:    LDA  3,1(7)	Return address in ac 
957:    LDA  7,-952(7)	CALL output
958:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
959:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
960:    LDA  1,-6(1)	Load address of new frame 
961:    LDA  3,1(7)	Return address in ac 
962:    LDA  7,-926(7)	CALL outnl
963:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
964:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
965:    LDC  3,3(6)	Load integer constant 
966:     ST  3,-8(1)	Save left side 
967:    LDC  3,4(6)	Load integer constant 
968:     LD  4,-8(1)	Load left into ac1 
969:    SUB  3,4,3	Op - 
970:     ST  3,-8(1)	Save left side 
971:    LDC  3,5(6)	Load integer constant 
972:     LD  4,-8(1)	Load left into ac1 
973:    SUB  3,4,3	Op - 
974:     ST  3,-8(1)	Store parameter 
*                       Jump to output
975:    LDA  1,-6(1)	Load address of new frame 
976:    LDA  3,1(7)	Return address in ac 
977:    LDA  7,-972(7)	CALL output
978:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
979:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
980:    LDC  3,211(6)	Load integer constant 
981:     ST  3,-8(1)	Save left side 
982:    LDC  3,17(6)	Load integer constant 
983:     LD  4,-8(1)	Load left into ac1 
984:    DIV  3,4,3	Op / 
985:     ST  3,-8(1)	Save left side 
986:    LDC  3,5(6)	Load integer constant 
987:     LD  4,-8(1)	Load left into ac1 
988:    DIV  3,4,3	Op / 
989:     ST  3,-8(1)	Store parameter 
*                       Jump to output
990:    LDA  1,-6(1)	Load address of new frame 
991:    LDA  3,1(7)	Return address in ac 
992:    LDA  7,-987(7)	CALL output
993:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
994:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
995:    LDC  3,211(6)	Load integer constant 
996:     ST  3,-8(1)	Save left side 
997:    LDC  3,17(6)	Load integer constant 
998:     ST  3,-9(1)	Save left side 
999:    LDC  3,5(6)	Load integer constant 
1000:     LD  4,-9(1)	Load left into ac1 
1001:    DIV  3,4,3	Op / 
1002:     LD  4,-8(1)	Load left into ac1 
1003:    DIV  3,4,3	Op / 
1004:     ST  3,-8(1)	Store parameter 
*                       Jump to output
1005:    LDA  1,-6(1)	Load address of new frame 
1006:    LDA  3,1(7)	Return address in ac 
1007:    LDA  7,-1002(7)	CALL output
1008:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
1009:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
1010:    LDA  1,-6(1)	Load address of new frame 
1011:    LDA  3,1(7)	Return address in ac 
1012:    LDA  7,-976(7)	CALL outnl
1013:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
1014:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1015:    LDC  3,1(6)	Load Boolean constant 
1016:     ST  3,-8(1)	Save left side 
1017:    LDC  3,0(6)	Load Boolean constant 
1018:     LD  4,-8(1)	Load left into ac1 
1019:     OR  3,4,3	Op OR 
1020:     ST  3,-8(1)	Save left side 
1021:    LDC  3,0(6)	Load Boolean constant 
1022:     LD  4,-8(1)	Load left into ac1 
1023:    AND  3,4,3	Op AND 
1024:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1025:    LDA  1,-6(1)	Load address of new frame 
1026:    LDA  3,1(7)	Return address in ac 
1027:    LDA  7,-1010(7)	CALL outputb
1028:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1029:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1030:    LDC  3,1(6)	Load Boolean constant 
1031:     ST  3,-8(1)	Save left side 
1032:    LDC  3,0(6)	Load Boolean constant 
1033:     ST  3,-9(1)	Save left side 
1034:    LDC  3,0(6)	Load Boolean constant 
1035:     LD  4,-9(1)	Load left into ac1 
1036:    AND  3,4,3	Op AND 
1037:     LD  4,-8(1)	Load left into ac1 
1038:     OR  3,4,3	Op OR 
1039:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1040:    LDA  1,-6(1)	Load address of new frame 
1041:    LDA  3,1(7)	Return address in ac 
1042:    LDA  7,-1025(7)	CALL outputb
1043:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1044:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1045:    LDC  3,1(6)	Load Boolean constant 
1046:     ST  3,-8(1)	Save left side 
1047:    LDC  3,0(6)	Load Boolean constant 
1048:     ST  3,-9(1)	Save left side 
1049:    LDC  3,0(6)	Load Boolean constant 
1050:     LD  4,-9(1)	Load left into ac1 
1051:    AND  3,4,3	Op AND 
1052:     LD  4,-8(1)	Load left into ac1 
1053:     OR  3,4,3	Op OR 
1054:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1055:    LDA  1,-6(1)	Load address of new frame 
1056:    LDA  3,1(7)	Return address in ac 
1057:    LDA  7,-1040(7)	CALL outputb
1058:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
1059:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
1060:    LDA  1,-6(1)	Load address of new frame 
1061:    LDA  3,1(7)	Return address in ac 
1062:    LDA  7,-1026(7)	CALL outnl
1063:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
1064:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1065:    LDC  3,3(6)	Load integer constant 
1066:    RND  3,3,6	Op ? 
1067:     ST  3,-8(1)	Save left side 
1068:    LDC  3,3(6)	Load integer constant 
1069:     LD  4,-8(1)	Load left into ac1 
1070:    TLT  3,4,3	Op < 
1071:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1072:    LDA  1,-6(1)	Load address of new frame 
1073:    LDA  3,1(7)	Return address in ac 
1074:    LDA  7,-1057(7)	CALL outputb
1075:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1076:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1077:    LDC  3,3(6)	Load integer constant 
1078:    RND  3,3,6	Op ? 
1079:     ST  3,-8(1)	Save left side 
1080:    LDC  3,3(6)	Load integer constant 
1081:     LD  4,-8(1)	Load left into ac1 
1082:    TLT  3,4,3	Op < 
1083:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1084:    LDA  1,-6(1)	Load address of new frame 
1085:    LDA  3,1(7)	Return address in ac 
1086:    LDA  7,-1069(7)	CALL outputb
1087:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1088:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1089:    LDC  3,3(6)	Load integer constant 
1090:    RND  3,3,6	Op ? 
1091:     ST  3,-8(1)	Save left side 
1092:    LDC  3,3(6)	Load integer constant 
1093:     LD  4,-8(1)	Load left into ac1 
1094:    TLT  3,4,3	Op < 
1095:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1096:    LDA  1,-6(1)	Load address of new frame 
1097:    LDA  3,1(7)	Return address in ac 
1098:    LDA  7,-1081(7)	CALL outputb
1099:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1100:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1101:    LDC  3,3(6)	Load integer constant 
1102:    RND  3,3,6	Op ? 
1103:     ST  3,-8(1)	Save left side 
1104:    LDC  3,3(6)	Load integer constant 
1105:     LD  4,-8(1)	Load left into ac1 
1106:    TLT  3,4,3	Op < 
1107:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1108:    LDA  1,-6(1)	Load address of new frame 
1109:    LDA  3,1(7)	Return address in ac 
1110:    LDA  7,-1093(7)	CALL outputb
1111:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1112:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1113:    LDC  3,3(6)	Load integer constant 
1114:    RND  3,3,6	Op ? 
1115:     ST  3,-8(1)	Save left side 
1116:    LDC  3,3(6)	Load integer constant 
1117:     LD  4,-8(1)	Load left into ac1 
1118:    TLT  3,4,3	Op < 
1119:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1120:    LDA  1,-6(1)	Load address of new frame 
1121:    LDA  3,1(7)	Return address in ac 
1122:    LDA  7,-1105(7)	CALL outputb
1123:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1124:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1125:    LDC  3,3(6)	Load integer constant 
1126:    RND  3,3,6	Op ? 
1127:     ST  3,-8(1)	Save left side 
1128:    LDC  3,3(6)	Load integer constant 
1129:     LD  4,-8(1)	Load left into ac1 
1130:    TLT  3,4,3	Op < 
1131:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1132:    LDA  1,-6(1)	Load address of new frame 
1133:    LDA  3,1(7)	Return address in ac 
1134:    LDA  7,-1117(7)	CALL outputb
1135:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1136:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1137:    LDC  3,3(6)	Load integer constant 
1138:    RND  3,3,6	Op ? 
1139:     ST  3,-8(1)	Save left side 
1140:    LDC  3,3(6)	Load integer constant 
1141:     LD  4,-8(1)	Load left into ac1 
1142:    TLT  3,4,3	Op < 
1143:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1144:    LDA  1,-6(1)	Load address of new frame 
1145:    LDA  3,1(7)	Return address in ac 
1146:    LDA  7,-1129(7)	CALL outputb
1147:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1148:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1149:    LDC  3,3(6)	Load integer constant 
1150:    RND  3,3,6	Op ? 
1151:     ST  3,-8(1)	Save left side 
1152:    LDC  3,3(6)	Load integer constant 
1153:     LD  4,-8(1)	Load left into ac1 
1154:    TLT  3,4,3	Op < 
1155:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1156:    LDA  1,-6(1)	Load address of new frame 
1157:    LDA  3,1(7)	Return address in ac 
1158:    LDA  7,-1141(7)	CALL outputb
1159:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1160:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1161:    LDC  3,3(6)	Load integer constant 
1162:    RND  3,3,6	Op ? 
1163:     ST  3,-8(1)	Save left side 
1164:    LDC  3,3(6)	Load integer constant 
1165:     LD  4,-8(1)	Load left into ac1 
1166:    TLT  3,4,3	Op < 
1167:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1168:    LDA  1,-6(1)	Load address of new frame 
1169:    LDA  3,1(7)	Return address in ac 
1170:    LDA  7,-1153(7)	CALL outputb
1171:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1172:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1173:    LDC  3,3(6)	Load integer constant 
1174:    RND  3,3,6	Op ? 
1175:     ST  3,-8(1)	Save left side 
1176:    LDC  3,3(6)	Load integer constant 
1177:     LD  4,-8(1)	Load left into ac1 
1178:    TLT  3,4,3	Op < 
1179:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1180:    LDA  1,-6(1)	Load address of new frame 
1181:    LDA  3,1(7)	Return address in ac 
1182:    LDA  7,-1165(7)	CALL outputb
1183:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1184:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1185:    LDC  3,3(6)	Load integer constant 
1186:    RND  3,3,6	Op ? 
1187:     ST  3,-8(1)	Save left side 
1188:    LDC  3,3(6)	Load integer constant 
1189:     LD  4,-8(1)	Load left into ac1 
1190:    TLT  3,4,3	Op < 
1191:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1192:    LDA  1,-6(1)	Load address of new frame 
1193:    LDA  3,1(7)	Return address in ac 
1194:    LDA  7,-1177(7)	CALL outputb
1195:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1196:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1197:    LDC  3,3(6)	Load integer constant 
1198:    RND  3,3,6	Op ? 
1199:     ST  3,-8(1)	Save left side 
1200:    LDC  3,3(6)	Load integer constant 
1201:     LD  4,-8(1)	Load left into ac1 
1202:    TLT  3,4,3	Op < 
1203:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1204:    LDA  1,-6(1)	Load address of new frame 
1205:    LDA  3,1(7)	Return address in ac 
1206:    LDA  7,-1189(7)	CALL outputb
1207:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1208:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1209:    LDC  3,1(6)	Load integer constant 
1210:    RND  3,3,6	Op ? 
1211:     ST  3,-8(1)	Save left side 
1212:    LDC  3,0(6)	Load integer constant 
1213:     LD  4,-8(1)	Load left into ac1 
1214:    TEQ  3,4,3	Op == 
1215:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1216:    LDA  1,-6(1)	Load address of new frame 
1217:    LDA  3,1(7)	Return address in ac 
1218:    LDA  7,-1201(7)	CALL outputb
1219:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
1220:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
1221:    LDA  1,-6(1)	Load address of new frame 
1222:    LDA  3,1(7)	Return address in ac 
1223:    LDA  7,-1187(7)	CALL outnl
1224:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
1225:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1226:    LDC  3,10000(6)	Load integer constant 
1227:    RND  3,3,6	Op ? 
1228:     ST  3,-8(1)	Save left side 
1229:    LDC  3,0(6)	Load integer constant 
1230:     LD  4,-8(1)	Load left into ac1 
1231:    TGT  3,4,3	Op > 
1232:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1233:    LDA  1,-6(1)	Load address of new frame 
1234:    LDA  3,1(7)	Return address in ac 
1235:    LDA  7,-1218(7)	CALL outputb
1236:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
1237:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
1238:    LDC  3,10000(6)	Load integer constant 
1239:    RND  3,3,6	Op ? 
1240:     ST  3,-8(1)	Save left side 
1241:    LDC  3,0(6)	Load integer constant 
1242:     LD  4,-8(1)	Load left into ac1 
1243:    TGT  3,4,3	Op > 
1244:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
1245:    LDA  1,-6(1)	Load address of new frame 
1246:    LDA  3,1(7)	Return address in ac 
1247:    LDA  7,-1230(7)	CALL outputb
1248:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
1249:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
1250:    LDA  1,-6(1)	Load address of new frame 
1251:    LDA  3,1(7)	Return address in ac 
1252:    LDA  7,-1216(7)	CALL outnl
1253:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
1254:    LDC  2,0(6)	Set return value to 0 
1255:     LD  3,-1(1)	Load return address 
1256:     LD  1,0(1)	Adjust fp 
1257:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,1257(7)	Jump to init [backpatch] 
* INIT
1258:     LD  0,0(0)	Set the global pointer 
1259:    LDA  1,-12(0)	set first frame at end of globals 
1260:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
1261:    LDC  3,10(6)	load size of array y
1262:     ST  3,0(0)	save size of array y
* END INIT GLOBALS AND STATICS
1263:    LDA  3,1(7)	Return address in ac 
1264:    LDA  7,-1223(7)	Jump to main 
1265:   HALT  0,0,0	DONE! 
* END INIT
