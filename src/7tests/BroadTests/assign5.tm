* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  assign5.c-
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
 43:    LDC  3,333(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable x
* EXPRESSION
 45:    LDC  3,444(6)	Load integer constant 
 46:     ST  3,-3(1)	Store variable y
* EXPRESSION
 47:    LDC  3,666(6)	Load integer constant 
 48:     ST  3,-4(1)	Store variable z
* EXPRESSION
 49:     LD  3,-4(1)	Load variable z
 50:     ST  3,-3(1)	Store variable y
 51:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 53:     LD  3,-2(1)	Load variable x
 54:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 55:    LDA  1,-5(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 59:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 60:     LD  3,-3(1)	Load variable y
 61:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 62:    LDA  1,-5(1)	Load address of new frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    LDA  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 66:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 67:     LD  3,-4(1)	Load variable z
 68:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 69:    LDA  1,-5(1)	Load address of new frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-66(7)	CALL output
 72:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 73:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 74:    LDA  1,-5(1)	Load address of new frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    LDA  7,-40(7)	CALL outnl
 77:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 78:     LD  3,-4(1)	Load variable z
 79:     ST  3,-3(1)	Store variable y
 80:     LD  4,-2(1)	load lhs variable x
 81:    ADD  3,4,3	op += 
 82:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
 83:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 84:     LD  3,-2(1)	Load variable x
 85:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 86:    LDA  1,-5(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-83(7)	CALL output
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 90:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 91:     LD  3,-3(1)	Load variable y
 92:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-5(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 98:     LD  3,-4(1)	Load variable z
 99:     ST  3,-7(1)	Store parameter 
*                       Jump to output
100:    LDA  1,-5(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-97(7)	CALL output
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
104:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
105:    LDA  1,-5(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-71(7)	CALL outnl
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
109:     LD  3,-4(1)	Load variable z
110:     LD  4,-3(1)	load lhs variable y
111:    ADD  3,4,3	op += 
112:     ST  3,-3(1)	Store variable y
113:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
114:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
115:     LD  3,-2(1)	Load variable x
116:     ST  3,-7(1)	Store parameter 
*                       Jump to output
117:    LDA  1,-5(1)	Load address of new frame 
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
121:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
122:     LD  3,-3(1)	Load variable y
123:     ST  3,-7(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-5(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
128:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
129:     LD  3,-4(1)	Load variable z
130:     ST  3,-7(1)	Store parameter 
*                       Jump to output
131:    LDA  1,-5(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-128(7)	CALL output
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
135:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
136:    LDA  1,-5(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-102(7)	CALL outnl
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
140:     LD  3,-4(1)	Load variable z
141:     LD  4,-3(1)	load lhs variable y
142:    ADD  3,4,3	op += 
143:     ST  3,-3(1)	Store variable y
144:     LD  4,-2(1)	load lhs variable x
145:    ADD  3,4,3	op += 
146:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
147:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
148:     LD  3,-2(1)	Load variable x
149:     ST  3,-7(1)	Store parameter 
*                       Jump to output
150:    LDA  1,-5(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-147(7)	CALL output
153:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
154:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
155:     LD  3,-3(1)	Load variable y
156:     ST  3,-7(1)	Store parameter 
*                       Jump to output
157:    LDA  1,-5(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-154(7)	CALL output
160:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
161:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
162:     LD  3,-4(1)	Load variable z
163:     ST  3,-7(1)	Store parameter 
*                       Jump to output
164:    LDA  1,-5(1)	Load address of new frame 
165:    LDA  3,1(7)	Return address in ac 
166:    LDA  7,-161(7)	CALL output
167:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
168:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
169:    LDA  1,-5(1)	Load address of new frame 
170:    LDA  3,1(7)	Return address in ac 
171:    LDA  7,-135(7)	CALL outnl
172:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
173:     LD  3,-4(1)	Load variable z
174:     ST  3,-3(1)	Store variable y
175:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
176:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
177:     LD  3,-2(1)	Load variable x
178:     ST  3,-7(1)	Store parameter 
*                       Jump to output
179:    LDA  1,-5(1)	Load address of new frame 
180:    LDA  3,1(7)	Return address in ac 
181:    LDA  7,-176(7)	CALL output
182:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
183:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
184:     LD  3,-3(1)	Load variable y
185:     ST  3,-7(1)	Store parameter 
*                       Jump to output
186:    LDA  1,-5(1)	Load address of new frame 
187:    LDA  3,1(7)	Return address in ac 
188:    LDA  7,-183(7)	CALL output
189:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
190:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
191:     LD  3,-4(1)	Load variable z
192:     ST  3,-7(1)	Store parameter 
*                       Jump to output
193:    LDA  1,-5(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-190(7)	CALL output
196:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
197:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
198:    LDA  1,-5(1)	Load address of new frame 
199:    LDA  3,1(7)	Return address in ac 
200:    LDA  7,-164(7)	CALL outnl
201:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
202:     LD  3,-4(1)	Load variable z
203:     ST  3,-3(1)	Store variable y
204:     LD  4,-2(1)	load lhs variable x
205:    SUB  3,4,3	op -= 
206:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
207:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
208:     LD  3,-2(1)	Load variable x
209:     ST  3,-7(1)	Store parameter 
*                       Jump to output
210:    LDA  1,-5(1)	Load address of new frame 
211:    LDA  3,1(7)	Return address in ac 
212:    LDA  7,-207(7)	CALL output
213:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
214:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
215:     LD  3,-3(1)	Load variable y
216:     ST  3,-7(1)	Store parameter 
*                       Jump to output
217:    LDA  1,-5(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-214(7)	CALL output
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
221:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
222:     LD  3,-4(1)	Load variable z
223:     ST  3,-7(1)	Store parameter 
*                       Jump to output
224:    LDA  1,-5(1)	Load address of new frame 
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-221(7)	CALL output
227:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
228:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
229:    LDA  1,-5(1)	Load address of new frame 
230:    LDA  3,1(7)	Return address in ac 
231:    LDA  7,-195(7)	CALL outnl
232:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
233:     LD  3,-4(1)	Load variable z
234:     LD  4,-3(1)	load lhs variable y
235:    SUB  3,4,3	op -= 
236:     ST  3,-3(1)	Store variable y
237:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
238:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
239:     LD  3,-2(1)	Load variable x
240:     ST  3,-7(1)	Store parameter 
*                       Jump to output
241:    LDA  1,-5(1)	Load address of new frame 
242:    LDA  3,1(7)	Return address in ac 
243:    LDA  7,-238(7)	CALL output
244:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
245:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
246:     LD  3,-3(1)	Load variable y
247:     ST  3,-7(1)	Store parameter 
*                       Jump to output
248:    LDA  1,-5(1)	Load address of new frame 
249:    LDA  3,1(7)	Return address in ac 
250:    LDA  7,-245(7)	CALL output
251:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
252:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
253:     LD  3,-4(1)	Load variable z
254:     ST  3,-7(1)	Store parameter 
*                       Jump to output
255:    LDA  1,-5(1)	Load address of new frame 
256:    LDA  3,1(7)	Return address in ac 
257:    LDA  7,-252(7)	CALL output
258:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
259:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
260:    LDA  1,-5(1)	Load address of new frame 
261:    LDA  3,1(7)	Return address in ac 
262:    LDA  7,-226(7)	CALL outnl
263:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
264:     LD  3,-4(1)	Load variable z
265:     LD  4,-3(1)	load lhs variable y
266:    SUB  3,4,3	op -= 
267:     ST  3,-3(1)	Store variable y
268:     LD  4,-2(1)	load lhs variable x
269:    SUB  3,4,3	op -= 
270:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
271:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
272:     LD  3,-2(1)	Load variable x
273:     ST  3,-7(1)	Store parameter 
*                       Jump to output
274:    LDA  1,-5(1)	Load address of new frame 
275:    LDA  3,1(7)	Return address in ac 
276:    LDA  7,-271(7)	CALL output
277:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
278:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
279:     LD  3,-3(1)	Load variable y
280:     ST  3,-7(1)	Store parameter 
*                       Jump to output
281:    LDA  1,-5(1)	Load address of new frame 
282:    LDA  3,1(7)	Return address in ac 
283:    LDA  7,-278(7)	CALL output
284:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
285:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
286:     LD  3,-4(1)	Load variable z
287:     ST  3,-7(1)	Store parameter 
*                       Jump to output
288:    LDA  1,-5(1)	Load address of new frame 
289:    LDA  3,1(7)	Return address in ac 
290:    LDA  7,-285(7)	CALL output
291:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
292:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
293:    LDA  1,-5(1)	Load address of new frame 
294:    LDA  3,1(7)	Return address in ac 
295:    LDA  7,-259(7)	CALL outnl
296:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
297:     LD  3,-1(1)	Load return address 
298:     LD  1,0(1)	Adjust fp 
299:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
300:    LDC  2,0(6)	Set return value to 0 
301:     LD  3,-1(1)	Load return address 
302:     LD  1,0(1)	Adjust fp 
303:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,303(7)	Jump to init [backpatch] 
* INIT
304:     LD  0,0(0)	Set the global pointer 
305:    LDA  1,0(0)	set first frame at end of globals 
306:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
307:    LDA  3,1(7)	Return address in ac 
308:    LDA  7,-267(7)	Jump to main 
309:   HALT  0,0,0	DONE! 
* END INIT
