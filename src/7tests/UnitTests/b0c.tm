* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  b0c.c-
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
*                       Begin call to  outputb
 43:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,1(6)	Load integer constant 
 45:    RND  3,3,6	Op ? 
 46:     ST  3,-4(1)	Save left side 
 47:    LDC  3,0(6)	Load integer constant 
 48:     LD  4,-4(1)	Load left into ac1 
 49:    TEQ  3,4,3	Op == 
 50:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 51:    LDA  1,-2(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-36(7)	CALL outputb
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
 55:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 56:    LDA  1,-2(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
 60:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 61:    LDC  3,100000(6)	Load integer constant 
 62:    RND  3,3,6	Op ? 
 63:     ST  3,-4(1)	Save left side 
 64:    LDC  3,0(6)	Load integer constant 
 65:     LD  4,-4(1)	Load left into ac1 
 66:    TGT  3,4,3	Op > 
 67:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 68:    LDA  1,-2(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-53(7)	CALL outputb
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 72:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 73:    LDC  3,3(6)	Load integer constant 
 74:    RND  3,3,6	Op ? 
 75:     ST  3,-4(1)	Save left side 
 76:    LDC  3,0(6)	Load integer constant 
 77:     LD  4,-4(1)	Load left into ac1 
 78:    TGT  3,4,3	Op > 
 79:     ST  3,-4(1)	Save left side 
 80:    LDC  3,3(6)	Load integer constant 
 81:    RND  3,3,6	Op ? 
 82:     ST  3,-5(1)	Save left side 
 83:    LDC  3,0(6)	Load integer constant 
 84:     LD  4,-5(1)	Load left into ac1 
 85:    TGT  3,4,3	Op > 
 86:     LD  4,-4(1)	Load left into ac1 
 87:    AND  3,4,3	Op AND 
 88:     ST  3,-4(1)	Save left side 
 89:    LDC  3,3(6)	Load integer constant 
 90:    RND  3,3,6	Op ? 
 91:     ST  3,-5(1)	Save left side 
 92:    LDC  3,0(6)	Load integer constant 
 93:     LD  4,-5(1)	Load left into ac1 
 94:    TGT  3,4,3	Op > 
 95:     LD  4,-4(1)	Load left into ac1 
 96:    AND  3,4,3	Op AND 
 97:     ST  3,-4(1)	Save left side 
 98:    LDC  3,3(6)	Load integer constant 
 99:    RND  3,3,6	Op ? 
100:     ST  3,-5(1)	Save left side 
101:    LDC  3,0(6)	Load integer constant 
102:     LD  4,-5(1)	Load left into ac1 
103:    TGT  3,4,3	Op > 
104:     LD  4,-4(1)	Load left into ac1 
105:    AND  3,4,3	Op AND 
106:     ST  3,-4(1)	Save left side 
107:    LDC  3,3(6)	Load integer constant 
108:    RND  3,3,6	Op ? 
109:     ST  3,-5(1)	Save left side 
110:    LDC  3,0(6)	Load integer constant 
111:     LD  4,-5(1)	Load left into ac1 
112:    TGT  3,4,3	Op > 
113:     LD  4,-4(1)	Load left into ac1 
114:    AND  3,4,3	Op AND 
115:     ST  3,-4(1)	Save left side 
116:    LDC  3,3(6)	Load integer constant 
117:    RND  3,3,6	Op ? 
118:     ST  3,-5(1)	Save left side 
119:    LDC  3,0(6)	Load integer constant 
120:     LD  4,-5(1)	Load left into ac1 
121:    TGT  3,4,3	Op > 
122:     LD  4,-4(1)	Load left into ac1 
123:    AND  3,4,3	Op AND 
124:     ST  3,-4(1)	Save left side 
125:    LDC  3,3(6)	Load integer constant 
126:    RND  3,3,6	Op ? 
127:     ST  3,-5(1)	Save left side 
128:    LDC  3,0(6)	Load integer constant 
129:     LD  4,-5(1)	Load left into ac1 
130:    TGT  3,4,3	Op > 
131:     LD  4,-4(1)	Load left into ac1 
132:    AND  3,4,3	Op AND 
133:     ST  3,-4(1)	Save left side 
134:    LDC  3,3(6)	Load integer constant 
135:    RND  3,3,6	Op ? 
136:     ST  3,-5(1)	Save left side 
137:    LDC  3,0(6)	Load integer constant 
138:     LD  4,-5(1)	Load left into ac1 
139:    TGT  3,4,3	Op > 
140:     LD  4,-4(1)	Load left into ac1 
141:    AND  3,4,3	Op AND 
142:     ST  3,-4(1)	Save left side 
143:    LDC  3,3(6)	Load integer constant 
144:    RND  3,3,6	Op ? 
145:     ST  3,-5(1)	Save left side 
146:    LDC  3,0(6)	Load integer constant 
147:     LD  4,-5(1)	Load left into ac1 
148:    TGT  3,4,3	Op > 
149:     LD  4,-4(1)	Load left into ac1 
150:    AND  3,4,3	Op AND 
151:     ST  3,-4(1)	Save left side 
152:    LDC  3,3(6)	Load integer constant 
153:    RND  3,3,6	Op ? 
154:     ST  3,-5(1)	Save left side 
155:    LDC  3,0(6)	Load integer constant 
156:     LD  4,-5(1)	Load left into ac1 
157:    TGT  3,4,3	Op > 
158:     LD  4,-4(1)	Load left into ac1 
159:    AND  3,4,3	Op AND 
160:     ST  3,-4(1)	Save left side 
161:    LDC  3,3(6)	Load integer constant 
162:    RND  3,3,6	Op ? 
163:     ST  3,-5(1)	Save left side 
164:    LDC  3,0(6)	Load integer constant 
165:     LD  4,-5(1)	Load left into ac1 
166:    TGT  3,4,3	Op > 
167:     LD  4,-4(1)	Load left into ac1 
168:    AND  3,4,3	Op AND 
169:     ST  3,-4(1)	Save left side 
170:    LDC  3,3(6)	Load integer constant 
171:    RND  3,3,6	Op ? 
172:     ST  3,-5(1)	Save left side 
173:    LDC  3,0(6)	Load integer constant 
174:     LD  4,-5(1)	Load left into ac1 
175:    TGT  3,4,3	Op > 
176:     LD  4,-4(1)	Load left into ac1 
177:    AND  3,4,3	Op AND 
178:     ST  3,-4(1)	Save left side 
179:    LDC  3,3(6)	Load integer constant 
180:    RND  3,3,6	Op ? 
181:     ST  3,-5(1)	Save left side 
182:    LDC  3,0(6)	Load integer constant 
183:     LD  4,-5(1)	Load left into ac1 
184:    TGT  3,4,3	Op > 
185:     LD  4,-4(1)	Load left into ac1 
186:    AND  3,4,3	Op AND 
187:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
188:    LDA  1,-2(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-173(7)	CALL outputb
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
192:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
193:    LDC  3,3(6)	Load integer constant 
194:    RND  3,3,6	Op ? 
195:     ST  3,-4(1)	Save left side 
196:    LDC  3,0(6)	Load integer constant 
197:     LD  4,-4(1)	Load left into ac1 
198:    TGT  3,4,3	Op > 
199:     ST  3,-4(1)	Save left side 
200:    LDC  3,3(6)	Load integer constant 
201:    RND  3,3,6	Op ? 
202:     ST  3,-5(1)	Save left side 
203:    LDC  3,0(6)	Load integer constant 
204:     LD  4,-5(1)	Load left into ac1 
205:    TGT  3,4,3	Op > 
206:     LD  4,-4(1)	Load left into ac1 
207:     OR  3,4,3	Op OR 
208:     ST  3,-4(1)	Save left side 
209:    LDC  3,3(6)	Load integer constant 
210:    RND  3,3,6	Op ? 
211:     ST  3,-5(1)	Save left side 
212:    LDC  3,0(6)	Load integer constant 
213:     LD  4,-5(1)	Load left into ac1 
214:    TGT  3,4,3	Op > 
215:     LD  4,-4(1)	Load left into ac1 
216:     OR  3,4,3	Op OR 
217:     ST  3,-4(1)	Save left side 
218:    LDC  3,3(6)	Load integer constant 
219:    RND  3,3,6	Op ? 
220:     ST  3,-5(1)	Save left side 
221:    LDC  3,0(6)	Load integer constant 
222:     LD  4,-5(1)	Load left into ac1 
223:    TGT  3,4,3	Op > 
224:     LD  4,-4(1)	Load left into ac1 
225:     OR  3,4,3	Op OR 
226:     ST  3,-4(1)	Save left side 
227:    LDC  3,3(6)	Load integer constant 
228:    RND  3,3,6	Op ? 
229:     ST  3,-5(1)	Save left side 
230:    LDC  3,0(6)	Load integer constant 
231:     LD  4,-5(1)	Load left into ac1 
232:    TGT  3,4,3	Op > 
233:     LD  4,-4(1)	Load left into ac1 
234:     OR  3,4,3	Op OR 
235:     ST  3,-4(1)	Save left side 
236:    LDC  3,3(6)	Load integer constant 
237:    RND  3,3,6	Op ? 
238:     ST  3,-5(1)	Save left side 
239:    LDC  3,0(6)	Load integer constant 
240:     LD  4,-5(1)	Load left into ac1 
241:    TGT  3,4,3	Op > 
242:     LD  4,-4(1)	Load left into ac1 
243:     OR  3,4,3	Op OR 
244:     ST  3,-4(1)	Save left side 
245:    LDC  3,3(6)	Load integer constant 
246:    RND  3,3,6	Op ? 
247:     ST  3,-5(1)	Save left side 
248:    LDC  3,0(6)	Load integer constant 
249:     LD  4,-5(1)	Load left into ac1 
250:    TGT  3,4,3	Op > 
251:     LD  4,-4(1)	Load left into ac1 
252:     OR  3,4,3	Op OR 
253:     ST  3,-4(1)	Save left side 
254:    LDC  3,3(6)	Load integer constant 
255:    RND  3,3,6	Op ? 
256:     ST  3,-5(1)	Save left side 
257:    LDC  3,0(6)	Load integer constant 
258:     LD  4,-5(1)	Load left into ac1 
259:    TGT  3,4,3	Op > 
260:     LD  4,-4(1)	Load left into ac1 
261:     OR  3,4,3	Op OR 
262:     ST  3,-4(1)	Save left side 
263:    LDC  3,3(6)	Load integer constant 
264:    RND  3,3,6	Op ? 
265:     ST  3,-5(1)	Save left side 
266:    LDC  3,0(6)	Load integer constant 
267:     LD  4,-5(1)	Load left into ac1 
268:    TGT  3,4,3	Op > 
269:     LD  4,-4(1)	Load left into ac1 
270:     OR  3,4,3	Op OR 
271:     ST  3,-4(1)	Save left side 
272:    LDC  3,3(6)	Load integer constant 
273:    RND  3,3,6	Op ? 
274:     ST  3,-5(1)	Save left side 
275:    LDC  3,0(6)	Load integer constant 
276:     LD  4,-5(1)	Load left into ac1 
277:    TGT  3,4,3	Op > 
278:     LD  4,-4(1)	Load left into ac1 
279:     OR  3,4,3	Op OR 
280:     ST  3,-4(1)	Save left side 
281:    LDC  3,3(6)	Load integer constant 
282:    RND  3,3,6	Op ? 
283:     ST  3,-5(1)	Save left side 
284:    LDC  3,0(6)	Load integer constant 
285:     LD  4,-5(1)	Load left into ac1 
286:    TGT  3,4,3	Op > 
287:     LD  4,-4(1)	Load left into ac1 
288:     OR  3,4,3	Op OR 
289:     ST  3,-4(1)	Save left side 
290:    LDC  3,3(6)	Load integer constant 
291:    RND  3,3,6	Op ? 
292:     ST  3,-5(1)	Save left side 
293:    LDC  3,0(6)	Load integer constant 
294:     LD  4,-5(1)	Load left into ac1 
295:    TGT  3,4,3	Op > 
296:     LD  4,-4(1)	Load left into ac1 
297:     OR  3,4,3	Op OR 
298:     ST  3,-4(1)	Save left side 
299:    LDC  3,3(6)	Load integer constant 
300:    RND  3,3,6	Op ? 
301:     ST  3,-5(1)	Save left side 
302:    LDC  3,0(6)	Load integer constant 
303:     LD  4,-5(1)	Load left into ac1 
304:    TGT  3,4,3	Op > 
305:     LD  4,-4(1)	Load left into ac1 
306:     OR  3,4,3	Op OR 
307:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
308:    LDA  1,-2(1)	Load address of new frame 
309:    LDA  3,1(7)	Return address in ac 
310:    LDA  7,-293(7)	CALL outputb
311:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
312:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
313:    LDA  1,-2(1)	Load address of new frame 
314:    LDA  3,1(7)	Return address in ac 
315:    LDA  7,-279(7)	CALL outnl
316:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
317:    LDC  2,0(6)	Set return value to 0 
318:     LD  3,-1(1)	Load return address 
319:     LD  1,0(1)	Adjust fp 
320:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,320(7)	Jump to init [backpatch] 
* INIT
321:     LD  0,0(0)	Set the global pointer 
322:    LDA  1,0(0)	set first frame at end of globals 
323:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
324:    LDA  3,1(7)	Return address in ac 
325:    LDA  7,-284(7)	Jump to main 
326:   HALT  0,0,0	DONE! 
* END INIT
