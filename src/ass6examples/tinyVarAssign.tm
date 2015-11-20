* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyVarAssign.c-
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
* FUNCTION esperanza
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,10(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* EXPRESSION
 45:    LDC  3,444(6)	Load integer constant 
 46:     ST  3,0(0)	Store variable gx
* EXPRESSION
 47:    LDC  3,555(6)	Load integer constant 
 48:     ST  3,-4(1)	Store variable x
* EXPRESSION
 49:    LDC  3,666(6)	Load integer constant 
 50:     ST  3,-12(0)	Store variable sx
* EXPRESSION
 51:    LDC  3,9(6)	Load integer constant 
 52:     ST  3,-16(1)	Save index 
 53:    LDC  3,222(6)	Load integer constant 
 54:     LD  4,-16(1)	Restore index 
 55:    LDA  5,-2(0)	Load address of base of array gy
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 59:    LDC  3,9(6)	Load integer constant 
 60:    LDA  4,-2(0)	Load address of base of array gy
 61:    SUB  3,4,3	Compute offset of value 
 62:     LD  3,0(3)	Load the value 
 63:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 64:    LDA  1,-16(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 68:     LD  3,0(0)	Load variable gx
 69:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
 70:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 71:     LD  3,0(0)	Load variable gx
 72:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 73:    LDA  1,-16(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 77:    LDC  3,8(6)	Load integer constant 
 78:     ST  3,-16(1)	Save index 
 79:    LDC  3,9(6)	Load integer constant 
 80:    LDA  4,-2(0)	Load address of base of array gy
 81:    SUB  3,4,3	Compute offset of value 
 82:     LD  3,0(3)	Load the value 
 83:     LD  4,-16(1)	Restore index 
 84:    LDA  5,-2(0)	Load address of base of array gy
 85:    SUB  5,5,4	Compute offset of value 
 86:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDC  3,8(6)	Load integer constant 
 89:    LDA  4,-2(0)	Load address of base of array gy
 90:    SUB  3,4,3	Compute offset of value 
 91:     LD  3,0(3)	Load the value 
 92:     ST  3,-18(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-16(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 97:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
 98:    LDA  1,-16(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-64(7)	CALL outnl
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
102:    LDC  3,9(6)	Load integer constant 
103:     ST  3,-16(1)	Save index 
104:    LDC  3,333(6)	Load integer constant 
105:     LD  4,-16(1)	Restore index 
106:    LDA  5,-6(1)	Load address of base of array y
107:    SUB  5,5,4	Compute offset of value 
108:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
109:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
110:    LDC  3,9(6)	Load integer constant 
111:    LDA  4,-6(1)	Load address of base of array y
112:    SUB  3,4,3	Compute offset of value 
113:     LD  3,0(3)	Load the value 
114:     ST  3,-18(1)	Store parameter 
*                       Jump to output
115:    LDA  1,-16(1)	Load address of new frame 
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-112(7)	CALL output
118:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
119:     LD  3,-4(1)	Load variable x
120:     ST  3,-4(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
121:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
122:     LD  3,-4(1)	Load variable x
123:     ST  3,-18(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-16(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
128:    LDC  3,7(6)	Load integer constant 
129:     ST  3,-16(1)	Save index 
130:    LDA  3,-6(1)	Load address of base of array y
131:     LD  3,1(3)	Load array size 
132:     LD  4,-16(1)	Restore index 
133:    LDA  5,-6(1)	Load address of base of array y
134:    SUB  5,5,4	Compute offset of value 
135:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
136:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
137:    LDC  3,7(6)	Load integer constant 
138:    LDA  4,-6(1)	Load address of base of array y
139:    SUB  3,4,3	Compute offset of value 
140:     LD  3,0(3)	Load the value 
141:     ST  3,-18(1)	Store parameter 
*                       Jump to output
142:    LDA  1,-16(1)	Load address of new frame 
143:    LDA  3,1(7)	Return address in ac 
144:    LDA  7,-139(7)	CALL output
145:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
146:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
147:    LDA  1,-16(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-113(7)	CALL outnl
150:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
151:     LD  3,-2(1)	Load variable px
152:     ST  3,-2(1)	Store variable px
* EXPRESSION
*                       Begin call to  output
153:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
154:     LD  3,-2(1)	Load variable px
155:     ST  3,-18(1)	Store parameter 
*                       Jump to output
156:    LDA  1,-16(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-153(7)	CALL output
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
160:    LDC  3,101(6)	Load integer constant 
161:     ST  3,-2(1)	Store variable px
* EXPRESSION
162:    LDC  3,8(6)	Load integer constant 
163:     ST  3,-16(1)	Save index 
164:    LDC  3,9(6)	Load integer constant 
165:     LD  4,-3(1)	Load address of base of array py
166:    SUB  3,4,3	Compute offset of value 
167:     LD  3,0(3)	Load the value 
168:     LD  4,-16(1)	Restore index 
169:     LD  5,-3(1)	Load address of base of array py
170:    SUB  5,5,4	Compute offset of value 
171:     ST  3,0(5)	Store variable py
* EXPRESSION
*                       Begin call to  output
172:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
173:    LDC  3,8(6)	Load integer constant 
174:     LD  4,-3(1)	Load address of base of array py
175:    SUB  3,4,3	Compute offset of value 
176:     LD  3,0(3)	Load the value 
177:     ST  3,-18(1)	Store parameter 
*                       Jump to output
178:    LDA  1,-16(1)	Load address of new frame 
179:    LDA  3,1(7)	Return address in ac 
180:    LDA  7,-175(7)	CALL output
181:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
182:    LDC  3,8(6)	Load integer constant 
183:     ST  3,-16(1)	Save index 
184:    LDC  3,102(6)	Load integer constant 
185:     LD  4,-16(1)	Restore index 
186:     LD  5,-3(1)	Load address of base of array py
187:    SUB  5,5,4	Compute offset of value 
188:     ST  3,0(5)	Store variable py
* EXPRESSION
189:    LDC  3,7(6)	Load integer constant 
190:     ST  3,-16(1)	Save index 
191:     LD  3,-3(1)	Load address of base of array py
192:     LD  3,1(3)	Load array size 
193:     LD  4,-16(1)	Restore index 
194:     LD  5,-3(1)	Load address of base of array py
195:    SUB  5,5,4	Compute offset of value 
196:     ST  3,0(5)	Store variable py
* EXPRESSION
*                       Begin call to  output
197:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
198:    LDC  3,7(6)	Load integer constant 
199:     LD  4,-3(1)	Load address of base of array py
200:    SUB  3,4,3	Compute offset of value 
201:     LD  3,0(3)	Load the value 
202:     ST  3,-18(1)	Store parameter 
*                       Jump to output
203:    LDA  1,-16(1)	Load address of new frame 
204:    LDA  3,1(7)	Return address in ac 
205:    LDA  7,-200(7)	CALL output
206:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
207:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
208:    LDA  1,-16(1)	Load address of new frame 
209:    LDA  3,1(7)	Return address in ac 
210:    LDA  7,-174(7)	CALL outnl
211:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
212:    LDC  3,9(6)	Load integer constant 
213:     ST  3,-16(1)	Save index 
214:    LDC  3,444(6)	Load integer constant 
215:     LD  4,-16(1)	Restore index 
216:    LDA  5,-14(0)	Load address of base of array sy
217:    SUB  5,5,4	Compute offset of value 
218:     ST  3,0(5)	Store variable sy
* EXPRESSION
*                       Begin call to  output
219:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
220:    LDC  3,9(6)	Load integer constant 
221:    LDA  4,-14(0)	Load address of base of array sy
222:    SUB  3,4,3	Compute offset of value 
223:     LD  3,0(3)	Load the value 
224:     ST  3,-18(1)	Store parameter 
*                       Jump to output
225:    LDA  1,-16(1)	Load address of new frame 
226:    LDA  3,1(7)	Return address in ac 
227:    LDA  7,-222(7)	CALL output
228:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
229:     LD  3,-12(0)	Load variable sx
230:     ST  3,-12(0)	Store variable sx
* EXPRESSION
*                       Begin call to  output
231:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
232:     LD  3,-12(0)	Load variable sx
233:     ST  3,-18(1)	Store parameter 
*                       Jump to output
234:    LDA  1,-16(1)	Load address of new frame 
235:    LDA  3,1(7)	Return address in ac 
236:    LDA  7,-231(7)	CALL output
237:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
238:    LDC  3,7(6)	Load integer constant 
239:     ST  3,-16(1)	Save index 
240:    LDA  3,-14(0)	Load address of base of array sy
241:     LD  3,1(3)	Load array size 
242:     LD  4,-16(1)	Restore index 
243:    LDA  5,-14(0)	Load address of base of array sy
244:    SUB  5,5,4	Compute offset of value 
245:     ST  3,0(5)	Store variable sy
* EXPRESSION
*                       Begin call to  output
246:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Load param 1
247:    LDC  3,7(6)	Load integer constant 
248:    LDA  4,-14(0)	Load address of base of array sy
249:    SUB  3,4,3	Compute offset of value 
250:     LD  3,0(3)	Load the value 
251:     ST  3,-18(1)	Store parameter 
*                       Jump to output
252:    LDA  1,-16(1)	Load address of new frame 
253:    LDA  3,1(7)	Return address in ac 
254:    LDA  7,-249(7)	CALL output
255:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
256:     ST  1,-16(1)	Store old fp in ghost frame 
*                       Jump to outnl
257:    LDA  1,-16(1)	Load address of new frame 
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-223(7)	CALL outnl
260:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
261:    LDC  2,0(6)	Set return value to 0 
262:     LD  3,-1(1)	Load return address 
263:     LD  1,0(1)	Adjust fp 
264:    LDA  7,0(3)	Return 
* END FUNCTION esperanza
* FUNCTION main
265:     ST  3,-1(1)	Store return address. 
* COMPOUND
266:    LDC  3,10(6)	load size of array zy
267:     ST  3,-3(1)	save size of array zy
* EXPRESSION
268:    LDC  3,999(6)	Load integer constant 
269:     ST  3,-2(1)	Store variable zx
* EXPRESSION
270:    LDC  3,9(6)	Load integer constant 
271:     ST  3,-14(1)	Save index 
272:    LDC  3,111(6)	Load integer constant 
273:     LD  4,-14(1)	Restore index 
274:    LDA  5,-4(1)	Load address of base of array zy
275:    SUB  5,5,4	Compute offset of value 
276:     ST  3,0(5)	Store variable zy
* EXPRESSION
*                       Begin call to  output
277:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
278:     LD  3,-2(1)	Load variable zx
279:     ST  3,-16(1)	Store parameter 
*                       Jump to output
280:    LDA  1,-14(1)	Load address of new frame 
281:    LDA  3,1(7)	Return address in ac 
282:    LDA  7,-277(7)	CALL output
283:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
284:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
285:    LDC  3,9(6)	Load integer constant 
286:    LDA  4,-4(1)	Load address of base of array zy
287:    SUB  3,4,3	Compute offset of value 
288:     LD  3,0(3)	Load the value 
289:     ST  3,-16(1)	Store parameter 
*                       Jump to output
290:    LDA  1,-14(1)	Load address of new frame 
291:    LDA  3,1(7)	Return address in ac 
292:    LDA  7,-287(7)	CALL output
293:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
294:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
295:    LDA  1,-14(1)	Load address of new frame 
296:    LDA  3,1(7)	Return address in ac 
297:    LDA  7,-261(7)	CALL outnl
298:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  esperanza
299:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
300:     LD  3,-2(1)	Load variable zx
301:     ST  3,-16(1)	Store parameter 
*                       Load param 2
302:    LDA  3,-4(1)	Load address of base of array zy
303:     ST  3,-17(1)	Store parameter 
*                       Jump to esperanza
304:    LDA  1,-14(1)	Load address of new frame 
305:    LDA  3,1(7)	Return address in ac 
306:    LDA  7,-265(7)	CALL esperanza
307:    LDA  3,0(2)	Save the result in ac 
*                       End call to esperanza
* EXPRESSION
*                       Begin call to  output
308:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
309:     LD  3,-2(1)	Load variable zx
310:     ST  3,-16(1)	Store parameter 
*                       Jump to output
311:    LDA  1,-14(1)	Load address of new frame 
312:    LDA  3,1(7)	Return address in ac 
313:    LDA  7,-308(7)	CALL output
314:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
315:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
316:    LDC  3,9(6)	Load integer constant 
317:    LDA  4,-4(1)	Load address of base of array zy
318:    SUB  3,4,3	Compute offset of value 
319:     LD  3,0(3)	Load the value 
320:     ST  3,-16(1)	Store parameter 
*                       Jump to output
321:    LDA  1,-14(1)	Load address of new frame 
322:    LDA  3,1(7)	Return address in ac 
323:    LDA  7,-318(7)	CALL output
324:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
325:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
326:    LDA  1,-14(1)	Load address of new frame 
327:    LDA  3,1(7)	Return address in ac 
328:    LDA  7,-292(7)	CALL outnl
329:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
330:    LDC  2,0(6)	Set return value to 0 
331:     LD  3,-1(1)	Load return address 
332:     LD  1,0(1)	Adjust fp 
333:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,333(7)	Jump to init [backpatch] 
* INIT
334:     LD  0,0(0)	Set the global pointer 
335:    LDA  1,-24(0)	set first frame at end of globals 
336:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
337:    LDC  3,10(6)	load size of array gy
338:     ST  3,-1(0)	save size of array gy
339:    LDC  3,10(6)	load size of array sy-2
340:     ST  3,-13(0)	save size of array sy-2
* END INIT GLOBALS AND STATICS
341:    LDA  3,1(7)	Return address in ac 
342:    LDA  7,-78(7)	Jump to main 
343:   HALT  0,0,0	DONE! 
* END INIT
