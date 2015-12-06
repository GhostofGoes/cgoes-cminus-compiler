* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  queens.c-
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
* FUNCTION printboard
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable i
* WHILE
 45:     LD  3,-3(1)	Load variable i
 46:     ST  3,-4(1)	Save left side 
 47:     LD  3,-78(0)	Load variable n
 48:     LD  4,-4(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 53:     LD  3,-3(1)	Load variable i
 54:     LD  4,-2(1)	Load address of base of array col
 55:    SUB  3,4,3	Compute offset of value 
 56:     LD  3,0(3)	Load the value 
 57:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 58:    LDA  1,-4(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 62:     LD  3,-3(1)	load lhs variable i
 63:    LDA  3,1(3)	increment value of i
 64:     ST  3,-3(1)	Store variable i
* END COMPOUND
 65:    LDA  7,-21(7)	go to beginning of loop 
 51:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
 66:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 67:    LDA  1,-4(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-33(7)	CALL outnl
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 71:     LD  3,-79(0)	load lhs variable count
 72:    LDA  3,1(3)	increment value of count
 73:     ST  3,-79(0)	Store variable count
* END COMPOUND
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6)	Set return value to 0 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    LDA  7,0(3)	Return 
* END FUNCTION printboard
* FUNCTION try
 78:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 79:     LD  3,-2(1)	Load variable c
 80:     ST  3,-4(1)	Save left side 
 81:     LD  3,-78(0)	Load variable n
 82:     LD  4,-4(1)	Load left into ac1 
 83:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  printboard
 85:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 86:    LDA  3,-14(0)	Load address of base of array col
 87:     ST  3,-6(1)	Store parameter 
*                       Jump to printboard
 88:    LDA  1,-4(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-49(7)	CALL printboard
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to printboard
 84:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
 93:    LDC  3,0(6)	Load integer constant 
 94:     ST  3,-3(1)	Store variable r
* WHILE
 95:     LD  3,-3(1)	Load variable r
 96:     ST  3,-4(1)	Save left side 
 97:     LD  3,-78(0)	Load variable n
 98:     LD  4,-4(1)	Load left into ac1 
 99:    TLT  3,4,3	Op < 
100:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
102:     LD  3,-3(1)	Load variable r
103:    LDA  4,-1(0)	Load address of base of array row
104:    SUB  3,4,3	Compute offset of value 
105:     LD  3,0(3)	Load the value 
106:     ST  3,-4(1)	Save left side 
107:    LDC  3,0(6)	Load integer constant 
108:     LD  4,-4(1)	Load left into ac1 
109:    TEQ  3,4,3	Op == 
110:     ST  3,-4(1)	Save left side 
111:     LD  3,-3(1)	Load variable r
112:     ST  3,-5(1)	Save left side 
113:     LD  3,-2(1)	Load variable c
114:     LD  4,-5(1)	Load left into ac1 
115:    ADD  3,4,3	Op + 
116:    LDA  4,-27(0)	Load address of base of array diagone
117:    SUB  3,4,3	Compute offset of value 
118:     LD  3,0(3)	Load the value 
119:     ST  3,-5(1)	Save left side 
120:    LDC  3,0(6)	Load integer constant 
121:     LD  4,-5(1)	Load left into ac1 
122:    TEQ  3,4,3	Op == 
123:     LD  4,-4(1)	Load left into ac1 
124:    AND  3,4,3	Op AND 
125:     ST  3,-4(1)	Save left side 
126:     LD  3,-3(1)	Load variable r
127:     ST  3,-5(1)	Save left side 
128:     LD  3,-78(0)	Load variable n
129:     ST  3,-6(1)	Save left side 
130:    LDC  3,1(6)	Load integer constant 
131:     LD  4,-6(1)	Load left into ac1 
132:    SUB  3,4,3	Op - 
133:     LD  4,-5(1)	Load left into ac1 
134:    ADD  3,4,3	Op + 
135:     ST  3,-5(1)	Save left side 
136:     LD  3,-2(1)	Load variable c
137:     LD  4,-5(1)	Load left into ac1 
138:    SUB  3,4,3	Op - 
139:    LDA  4,-53(0)	Load address of base of array diagtwo
140:    SUB  3,4,3	Compute offset of value 
141:     LD  3,0(3)	Load the value 
142:     ST  3,-5(1)	Save left side 
143:    LDC  3,0(6)	Load integer constant 
144:     LD  4,-5(1)	Load left into ac1 
145:    TEQ  3,4,3	Op == 
146:     LD  4,-4(1)	Load left into ac1 
147:    AND  3,4,3	Op AND 
* THEN
* COMPOUND
* EXPRESSION
149:     LD  3,-3(1)	Load variable r
150:     ST  3,-4(1)	Save index 
151:    LDC  3,1(6)	Load integer constant 
152:     LD  4,-4(1)	Restore index 
153:    LDA  5,-1(0)	Load address of base of array row
154:    SUB  5,5,4	Compute offset of value 
155:     ST  3,0(5)	Store variable row
* EXPRESSION
156:     LD  3,-2(1)	Load variable c
157:     ST  3,-4(1)	Save index 
158:     LD  3,-3(1)	Load variable r
159:     LD  4,-4(1)	Restore index 
160:    LDA  5,-14(0)	Load address of base of array col
161:    SUB  5,5,4	Compute offset of value 
162:     ST  3,0(5)	Store variable col
* EXPRESSION
163:     LD  3,-3(1)	Load variable r
164:     ST  3,-4(1)	Save left side 
165:     LD  3,-2(1)	Load variable c
166:     LD  4,-4(1)	Load left into ac1 
167:    ADD  3,4,3	Op + 
168:     ST  3,-4(1)	Save index 
169:    LDC  3,1(6)	Load integer constant 
170:     LD  4,-4(1)	Restore index 
171:    LDA  5,-27(0)	Load address of base of array diagone
172:    SUB  5,5,4	Compute offset of value 
173:     ST  3,0(5)	Store variable diagone
* EXPRESSION
174:     LD  3,-3(1)	Load variable r
175:     ST  3,-4(1)	Save left side 
176:     LD  3,-78(0)	Load variable n
177:     ST  3,-5(1)	Save left side 
178:    LDC  3,1(6)	Load integer constant 
179:     LD  4,-5(1)	Load left into ac1 
180:    SUB  3,4,3	Op - 
181:     LD  4,-4(1)	Load left into ac1 
182:    ADD  3,4,3	Op + 
183:     ST  3,-4(1)	Save left side 
184:     LD  3,-2(1)	Load variable c
185:     LD  4,-4(1)	Load left into ac1 
186:    SUB  3,4,3	Op - 
187:     ST  3,-4(1)	Save index 
188:    LDC  3,1(6)	Load integer constant 
189:     LD  4,-4(1)	Restore index 
190:    LDA  5,-53(0)	Load address of base of array diagtwo
191:    SUB  5,5,4	Compute offset of value 
192:     ST  3,0(5)	Store variable diagtwo
* EXPRESSION
*                       Begin call to  try
193:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
194:     LD  3,-2(1)	Load variable c
195:     ST  3,-6(1)	Save left side 
196:    LDC  3,1(6)	Load integer constant 
197:     LD  4,-6(1)	Load left into ac1 
198:    ADD  3,4,3	Op + 
199:     ST  3,-6(1)	Store parameter 
*                       Jump to try
200:    LDA  1,-4(1)	Load address of new frame 
201:    LDA  3,1(7)	Return address in ac 
202:    LDA  7,-125(7)	CALL try
203:    LDA  3,0(2)	Save the result in ac 
*                       End call to try
* EXPRESSION
204:     LD  3,-3(1)	Load variable r
205:     ST  3,-4(1)	Save index 
206:    LDC  3,0(6)	Load integer constant 
207:     LD  4,-4(1)	Restore index 
208:    LDA  5,-1(0)	Load address of base of array row
209:    SUB  5,5,4	Compute offset of value 
210:     ST  3,0(5)	Store variable row
* EXPRESSION
211:     LD  3,-3(1)	Load variable r
212:     ST  3,-4(1)	Save left side 
213:     LD  3,-2(1)	Load variable c
214:     LD  4,-4(1)	Load left into ac1 
215:    ADD  3,4,3	Op + 
216:     ST  3,-4(1)	Save index 
217:    LDC  3,0(6)	Load integer constant 
218:     LD  4,-4(1)	Restore index 
219:    LDA  5,-27(0)	Load address of base of array diagone
220:    SUB  5,5,4	Compute offset of value 
221:     ST  3,0(5)	Store variable diagone
* EXPRESSION
222:     LD  3,-3(1)	Load variable r
223:     ST  3,-4(1)	Save left side 
224:     LD  3,-78(0)	Load variable n
225:     ST  3,-5(1)	Save left side 
226:    LDC  3,1(6)	Load integer constant 
227:     LD  4,-5(1)	Load left into ac1 
228:    SUB  3,4,3	Op - 
229:     LD  4,-4(1)	Load left into ac1 
230:    ADD  3,4,3	Op + 
231:     ST  3,-4(1)	Save left side 
232:     LD  3,-2(1)	Load variable c
233:     LD  4,-4(1)	Load left into ac1 
234:    SUB  3,4,3	Op - 
235:     ST  3,-4(1)	Save index 
236:    LDC  3,0(6)	Load integer constant 
237:     LD  4,-4(1)	Restore index 
238:    LDA  5,-53(0)	Load address of base of array diagtwo
239:    SUB  5,5,4	Compute offset of value 
240:     ST  3,0(5)	Store variable diagtwo
* END COMPOUND
148:    JZR  3,92(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
241:     LD  3,-3(1)	load lhs variable r
242:    LDA  3,1(3)	increment value of r
243:     ST  3,-3(1)	Store variable r
* END COMPOUND
244:    LDA  7,-150(7)	go to beginning of loop 
101:    LDA  7,143(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
 92:    LDA  7,152(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
245:    LDC  2,0(6)	Set return value to 0 
246:     LD  3,-1(1)	Load return address 
247:     LD  1,0(1)	Adjust fp 
248:    LDA  7,0(3)	Return 
* END FUNCTION try
* FUNCTION solve
249:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
250:     LD  3,-2(1)	Load variable num
251:     ST  3,-78(0)	Store variable n
* EXPRESSION
252:    LDC  3,0(6)	Load integer constant 
253:     ST  3,-79(0)	Store variable count
* EXPRESSION
*                       Begin call to  try
254:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
255:    LDC  3,0(6)	Load integer constant 
256:     ST  3,-5(1)	Store parameter 
*                       Jump to try
257:    LDA  1,-3(1)	Load address of new frame 
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-182(7)	CALL try
260:    LDA  3,0(2)	Save the result in ac 
*                       End call to try
* RETURN
261:     LD  3,-79(0)	Load variable count
262:    LDA  2,0(3)	Copy result to rt register 
263:     LD  3,-1(1)	Load return address 
264:     LD  1,0(1)	Adjust fp 
265:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
266:    LDC  2,0(6)	Set return value to 0 
267:     LD  3,-1(1)	Load return address 
268:     LD  1,0(1)	Adjust fp 
269:    LDA  7,0(3)	Return 
* END FUNCTION solve
* FUNCTION main
270:     ST  3,-1(1)	Store return address. 
* COMPOUND
* WHILE
*                       Begin call to  input
271:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to input
272:    LDA  1,-3(1)	Load address of new frame 
273:    LDA  3,1(7)	Return address in ac 
274:    LDA  7,-274(7)	CALL input
275:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
276:     ST  3,-2(1)	Store variable num
277:     ST  3,-3(1)	Save left side 
278:    LDC  3,0(6)	Load integer constant 
279:     LD  4,-3(1)	Load left into ac1 
280:    TGT  3,4,3	Op > 
281:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
283:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  solve
284:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
285:     LD  3,-2(1)	Load variable num
286:     ST  3,-7(1)	Store parameter 
*                       Jump to solve
287:    LDA  1,-5(1)	Load address of new frame 
288:    LDA  3,1(7)	Return address in ac 
289:    LDA  7,-41(7)	CALL solve
290:    LDA  3,0(2)	Save the result in ac 
*                       End call to solve
291:     ST  3,-5(1)	Store parameter 
*                       Jump to output
292:    LDA  1,-3(1)	Load address of new frame 
293:    LDA  3,1(7)	Return address in ac 
294:    LDA  7,-289(7)	CALL output
295:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
296:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
297:    LDA  1,-3(1)	Load address of new frame 
298:    LDA  3,1(7)	Return address in ac 
299:    LDA  7,-263(7)	CALL outnl
300:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
301:    LDA  7,-31(7)	go to beginning of loop 
282:    LDA  7,19(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
302:    LDC  2,0(6)	Set return value to 0 
303:     LD  3,-1(1)	Load return address 
304:     LD  1,0(1)	Adjust fp 
305:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,305(7)	Jump to init [backpatch] 
* INIT
306:     LD  0,0(0)	Set the global pointer 
307:    LDA  1,-80(0)	set first frame at end of globals 
308:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
309:    LDC  3,12(6)	load size of array col
310:     ST  3,-13(0)	save size of array col
311:    LDC  3,25(6)	load size of array diagone
312:     ST  3,-26(0)	save size of array diagone
313:    LDC  3,25(6)	load size of array diagtwo
314:     ST  3,-52(0)	save size of array diagtwo
315:    LDC  3,12(6)	load size of array row
316:     ST  3,0(0)	save size of array row
* END INIT GLOBALS AND STATICS
317:    LDA  3,1(7)	Return address in ac 
318:    LDA  7,-49(7)	Jump to main 
319:   HALT  0,0,0	DONE! 
* END INIT
