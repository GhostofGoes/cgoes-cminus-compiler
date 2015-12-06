* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  init.c-
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
 43:    LDC  3,666(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
 45:    LDC  3,97(6)	Load char constant 
 46:     ST  3,-3(1)	Store variable y
 47:    LDC  3,1(6)	Load Boolean constant 
 48:     ST  3,-4(1)	Store variable ba
 49:    LDC  3,1(6)	Load Boolean constant 
 50:     ST  3,-20(1)	Save left side 
 51:    LDC  3,0(6)	Load Boolean constant 
 52:    LDC  4,1(6)	Load 1 
 53:    XOR  3,3,4	Op NOT 
 54:     LD  4,-20(1)	Load left into ac1 
 55:    AND  3,4,3	Op AND 
 56:     ST  3,-5(1)	Store variable bb
 57:    LDC  3,5(6)	Load integer constant 
 58:     ST  3,-20(1)	Save left side 
 59:    LDC  3,4(6)	Load integer constant 
 60:     LD  4,-20(1)	Load left into ac1 
 61:    TGT  3,4,3	Op > 
 62:     ST  3,-6(1)	Store variable bc
 63:    LDC  3,10(6)	load size of array x
 64:     ST  3,-7(1)	save size of array x
 65:    LDC  3,4(6)	Load integer constant 
 66:     ST  3,-20(1)	Save left side 
 67:    LDC  3,5(6)	Load integer constant 
 68:     LD  4,-20(1)	Load left into ac1 
 69:    MUL  3,4,3	Op * 
 70:     ST  3,-20(1)	Save left side 
 71:    LDC  3,3(6)	Load integer constant 
 72:     ST  3,-21(1)	Save left side 
 73:    LDC  3,2(6)	Load integer constant 
 74:     LD  4,-21(1)	Load left into ac1 
 75:    MUL  3,4,3	Op * 
 76:     LD  4,-20(1)	Load left into ac1 
 77:    ADD  3,4,3	Op + 
 78:     ST  3,-18(1)	Store variable k
 79:    LDC  3,46(6)	Load integer constant 
 80:    LDC  4,0(6)	Load 0 
 81:    SUB  3,4,3	Op unary - 
 82:     ST  3,-19(1)	Store variable l
* EXPRESSION
*                       Begin call to  output
 83:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
 84:     LD  3,0(0)	Load variable ga
 85:     ST  3,-22(1)	Store parameter 
*                       Jump to output
 86:    LDA  1,-20(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-83(7)	CALL output
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 90:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
 91:    LDA  1,-20(1)	Load address of new frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-57(7)	CALL outnl
 94:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
 95:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
 96:     LD  3,-1(0)	Load variable gb
 97:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
 98:    LDA  1,-20(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-83(7)	CALL outputb
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
102:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
103:    LDA  1,-20(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-69(7)	CALL outnl
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
107:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
108:    LDA  3,-3(0)	Load address of base of array gc
109:     LD  3,1(3)	Load array size 
110:     ST  3,-22(1)	Store parameter 
*                       Jump to output
111:    LDA  1,-20(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-108(7)	CALL output
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
115:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
116:    LDA  1,-20(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-82(7)	CALL outnl
119:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
120:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
121:     LD  3,-2(1)	Load variable i
122:     ST  3,-22(1)	Store parameter 
*                       Jump to output
123:    LDA  1,-20(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-120(7)	CALL output
126:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
127:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
128:    LDA  1,-20(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-94(7)	CALL outnl
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputc
132:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
133:     LD  3,-3(1)	Load variable y
134:     ST  3,-22(1)	Store parameter 
*                       Jump to outputc
135:    LDA  1,-20(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-108(7)	CALL outputc
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputc
* EXPRESSION
*                       Begin call to  outnl
139:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
140:    LDA  1,-20(1)	Load address of new frame 
141:    LDA  3,1(7)	Return address in ac 
142:    LDA  7,-106(7)	CALL outnl
143:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
144:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
145:     LD  3,-4(1)	Load variable ba
146:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
147:    LDA  1,-20(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-132(7)	CALL outputb
150:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
151:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
152:    LDA  1,-20(1)	Load address of new frame 
153:    LDA  3,1(7)	Return address in ac 
154:    LDA  7,-118(7)	CALL outnl
155:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
156:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
157:     LD  3,-5(1)	Load variable bb
158:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
159:    LDA  1,-20(1)	Load address of new frame 
160:    LDA  3,1(7)	Return address in ac 
161:    LDA  7,-144(7)	CALL outputb
162:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
163:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
164:    LDA  1,-20(1)	Load address of new frame 
165:    LDA  3,1(7)	Return address in ac 
166:    LDA  7,-130(7)	CALL outnl
167:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
168:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
169:     LD  3,-6(1)	Load variable bc
170:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
171:    LDA  1,-20(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-156(7)	CALL outputb
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
175:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
176:    LDA  1,-20(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-142(7)	CALL outnl
179:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
180:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
181:    LDA  3,-8(1)	Load address of base of array x
182:     LD  3,1(3)	Load array size 
183:     ST  3,-22(1)	Store parameter 
*                       Jump to output
184:    LDA  1,-20(1)	Load address of new frame 
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-181(7)	CALL output
187:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
188:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
189:    LDA  1,-20(1)	Load address of new frame 
190:    LDA  3,1(7)	Return address in ac 
191:    LDA  7,-155(7)	CALL outnl
192:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
193:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
194:     LD  3,-18(1)	Load variable k
195:     ST  3,-22(1)	Store parameter 
*                       Jump to output
196:    LDA  1,-20(1)	Load address of new frame 
197:    LDA  3,1(7)	Return address in ac 
198:    LDA  7,-193(7)	CALL output
199:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
200:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
201:    LDA  1,-20(1)	Load address of new frame 
202:    LDA  3,1(7)	Return address in ac 
203:    LDA  7,-167(7)	CALL outnl
204:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
205:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
206:     LD  3,-19(1)	Load variable l
207:     ST  3,-22(1)	Store parameter 
*                       Jump to output
208:    LDA  1,-20(1)	Load address of new frame 
209:    LDA  3,1(7)	Return address in ac 
210:    LDA  7,-205(7)	CALL output
211:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
212:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
213:    LDA  1,-20(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-179(7)	CALL outnl
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
217:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
218:     LD  3,-16(0)	Load variable sia
219:     ST  3,-22(1)	Store parameter 
*                       Jump to output
220:    LDA  1,-20(1)	Load address of new frame 
221:    LDA  3,1(7)	Return address in ac 
222:    LDA  7,-217(7)	CALL output
223:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
224:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
225:    LDA  1,-20(1)	Load address of new frame 
226:    LDA  3,1(7)	Return address in ac 
227:    LDA  7,-191(7)	CALL outnl
228:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
229:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
230:    LDA  3,-18(0)	Load address of base of array sib
231:     LD  3,1(3)	Load array size 
232:     ST  3,-22(1)	Store parameter 
*                       Jump to output
233:    LDA  1,-20(1)	Load address of new frame 
234:    LDA  3,1(7)	Return address in ac 
235:    LDA  7,-230(7)	CALL output
236:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
237:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
238:    LDA  1,-20(1)	Load address of new frame 
239:    LDA  3,1(7)	Return address in ac 
240:    LDA  7,-204(7)	CALL outnl
241:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* COMPOUND
242:    LDC  3,20(6)	load size of array y
243:     ST  3,-20(1)	save size of array y
244:    LDC  3,1(6)	Load Boolean constant 
245:    LDC  4,1(6)	Load 1 
246:    XOR  3,3,4	Op NOT 
247:     ST  3,-41(1)	Store variable t
* EXPRESSION
*                       Begin call to  output
248:     ST  1,-42(1)	Store old fp in ghost frame 
*                       Load param 1
249:    LDA  3,-21(1)	Load address of base of array y
250:     LD  3,1(3)	Load array size 
251:     ST  3,-44(1)	Store parameter 
*                       Jump to output
252:    LDA  1,-42(1)	Load address of new frame 
253:    LDA  3,1(7)	Return address in ac 
254:    LDA  7,-249(7)	CALL output
255:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
256:     ST  1,-42(1)	Store old fp in ghost frame 
*                       Jump to outnl
257:    LDA  1,-42(1)	Load address of new frame 
258:    LDA  3,1(7)	Return address in ac 
259:    LDA  7,-223(7)	CALL outnl
260:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
261:     ST  1,-42(1)	Store old fp in ghost frame 
*                       Load param 1
262:     LD  3,-41(1)	Load variable t
263:     ST  3,-44(1)	Store parameter 
*                       Jump to outputb
264:    LDA  1,-42(1)	Load address of new frame 
265:    LDA  3,1(7)	Return address in ac 
266:    LDA  7,-249(7)	CALL outputb
267:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
268:     ST  1,-42(1)	Store old fp in ghost frame 
*                       Jump to outnl
269:    LDA  1,-42(1)	Load address of new frame 
270:    LDA  3,1(7)	Return address in ac 
271:    LDA  7,-235(7)	CALL outnl
272:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
273:    LDC  2,0(6)	Set return value to 0 
274:     LD  3,-1(1)	Load return address 
275:     LD  1,0(1)	Adjust fp 
276:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,276(7)	Jump to init [backpatch] 
* INIT
277:     LD  0,0(0)	Set the global pointer 
278:    LDA  1,-33(0)	set first frame at end of globals 
279:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
280:    LDC  3,111(6)	Load integer constant 
281:     ST  3,0(0)	Store variable ga
282:    LDC  3,1(6)	Load Boolean constant 
283:     ST  3,-1(0)	Store variable gb
284:    LDC  3,13(6)	load size of array gc
285:     ST  3,-2(0)	save size of array gc
286:    LDC  3,666(6)	Load integer constant 
287:     ST  3,-16(0)	Store variable sia-1
288:    LDC  3,15(6)	load size of array sib-2
289:     ST  3,-17(0)	save size of array sib-2
* END INIT GLOBALS AND STATICS
290:    LDA  3,1(7)	Return address in ac 
291:    LDA  7,-250(7)	Jump to main 
292:   HALT  0,0,0	DONE! 
* END INIT
