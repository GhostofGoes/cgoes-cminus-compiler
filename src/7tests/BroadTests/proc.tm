* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  proc.c-
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
* FUNCTION square
 42:     ST  3,-1(1)	Store return address. 
* RETURN
 43:     LD  3,-2(1)	Load variable x
 44:     ST  3,-3(1)	Save left side 
 45:     LD  3,-2(1)	Load variable x
 46:     LD  4,-3(1)	Load left into ac1 
 47:    MUL  3,4,3	Op * 
 48:    LDA  2,0(3)	Copy result to rt register 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 52:    LDC  2,0(6)	Set return value to 0 
 53:     LD  3,-1(1)	Load return address 
 54:     LD  1,0(1)	Adjust fp 
 55:    LDA  7,0(3)	Return 
* END FUNCTION square
* FUNCTION max
 56:     ST  3,-1(1)	Store return address. 
* IF
 57:     LD  3,-2(1)	Load variable x
 58:     ST  3,-4(1)	Save left side 
 59:     LD  3,-3(1)	Load variable y
 60:     LD  4,-4(1)	Load left into ac1 
 61:    TGT  3,4,3	Op > 
* THEN
* RETURN
 63:     LD  3,-2(1)	Load variable x
 64:    LDA  2,0(3)	Copy result to rt register 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    LDA  7,0(3)	Return 
 62:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 69:     LD  3,-3(1)	Load variable y
 70:    LDA  2,0(3)	Copy result to rt register 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust fp 
 73:    LDA  7,0(3)	Return 
 68:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6)	Set return value to 0 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    LDA  7,0(3)	Return 
* END FUNCTION max
* FUNCTION toInt
 78:     ST  3,-1(1)	Store return address. 
* IF
 79:     LD  3,-2(1)	Load variable b
* THEN
* RETURN
 81:    LDC  3,1(6)	Load integer constant 
 82:    LDA  2,0(3)	Copy result to rt register 
 83:     LD  3,-1(1)	Load return address 
 84:     LD  1,0(1)	Adjust fp 
 85:    LDA  7,0(3)	Return 
 80:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 87:    LDC  3,0(6)	Load integer constant 
 88:    LDA  2,0(3)	Copy result to rt register 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    LDA  7,0(3)	Return 
 86:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* Add standard closing in case there is no return statement
 92:    LDC  2,0(6)	Set return value to 0 
 93:     LD  3,-1(1)	Load return address 
 94:     LD  1,0(1)	Adjust fp 
 95:    LDA  7,0(3)	Return 
* END FUNCTION toInt
* FUNCTION toBool
 96:     ST  3,-1(1)	Store return address. 
* IF
 97:     LD  3,-2(1)	Load variable x
 98:     ST  3,-3(1)	Save left side 
 99:    LDC  3,0(6)	Load integer constant 
100:     LD  4,-3(1)	Load left into ac1 
101:    TEQ  3,4,3	Op == 
* THEN
* RETURN
103:    LDC  3,0(6)	Load Boolean constant 
104:    LDA  2,0(3)	Copy result to rt register 
105:     LD  3,-1(1)	Load return address 
106:     LD  1,0(1)	Adjust fp 
107:    LDA  7,0(3)	Return 
102:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
109:    LDC  3,1(6)	Load Boolean constant 
110:    LDA  2,0(3)	Copy result to rt register 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    LDA  7,0(3)	Return 
108:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* Add standard closing in case there is no return statement
114:    LDC  2,0(6)	Set return value to 0 
115:     LD  3,-1(1)	Load return address 
116:     LD  1,0(1)	Adjust fp 
117:    LDA  7,0(3)	Return 
* END FUNCTION toBool
* FUNCTION main
118:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
119:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  square
120:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
121:    LDC  3,31(6)	Load integer constant 
122:     ST  3,-10(1)	Store parameter 
*                       Jump to square
123:    LDA  1,-8(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-84(7)	CALL square
126:    LDA  3,0(2)	Save the result in ac 
*                       End call to square
127:     ST  3,-8(1)	Store parameter 
*                       Jump to output
128:    LDA  1,-6(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-125(7)	CALL output
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
132:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
133:    LDA  1,-6(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-99(7)	CALL outnl
136:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
137:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  max
138:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
139:    LDC  3,131(6)	Load integer constant 
140:     ST  3,-10(1)	Store parameter 
*                       Load param 2
141:    LDC  3,42(6)	Load integer constant 
142:     ST  3,-11(1)	Store parameter 
*                       Jump to max
143:    LDA  1,-8(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-90(7)	CALL max
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to max
147:     ST  3,-8(1)	Store parameter 
*                       Jump to output
148:    LDA  1,-6(1)	Load address of new frame 
149:    LDA  3,1(7)	Return address in ac 
150:    LDA  7,-145(7)	CALL output
151:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
152:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
153:    LDA  1,-6(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-119(7)	CALL outnl
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  toBool
157:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
158:    LDC  3,42(6)	Load integer constant 
159:     ST  3,-8(1)	Store parameter 
*                       Jump to toBool
160:    LDA  1,-6(1)	Load address of new frame 
161:    LDA  3,1(7)	Return address in ac 
162:    LDA  7,-67(7)	CALL toBool
163:    LDA  3,0(2)	Save the result in ac 
*                       End call to toBool
164:     ST  3,-2(1)	Store variable a
* EXPRESSION
*                       Begin call to  toInt
165:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
166:    LDC  3,1(6)	Load Boolean constant 
167:     ST  3,-8(1)	Store parameter 
*                       Jump to toInt
168:    LDA  1,-6(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-93(7)	CALL toInt
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to toInt
172:     ST  3,-4(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
173:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
174:     LD  3,-4(1)	Load variable x
175:     ST  3,-8(1)	Store parameter 
*                       Jump to output
176:    LDA  1,-6(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
180:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
181:     LD  3,-2(1)	Load variable a
182:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
183:    LDA  1,-6(1)	Load address of new frame 
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-168(7)	CALL outputb
186:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* IF
187:    LDC  3,666(6)	Load integer constant 
188:     ST  3,-6(1)	Save left side 
189:    LDC  3,1(6)	Load integer constant 
190:     LD  4,-6(1)	Load left into ac1 
191:    ADD  3,4,3	Op + 
192:     ST  3,-6(1)	Save left side 
193:    LDC  3,13(6)	Load integer constant 
194:     LD  4,-6(1)	Load left into ac1 
195:    TGT  3,4,3	Op > 
196:    LDC  4,1(6)	Load 1 
197:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
199:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
200:    LDC  3,0(6)	Load integer constant 
201:     ST  3,-8(1)	Store parameter 
*                       Jump to output
202:    LDA  1,-6(1)	Load address of new frame 
203:    LDA  3,1(7)	Return address in ac 
204:    LDA  7,-199(7)	CALL output
205:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
198:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
207:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
208:    LDC  3,666(6)	Load integer constant 
209:     ST  3,-8(1)	Store parameter 
*                       Jump to output
210:    LDA  1,-6(1)	Load address of new frame 
211:    LDA  3,1(7)	Return address in ac 
212:    LDA  7,-207(7)	CALL output
213:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
206:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
214:    LDC  3,666(6)	Load integer constant 
215:    LDC  4,0(6)	Load 0 
216:    SUB  3,4,3	Op unary - 
217:     ST  3,-6(1)	Save left side 
218:    LDC  3,1(6)	Load integer constant 
219:     LD  4,-6(1)	Load left into ac1 
220:    ADD  3,4,3	Op + 
221:     ST  3,-6(1)	Save left side 
222:    LDC  3,13(6)	Load integer constant 
223:    LDC  4,0(6)	Load 0 
224:    SUB  3,4,3	Op unary - 
225:     LD  4,-6(1)	Load left into ac1 
226:    TGT  3,4,3	Op > 
227:    LDC  4,1(6)	Load 1 
228:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
230:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
231:    LDC  3,0(6)	Load integer constant 
232:     ST  3,-8(1)	Store parameter 
*                       Jump to output
233:    LDA  1,-6(1)	Load address of new frame 
234:    LDA  3,1(7)	Return address in ac 
235:    LDA  7,-230(7)	CALL output
236:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
229:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
238:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
239:    LDC  3,666(6)	Load integer constant 
240:     ST  3,-8(1)	Store parameter 
*                       Jump to output
241:    LDA  1,-6(1)	Load address of new frame 
242:    LDA  3,1(7)	Return address in ac 
243:    LDA  7,-238(7)	CALL output
244:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
237:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
245:    LDC  3,666(6)	Load integer constant 
246:    LDC  4,0(6)	Load 0 
247:    SUB  3,4,3	Op unary - 
248:     ST  3,-6(1)	Save left side 
249:    LDC  3,1(6)	Load integer constant 
250:     LD  4,-6(1)	Load left into ac1 
251:    ADD  3,4,3	Op + 
252:     ST  3,-6(1)	Save left side 
253:    LDC  3,13(6)	Load integer constant 
254:    LDC  4,0(6)	Load 0 
255:    SUB  3,4,3	Op unary - 
256:     LD  4,-6(1)	Load left into ac1 
257:    TGT  3,4,3	Op > 
258:    LDC  4,1(6)	Load 1 
259:    XOR  3,3,4	Op NOT 
260:    LDC  4,1(6)	Load 1 
261:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
263:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
264:    LDC  3,0(6)	Load integer constant 
265:     ST  3,-8(1)	Store parameter 
*                       Jump to output
266:    LDA  1,-6(1)	Load address of new frame 
267:    LDA  3,1(7)	Return address in ac 
268:    LDA  7,-263(7)	CALL output
269:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
262:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
271:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
272:    LDC  3,666(6)	Load integer constant 
273:     ST  3,-8(1)	Store parameter 
*                       Jump to output
274:    LDA  1,-6(1)	Load address of new frame 
275:    LDA  3,1(7)	Return address in ac 
276:    LDA  7,-271(7)	CALL output
277:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
270:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
278:    LDC  3,0(6)	Load Boolean constant 
279:    LDC  4,1(6)	Load 1 
280:    XOR  3,3,4	Op NOT 
281:     ST  3,-6(1)	Save left side 
282:    LDC  3,1(6)	Load Boolean constant 
283:     LD  4,-6(1)	Load left into ac1 
284:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  output
286:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
287:    LDC  3,7(6)	Load integer constant 
288:     ST  3,-8(1)	Store parameter 
*                       Jump to output
289:    LDA  1,-6(1)	Load address of new frame 
290:    LDA  3,1(7)	Return address in ac 
291:    LDA  7,-286(7)	CALL output
292:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
285:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
293:    LDC  3,4(6)	Load integer constant 
294:     ST  3,-6(1)	Save left side 
295:    LDC  3,6(6)	Load integer constant 
296:     LD  4,-6(1)	Load left into ac1 
297:    TGT  3,4,3	Op > 
298:    LDC  4,1(6)	Load 1 
299:    XOR  3,3,4	Op NOT 
300:     ST  3,-6(1)	Save left side 
301:    LDC  3,6(6)	Load integer constant 
302:     ST  3,-7(1)	Save left side 
303:    LDC  3,4(6)	Load integer constant 
304:     LD  4,-7(1)	Load left into ac1 
305:    TGT  3,4,3	Op > 
306:     LD  4,-6(1)	Load left into ac1 
307:    AND  3,4,3	Op AND 
* THEN
* EXPRESSION
*                       Begin call to  output
309:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
310:    LDC  3,7(6)	Load integer constant 
311:     ST  3,-8(1)	Store parameter 
*                       Jump to output
312:    LDA  1,-6(1)	Load address of new frame 
313:    LDA  3,1(7)	Return address in ac 
314:    LDA  7,-309(7)	CALL output
315:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
308:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
316:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
317:    LDA  1,-6(1)	Load address of new frame 
318:    LDA  3,1(7)	Return address in ac 
319:    LDA  7,-283(7)	CALL outnl
320:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
321:    LDC  2,0(6)	Set return value to 0 
322:     LD  3,-1(1)	Load return address 
323:     LD  1,0(1)	Adjust fp 
324:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,324(7)	Jump to init [backpatch] 
* INIT
325:     LD  0,0(0)	Set the global pointer 
326:    LDA  1,0(0)	set first frame at end of globals 
327:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
328:    LDA  3,1(7)	Return address in ac 
329:    LDA  7,-212(7)	Jump to main 
330:   HALT  0,0,0	DONE! 
* END INIT
