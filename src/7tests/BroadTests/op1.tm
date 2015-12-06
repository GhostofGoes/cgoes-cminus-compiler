* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  op1.c-
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
*                       Begin call to  outputb
 43:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,111(6)	Load integer constant 
 45:     ST  3,-4(1)	Save left side 
 46:    LDC  3,222(6)	Load integer constant 
 47:     LD  4,-4(1)	Load left into ac1 
 48:    TLE  3,4,3	Op <= 
 49:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 50:    LDA  1,-2(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-35(7)	CALL outputb
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 54:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 55:    LDC  3,222(6)	Load integer constant 
 56:     ST  3,-4(1)	Save left side 
 57:    LDC  3,111(6)	Load integer constant 
 58:     LD  4,-4(1)	Load left into ac1 
 59:    TLE  3,4,3	Op <= 
 60:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 61:    LDA  1,-2(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-46(7)	CALL outputb
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 65:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 66:    LDC  3,111(6)	Load integer constant 
 67:     ST  3,-4(1)	Save left side 
 68:    LDC  3,111(6)	Load integer constant 
 69:     LD  4,-4(1)	Load left into ac1 
 70:    TLE  3,4,3	Op <= 
 71:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 72:    LDA  1,-2(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-57(7)	CALL outputb
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
 76:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 77:    LDA  1,-2(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-43(7)	CALL outnl
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
 81:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 82:    LDC  3,111(6)	Load integer constant 
 83:     ST  3,-4(1)	Save left side 
 84:    LDC  3,222(6)	Load integer constant 
 85:     LD  4,-4(1)	Load left into ac1 
 86:    TLT  3,4,3	Op < 
 87:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 88:    LDA  1,-2(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-73(7)	CALL outputb
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 92:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 93:    LDC  3,222(6)	Load integer constant 
 94:     ST  3,-4(1)	Save left side 
 95:    LDC  3,111(6)	Load integer constant 
 96:     LD  4,-4(1)	Load left into ac1 
 97:    TLT  3,4,3	Op < 
 98:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 99:    LDA  1,-2(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-84(7)	CALL outputb
102:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
103:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
104:    LDC  3,111(6)	Load integer constant 
105:     ST  3,-4(1)	Save left side 
106:    LDC  3,111(6)	Load integer constant 
107:     LD  4,-4(1)	Load left into ac1 
108:    TLT  3,4,3	Op < 
109:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
110:    LDA  1,-2(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-95(7)	CALL outputb
113:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
114:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
115:    LDA  1,-2(1)	Load address of new frame 
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-81(7)	CALL outnl
118:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
119:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
120:    LDC  3,111(6)	Load integer constant 
121:     ST  3,-4(1)	Save left side 
122:    LDC  3,222(6)	Load integer constant 
123:     LD  4,-4(1)	Load left into ac1 
124:    TGT  3,4,3	Op > 
125:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
126:    LDA  1,-2(1)	Load address of new frame 
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-111(7)	CALL outputb
129:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
130:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
131:    LDC  3,222(6)	Load integer constant 
132:     ST  3,-4(1)	Save left side 
133:    LDC  3,111(6)	Load integer constant 
134:     LD  4,-4(1)	Load left into ac1 
135:    TGT  3,4,3	Op > 
136:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
137:    LDA  1,-2(1)	Load address of new frame 
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-122(7)	CALL outputb
140:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
141:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
142:    LDC  3,111(6)	Load integer constant 
143:     ST  3,-4(1)	Save left side 
144:    LDC  3,111(6)	Load integer constant 
145:     LD  4,-4(1)	Load left into ac1 
146:    TGT  3,4,3	Op > 
147:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
148:    LDA  1,-2(1)	Load address of new frame 
149:    LDA  3,1(7)	Return address in ac 
150:    LDA  7,-133(7)	CALL outputb
151:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
152:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
153:    LDA  1,-2(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-119(7)	CALL outnl
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
157:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
158:    LDC  3,111(6)	Load integer constant 
159:     ST  3,-4(1)	Save left side 
160:    LDC  3,222(6)	Load integer constant 
161:     LD  4,-4(1)	Load left into ac1 
162:    TGE  3,4,3	Op >= 
163:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
164:    LDA  1,-2(1)	Load address of new frame 
165:    LDA  3,1(7)	Return address in ac 
166:    LDA  7,-149(7)	CALL outputb
167:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
168:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
169:    LDC  3,222(6)	Load integer constant 
170:     ST  3,-4(1)	Save left side 
171:    LDC  3,111(6)	Load integer constant 
172:     LD  4,-4(1)	Load left into ac1 
173:    TGE  3,4,3	Op >= 
174:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
175:    LDA  1,-2(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-160(7)	CALL outputb
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
179:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
180:    LDC  3,111(6)	Load integer constant 
181:     ST  3,-4(1)	Save left side 
182:    LDC  3,111(6)	Load integer constant 
183:     LD  4,-4(1)	Load left into ac1 
184:    TGE  3,4,3	Op >= 
185:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
186:    LDA  1,-2(1)	Load address of new frame 
187:    LDA  3,1(7)	Return address in ac 
188:    LDA  7,-171(7)	CALL outputb
189:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
190:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
191:    LDA  1,-2(1)	Load address of new frame 
192:    LDA  3,1(7)	Return address in ac 
193:    LDA  7,-157(7)	CALL outnl
194:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
195:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
196:    LDC  3,111(6)	Load integer constant 
197:     ST  3,-4(1)	Save left side 
198:    LDC  3,222(6)	Load integer constant 
199:     LD  4,-4(1)	Load left into ac1 
200:    TEQ  3,4,3	Op == 
201:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
202:    LDA  1,-2(1)	Load address of new frame 
203:    LDA  3,1(7)	Return address in ac 
204:    LDA  7,-187(7)	CALL outputb
205:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
206:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
207:    LDC  3,222(6)	Load integer constant 
208:     ST  3,-4(1)	Save left side 
209:    LDC  3,111(6)	Load integer constant 
210:     LD  4,-4(1)	Load left into ac1 
211:    TEQ  3,4,3	Op == 
212:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
213:    LDA  1,-2(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-198(7)	CALL outputb
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
217:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
218:    LDC  3,111(6)	Load integer constant 
219:     ST  3,-4(1)	Save left side 
220:    LDC  3,111(6)	Load integer constant 
221:     LD  4,-4(1)	Load left into ac1 
222:    TEQ  3,4,3	Op == 
223:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
224:    LDA  1,-2(1)	Load address of new frame 
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-209(7)	CALL outputb
227:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
228:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
229:    LDA  1,-2(1)	Load address of new frame 
230:    LDA  3,1(7)	Return address in ac 
231:    LDA  7,-195(7)	CALL outnl
232:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
233:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
234:    LDC  3,111(6)	Load integer constant 
235:     ST  3,-4(1)	Save left side 
236:    LDC  3,222(6)	Load integer constant 
237:     LD  4,-4(1)	Load left into ac1 
238:    TNE  3,4,3	Op != 
239:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
240:    LDA  1,-2(1)	Load address of new frame 
241:    LDA  3,1(7)	Return address in ac 
242:    LDA  7,-225(7)	CALL outputb
243:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
244:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
245:    LDC  3,222(6)	Load integer constant 
246:     ST  3,-4(1)	Save left side 
247:    LDC  3,111(6)	Load integer constant 
248:     LD  4,-4(1)	Load left into ac1 
249:    TNE  3,4,3	Op != 
250:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
251:    LDA  1,-2(1)	Load address of new frame 
252:    LDA  3,1(7)	Return address in ac 
253:    LDA  7,-236(7)	CALL outputb
254:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
255:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
256:    LDC  3,111(6)	Load integer constant 
257:     ST  3,-4(1)	Save left side 
258:    LDC  3,111(6)	Load integer constant 
259:     LD  4,-4(1)	Load left into ac1 
260:    TNE  3,4,3	Op != 
261:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
262:    LDA  1,-2(1)	Load address of new frame 
263:    LDA  3,1(7)	Return address in ac 
264:    LDA  7,-247(7)	CALL outputb
265:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
266:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
267:    LDA  1,-2(1)	Load address of new frame 
268:    LDA  3,1(7)	Return address in ac 
269:    LDA  7,-233(7)	CALL outnl
270:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
271:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
272:    LDC  3,111(6)	Load integer constant 
273:     ST  3,-4(1)	Save left side 
274:    LDC  3,222(6)	Load integer constant 
275:     LD  4,-4(1)	Load left into ac1 
276:    TNE  3,4,3	Op != 
277:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
278:    LDA  1,-2(1)	Load address of new frame 
279:    LDA  3,1(7)	Return address in ac 
280:    LDA  7,-263(7)	CALL outputb
281:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
282:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
283:    LDC  3,222(6)	Load integer constant 
284:     ST  3,-4(1)	Save left side 
285:    LDC  3,111(6)	Load integer constant 
286:     LD  4,-4(1)	Load left into ac1 
287:    TNE  3,4,3	Op != 
288:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
289:    LDA  1,-2(1)	Load address of new frame 
290:    LDA  3,1(7)	Return address in ac 
291:    LDA  7,-274(7)	CALL outputb
292:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
293:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
294:    LDC  3,111(6)	Load integer constant 
295:     ST  3,-4(1)	Save left side 
296:    LDC  3,111(6)	Load integer constant 
297:     LD  4,-4(1)	Load left into ac1 
298:    TNE  3,4,3	Op != 
299:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
300:    LDA  1,-2(1)	Load address of new frame 
301:    LDA  3,1(7)	Return address in ac 
302:    LDA  7,-285(7)	CALL outputb
303:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
304:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
305:    LDA  1,-2(1)	Load address of new frame 
306:    LDA  3,1(7)	Return address in ac 
307:    LDA  7,-271(7)	CALL outnl
308:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
309:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
310:    LDC  3,0(6)	Load Boolean constant 
311:     ST  3,-4(1)	Save left side 
312:    LDC  3,0(6)	Load Boolean constant 
313:     LD  4,-4(1)	Load left into ac1 
314:    AND  3,4,3	Op AND 
315:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
316:    LDA  1,-2(1)	Load address of new frame 
317:    LDA  3,1(7)	Return address in ac 
318:    LDA  7,-301(7)	CALL outputb
319:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
320:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
321:    LDC  3,0(6)	Load Boolean constant 
322:     ST  3,-4(1)	Save left side 
323:    LDC  3,1(6)	Load Boolean constant 
324:     LD  4,-4(1)	Load left into ac1 
325:    AND  3,4,3	Op AND 
326:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
327:    LDA  1,-2(1)	Load address of new frame 
328:    LDA  3,1(7)	Return address in ac 
329:    LDA  7,-312(7)	CALL outputb
330:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
331:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
332:    LDC  3,1(6)	Load Boolean constant 
333:     ST  3,-4(1)	Save left side 
334:    LDC  3,0(6)	Load Boolean constant 
335:     LD  4,-4(1)	Load left into ac1 
336:    AND  3,4,3	Op AND 
337:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
338:    LDA  1,-2(1)	Load address of new frame 
339:    LDA  3,1(7)	Return address in ac 
340:    LDA  7,-323(7)	CALL outputb
341:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
342:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
343:    LDC  3,1(6)	Load Boolean constant 
344:     ST  3,-4(1)	Save left side 
345:    LDC  3,1(6)	Load Boolean constant 
346:     LD  4,-4(1)	Load left into ac1 
347:    AND  3,4,3	Op AND 
348:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
349:    LDA  1,-2(1)	Load address of new frame 
350:    LDA  3,1(7)	Return address in ac 
351:    LDA  7,-334(7)	CALL outputb
352:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
353:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
354:    LDA  1,-2(1)	Load address of new frame 
355:    LDA  3,1(7)	Return address in ac 
356:    LDA  7,-320(7)	CALL outnl
357:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
358:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
359:    LDC  3,0(6)	Load Boolean constant 
360:     ST  3,-4(1)	Save left side 
361:    LDC  3,0(6)	Load Boolean constant 
362:     LD  4,-4(1)	Load left into ac1 
363:     OR  3,4,3	Op OR 
364:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
365:    LDA  1,-2(1)	Load address of new frame 
366:    LDA  3,1(7)	Return address in ac 
367:    LDA  7,-350(7)	CALL outputb
368:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
369:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
370:    LDC  3,0(6)	Load Boolean constant 
371:     ST  3,-4(1)	Save left side 
372:    LDC  3,1(6)	Load Boolean constant 
373:     LD  4,-4(1)	Load left into ac1 
374:     OR  3,4,3	Op OR 
375:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
376:    LDA  1,-2(1)	Load address of new frame 
377:    LDA  3,1(7)	Return address in ac 
378:    LDA  7,-361(7)	CALL outputb
379:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
380:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
381:    LDC  3,1(6)	Load Boolean constant 
382:     ST  3,-4(1)	Save left side 
383:    LDC  3,0(6)	Load Boolean constant 
384:     LD  4,-4(1)	Load left into ac1 
385:     OR  3,4,3	Op OR 
386:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
387:    LDA  1,-2(1)	Load address of new frame 
388:    LDA  3,1(7)	Return address in ac 
389:    LDA  7,-372(7)	CALL outputb
390:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
391:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
392:    LDC  3,1(6)	Load Boolean constant 
393:     ST  3,-4(1)	Save left side 
394:    LDC  3,1(6)	Load Boolean constant 
395:     LD  4,-4(1)	Load left into ac1 
396:     OR  3,4,3	Op OR 
397:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
398:    LDA  1,-2(1)	Load address of new frame 
399:    LDA  3,1(7)	Return address in ac 
400:    LDA  7,-383(7)	CALL outputb
401:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
402:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
403:    LDA  1,-2(1)	Load address of new frame 
404:    LDA  3,1(7)	Return address in ac 
405:    LDA  7,-369(7)	CALL outnl
406:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
407:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
408:    LDC  3,0(6)	Load Boolean constant 
409:    LDC  4,1(6)	Load 1 
410:    XOR  3,3,4	Op NOT 
411:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
412:    LDA  1,-2(1)	Load address of new frame 
413:    LDA  3,1(7)	Return address in ac 
414:    LDA  7,-397(7)	CALL outputb
415:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
416:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
417:    LDC  3,1(6)	Load Boolean constant 
418:    LDC  4,1(6)	Load 1 
419:    XOR  3,3,4	Op NOT 
420:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
421:    LDA  1,-2(1)	Load address of new frame 
422:    LDA  3,1(7)	Return address in ac 
423:    LDA  7,-406(7)	CALL outputb
424:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
425:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
426:    LDA  1,-2(1)	Load address of new frame 
427:    LDA  3,1(7)	Return address in ac 
428:    LDA  7,-392(7)	CALL outnl
429:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
430:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
431:    LDC  3,333(6)	Load integer constant 
432:     ST  3,-4(1)	Save left side 
433:    LDC  3,444(6)	Load integer constant 
434:     LD  4,-4(1)	Load left into ac1 
435:    ADD  3,4,3	Op + 
436:     ST  3,-4(1)	Store parameter 
*                       Jump to output
437:    LDA  1,-2(1)	Load address of new frame 
438:    LDA  3,1(7)	Return address in ac 
439:    LDA  7,-434(7)	CALL output
440:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
441:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
442:    LDC  3,333(6)	Load integer constant 
443:     ST  3,-4(1)	Save left side 
444:    LDC  3,444(6)	Load integer constant 
445:     LD  4,-4(1)	Load left into ac1 
446:    SUB  3,4,3	Op - 
447:     ST  3,-4(1)	Store parameter 
*                       Jump to output
448:    LDA  1,-2(1)	Load address of new frame 
449:    LDA  3,1(7)	Return address in ac 
450:    LDA  7,-445(7)	CALL output
451:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
452:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
453:    LDC  3,333(6)	Load integer constant 
454:     ST  3,-4(1)	Save left side 
455:    LDC  3,444(6)	Load integer constant 
456:     LD  4,-4(1)	Load left into ac1 
457:    MUL  3,4,3	Op * 
458:     ST  3,-4(1)	Store parameter 
*                       Jump to output
459:    LDA  1,-2(1)	Load address of new frame 
460:    LDA  3,1(7)	Return address in ac 
461:    LDA  7,-456(7)	CALL output
462:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
463:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
464:    LDC  3,333(6)	Load integer constant 
465:     ST  3,-4(1)	Save left side 
466:    LDC  3,444(6)	Load integer constant 
467:     LD  4,-4(1)	Load left into ac1 
468:    DIV  3,4,3	Op / 
469:     ST  3,-4(1)	Store parameter 
*                       Jump to output
470:    LDA  1,-2(1)	Load address of new frame 
471:    LDA  3,1(7)	Return address in ac 
472:    LDA  7,-467(7)	CALL output
473:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
474:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
475:    LDC  3,3333(6)	Load integer constant 
476:     ST  3,-4(1)	Save left side 
477:    LDC  3,444(6)	Load integer constant 
478:     LD  4,-4(1)	Load left into ac1 
479:    DIV  5,4,3	Op % 
480:    MUL  5,5,3	 
481:    SUB  3,4,5	 
482:     ST  3,-4(1)	Store parameter 
*                       Jump to output
483:    LDA  1,-2(1)	Load address of new frame 
484:    LDA  3,1(7)	Return address in ac 
485:    LDA  7,-480(7)	CALL output
486:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
487:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
488:    LDC  3,444(6)	Load integer constant 
489:    LDC  4,0(6)	Load 0 
490:    SUB  3,4,3	Op unary - 
491:     ST  3,-4(1)	Store parameter 
*                       Jump to output
492:    LDA  1,-2(1)	Load address of new frame 
493:    LDA  3,1(7)	Return address in ac 
494:    LDA  7,-489(7)	CALL output
495:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
496:     LD  3,-1(1)	Load return address 
497:     LD  1,0(1)	Adjust fp 
498:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
499:    LDC  2,0(6)	Set return value to 0 
500:     LD  3,-1(1)	Load return address 
501:     LD  1,0(1)	Adjust fp 
502:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,502(7)	Jump to init [backpatch] 
* INIT
503:     LD  0,0(0)	Set the global pointer 
504:    LDA  1,0(0)	set first frame at end of globals 
505:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
506:    LDA  3,1(7)	Return address in ac 
507:    LDA  7,-466(7)	Jump to main 
508:   HALT  0,0,0	DONE! 
* END INIT
