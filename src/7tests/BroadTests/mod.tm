* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  mod.c-
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
*                       Begin call to  output
 43:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,10(6)	Load integer constant 
 45:     ST  3,-4(1)	Save left side 
 46:    LDC  3,1(6)	Load integer constant 
 47:     LD  4,-4(1)	Load left into ac1 
 48:    DIV  5,4,3	Op % 
 49:    MUL  5,5,3	 
 50:    SUB  3,4,5	 
 51:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 52:    LDA  1,-2(1)	Load address of new frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    LDA  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 56:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 57:    LDC  3,10(6)	Load integer constant 
 58:     ST  3,-4(1)	Save left side 
 59:    LDC  3,2(6)	Load integer constant 
 60:     LD  4,-4(1)	Load left into ac1 
 61:    DIV  5,4,3	Op % 
 62:    MUL  5,5,3	 
 63:    SUB  3,4,5	 
 64:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 65:    LDA  1,-2(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 70:    LDC  3,10(6)	Load integer constant 
 71:     ST  3,-4(1)	Save left side 
 72:    LDC  3,3(6)	Load integer constant 
 73:     LD  4,-4(1)	Load left into ac1 
 74:    DIV  5,4,3	Op % 
 75:    MUL  5,5,3	 
 76:    SUB  3,4,5	 
 77:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 78:    LDA  1,-2(1)	Load address of new frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    LDA  7,-75(7)	CALL output
 81:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 82:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 83:    LDC  3,10(6)	Load integer constant 
 84:     ST  3,-4(1)	Save left side 
 85:    LDC  3,4(6)	Load integer constant 
 86:     LD  4,-4(1)	Load left into ac1 
 87:    DIV  5,4,3	Op % 
 88:    MUL  5,5,3	 
 89:    SUB  3,4,5	 
 90:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 91:    LDA  1,-2(1)	Load address of new frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-88(7)	CALL output
 94:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 95:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 96:    LDC  3,10(6)	Load integer constant 
 97:     ST  3,-4(1)	Save left side 
 98:    LDC  3,5(6)	Load integer constant 
 99:     LD  4,-4(1)	Load left into ac1 
100:    DIV  5,4,3	Op % 
101:    MUL  5,5,3	 
102:    SUB  3,4,5	 
103:     ST  3,-4(1)	Store parameter 
*                       Jump to output
104:    LDA  1,-2(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-101(7)	CALL output
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
108:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
109:    LDA  1,-2(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-75(7)	CALL outnl
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
113:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
114:    LDC  3,10(6)	Load integer constant 
115:     ST  3,-4(1)	Save left side 
116:    LDC  3,10(6)	Load integer constant 
117:     LD  4,-4(1)	Load left into ac1 
118:    DIV  5,4,3	Op % 
119:    MUL  5,5,3	 
120:    SUB  3,4,5	 
121:     ST  3,-4(1)	Store parameter 
*                       Jump to output
122:    LDA  1,-2(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
126:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
127:    LDC  3,10(6)	Load integer constant 
128:     ST  3,-4(1)	Save left side 
129:    LDC  3,11(6)	Load integer constant 
130:     LD  4,-4(1)	Load left into ac1 
131:    DIV  5,4,3	Op % 
132:    MUL  5,5,3	 
133:    SUB  3,4,5	 
134:     ST  3,-4(1)	Store parameter 
*                       Jump to output
135:    LDA  1,-2(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-132(7)	CALL output
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
139:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
140:    LDA  1,-2(1)	Load address of new frame 
141:    LDA  3,1(7)	Return address in ac 
142:    LDA  7,-106(7)	CALL outnl
143:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
144:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
145:    LDC  3,0(6)	Load integer constant 
146:     ST  3,-4(1)	Save left side 
147:    LDC  3,1(6)	Load integer constant 
148:     LD  4,-4(1)	Load left into ac1 
149:    DIV  5,4,3	Op % 
150:    MUL  5,5,3	 
151:    SUB  3,4,5	 
152:     ST  3,-4(1)	Store parameter 
*                       Jump to output
153:    LDA  1,-2(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-150(7)	CALL output
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
157:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
158:    LDA  1,-2(1)	Load address of new frame 
159:    LDA  3,1(7)	Return address in ac 
160:    LDA  7,-124(7)	CALL outnl
161:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
162:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
163:    LDC  3,10(6)	Load integer constant 
164:    LDC  4,0(6)	Load 0 
165:    SUB  3,4,3	Op unary - 
166:     ST  3,-4(1)	Save left side 
167:    LDC  3,1(6)	Load integer constant 
168:     LD  4,-4(1)	Load left into ac1 
169:    DIV  5,4,3	Op % 
170:    MUL  5,5,3	 
171:    SUB  3,4,5	 
172:     ST  3,-4(1)	Store parameter 
*                       Jump to output
173:    LDA  1,-2(1)	Load address of new frame 
174:    LDA  3,1(7)	Return address in ac 
175:    LDA  7,-170(7)	CALL output
176:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
177:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
178:    LDC  3,10(6)	Load integer constant 
179:    LDC  4,0(6)	Load 0 
180:    SUB  3,4,3	Op unary - 
181:     ST  3,-4(1)	Save left side 
182:    LDC  3,2(6)	Load integer constant 
183:     LD  4,-4(1)	Load left into ac1 
184:    DIV  5,4,3	Op % 
185:    MUL  5,5,3	 
186:    SUB  3,4,5	 
187:     ST  3,-4(1)	Store parameter 
*                       Jump to output
188:    LDA  1,-2(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-185(7)	CALL output
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
192:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
193:    LDC  3,10(6)	Load integer constant 
194:    LDC  4,0(6)	Load 0 
195:    SUB  3,4,3	Op unary - 
196:     ST  3,-4(1)	Save left side 
197:    LDC  3,3(6)	Load integer constant 
198:     LD  4,-4(1)	Load left into ac1 
199:    DIV  5,4,3	Op % 
200:    MUL  5,5,3	 
201:    SUB  3,4,5	 
202:     ST  3,-4(1)	Store parameter 
*                       Jump to output
203:    LDA  1,-2(1)	Load address of new frame 
204:    LDA  3,1(7)	Return address in ac 
205:    LDA  7,-200(7)	CALL output
206:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
207:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
208:    LDC  3,10(6)	Load integer constant 
209:    LDC  4,0(6)	Load 0 
210:    SUB  3,4,3	Op unary - 
211:     ST  3,-4(1)	Save left side 
212:    LDC  3,4(6)	Load integer constant 
213:     LD  4,-4(1)	Load left into ac1 
214:    DIV  5,4,3	Op % 
215:    MUL  5,5,3	 
216:    SUB  3,4,5	 
217:     ST  3,-4(1)	Store parameter 
*                       Jump to output
218:    LDA  1,-2(1)	Load address of new frame 
219:    LDA  3,1(7)	Return address in ac 
220:    LDA  7,-215(7)	CALL output
221:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
222:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
223:    LDC  3,10(6)	Load integer constant 
224:    LDC  4,0(6)	Load 0 
225:    SUB  3,4,3	Op unary - 
226:     ST  3,-4(1)	Save left side 
227:    LDC  3,5(6)	Load integer constant 
228:     LD  4,-4(1)	Load left into ac1 
229:    DIV  5,4,3	Op % 
230:    MUL  5,5,3	 
231:    SUB  3,4,5	 
232:     ST  3,-4(1)	Store parameter 
*                       Jump to output
233:    LDA  1,-2(1)	Load address of new frame 
234:    LDA  3,1(7)	Return address in ac 
235:    LDA  7,-230(7)	CALL output
236:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
237:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
238:    LDA  1,-2(1)	Load address of new frame 
239:    LDA  3,1(7)	Return address in ac 
240:    LDA  7,-204(7)	CALL outnl
241:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
242:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
243:    LDC  3,10(6)	Load integer constant 
244:    LDC  4,0(6)	Load 0 
245:    SUB  3,4,3	Op unary - 
246:     ST  3,-4(1)	Save left side 
247:    LDC  3,10(6)	Load integer constant 
248:     LD  4,-4(1)	Load left into ac1 
249:    DIV  5,4,3	Op % 
250:    MUL  5,5,3	 
251:    SUB  3,4,5	 
252:     ST  3,-4(1)	Store parameter 
*                       Jump to output
253:    LDA  1,-2(1)	Load address of new frame 
254:    LDA  3,1(7)	Return address in ac 
255:    LDA  7,-250(7)	CALL output
256:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
257:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
258:    LDC  3,10(6)	Load integer constant 
259:    LDC  4,0(6)	Load 0 
260:    SUB  3,4,3	Op unary - 
261:     ST  3,-4(1)	Save left side 
262:    LDC  3,11(6)	Load integer constant 
263:     LD  4,-4(1)	Load left into ac1 
264:    DIV  5,4,3	Op % 
265:    MUL  5,5,3	 
266:    SUB  3,4,5	 
267:     ST  3,-4(1)	Store parameter 
*                       Jump to output
268:    LDA  1,-2(1)	Load address of new frame 
269:    LDA  3,1(7)	Return address in ac 
270:    LDA  7,-265(7)	CALL output
271:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
272:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
273:    LDA  1,-2(1)	Load address of new frame 
274:    LDA  3,1(7)	Return address in ac 
275:    LDA  7,-239(7)	CALL outnl
276:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
277:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
278:    LDC  3,331(6)	Load integer constant 
279:     ST  3,-4(1)	Save left side 
280:    LDC  3,31(6)	Load integer constant 
281:     LD  4,-4(1)	Load left into ac1 
282:    DIV  5,4,3	Op % 
283:    MUL  5,5,3	 
284:    SUB  3,4,5	 
285:     ST  3,-4(1)	Store parameter 
*                       Jump to output
286:    LDA  1,-2(1)	Load address of new frame 
287:    LDA  3,1(7)	Return address in ac 
288:    LDA  7,-283(7)	CALL output
289:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
290:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
291:    LDC  3,331(6)	Load integer constant 
292:     ST  3,-4(1)	Save left side 
293:    LDC  3,31(6)	Load integer constant 
294:    LDC  4,0(6)	Load 0 
295:    SUB  3,4,3	Op unary - 
296:     LD  4,-4(1)	Load left into ac1 
297:    DIV  5,4,3	Op % 
298:    MUL  5,5,3	 
299:    SUB  3,4,5	 
300:     ST  3,-4(1)	Store parameter 
*                       Jump to output
301:    LDA  1,-2(1)	Load address of new frame 
302:    LDA  3,1(7)	Return address in ac 
303:    LDA  7,-298(7)	CALL output
304:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
305:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
306:    LDC  3,331(6)	Load integer constant 
307:    LDC  4,0(6)	Load 0 
308:    SUB  3,4,3	Op unary - 
309:     ST  3,-4(1)	Save left side 
310:    LDC  3,31(6)	Load integer constant 
311:     LD  4,-4(1)	Load left into ac1 
312:    DIV  5,4,3	Op % 
313:    MUL  5,5,3	 
314:    SUB  3,4,5	 
315:     ST  3,-4(1)	Store parameter 
*                       Jump to output
316:    LDA  1,-2(1)	Load address of new frame 
317:    LDA  3,1(7)	Return address in ac 
318:    LDA  7,-313(7)	CALL output
319:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
320:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
321:    LDC  3,331(6)	Load integer constant 
322:    LDC  4,0(6)	Load 0 
323:    SUB  3,4,3	Op unary - 
324:     ST  3,-4(1)	Save left side 
325:    LDC  3,31(6)	Load integer constant 
326:    LDC  4,0(6)	Load 0 
327:    SUB  3,4,3	Op unary - 
328:     LD  4,-4(1)	Load left into ac1 
329:    DIV  5,4,3	Op % 
330:    MUL  5,5,3	 
331:    SUB  3,4,5	 
332:     ST  3,-4(1)	Store parameter 
*                       Jump to output
333:    LDA  1,-2(1)	Load address of new frame 
334:    LDA  3,1(7)	Return address in ac 
335:    LDA  7,-330(7)	CALL output
336:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
337:    LDC  2,0(6)	Set return value to 0 
338:     LD  3,-1(1)	Load return address 
339:     LD  1,0(1)	Adjust fp 
340:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,340(7)	Jump to init [backpatch] 
* INIT
341:     LD  0,0(0)	Set the global pointer 
342:    LDA  1,0(0)	set first frame at end of globals 
343:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
344:    LDA  3,1(7)	Return address in ac 
345:    LDA  7,-304(7)	Jump to main 
346:   HALT  0,0,0	DONE! 
* END INIT
