* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  pi.c-
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
 43:    LDC  3,340(6)	load size of array a
 44:     ST  3,-11(1)	save size of array a
* EXPRESSION
 45:    LDC  3,100(6)	Load integer constant 
 46:     ST  3,-2(1)	Store variable N
* EXPRESSION
 47:     LD  3,-2(1)	Load variable N
 48:     ST  3,-352(1)	Save left side 
 49:    LDC  3,10(6)	Load integer constant 
 50:     LD  4,-352(1)	Load left into ac1 
 51:    MUL  3,4,3	Op * 
 52:     ST  3,-352(1)	Save left side 
 53:    LDC  3,3(6)	Load integer constant 
 54:     LD  4,-352(1)	Load left into ac1 
 55:    DIV  3,4,3	Op / 
 56:     ST  3,-3(1)	Store variable LEN
* EXPRESSION
 57:    LDC  3,0(6)	Load integer constant 
 58:     ST  3,-5(1)	Store variable j
* WHILE
 59:     LD  3,-5(1)	Load variable j
 60:     ST  3,-352(1)	Save left side 
 61:     LD  3,-3(1)	Load variable LEN
 62:     LD  4,-352(1)	Load left into ac1 
 63:    TLT  3,4,3	Op < 
 64:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 66:     LD  3,-5(1)	Load variable j
 67:     ST  3,-352(1)	Save index 
 68:    LDC  3,2(6)	Load integer constant 
 69:     LD  4,-352(1)	Restore index 
 70:    LDA  5,-12(1)	Load address of base of array a
 71:    SUB  5,5,4	Compute offset of value 
 72:     ST  3,0(5)	Store variable a
* EXPRESSION
 73:     LD  3,-5(1)	load lhs variable j
 74:    LDA  3,1(3)	increment value of j
 75:     ST  3,-5(1)	Store variable j
* END COMPOUND
 76:    LDA  7,-18(7)	go to beginning of loop 
 65:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
 77:    LDC  3,0(6)	Load integer constant 
 78:     ST  3,-9(1)	Store variable nines
* EXPRESSION
 79:    LDC  3,0(6)	Load integer constant 
 80:     ST  3,-10(1)	Store variable predigit
* EXPRESSION
 81:    LDC  3,0(6)	Load integer constant 
 82:     ST  3,-5(1)	Store variable j
* WHILE
 83:     LD  3,-5(1)	Load variable j
 84:     ST  3,-352(1)	Save left side 
 85:     LD  3,-2(1)	Load variable N
 86:     LD  4,-352(1)	Load left into ac1 
 87:    TLT  3,4,3	Op < 
 88:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 90:    LDC  3,0(6)	Load integer constant 
 91:     ST  3,-7(1)	Store variable q
* EXPRESSION
 92:     LD  3,-3(1)	Load variable LEN
 93:     ST  3,-4(1)	Store variable i
* WHILE
 94:     LD  3,-4(1)	Load variable i
 95:     ST  3,-352(1)	Save left side 
 96:    LDC  3,0(6)	Load integer constant 
 97:     LD  4,-352(1)	Load left into ac1 
 98:    TGT  3,4,3	Op > 
 99:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
101:    LDC  3,10(6)	Load integer constant 
102:     ST  3,-352(1)	Save left side 
103:     LD  3,-4(1)	Load variable i
104:     ST  3,-353(1)	Save left side 
105:    LDC  3,1(6)	Load integer constant 
106:     LD  4,-353(1)	Load left into ac1 
107:    SUB  3,4,3	Op - 
108:    LDA  4,-12(1)	Load address of base of array a
109:    SUB  3,4,3	Compute offset of value 
110:     LD  3,0(3)	Load the value 
111:     LD  4,-352(1)	Load left into ac1 
112:    MUL  3,4,3	Op * 
113:     ST  3,-352(1)	Save left side 
114:     LD  3,-7(1)	Load variable q
115:     ST  3,-353(1)	Save left side 
116:     LD  3,-4(1)	Load variable i
117:     LD  4,-353(1)	Load left into ac1 
118:    MUL  3,4,3	Op * 
119:     LD  4,-352(1)	Load left into ac1 
120:    ADD  3,4,3	Op + 
121:     ST  3,-8(1)	Store variable x
* EXPRESSION
122:     LD  3,-4(1)	Load variable i
123:     ST  3,-352(1)	Save left side 
124:    LDC  3,1(6)	Load integer constant 
125:     LD  4,-352(1)	Load left into ac1 
126:    SUB  3,4,3	Op - 
127:     ST  3,-352(1)	Save index 
128:     LD  3,-8(1)	Load variable x
129:     ST  3,-353(1)	Save left side 
130:    LDC  3,2(6)	Load integer constant 
131:     ST  3,-354(1)	Save left side 
132:     LD  3,-4(1)	Load variable i
133:     LD  4,-354(1)	Load left into ac1 
134:    MUL  3,4,3	Op * 
135:     ST  3,-354(1)	Save left side 
136:    LDC  3,1(6)	Load integer constant 
137:     LD  4,-354(1)	Load left into ac1 
138:    SUB  3,4,3	Op - 
139:     LD  4,-353(1)	Load left into ac1 
140:    DIV  5,4,3	Op % 
141:    MUL  5,5,3	 
142:    SUB  3,4,5	 
143:     LD  4,-352(1)	Restore index 
144:    LDA  5,-12(1)	Load address of base of array a
145:    SUB  5,5,4	Compute offset of value 
146:     ST  3,0(5)	Store variable a
* EXPRESSION
147:     LD  3,-8(1)	Load variable x
148:     ST  3,-352(1)	Save left side 
149:    LDC  3,2(6)	Load integer constant 
150:     ST  3,-353(1)	Save left side 
151:     LD  3,-4(1)	Load variable i
152:     LD  4,-353(1)	Load left into ac1 
153:    MUL  3,4,3	Op * 
154:     ST  3,-353(1)	Save left side 
155:    LDC  3,1(6)	Load integer constant 
156:     LD  4,-353(1)	Load left into ac1 
157:    SUB  3,4,3	Op - 
158:     LD  4,-352(1)	Load left into ac1 
159:    DIV  3,4,3	Op / 
160:     ST  3,-7(1)	Store variable q
* EXPRESSION
161:    LDC  3,1(6)	Load integer constant 
162:     LD  4,-4(1)	load lhs variable i
163:    SUB  3,4,3	op -= 
164:     ST  3,-4(1)	Store variable i
* END COMPOUND
165:    LDA  7,-72(7)	go to beginning of loop 
100:    LDA  7,65(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
166:    LDC  3,0(6)	Load integer constant 
167:     ST  3,-352(1)	Save index 
168:     LD  3,-7(1)	Load variable q
169:     ST  3,-353(1)	Save left side 
170:    LDC  3,10(6)	Load integer constant 
171:     LD  4,-353(1)	Load left into ac1 
172:    DIV  5,4,3	Op % 
173:    MUL  5,5,3	 
174:    SUB  3,4,5	 
175:     LD  4,-352(1)	Restore index 
176:    LDA  5,-12(1)	Load address of base of array a
177:    SUB  5,5,4	Compute offset of value 
178:     ST  3,0(5)	Store variable a
* EXPRESSION
179:     LD  3,-7(1)	Load variable q
180:     ST  3,-352(1)	Save left side 
181:    LDC  3,10(6)	Load integer constant 
182:     LD  4,-352(1)	Load left into ac1 
183:    DIV  3,4,3	Op / 
184:     ST  3,-7(1)	Store variable q
* IF
185:     LD  3,-7(1)	Load variable q
186:     ST  3,-352(1)	Save left side 
187:    LDC  3,9(6)	Load integer constant 
188:     LD  4,-352(1)	Load left into ac1 
189:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
191:     LD  3,-9(1)	load lhs variable nines
192:    LDA  3,1(3)	increment value of nines
193:     ST  3,-9(1)	Store variable nines
* END COMPOUND
190:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* IF
195:     LD  3,-7(1)	Load variable q
196:     ST  3,-352(1)	Save left side 
197:    LDC  3,10(6)	Load integer constant 
198:     LD  4,-352(1)	Load left into ac1 
199:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  output
201:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
202:     LD  3,-10(1)	Load variable predigit
203:     ST  3,-354(1)	Save left side 
204:    LDC  3,1(6)	Load integer constant 
205:     LD  4,-354(1)	Load left into ac1 
206:    ADD  3,4,3	Op + 
207:     ST  3,-354(1)	Store parameter 
*                       Jump to output
208:    LDA  1,-352(1)	Load address of new frame 
209:    LDA  3,1(7)	Return address in ac 
210:    LDA  7,-205(7)	CALL output
211:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
212:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
213:    LDA  1,-352(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-179(7)	CALL outnl
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
217:    LDC  3,0(6)	Load integer constant 
218:     ST  3,-10(1)	Store variable predigit
* WHILE
219:     LD  3,-9(1)	Load variable nines
220:     ST  3,-352(1)	Save left side 
221:    LDC  3,0(6)	Load integer constant 
222:     LD  4,-352(1)	Load left into ac1 
223:    TGT  3,4,3	Op > 
224:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
226:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
227:    LDC  3,0(6)	Load integer constant 
228:     ST  3,-354(1)	Store parameter 
*                       Jump to output
229:    LDA  1,-352(1)	Load address of new frame 
230:    LDA  3,1(7)	Return address in ac 
231:    LDA  7,-226(7)	CALL output
232:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
233:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
234:    LDA  1,-352(1)	Load address of new frame 
235:    LDA  3,1(7)	Return address in ac 
236:    LDA  7,-200(7)	CALL outnl
237:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
238:     LD  3,-9(1)	load lhs variable nines
239:    LDA  3,-1(3)	decrement value of nines
240:     ST  3,-9(1)	Store variable nines
* END COMPOUND
241:    LDA  7,-23(7)	go to beginning of loop 
225:    LDA  7,16(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
200:    JZR  3,42(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
*                       Begin call to  output
243:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
244:     LD  3,-10(1)	Load variable predigit
245:     ST  3,-354(1)	Store parameter 
*                       Jump to output
246:    LDA  1,-352(1)	Load address of new frame 
247:    LDA  3,1(7)	Return address in ac 
248:    LDA  7,-243(7)	CALL output
249:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
250:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
251:    LDA  1,-352(1)	Load address of new frame 
252:    LDA  3,1(7)	Return address in ac 
253:    LDA  7,-217(7)	CALL outnl
254:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
255:     LD  3,-7(1)	Load variable q
256:     ST  3,-10(1)	Store variable predigit
* WHILE
257:     LD  3,-9(1)	Load variable nines
258:     ST  3,-352(1)	Save left side 
259:    LDC  3,0(6)	Load integer constant 
260:     LD  4,-352(1)	Load left into ac1 
261:    TGT  3,4,3	Op > 
262:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
264:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
265:    LDC  3,9(6)	Load integer constant 
266:     ST  3,-354(1)	Store parameter 
*                       Jump to output
267:    LDA  1,-352(1)	Load address of new frame 
268:    LDA  3,1(7)	Return address in ac 
269:    LDA  7,-264(7)	CALL output
270:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
271:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
272:    LDA  1,-352(1)	Load address of new frame 
273:    LDA  3,1(7)	Return address in ac 
274:    LDA  7,-238(7)	CALL outnl
275:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
276:     LD  3,-9(1)	load lhs variable nines
277:    LDA  3,-1(3)	decrement value of nines
278:     ST  3,-9(1)	Store variable nines
* END COMPOUND
279:    LDA  7,-23(7)	go to beginning of loop 
263:    LDA  7,16(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
242:    LDA  7,37(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
194:    LDA  7,85(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
280:     LD  3,-5(1)	load lhs variable j
281:    LDA  3,1(3)	increment value of j
282:     ST  3,-5(1)	Store variable j
* END COMPOUND
283:    LDA  7,-201(7)	go to beginning of loop 
 89:    LDA  7,194(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
284:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Load param 1
285:     LD  3,-10(1)	Load variable predigit
286:     ST  3,-354(1)	Store parameter 
*                       Jump to output
287:    LDA  1,-352(1)	Load address of new frame 
288:    LDA  3,1(7)	Return address in ac 
289:    LDA  7,-284(7)	CALL output
290:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
291:     ST  1,-352(1)	Store old fp in ghost frame 
*                       Jump to outnl
292:    LDA  1,-352(1)	Load address of new frame 
293:    LDA  3,1(7)	Return address in ac 
294:    LDA  7,-258(7)	CALL outnl
295:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
296:    LDC  2,0(6)	Set return value to 0 
297:     LD  3,-1(1)	Load return address 
298:     LD  1,0(1)	Adjust fp 
299:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,299(7)	Jump to init [backpatch] 
* INIT
300:     LD  0,0(0)	Set the global pointer 
301:    LDA  1,0(0)	set first frame at end of globals 
302:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
303:    LDA  3,1(7)	Return address in ac 
304:    LDA  7,-263(7)	Jump to main 
305:   HALT  0,0,0	DONE! 
* END INIT
