* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyCall.c-
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
* FUNCTION cheyenne
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable a
 45:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-5(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
 50:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 51:     LD  3,-3(1)	Load variable b
 52:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
 53:    LDA  1,-5(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-38(7)	CALL outputb
 56:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputc
 57:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 58:     LD  3,-4(1)	Load variable c
 59:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
 60:    LDA  1,-5(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-33(7)	CALL outputc
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
 64:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 65:    LDA  1,-5(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-31(7)	CALL outnl
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 69:    LDC  2,0(6)	Set return value to 0 
 70:     LD  3,-1(1)	Load return address 
 71:     LD  1,0(1)	Adjust fp 
 72:    LDA  7,0(3)	Return 
* END FUNCTION cheyenne
* FUNCTION sioux
 73:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 74:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 75:    LDC  3,1(6)	Load integer constant 
 76:     LD  4,-2(1)	Load address of base of array a
 77:    SUB  3,4,3	Compute offset of value 
 78:     LD  3,0(3)	Load the value 
 79:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 80:    LDA  1,-5(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
 84:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 85:    LDC  3,2(6)	Load integer constant 
 86:     LD  4,-3(1)	Load address of base of array b
 87:    SUB  3,4,3	Compute offset of value 
 88:     LD  3,0(3)	Load the value 
 89:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
 90:    LDA  1,-5(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-75(7)	CALL outputb
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputc
 94:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 95:    LDC  3,3(6)	Load integer constant 
 96:     LD  4,-4(1)	Load address of base of array c
 97:    SUB  3,4,3	Compute offset of value 
 98:     LD  3,0(3)	Load the value 
 99:     ST  3,-7(1)	Store parameter 
*                       Jump to outputc
100:    LDA  1,-5(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-73(7)	CALL outputc
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
104:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
105:    LDA  1,-5(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-71(7)	CALL outnl
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
109:    LDC  2,0(6)	Set return value to 0 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
* END FUNCTION sioux
* FUNCTION comanche
113:     ST  3,-1(1)	Store return address. 
* COMPOUND
114:    LDC  3,5(6)	load size of array b
115:     ST  3,-3(1)	save size of array b
116:    LDC  3,5(6)	load size of array c
117:     ST  3,-9(1)	save size of array c
* EXPRESSION
118:    LDC  3,2(6)	Load integer constant 
119:     ST  3,-15(1)	Save index 
120:    LDC  3,1(6)	Load Boolean constant 
121:     LD  4,-15(1)	Restore index 
122:    LDA  5,-4(1)	Load address of base of array b
123:    SUB  5,5,4	Compute offset of value 
124:     ST  3,0(5)	Store variable b
* EXPRESSION
125:    LDC  3,3(6)	Load integer constant 
126:     ST  3,-15(1)	Save index 
127:    LDC  3,122(6)	Load char constant 
128:     LD  4,-15(1)	Restore index 
129:    LDA  5,-10(1)	Load address of base of array c
130:    SUB  5,5,4	Compute offset of value 
131:     ST  3,0(5)	Store variable c
* EXPRESSION
*                       Begin call to  sioux
132:     ST  1,-15(1)	Store old fp in ghost frame 
*                       Load param 1
133:     LD  3,-2(1)	Load address of base of array z
134:     ST  3,-17(1)	Store parameter 
*                       Load param 2
135:    LDA  3,-4(1)	Load address of base of array b
136:     ST  3,-18(1)	Store parameter 
*                       Load param 3
137:    LDA  3,-10(1)	Load address of base of array c
138:     ST  3,-19(1)	Store parameter 
*                       Jump to sioux
139:    LDA  1,-15(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-69(7)	CALL sioux
142:    LDA  3,0(2)	Save the result in ac 
*                       End call to sioux
* END COMPOUND
* Add standard closing in case there is no return statement
143:    LDC  2,0(6)	Set return value to 0 
144:     LD  3,-1(1)	Load return address 
145:     LD  1,0(1)	Adjust fp 
146:    LDA  7,0(3)	Return 
* END FUNCTION comanche
* FUNCTION main
147:     ST  3,-1(1)	Store return address. 
* COMPOUND
148:    LDC  3,5(6)	load size of array a
149:     ST  3,-2(1)	save size of array a
150:    LDC  3,6(6)	load size of array b
151:     ST  3,-8(1)	save size of array b
152:    LDC  3,7(6)	load size of array c
153:     ST  3,-15(1)	save size of array c
* EXPRESSION
154:    LDC  3,1(6)	Load integer constant 
155:     ST  3,-23(1)	Save index 
156:    LDC  3,555(6)	Load integer constant 
157:     LD  4,-23(1)	Restore index 
158:    LDA  5,-3(1)	Load address of base of array a
159:    SUB  5,5,4	Compute offset of value 
160:     ST  3,0(5)	Store variable a
* EXPRESSION
161:    LDC  3,2(6)	Load integer constant 
162:     ST  3,-23(1)	Save index 
163:    LDC  3,1(6)	Load Boolean constant 
164:     LD  4,-23(1)	Restore index 
165:    LDA  5,-9(1)	Load address of base of array b
166:    SUB  5,5,4	Compute offset of value 
167:     ST  3,0(5)	Store variable b
* EXPRESSION
168:    LDC  3,3(6)	Load integer constant 
169:     ST  3,-23(1)	Save index 
170:    LDC  3,122(6)	Load char constant 
171:     LD  4,-23(1)	Restore index 
172:    LDA  5,-16(1)	Load address of base of array c
173:    SUB  5,5,4	Compute offset of value 
174:     ST  3,0(5)	Store variable c
* EXPRESSION
*                       Begin call to  cheyenne
175:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
176:    LDC  3,666(6)	Load integer constant 
177:     ST  3,-25(1)	Store parameter 
*                       Load param 2
178:    LDC  3,1(6)	Load Boolean constant 
179:     ST  3,-26(1)	Store parameter 
*                       Load param 3
180:    LDC  3,99(6)	Load char constant 
181:     ST  3,-27(1)	Store parameter 
*                       Jump to cheyenne
182:    LDA  1,-23(1)	Load address of new frame 
183:    LDA  3,1(7)	Return address in ac 
184:    LDA  7,-143(7)	CALL cheyenne
185:    LDA  3,0(2)	Save the result in ac 
*                       End call to cheyenne
* EXPRESSION
*                       Begin call to  cheyenne
186:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
187:    LDC  3,777(6)	Load integer constant 
188:     ST  3,-25(1)	Store parameter 
*                       Load param 2
189:    LDC  3,0(6)	Load Boolean constant 
190:     ST  3,-26(1)	Store parameter 
*                       Load param 3
191:    LDC  3,100(6)	Load char constant 
192:     ST  3,-27(1)	Store parameter 
*                       Jump to cheyenne
193:    LDA  1,-23(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-154(7)	CALL cheyenne
196:    LDA  3,0(2)	Save the result in ac 
*                       End call to cheyenne
* EXPRESSION
*                       Begin call to  sioux
197:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
198:    LDA  3,-3(1)	Load address of base of array a
199:     ST  3,-25(1)	Store parameter 
*                       Load param 2
200:    LDA  3,-9(1)	Load address of base of array b
201:     ST  3,-26(1)	Store parameter 
*                       Load param 3
202:    LDA  3,-16(1)	Load address of base of array c
203:     ST  3,-27(1)	Store parameter 
*                       Jump to sioux
204:    LDA  1,-23(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-134(7)	CALL sioux
207:    LDA  3,0(2)	Save the result in ac 
*                       End call to sioux
* EXPRESSION
*                       Begin call to  comanche
208:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
209:    LDA  3,-3(1)	Load address of base of array a
210:     ST  3,-25(1)	Store parameter 
*                       Jump to comanche
211:    LDA  1,-23(1)	Load address of new frame 
212:    LDA  3,1(7)	Return address in ac 
213:    LDA  7,-101(7)	CALL comanche
214:    LDA  3,0(2)	Save the result in ac 
*                       End call to comanche
* EXPRESSION
215:    LDC  3,1(6)	Load integer constant 
216:     ST  3,-23(1)	Save index 
217:    LDC  3,888(6)	Load integer constant 
218:     LD  4,-23(1)	Restore index 
219:    LDA  5,-1(0)	Load address of base of array ga
220:    SUB  5,5,4	Compute offset of value 
221:     ST  3,0(5)	Store variable ga
* EXPRESSION
222:    LDC  3,2(6)	Load integer constant 
223:     ST  3,-23(1)	Save index 
224:    LDC  3,0(6)	Load Boolean constant 
225:     LD  4,-23(1)	Restore index 
226:    LDA  5,-7(0)	Load address of base of array gb
227:    SUB  5,5,4	Compute offset of value 
228:     ST  3,0(5)	Store variable gb
* EXPRESSION
229:    LDC  3,3(6)	Load integer constant 
230:     ST  3,-23(1)	Save index 
231:    LDC  3,103(6)	Load char constant 
232:     LD  4,-23(1)	Restore index 
233:    LDA  5,-14(0)	Load address of base of array gc
234:    SUB  5,5,4	Compute offset of value 
235:     ST  3,0(5)	Store variable gc
* EXPRESSION
*                       Begin call to  sioux
236:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
237:    LDA  3,-1(0)	Load address of base of array ga
238:     ST  3,-25(1)	Store parameter 
*                       Load param 2
239:    LDA  3,-7(0)	Load address of base of array gb
240:     ST  3,-26(1)	Store parameter 
*                       Load param 3
241:    LDA  3,-14(0)	Load address of base of array gc
242:     ST  3,-27(1)	Store parameter 
*                       Jump to sioux
243:    LDA  1,-23(1)	Load address of new frame 
244:    LDA  3,1(7)	Return address in ac 
245:    LDA  7,-173(7)	CALL sioux
246:    LDA  3,0(2)	Save the result in ac 
*                       End call to sioux
* EXPRESSION
*                       Begin call to  comanche
247:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
248:    LDA  3,-1(0)	Load address of base of array ga
249:     ST  3,-25(1)	Store parameter 
*                       Jump to comanche
250:    LDA  1,-23(1)	Load address of new frame 
251:    LDA  3,1(7)	Return address in ac 
252:    LDA  7,-140(7)	CALL comanche
253:    LDA  3,0(2)	Save the result in ac 
*                       End call to comanche
* COMPOUND
* EXPRESSION
254:    LDC  3,1(6)	Load integer constant 
255:     ST  3,-23(1)	Save index 
256:    LDC  3,999(6)	Load integer constant 
257:     LD  4,-23(1)	Restore index 
258:    LDA  5,-22(0)	Load address of base of array ga
259:    SUB  5,5,4	Compute offset of value 
260:     ST  3,0(5)	Store variable ga
* EXPRESSION
261:    LDC  3,2(6)	Load integer constant 
262:     ST  3,-23(1)	Save index 
263:    LDC  3,1(6)	Load Boolean constant 
264:     LD  4,-23(1)	Restore index 
265:    LDA  5,-28(0)	Load address of base of array gb
266:    SUB  5,5,4	Compute offset of value 
267:     ST  3,0(5)	Store variable gb
* EXPRESSION
268:    LDC  3,3(6)	Load integer constant 
269:     ST  3,-23(1)	Save index 
270:    LDC  3,115(6)	Load char constant 
271:     LD  4,-23(1)	Restore index 
272:    LDA  5,-35(0)	Load address of base of array gc
273:    SUB  5,5,4	Compute offset of value 
274:     ST  3,0(5)	Store variable gc
* EXPRESSION
*                       Begin call to  sioux
275:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
276:    LDA  3,-22(0)	Load address of base of array ga
277:     ST  3,-25(1)	Store parameter 
*                       Load param 2
278:    LDA  3,-28(0)	Load address of base of array gb
279:     ST  3,-26(1)	Store parameter 
*                       Load param 3
280:    LDA  3,-35(0)	Load address of base of array gc
281:     ST  3,-27(1)	Store parameter 
*                       Jump to sioux
282:    LDA  1,-23(1)	Load address of new frame 
283:    LDA  3,1(7)	Return address in ac 
284:    LDA  7,-212(7)	CALL sioux
285:    LDA  3,0(2)	Save the result in ac 
*                       End call to sioux
* EXPRESSION
*                       Begin call to  comanche
286:     ST  1,-23(1)	Store old fp in ghost frame 
*                       Load param 1
287:    LDA  3,-22(0)	Load address of base of array ga
288:     ST  3,-25(1)	Store parameter 
*                       Jump to comanche
289:    LDA  1,-23(1)	Load address of new frame 
290:    LDA  3,1(7)	Return address in ac 
291:    LDA  7,-179(7)	CALL comanche
292:    LDA  3,0(2)	Save the result in ac 
*                       End call to comanche
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
293:    LDC  2,0(6)	Set return value to 0 
294:     LD  3,-1(1)	Load return address 
295:     LD  1,0(1)	Adjust fp 
296:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,296(7)	Jump to init [backpatch] 
* INIT
297:     LD  0,0(0)	Set the global pointer 
298:    LDA  1,-42(0)	set first frame at end of globals 
299:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
300:    LDC  3,5(6)	load size of array ga
301:     ST  3,0(0)	save size of array ga
302:    LDC  3,5(6)	load size of array ga-1
303:     ST  3,-21(0)	save size of array ga-1
304:    LDC  3,6(6)	load size of array gb
305:     ST  3,-6(0)	save size of array gb
306:    LDC  3,6(6)	load size of array gb-2
307:     ST  3,-27(0)	save size of array gb-2
308:    LDC  3,7(6)	load size of array gc
309:     ST  3,-13(0)	save size of array gc
310:    LDC  3,7(6)	load size of array gc-3
311:     ST  3,-34(0)	save size of array gc-3
* END INIT GLOBALS AND STATICS
312:    LDA  3,1(7)	Return address in ac 
313:    LDA  7,-167(7)	Jump to main 
314:   HALT  0,0,0	DONE! 
* END INIT
