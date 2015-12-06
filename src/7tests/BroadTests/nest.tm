* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  nest.c-
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
* FUNCTION agamemnon
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,666(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable a
* EXPRESSION
 45:    LDC  3,666(6)	Load integer constant 
 46:     ST  3,-3(1)	Store variable b
* EXPRESSION
 47:    LDC  3,666(6)	Load integer constant 
 48:     ST  3,-4(1)	Store variable x
* EXPRESSION
 49:    LDC  3,666(6)	Load integer constant 
 50:     ST  3,-2(0)	Store variable z
* EXPRESSION
*                       Begin call to  output
 51:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 52:     LD  3,-2(1)	Load variable a
 53:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 54:    LDA  1,-5(1)	Load address of new frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    LDA  7,-51(7)	CALL output
 57:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 59:     LD  3,-3(1)	Load variable b
 60:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 61:    LDA  1,-5(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-58(7)	CALL output
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 65:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 66:     LD  3,-4(1)	Load variable x
 67:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 68:    LDA  1,-5(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-65(7)	CALL output
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 72:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 73:     LD  3,-1(0)	Load variable y
 74:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-5(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 79:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 80:     LD  3,-2(0)	Load variable z
 81:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 82:    LDA  1,-5(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 86:    LDC  3,1(6)	Load integer constant 
 87:     ST  3,-2(1)	Store variable a
* EXPRESSION
 88:    LDC  3,2(6)	Load integer constant 
 89:     ST  3,-3(1)	Store variable b
* EXPRESSION
 90:    LDC  3,3(6)	Load integer constant 
 91:     ST  3,-4(1)	Store variable x
* EXPRESSION
 92:    LDC  3,4(6)	Load integer constant 
 93:     ST  3,-1(0)	Store variable y
* EXPRESSION
 94:    LDC  3,5(6)	Load integer constant 
 95:     ST  3,-2(0)	Store variable z
* END COMPOUND
* Add standard closing in case there is no return statement
 96:    LDC  2,0(6)	Set return value to 0 
 97:     LD  3,-1(1)	Load return address 
 98:     LD  1,0(1)	Adjust fp 
 99:    LDA  7,0(3)	Return 
* END FUNCTION agamemnon
* FUNCTION main
100:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
101:    LDC  3,6(6)	Load integer constant 
102:     ST  3,-2(1)	Store variable a
* EXPRESSION
103:    LDC  3,7(6)	Load integer constant 
104:     ST  3,-3(1)	Store variable b
* EXPRESSION
105:    LDC  3,8(6)	Load integer constant 
106:     ST  3,0(0)	Store variable x
* EXPRESSION
107:    LDC  3,9(6)	Load integer constant 
108:     ST  3,-1(0)	Store variable y
* EXPRESSION
109:    LDC  3,10(6)	Load integer constant 
110:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
111:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
112:     LD  3,-2(1)	Load variable a
113:     ST  3,-7(1)	Store parameter 
*                       Jump to output
114:    LDA  1,-5(1)	Load address of new frame 
115:    LDA  3,1(7)	Return address in ac 
116:    LDA  7,-111(7)	CALL output
117:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
118:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
119:     LD  3,-3(1)	Load variable b
120:     ST  3,-7(1)	Store parameter 
*                       Jump to output
121:    LDA  1,-5(1)	Load address of new frame 
122:    LDA  3,1(7)	Return address in ac 
123:    LDA  7,-118(7)	CALL output
124:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
125:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
126:     LD  3,0(0)	Load variable x
127:     ST  3,-7(1)	Store parameter 
*                       Jump to output
128:    LDA  1,-5(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-125(7)	CALL output
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
132:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
133:     LD  3,-1(0)	Load variable y
134:     ST  3,-7(1)	Store parameter 
*                       Jump to output
135:    LDA  1,-5(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-132(7)	CALL output
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
139:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
140:     LD  3,-4(1)	Load variable z
141:     ST  3,-7(1)	Store parameter 
*                       Jump to output
142:    LDA  1,-5(1)	Load address of new frame 
143:    LDA  3,1(7)	Return address in ac 
144:    LDA  7,-139(7)	CALL output
145:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* COMPOUND
* EXPRESSION
146:    LDC  3,666(6)	Load integer constant 
147:     ST  3,-5(1)	Store variable a
* EXPRESSION
148:    LDC  3,666(6)	Load integer constant 
149:     ST  3,-6(1)	Store variable b
* EXPRESSION
150:    LDC  3,666(6)	Load integer constant 
151:     ST  3,-7(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
152:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
153:     LD  3,-5(1)	Load variable a
154:     ST  3,-10(1)	Store parameter 
*                       Jump to output
155:    LDA  1,-8(1)	Load address of new frame 
156:    LDA  3,1(7)	Return address in ac 
157:    LDA  7,-152(7)	CALL output
158:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
159:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
160:     LD  3,-6(1)	Load variable b
161:     ST  3,-10(1)	Store parameter 
*                       Jump to output
162:    LDA  1,-8(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-159(7)	CALL output
165:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
166:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
167:     LD  3,0(0)	Load variable x
168:     ST  3,-10(1)	Store parameter 
*                       Jump to output
169:    LDA  1,-8(1)	Load address of new frame 
170:    LDA  3,1(7)	Return address in ac 
171:    LDA  7,-166(7)	CALL output
172:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
173:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
174:     LD  3,-1(0)	Load variable y
175:     ST  3,-10(1)	Store parameter 
*                       Jump to output
176:    LDA  1,-8(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
180:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
181:     LD  3,-7(1)	Load variable z
182:     ST  3,-10(1)	Store parameter 
*                       Jump to output
183:    LDA  1,-8(1)	Load address of new frame 
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-180(7)	CALL output
186:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
187:    LDC  3,11(6)	Load integer constant 
188:     ST  3,-5(1)	Store variable a
* EXPRESSION
189:    LDC  3,12(6)	Load integer constant 
190:     ST  3,-6(1)	Store variable b
* EXPRESSION
191:    LDC  3,13(6)	Load integer constant 
192:     ST  3,0(0)	Store variable x
* EXPRESSION
193:    LDC  3,14(6)	Load integer constant 
194:     ST  3,-1(0)	Store variable y
* EXPRESSION
195:    LDC  3,15(6)	Load integer constant 
196:     ST  3,-7(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
197:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
198:     LD  3,-5(1)	Load variable a
199:     ST  3,-10(1)	Store parameter 
*                       Jump to output
200:    LDA  1,-8(1)	Load address of new frame 
201:    LDA  3,1(7)	Return address in ac 
202:    LDA  7,-197(7)	CALL output
203:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
204:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
205:     LD  3,-6(1)	Load variable b
206:     ST  3,-10(1)	Store parameter 
*                       Jump to output
207:    LDA  1,-8(1)	Load address of new frame 
208:    LDA  3,1(7)	Return address in ac 
209:    LDA  7,-204(7)	CALL output
210:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
211:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
212:     LD  3,0(0)	Load variable x
213:     ST  3,-10(1)	Store parameter 
*                       Jump to output
214:    LDA  1,-8(1)	Load address of new frame 
215:    LDA  3,1(7)	Return address in ac 
216:    LDA  7,-211(7)	CALL output
217:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
218:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
219:     LD  3,-1(0)	Load variable y
220:     ST  3,-10(1)	Store parameter 
*                       Jump to output
221:    LDA  1,-8(1)	Load address of new frame 
222:    LDA  3,1(7)	Return address in ac 
223:    LDA  7,-218(7)	CALL output
224:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
225:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
226:     LD  3,-7(1)	Load variable z
227:     ST  3,-10(1)	Store parameter 
*                       Jump to output
228:    LDA  1,-8(1)	Load address of new frame 
229:    LDA  3,1(7)	Return address in ac 
230:    LDA  7,-225(7)	CALL output
231:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* COMPOUND
* EXPRESSION
*                       Begin call to  output
232:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
233:     LD  3,-5(1)	Load variable a
234:     ST  3,-10(1)	Store parameter 
*                       Jump to output
235:    LDA  1,-8(1)	Load address of new frame 
236:    LDA  3,1(7)	Return address in ac 
237:    LDA  7,-232(7)	CALL output
238:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
239:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
240:     LD  3,-6(1)	Load variable b
241:     ST  3,-10(1)	Store parameter 
*                       Jump to output
242:    LDA  1,-8(1)	Load address of new frame 
243:    LDA  3,1(7)	Return address in ac 
244:    LDA  7,-239(7)	CALL output
245:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
246:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
247:     LD  3,0(0)	Load variable x
248:     ST  3,-10(1)	Store parameter 
*                       Jump to output
249:    LDA  1,-8(1)	Load address of new frame 
250:    LDA  3,1(7)	Return address in ac 
251:    LDA  7,-246(7)	CALL output
252:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
253:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
254:     LD  3,-1(0)	Load variable y
255:     ST  3,-10(1)	Store parameter 
*                       Jump to output
256:    LDA  1,-8(1)	Load address of new frame 
257:    LDA  3,1(7)	Return address in ac 
258:    LDA  7,-253(7)	CALL output
259:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
260:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
261:     LD  3,-7(1)	Load variable z
262:     ST  3,-10(1)	Store parameter 
*                       Jump to output
263:    LDA  1,-8(1)	Load address of new frame 
264:    LDA  3,1(7)	Return address in ac 
265:    LDA  7,-260(7)	CALL output
266:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
267:    LDC  3,16(6)	Load integer constant 
268:     ST  3,-5(1)	Store variable a
* EXPRESSION
269:    LDC  3,17(6)	Load integer constant 
270:     ST  3,-6(1)	Store variable b
* EXPRESSION
271:    LDC  3,18(6)	Load integer constant 
272:     ST  3,0(0)	Store variable x
* EXPRESSION
273:    LDC  3,19(6)	Load integer constant 
274:     ST  3,-1(0)	Store variable y
* EXPRESSION
275:    LDC  3,20(6)	Load integer constant 
276:     ST  3,-7(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
277:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
278:     LD  3,-5(1)	Load variable a
279:     ST  3,-10(1)	Store parameter 
*                       Jump to output
280:    LDA  1,-8(1)	Load address of new frame 
281:    LDA  3,1(7)	Return address in ac 
282:    LDA  7,-277(7)	CALL output
283:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
284:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
285:     LD  3,-6(1)	Load variable b
286:     ST  3,-10(1)	Store parameter 
*                       Jump to output
287:    LDA  1,-8(1)	Load address of new frame 
288:    LDA  3,1(7)	Return address in ac 
289:    LDA  7,-284(7)	CALL output
290:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
291:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
292:     LD  3,0(0)	Load variable x
293:     ST  3,-10(1)	Store parameter 
*                       Jump to output
294:    LDA  1,-8(1)	Load address of new frame 
295:    LDA  3,1(7)	Return address in ac 
296:    LDA  7,-291(7)	CALL output
297:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
298:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
299:     LD  3,-1(0)	Load variable y
300:     ST  3,-10(1)	Store parameter 
*                       Jump to output
301:    LDA  1,-8(1)	Load address of new frame 
302:    LDA  3,1(7)	Return address in ac 
303:    LDA  7,-298(7)	CALL output
304:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
305:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
306:     LD  3,-7(1)	Load variable z
307:     ST  3,-10(1)	Store parameter 
*                       Jump to output
308:    LDA  1,-8(1)	Load address of new frame 
309:    LDA  3,1(7)	Return address in ac 
310:    LDA  7,-305(7)	CALL output
311:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* EXPRESSION
*                       Begin call to  output
312:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
313:     LD  3,-5(1)	Load variable a
314:     ST  3,-10(1)	Store parameter 
*                       Jump to output
315:    LDA  1,-8(1)	Load address of new frame 
316:    LDA  3,1(7)	Return address in ac 
317:    LDA  7,-312(7)	CALL output
318:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
319:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
320:     LD  3,-6(1)	Load variable b
321:     ST  3,-10(1)	Store parameter 
*                       Jump to output
322:    LDA  1,-8(1)	Load address of new frame 
323:    LDA  3,1(7)	Return address in ac 
324:    LDA  7,-319(7)	CALL output
325:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
326:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
327:     LD  3,0(0)	Load variable x
328:     ST  3,-10(1)	Store parameter 
*                       Jump to output
329:    LDA  1,-8(1)	Load address of new frame 
330:    LDA  3,1(7)	Return address in ac 
331:    LDA  7,-326(7)	CALL output
332:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
333:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
334:     LD  3,-1(0)	Load variable y
335:     ST  3,-10(1)	Store parameter 
*                       Jump to output
336:    LDA  1,-8(1)	Load address of new frame 
337:    LDA  3,1(7)	Return address in ac 
338:    LDA  7,-333(7)	CALL output
339:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
340:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
341:     LD  3,-7(1)	Load variable z
342:     ST  3,-10(1)	Store parameter 
*                       Jump to output
343:    LDA  1,-8(1)	Load address of new frame 
344:    LDA  3,1(7)	Return address in ac 
345:    LDA  7,-340(7)	CALL output
346:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  agamemnon
347:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to agamemnon
348:    LDA  1,-8(1)	Load address of new frame 
349:    LDA  3,1(7)	Return address in ac 
350:    LDA  7,-309(7)	CALL agamemnon
351:    LDA  3,0(2)	Save the result in ac 
*                       End call to agamemnon
* EXPRESSION
*                       Begin call to  output
352:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
353:     LD  3,-5(1)	Load variable a
354:     ST  3,-10(1)	Store parameter 
*                       Jump to output
355:    LDA  1,-8(1)	Load address of new frame 
356:    LDA  3,1(7)	Return address in ac 
357:    LDA  7,-352(7)	CALL output
358:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
359:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
360:     LD  3,-6(1)	Load variable b
361:     ST  3,-10(1)	Store parameter 
*                       Jump to output
362:    LDA  1,-8(1)	Load address of new frame 
363:    LDA  3,1(7)	Return address in ac 
364:    LDA  7,-359(7)	CALL output
365:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
366:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
367:     LD  3,0(0)	Load variable x
368:     ST  3,-10(1)	Store parameter 
*                       Jump to output
369:    LDA  1,-8(1)	Load address of new frame 
370:    LDA  3,1(7)	Return address in ac 
371:    LDA  7,-366(7)	CALL output
372:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
373:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
374:     LD  3,-1(0)	Load variable y
375:     ST  3,-10(1)	Store parameter 
*                       Jump to output
376:    LDA  1,-8(1)	Load address of new frame 
377:    LDA  3,1(7)	Return address in ac 
378:    LDA  7,-373(7)	CALL output
379:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
380:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
381:     LD  3,-7(1)	Load variable z
382:     ST  3,-10(1)	Store parameter 
*                       Jump to output
383:    LDA  1,-8(1)	Load address of new frame 
384:    LDA  3,1(7)	Return address in ac 
385:    LDA  7,-380(7)	CALL output
386:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
387:    LDC  2,0(6)	Set return value to 0 
388:     LD  3,-1(1)	Load return address 
389:     LD  1,0(1)	Adjust fp 
390:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,390(7)	Jump to init [backpatch] 
* INIT
391:     LD  0,0(0)	Set the global pointer 
392:    LDA  1,-3(0)	set first frame at end of globals 
393:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
394:    LDA  3,1(7)	Return address in ac 
395:    LDA  7,-296(7)	Jump to main 
396:   HALT  0,0,0	DONE! 
* END INIT
