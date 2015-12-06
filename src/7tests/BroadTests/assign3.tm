* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  assign3.c-
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
 43:    LDC  3,8(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
 45:    LDC  3,7(6)	load size of array y
 46:     ST  3,-11(1)	save size of array y
* EXPRESSION
 47:    LDC  3,5(6)	Load integer constant 
 48:     ST  3,-19(1)	Save index 
 49:    LDC  3,111(6)	Load integer constant 
 50:     LD  4,-19(1)	Restore index 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     LD  4,0(5)	load lhs variable x
 54:    ADD  3,4,3	op += 
 55:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 56:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
 57:    LDC  3,5(6)	Load integer constant 
 58:    LDA  4,-3(1)	Load address of base of array x
 59:    SUB  3,4,3	Compute offset of value 
 60:     LD  3,0(3)	Load the value 
 61:     ST  3,-21(1)	Store parameter 
*                       Jump to output
 62:    LDA  1,-19(1)	Load address of new frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    LDA  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 66:    LDC  3,4(6)	Load integer constant 
 67:     ST  3,-19(1)	Save index 
 68:    LDC  3,222(6)	Load integer constant 
 69:     LD  4,-19(1)	Restore index 
 70:    LDA  5,-12(1)	Load address of base of array y
 71:    SUB  5,5,4	Compute offset of value 
 72:     LD  4,0(5)	load lhs variable y
 73:    ADD  3,4,3	op += 
 74:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 75:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
 76:    LDC  3,4(6)	Load integer constant 
 77:    LDA  4,-12(1)	Load address of base of array y
 78:    SUB  3,4,3	Compute offset of value 
 79:     LD  3,0(3)	Load the value 
 80:     ST  3,-21(1)	Store parameter 
*                       Jump to output
 81:    LDA  1,-19(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-78(7)	CALL output
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 85:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
 86:    LDA  1,-19(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-52(7)	CALL outnl
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 90:    LDC  3,5(6)	Load integer constant 
 91:     ST  3,-19(1)	Save index 
 92:    LDC  3,333(6)	Load integer constant 
 93:     LD  4,-19(1)	Restore index 
 94:    LDA  5,-1(0)	Load address of base of array gx
 95:    SUB  5,5,4	Compute offset of value 
 96:     LD  4,0(5)	load lhs variable gx
 97:    ADD  3,4,3	op += 
 98:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
 99:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
100:    LDC  3,5(6)	Load integer constant 
101:    LDA  4,-1(0)	Load address of base of array gx
102:    SUB  3,4,3	Compute offset of value 
103:     LD  3,0(3)	Load the value 
104:     ST  3,-21(1)	Store parameter 
*                       Jump to output
105:    LDA  1,-19(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-102(7)	CALL output
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
109:    LDC  3,4(6)	Load integer constant 
110:     ST  3,-19(1)	Save index 
111:    LDC  3,444(6)	Load integer constant 
112:     LD  4,-19(1)	Restore index 
113:    LDA  5,-9(0)	Load address of base of array gy
114:    SUB  5,5,4	Compute offset of value 
115:     LD  4,0(5)	load lhs variable gy
116:    ADD  3,4,3	op += 
117:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
118:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
119:    LDC  3,4(6)	Load integer constant 
120:    LDA  4,-9(0)	Load address of base of array gy
121:    SUB  3,4,3	Compute offset of value 
122:     LD  3,0(3)	Load the value 
123:     ST  3,-21(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-19(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
128:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
129:    LDA  1,-19(1)	Load address of new frame 
130:    LDA  3,1(7)	Return address in ac 
131:    LDA  7,-95(7)	CALL outnl
132:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
133:    LDC  3,5(6)	Load integer constant 
134:     ST  3,-19(1)	Save index 
135:    LDC  3,4(6)	Load integer constant 
136:    LDA  4,-12(1)	Load address of base of array y
137:    SUB  3,4,3	Compute offset of value 
138:     LD  3,0(3)	Load the value 
139:     LD  4,-19(1)	Restore index 
140:    LDA  5,-3(1)	Load address of base of array x
141:    SUB  5,5,4	Compute offset of value 
142:     LD  4,0(5)	load lhs variable x
143:    ADD  3,4,3	op += 
144:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
145:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
146:    LDC  3,5(6)	Load integer constant 
147:    LDA  4,-3(1)	Load address of base of array x
148:    SUB  3,4,3	Compute offset of value 
149:     LD  3,0(3)	Load the value 
150:     ST  3,-21(1)	Store parameter 
*                       Jump to output
151:    LDA  1,-19(1)	Load address of new frame 
152:    LDA  3,1(7)	Return address in ac 
153:    LDA  7,-148(7)	CALL output
154:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
155:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
156:    LDA  1,-19(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-122(7)	CALL outnl
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
160:    LDC  3,5(6)	Load integer constant 
161:     ST  3,-19(1)	Save index 
162:    LDC  3,4(6)	Load integer constant 
163:    LDA  4,-9(0)	Load address of base of array gy
164:    SUB  3,4,3	Compute offset of value 
165:     LD  3,0(3)	Load the value 
166:     LD  4,-19(1)	Restore index 
167:    LDA  5,-1(0)	Load address of base of array gx
168:    SUB  5,5,4	Compute offset of value 
169:     LD  4,0(5)	load lhs variable gx
170:    ADD  3,4,3	op += 
171:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
172:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
173:    LDC  3,5(6)	Load integer constant 
174:    LDA  4,-1(0)	Load address of base of array gx
175:    SUB  3,4,3	Compute offset of value 
176:     LD  3,0(3)	Load the value 
177:     ST  3,-21(1)	Store parameter 
*                       Jump to output
178:    LDA  1,-19(1)	Load address of new frame 
179:    LDA  3,1(7)	Return address in ac 
180:    LDA  7,-175(7)	CALL output
181:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
182:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
183:    LDA  1,-19(1)	Load address of new frame 
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-149(7)	CALL outnl
186:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
187:    LDC  3,5(6)	Load integer constant 
188:     ST  3,-19(1)	Save index 
189:    LDC  3,111(6)	Load integer constant 
190:     LD  4,-19(1)	Restore index 
191:    LDA  5,-3(1)	Load address of base of array x
192:    SUB  5,5,4	Compute offset of value 
193:     LD  4,0(5)	load lhs variable x
194:    SUB  3,4,3	op -= 
195:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
196:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
197:    LDC  3,5(6)	Load integer constant 
198:    LDA  4,-3(1)	Load address of base of array x
199:    SUB  3,4,3	Compute offset of value 
200:     LD  3,0(3)	Load the value 
201:     ST  3,-21(1)	Store parameter 
*                       Jump to output
202:    LDA  1,-19(1)	Load address of new frame 
203:    LDA  3,1(7)	Return address in ac 
204:    LDA  7,-199(7)	CALL output
205:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
206:    LDC  3,4(6)	Load integer constant 
207:     ST  3,-19(1)	Save index 
208:    LDC  3,222(6)	Load integer constant 
209:     LD  4,-19(1)	Restore index 
210:    LDA  5,-12(1)	Load address of base of array y
211:    SUB  5,5,4	Compute offset of value 
212:     LD  4,0(5)	load lhs variable y
213:    SUB  3,4,3	op -= 
214:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
215:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
216:    LDC  3,4(6)	Load integer constant 
217:    LDA  4,-12(1)	Load address of base of array y
218:    SUB  3,4,3	Compute offset of value 
219:     LD  3,0(3)	Load the value 
220:     ST  3,-21(1)	Store parameter 
*                       Jump to output
221:    LDA  1,-19(1)	Load address of new frame 
222:    LDA  3,1(7)	Return address in ac 
223:    LDA  7,-218(7)	CALL output
224:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
225:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
226:    LDA  1,-19(1)	Load address of new frame 
227:    LDA  3,1(7)	Return address in ac 
228:    LDA  7,-192(7)	CALL outnl
229:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
230:    LDC  3,5(6)	Load integer constant 
231:     ST  3,-19(1)	Save index 
232:    LDC  3,333(6)	Load integer constant 
233:     LD  4,-19(1)	Restore index 
234:    LDA  5,-1(0)	Load address of base of array gx
235:    SUB  5,5,4	Compute offset of value 
236:     LD  4,0(5)	load lhs variable gx
237:    SUB  3,4,3	op -= 
238:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
239:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
240:    LDC  3,5(6)	Load integer constant 
241:    LDA  4,-1(0)	Load address of base of array gx
242:    SUB  3,4,3	Compute offset of value 
243:     LD  3,0(3)	Load the value 
244:     ST  3,-21(1)	Store parameter 
*                       Jump to output
245:    LDA  1,-19(1)	Load address of new frame 
246:    LDA  3,1(7)	Return address in ac 
247:    LDA  7,-242(7)	CALL output
248:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
249:    LDC  3,4(6)	Load integer constant 
250:     ST  3,-19(1)	Save index 
251:    LDC  3,444(6)	Load integer constant 
252:     LD  4,-19(1)	Restore index 
253:    LDA  5,-9(0)	Load address of base of array gy
254:    SUB  5,5,4	Compute offset of value 
255:     LD  4,0(5)	load lhs variable gy
256:    SUB  3,4,3	op -= 
257:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
258:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
259:    LDC  3,4(6)	Load integer constant 
260:    LDA  4,-9(0)	Load address of base of array gy
261:    SUB  3,4,3	Compute offset of value 
262:     LD  3,0(3)	Load the value 
263:     ST  3,-21(1)	Store parameter 
*                       Jump to output
264:    LDA  1,-19(1)	Load address of new frame 
265:    LDA  3,1(7)	Return address in ac 
266:    LDA  7,-261(7)	CALL output
267:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
268:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
269:    LDA  1,-19(1)	Load address of new frame 
270:    LDA  3,1(7)	Return address in ac 
271:    LDA  7,-235(7)	CALL outnl
272:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
273:    LDC  3,5(6)	Load integer constant 
274:     ST  3,-19(1)	Save index 
275:    LDC  3,4(6)	Load integer constant 
276:    LDA  4,-12(1)	Load address of base of array y
277:    SUB  3,4,3	Compute offset of value 
278:     LD  3,0(3)	Load the value 
279:     LD  4,-19(1)	Restore index 
280:    LDA  5,-3(1)	Load address of base of array x
281:    SUB  5,5,4	Compute offset of value 
282:     LD  4,0(5)	load lhs variable x
283:    SUB  3,4,3	op -= 
284:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
285:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
286:    LDC  3,5(6)	Load integer constant 
287:    LDA  4,-3(1)	Load address of base of array x
288:    SUB  3,4,3	Compute offset of value 
289:     LD  3,0(3)	Load the value 
290:     ST  3,-21(1)	Store parameter 
*                       Jump to output
291:    LDA  1,-19(1)	Load address of new frame 
292:    LDA  3,1(7)	Return address in ac 
293:    LDA  7,-288(7)	CALL output
294:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
295:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
296:    LDA  1,-19(1)	Load address of new frame 
297:    LDA  3,1(7)	Return address in ac 
298:    LDA  7,-262(7)	CALL outnl
299:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
300:    LDC  3,5(6)	Load integer constant 
301:     ST  3,-19(1)	Save index 
302:    LDC  3,4(6)	Load integer constant 
303:    LDA  4,-9(0)	Load address of base of array gy
304:    SUB  3,4,3	Compute offset of value 
305:     LD  3,0(3)	Load the value 
306:     LD  4,-19(1)	Restore index 
307:    LDA  5,-1(0)	Load address of base of array gx
308:    SUB  5,5,4	Compute offset of value 
309:     LD  4,0(5)	load lhs variable gx
310:    SUB  3,4,3	op -= 
311:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
312:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Load param 1
313:    LDC  3,5(6)	Load integer constant 
314:    LDA  4,-1(0)	Load address of base of array gx
315:    SUB  3,4,3	Compute offset of value 
316:     LD  3,0(3)	Load the value 
317:     ST  3,-21(1)	Store parameter 
*                       Jump to output
318:    LDA  1,-19(1)	Load address of new frame 
319:    LDA  3,1(7)	Return address in ac 
320:    LDA  7,-315(7)	CALL output
321:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
322:     ST  1,-19(1)	Store old fp in ghost frame 
*                       Jump to outnl
323:    LDA  1,-19(1)	Load address of new frame 
324:    LDA  3,1(7)	Return address in ac 
325:    LDA  7,-289(7)	CALL outnl
326:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
327:     LD  3,-1(1)	Load return address 
328:     LD  1,0(1)	Adjust fp 
329:    LDA  7,0(3)	Return 
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
335:    LDA  1,-15(0)	set first frame at end of globals 
336:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
337:    LDC  3,7(6)	load size of array gx
338:     ST  3,0(0)	save size of array gx
339:    LDC  3,6(6)	load size of array gy
340:     ST  3,-8(0)	save size of array gy
* END INIT GLOBALS AND STATICS
341:    LDA  3,1(7)	Return address in ac 
342:    LDA  7,-301(7)	Jump to main 
343:   HALT  0,0,0	DONE! 
* END INIT
