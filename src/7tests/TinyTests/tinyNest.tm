* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyNest.c-
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
*                       Begin call to  outnl
 86:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 87:    LDA  1,-5(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-53(7)	CALL outnl
 90:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 91:    LDC  3,1(6)	Load integer constant 
 92:     ST  3,-2(1)	Store variable a
* EXPRESSION
 93:    LDC  3,2(6)	Load integer constant 
 94:     ST  3,-3(1)	Store variable b
* EXPRESSION
 95:    LDC  3,3(6)	Load integer constant 
 96:     ST  3,-4(1)	Store variable x
* EXPRESSION
 97:    LDC  3,4(6)	Load integer constant 
 98:     ST  3,-1(0)	Store variable y
* EXPRESSION
 99:    LDC  3,5(6)	Load integer constant 
100:     ST  3,-2(0)	Store variable z
* END COMPOUND
* Add standard closing in case there is no return statement
101:    LDC  2,0(6)	Set return value to 0 
102:     LD  3,-1(1)	Load return address 
103:     LD  1,0(1)	Adjust fp 
104:    LDA  7,0(3)	Return 
* END FUNCTION agamemnon
* FUNCTION main
105:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
106:    LDC  3,6(6)	Load integer constant 
107:     ST  3,-2(1)	Store variable a
* EXPRESSION
108:    LDC  3,7(6)	Load integer constant 
109:     ST  3,-3(1)	Store variable b
* EXPRESSION
110:    LDC  3,8(6)	Load integer constant 
111:     ST  3,0(0)	Store variable x
* EXPRESSION
112:    LDC  3,9(6)	Load integer constant 
113:     ST  3,-1(0)	Store variable y
* EXPRESSION
114:    LDC  3,10(6)	Load integer constant 
115:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
116:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
117:     LD  3,-2(1)	Load variable a
118:     ST  3,-7(1)	Store parameter 
*                       Jump to output
119:    LDA  1,-5(1)	Load address of new frame 
120:    LDA  3,1(7)	Return address in ac 
121:    LDA  7,-116(7)	CALL output
122:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
123:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
124:     LD  3,-3(1)	Load variable b
125:     ST  3,-7(1)	Store parameter 
*                       Jump to output
126:    LDA  1,-5(1)	Load address of new frame 
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-123(7)	CALL output
129:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
130:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
131:     LD  3,0(0)	Load variable x
132:     ST  3,-7(1)	Store parameter 
*                       Jump to output
133:    LDA  1,-5(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
137:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
138:     LD  3,-1(0)	Load variable y
139:     ST  3,-7(1)	Store parameter 
*                       Jump to output
140:    LDA  1,-5(1)	Load address of new frame 
141:    LDA  3,1(7)	Return address in ac 
142:    LDA  7,-137(7)	CALL output
143:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
144:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
145:     LD  3,-4(1)	Load variable z
146:     ST  3,-7(1)	Store parameter 
*                       Jump to output
147:    LDA  1,-5(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
151:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
152:    LDA  1,-5(1)	Load address of new frame 
153:    LDA  3,1(7)	Return address in ac 
154:    LDA  7,-118(7)	CALL outnl
155:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* COMPOUND
* EXPRESSION
156:    LDC  3,666(6)	Load integer constant 
157:     ST  3,-5(1)	Store variable a
* EXPRESSION
158:    LDC  3,666(6)	Load integer constant 
159:     ST  3,-6(1)	Store variable b
* EXPRESSION
160:    LDC  3,666(6)	Load integer constant 
161:     ST  3,-7(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
162:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
163:     LD  3,-5(1)	Load variable a
164:     ST  3,-10(1)	Store parameter 
*                       Jump to output
165:    LDA  1,-8(1)	Load address of new frame 
166:    LDA  3,1(7)	Return address in ac 
167:    LDA  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
169:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
170:     LD  3,-6(1)	Load variable b
171:     ST  3,-10(1)	Store parameter 
*                       Jump to output
172:    LDA  1,-8(1)	Load address of new frame 
173:    LDA  3,1(7)	Return address in ac 
174:    LDA  7,-169(7)	CALL output
175:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
176:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
177:     LD  3,0(0)	Load variable x
178:     ST  3,-10(1)	Store parameter 
*                       Jump to output
179:    LDA  1,-8(1)	Load address of new frame 
180:    LDA  3,1(7)	Return address in ac 
181:    LDA  7,-176(7)	CALL output
182:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
183:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
184:     LD  3,-1(0)	Load variable y
185:     ST  3,-10(1)	Store parameter 
*                       Jump to output
186:    LDA  1,-8(1)	Load address of new frame 
187:    LDA  3,1(7)	Return address in ac 
188:    LDA  7,-183(7)	CALL output
189:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
190:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
191:     LD  3,-7(1)	Load variable z
192:     ST  3,-10(1)	Store parameter 
*                       Jump to output
193:    LDA  1,-8(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-190(7)	CALL output
196:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
197:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
198:    LDA  1,-8(1)	Load address of new frame 
199:    LDA  3,1(7)	Return address in ac 
200:    LDA  7,-164(7)	CALL outnl
201:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
202:    LDC  3,11(6)	Load integer constant 
203:     ST  3,-5(1)	Store variable a
* EXPRESSION
204:    LDC  3,12(6)	Load integer constant 
205:     ST  3,-6(1)	Store variable b
* EXPRESSION
206:    LDC  3,13(6)	Load integer constant 
207:     ST  3,0(0)	Store variable x
* EXPRESSION
208:    LDC  3,14(6)	Load integer constant 
209:     ST  3,-1(0)	Store variable y
* EXPRESSION
210:    LDC  3,15(6)	Load integer constant 
211:     ST  3,-7(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
212:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
213:     LD  3,-5(1)	Load variable a
214:     ST  3,-10(1)	Store parameter 
*                       Jump to output
215:    LDA  1,-8(1)	Load address of new frame 
216:    LDA  3,1(7)	Return address in ac 
217:    LDA  7,-212(7)	CALL output
218:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
219:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
220:     LD  3,-6(1)	Load variable b
221:     ST  3,-10(1)	Store parameter 
*                       Jump to output
222:    LDA  1,-8(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-219(7)	CALL output
225:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
226:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
227:     LD  3,0(0)	Load variable x
228:     ST  3,-10(1)	Store parameter 
*                       Jump to output
229:    LDA  1,-8(1)	Load address of new frame 
230:    LDA  3,1(7)	Return address in ac 
231:    LDA  7,-226(7)	CALL output
232:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
233:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
234:     LD  3,-1(0)	Load variable y
235:     ST  3,-10(1)	Store parameter 
*                       Jump to output
236:    LDA  1,-8(1)	Load address of new frame 
237:    LDA  3,1(7)	Return address in ac 
238:    LDA  7,-233(7)	CALL output
239:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
240:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
241:     LD  3,-7(1)	Load variable z
242:     ST  3,-10(1)	Store parameter 
*                       Jump to output
243:    LDA  1,-8(1)	Load address of new frame 
244:    LDA  3,1(7)	Return address in ac 
245:    LDA  7,-240(7)	CALL output
246:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
247:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
248:    LDA  1,-8(1)	Load address of new frame 
249:    LDA  3,1(7)	Return address in ac 
250:    LDA  7,-214(7)	CALL outnl
251:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* COMPOUND
* EXPRESSION
*                       Begin call to  output
252:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
253:     LD  3,-5(1)	Load variable a
254:     ST  3,-10(1)	Store parameter 
*                       Jump to output
255:    LDA  1,-8(1)	Load address of new frame 
256:    LDA  3,1(7)	Return address in ac 
257:    LDA  7,-252(7)	CALL output
258:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
259:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
260:     LD  3,-6(1)	Load variable b
261:     ST  3,-10(1)	Store parameter 
*                       Jump to output
262:    LDA  1,-8(1)	Load address of new frame 
263:    LDA  3,1(7)	Return address in ac 
264:    LDA  7,-259(7)	CALL output
265:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
266:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
267:     LD  3,0(0)	Load variable x
268:     ST  3,-10(1)	Store parameter 
*                       Jump to output
269:    LDA  1,-8(1)	Load address of new frame 
270:    LDA  3,1(7)	Return address in ac 
271:    LDA  7,-266(7)	CALL output
272:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
273:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
274:     LD  3,-1(0)	Load variable y
275:     ST  3,-10(1)	Store parameter 
*                       Jump to output
276:    LDA  1,-8(1)	Load address of new frame 
277:    LDA  3,1(7)	Return address in ac 
278:    LDA  7,-273(7)	CALL output
279:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
280:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
281:     LD  3,-7(1)	Load variable z
282:     ST  3,-10(1)	Store parameter 
*                       Jump to output
283:    LDA  1,-8(1)	Load address of new frame 
284:    LDA  3,1(7)	Return address in ac 
285:    LDA  7,-280(7)	CALL output
286:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
287:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
288:    LDA  1,-8(1)	Load address of new frame 
289:    LDA  3,1(7)	Return address in ac 
290:    LDA  7,-254(7)	CALL outnl
291:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
292:    LDC  3,16(6)	Load integer constant 
293:     ST  3,-5(1)	Store variable a
* EXPRESSION
294:    LDC  3,17(6)	Load integer constant 
295:     ST  3,-6(1)	Store variable b
* EXPRESSION
296:    LDC  3,18(6)	Load integer constant 
297:     ST  3,0(0)	Store variable x
* EXPRESSION
298:    LDC  3,19(6)	Load integer constant 
299:     ST  3,-1(0)	Store variable y
* EXPRESSION
300:    LDC  3,20(6)	Load integer constant 
301:     ST  3,-7(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
302:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
303:     LD  3,-5(1)	Load variable a
304:     ST  3,-10(1)	Store parameter 
*                       Jump to output
305:    LDA  1,-8(1)	Load address of new frame 
306:    LDA  3,1(7)	Return address in ac 
307:    LDA  7,-302(7)	CALL output
308:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
309:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
310:     LD  3,-6(1)	Load variable b
311:     ST  3,-10(1)	Store parameter 
*                       Jump to output
312:    LDA  1,-8(1)	Load address of new frame 
313:    LDA  3,1(7)	Return address in ac 
314:    LDA  7,-309(7)	CALL output
315:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
316:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
317:     LD  3,0(0)	Load variable x
318:     ST  3,-10(1)	Store parameter 
*                       Jump to output
319:    LDA  1,-8(1)	Load address of new frame 
320:    LDA  3,1(7)	Return address in ac 
321:    LDA  7,-316(7)	CALL output
322:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
323:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
324:     LD  3,-1(0)	Load variable y
325:     ST  3,-10(1)	Store parameter 
*                       Jump to output
326:    LDA  1,-8(1)	Load address of new frame 
327:    LDA  3,1(7)	Return address in ac 
328:    LDA  7,-323(7)	CALL output
329:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
330:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
331:     LD  3,-7(1)	Load variable z
332:     ST  3,-10(1)	Store parameter 
*                       Jump to output
333:    LDA  1,-8(1)	Load address of new frame 
334:    LDA  3,1(7)	Return address in ac 
335:    LDA  7,-330(7)	CALL output
336:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
337:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
338:    LDA  1,-8(1)	Load address of new frame 
339:    LDA  3,1(7)	Return address in ac 
340:    LDA  7,-304(7)	CALL outnl
341:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* EXPRESSION
*                       Begin call to  output
342:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
343:     LD  3,-5(1)	Load variable a
344:     ST  3,-10(1)	Store parameter 
*                       Jump to output
345:    LDA  1,-8(1)	Load address of new frame 
346:    LDA  3,1(7)	Return address in ac 
347:    LDA  7,-342(7)	CALL output
348:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
349:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
350:     LD  3,-6(1)	Load variable b
351:     ST  3,-10(1)	Store parameter 
*                       Jump to output
352:    LDA  1,-8(1)	Load address of new frame 
353:    LDA  3,1(7)	Return address in ac 
354:    LDA  7,-349(7)	CALL output
355:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
356:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
357:     LD  3,0(0)	Load variable x
358:     ST  3,-10(1)	Store parameter 
*                       Jump to output
359:    LDA  1,-8(1)	Load address of new frame 
360:    LDA  3,1(7)	Return address in ac 
361:    LDA  7,-356(7)	CALL output
362:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
363:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
364:     LD  3,-1(0)	Load variable y
365:     ST  3,-10(1)	Store parameter 
*                       Jump to output
366:    LDA  1,-8(1)	Load address of new frame 
367:    LDA  3,1(7)	Return address in ac 
368:    LDA  7,-363(7)	CALL output
369:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
370:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
371:     LD  3,-7(1)	Load variable z
372:     ST  3,-10(1)	Store parameter 
*                       Jump to output
373:    LDA  1,-8(1)	Load address of new frame 
374:    LDA  3,1(7)	Return address in ac 
375:    LDA  7,-370(7)	CALL output
376:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
377:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
378:    LDA  1,-8(1)	Load address of new frame 
379:    LDA  3,1(7)	Return address in ac 
380:    LDA  7,-344(7)	CALL outnl
381:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  agamemnon
382:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to agamemnon
383:    LDA  1,-8(1)	Load address of new frame 
384:    LDA  3,1(7)	Return address in ac 
385:    LDA  7,-344(7)	CALL agamemnon
386:    LDA  3,0(2)	Save the result in ac 
*                       End call to agamemnon
* EXPRESSION
*                       Begin call to  output
387:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
388:     LD  3,-5(1)	Load variable a
389:     ST  3,-10(1)	Store parameter 
*                       Jump to output
390:    LDA  1,-8(1)	Load address of new frame 
391:    LDA  3,1(7)	Return address in ac 
392:    LDA  7,-387(7)	CALL output
393:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
394:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
395:     LD  3,-6(1)	Load variable b
396:     ST  3,-10(1)	Store parameter 
*                       Jump to output
397:    LDA  1,-8(1)	Load address of new frame 
398:    LDA  3,1(7)	Return address in ac 
399:    LDA  7,-394(7)	CALL output
400:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
401:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
402:     LD  3,0(0)	Load variable x
403:     ST  3,-10(1)	Store parameter 
*                       Jump to output
404:    LDA  1,-8(1)	Load address of new frame 
405:    LDA  3,1(7)	Return address in ac 
406:    LDA  7,-401(7)	CALL output
407:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
408:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
409:     LD  3,-1(0)	Load variable y
410:     ST  3,-10(1)	Store parameter 
*                       Jump to output
411:    LDA  1,-8(1)	Load address of new frame 
412:    LDA  3,1(7)	Return address in ac 
413:    LDA  7,-408(7)	CALL output
414:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
415:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
416:     LD  3,-7(1)	Load variable z
417:     ST  3,-10(1)	Store parameter 
*                       Jump to output
418:    LDA  1,-8(1)	Load address of new frame 
419:    LDA  3,1(7)	Return address in ac 
420:    LDA  7,-415(7)	CALL output
421:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
422:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
423:    LDA  1,-8(1)	Load address of new frame 
424:    LDA  3,1(7)	Return address in ac 
425:    LDA  7,-389(7)	CALL outnl
426:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
427:    LDC  2,0(6)	Set return value to 0 
428:     LD  3,-1(1)	Load return address 
429:     LD  1,0(1)	Adjust fp 
430:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,430(7)	Jump to init [backpatch] 
* INIT
431:     LD  0,0(0)	Set the global pointer 
432:    LDA  1,-3(0)	set first frame at end of globals 
433:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
434:    LDA  3,1(7)	Return address in ac 
435:    LDA  7,-331(7)	Jump to main 
436:   HALT  0,0,0	DONE! 
* END INIT
