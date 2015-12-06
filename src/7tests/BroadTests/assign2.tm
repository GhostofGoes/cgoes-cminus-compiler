* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  assign2.c-
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
 47:    LDC  3,6(6)	load size of array a
 48:     ST  3,-19(1)	save size of array a
 49:    LDC  3,5(6)	load size of array b
 50:     ST  3,-26(1)	save size of array b
* EXPRESSION
 51:    LDC  3,5(6)	Load integer constant 
 52:     ST  3,-32(1)	Save index 
 53:    LDC  3,111(6)	Load integer constant 
 54:     LD  4,-32(1)	Restore index 
 55:    LDA  5,-3(1)	Load address of base of array x
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
 59:    LDC  3,5(6)	Load integer constant 
 60:    LDA  4,-3(1)	Load address of base of array x
 61:    SUB  3,4,3	Compute offset of value 
 62:     LD  3,0(3)	Load the value 
 63:     ST  3,-34(1)	Store parameter 
*                       Jump to output
 64:    LDA  1,-32(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 68:    LDC  3,4(6)	Load integer constant 
 69:     ST  3,-32(1)	Save index 
 70:    LDC  3,222(6)	Load integer constant 
 71:     LD  4,-32(1)	Restore index 
 72:    LDA  5,-12(1)	Load address of base of array y
 73:    SUB  5,5,4	Compute offset of value 
 74:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 75:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
 76:    LDC  3,4(6)	Load integer constant 
 77:    LDA  4,-12(1)	Load address of base of array y
 78:    SUB  3,4,3	Compute offset of value 
 79:     LD  3,0(3)	Load the value 
 80:     ST  3,-34(1)	Store parameter 
*                       Jump to output
 81:    LDA  1,-32(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-78(7)	CALL output
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 85:    LDC  3,3(6)	Load integer constant 
 86:     ST  3,-32(1)	Save index 
 87:    LDC  3,1(6)	Load Boolean constant 
 88:     LD  4,-32(1)	Restore index 
 89:    LDA  5,-20(1)	Load address of base of array a
 90:    SUB  5,5,4	Compute offset of value 
 91:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  outputb
 92:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
 93:    LDC  3,3(6)	Load integer constant 
 94:    LDA  4,-20(1)	Load address of base of array a
 95:    SUB  3,4,3	Compute offset of value 
 96:     LD  3,0(3)	Load the value 
 97:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
 98:    LDA  1,-32(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-83(7)	CALL outputb
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
102:    LDC  3,2(6)	Load integer constant 
103:     ST  3,-32(1)	Save index 
104:    LDC  3,0(6)	Load Boolean constant 
105:     LD  4,-32(1)	Restore index 
106:    LDA  5,-27(1)	Load address of base of array b
107:    SUB  5,5,4	Compute offset of value 
108:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  outputb
109:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
110:    LDC  3,2(6)	Load integer constant 
111:    LDA  4,-27(1)	Load address of base of array b
112:    SUB  3,4,3	Compute offset of value 
113:     LD  3,0(3)	Load the value 
114:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
115:    LDA  1,-32(1)	Load address of new frame 
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-100(7)	CALL outputb
118:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
119:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Jump to outnl
120:    LDA  1,-32(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-86(7)	CALL outnl
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
124:    LDC  3,5(6)	Load integer constant 
125:     ST  3,-32(1)	Save index 
126:    LDC  3,333(6)	Load integer constant 
127:     LD  4,-32(1)	Restore index 
128:    LDA  5,-1(0)	Load address of base of array gx
129:    SUB  5,5,4	Compute offset of value 
130:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
131:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
132:    LDC  3,5(6)	Load integer constant 
133:    LDA  4,-1(0)	Load address of base of array gx
134:    SUB  3,4,3	Compute offset of value 
135:     LD  3,0(3)	Load the value 
136:     ST  3,-34(1)	Store parameter 
*                       Jump to output
137:    LDA  1,-32(1)	Load address of new frame 
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-134(7)	CALL output
140:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
141:    LDC  3,4(6)	Load integer constant 
142:     ST  3,-32(1)	Save index 
143:    LDC  3,444(6)	Load integer constant 
144:     LD  4,-32(1)	Restore index 
145:    LDA  5,-9(0)	Load address of base of array gy
146:    SUB  5,5,4	Compute offset of value 
147:     ST  3,0(5)	Store variable gy
* EXPRESSION
*                       Begin call to  output
148:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
149:    LDC  3,4(6)	Load integer constant 
150:    LDA  4,-9(0)	Load address of base of array gy
151:    SUB  3,4,3	Compute offset of value 
152:     LD  3,0(3)	Load the value 
153:     ST  3,-34(1)	Store parameter 
*                       Jump to output
154:    LDA  1,-32(1)	Load address of new frame 
155:    LDA  3,1(7)	Return address in ac 
156:    LDA  7,-151(7)	CALL output
157:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
158:    LDC  3,3(6)	Load integer constant 
159:     ST  3,-32(1)	Save index 
160:    LDC  3,0(6)	Load Boolean constant 
161:     LD  4,-32(1)	Restore index 
162:    LDA  5,-16(0)	Load address of base of array ga
163:    SUB  5,5,4	Compute offset of value 
164:     ST  3,0(5)	Store variable ga
* EXPRESSION
*                       Begin call to  outputb
165:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
166:    LDC  3,3(6)	Load integer constant 
167:    LDA  4,-16(0)	Load address of base of array ga
168:    SUB  3,4,3	Compute offset of value 
169:     LD  3,0(3)	Load the value 
170:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
171:    LDA  1,-32(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-156(7)	CALL outputb
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
175:    LDC  3,2(6)	Load integer constant 
176:     ST  3,-32(1)	Save index 
177:    LDC  3,1(6)	Load Boolean constant 
178:     LD  4,-32(1)	Restore index 
179:    LDA  5,-22(0)	Load address of base of array gb
180:    SUB  5,5,4	Compute offset of value 
181:     ST  3,0(5)	Store variable gb
* EXPRESSION
*                       Begin call to  outputb
182:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
183:    LDC  3,2(6)	Load integer constant 
184:    LDA  4,-22(0)	Load address of base of array gb
185:    SUB  3,4,3	Compute offset of value 
186:     LD  3,0(3)	Load the value 
187:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
188:    LDA  1,-32(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-173(7)	CALL outputb
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
192:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Jump to outnl
193:    LDA  1,-32(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-159(7)	CALL outnl
196:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
197:    LDC  3,5(6)	Load integer constant 
198:     ST  3,-32(1)	Save index 
199:    LDC  3,4(6)	Load integer constant 
200:    LDA  4,-12(1)	Load address of base of array y
201:    SUB  3,4,3	Compute offset of value 
202:     LD  3,0(3)	Load the value 
203:     LD  4,-32(1)	Restore index 
204:    LDA  5,-3(1)	Load address of base of array x
205:    SUB  5,5,4	Compute offset of value 
206:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
207:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
208:    LDC  3,5(6)	Load integer constant 
209:    LDA  4,-3(1)	Load address of base of array x
210:    SUB  3,4,3	Compute offset of value 
211:     LD  3,0(3)	Load the value 
212:     ST  3,-34(1)	Store parameter 
*                       Jump to output
213:    LDA  1,-32(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-210(7)	CALL output
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
217:    LDC  3,3(6)	Load integer constant 
218:     ST  3,-32(1)	Save index 
219:    LDC  3,2(6)	Load integer constant 
220:    LDA  4,-27(1)	Load address of base of array b
221:    SUB  3,4,3	Compute offset of value 
222:     LD  3,0(3)	Load the value 
223:     LD  4,-32(1)	Restore index 
224:    LDA  5,-20(1)	Load address of base of array a
225:    SUB  5,5,4	Compute offset of value 
226:     ST  3,0(5)	Store variable a
* EXPRESSION
*                       Begin call to  outputb
227:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
228:    LDC  3,3(6)	Load integer constant 
229:    LDA  4,-20(1)	Load address of base of array a
230:    SUB  3,4,3	Compute offset of value 
231:     LD  3,0(3)	Load the value 
232:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
233:    LDA  1,-32(1)	Load address of new frame 
234:    LDA  3,1(7)	Return address in ac 
235:    LDA  7,-218(7)	CALL outputb
236:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
237:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Jump to outnl
238:    LDA  1,-32(1)	Load address of new frame 
239:    LDA  3,1(7)	Return address in ac 
240:    LDA  7,-204(7)	CALL outnl
241:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
242:    LDC  3,5(6)	Load integer constant 
243:     ST  3,-32(1)	Save index 
244:    LDC  3,4(6)	Load integer constant 
245:    LDA  4,-9(0)	Load address of base of array gy
246:    SUB  3,4,3	Compute offset of value 
247:     LD  3,0(3)	Load the value 
248:     LD  4,-32(1)	Restore index 
249:    LDA  5,-1(0)	Load address of base of array gx
250:    SUB  5,5,4	Compute offset of value 
251:     ST  3,0(5)	Store variable gx
* EXPRESSION
*                       Begin call to  output
252:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
253:    LDC  3,5(6)	Load integer constant 
254:    LDA  4,-1(0)	Load address of base of array gx
255:    SUB  3,4,3	Compute offset of value 
256:     LD  3,0(3)	Load the value 
257:     ST  3,-34(1)	Store parameter 
*                       Jump to output
258:    LDA  1,-32(1)	Load address of new frame 
259:    LDA  3,1(7)	Return address in ac 
260:    LDA  7,-255(7)	CALL output
261:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
262:    LDC  3,3(6)	Load integer constant 
263:     ST  3,-32(1)	Save index 
264:    LDC  3,2(6)	Load integer constant 
265:    LDA  4,-22(0)	Load address of base of array gb
266:    SUB  3,4,3	Compute offset of value 
267:     LD  3,0(3)	Load the value 
268:     LD  4,-32(1)	Restore index 
269:    LDA  5,-16(0)	Load address of base of array ga
270:    SUB  5,5,4	Compute offset of value 
271:     ST  3,0(5)	Store variable ga
* EXPRESSION
*                       Begin call to  outputb
272:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Load param 1
273:    LDC  3,3(6)	Load integer constant 
274:    LDA  4,-16(0)	Load address of base of array ga
275:    SUB  3,4,3	Compute offset of value 
276:     LD  3,0(3)	Load the value 
277:     ST  3,-34(1)	Store parameter 
*                       Jump to outputb
278:    LDA  1,-32(1)	Load address of new frame 
279:    LDA  3,1(7)	Return address in ac 
280:    LDA  7,-263(7)	CALL outputb
281:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
282:     ST  1,-32(1)	Store old fp in ghost frame 
*                       Jump to outnl
283:    LDA  1,-32(1)	Load address of new frame 
284:    LDA  3,1(7)	Return address in ac 
285:    LDA  7,-249(7)	CALL outnl
286:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
287:     LD  3,-1(1)	Load return address 
288:     LD  1,0(1)	Adjust fp 
289:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
290:    LDC  2,0(6)	Set return value to 0 
291:     LD  3,-1(1)	Load return address 
292:     LD  1,0(1)	Adjust fp 
293:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,293(7)	Jump to init [backpatch] 
* INIT
294:     LD  0,0(0)	Set the global pointer 
295:    LDA  1,-26(0)	set first frame at end of globals 
296:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
297:    LDC  3,5(6)	load size of array ga
298:     ST  3,-15(0)	save size of array ga
299:    LDC  3,4(6)	load size of array gb
300:     ST  3,-21(0)	save size of array gb
301:    LDC  3,7(6)	load size of array gx
302:     ST  3,0(0)	save size of array gx
303:    LDC  3,6(6)	load size of array gy
304:     ST  3,-8(0)	save size of array gy
* END INIT GLOBALS AND STATICS
305:    LDA  3,1(7)	Return address in ac 
306:    LDA  7,-265(7)	Jump to main 
307:   HALT  0,0,0	DONE! 
* END INIT
