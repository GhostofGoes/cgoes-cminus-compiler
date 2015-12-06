* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  permlist.c-
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
* FUNCTION put
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,1(6)	Load integer constant 
 44:     LD  4,-2(1)	Load address of base of array p
 45:    SUB  3,4,3	Compute offset of value 
 46:     LD  3,0(3)	Load the value 
 47:     ST  3,-4(1)	Store variable sum
* EXPRESSION
 48:    LDC  3,2(6)	Load integer constant 
 49:     ST  3,-3(1)	Store variable j
* WHILE
 50:     LD  3,-3(1)	Load variable j
 51:     ST  3,-5(1)	Save left side 
 52:     LD  3,0(0)	Load variable n
 53:     LD  4,-5(1)	Load left into ac1 
 54:    TLE  3,4,3	Op <= 
 55:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 57:     LD  3,-4(1)	Load variable sum
 58:     ST  3,-5(1)	Save left side 
 59:    LDC  3,10(6)	Load integer constant 
 60:     LD  4,-5(1)	Load left into ac1 
 61:    MUL  3,4,3	Op * 
 62:     ST  3,-5(1)	Save left side 
 63:     LD  3,-3(1)	Load variable j
 64:     LD  4,-2(1)	Load address of base of array p
 65:    SUB  3,4,3	Compute offset of value 
 66:     LD  3,0(3)	Load the value 
 67:     LD  4,-5(1)	Load left into ac1 
 68:    ADD  3,4,3	Op + 
 69:     ST  3,-4(1)	Store variable sum
* EXPRESSION
 70:     LD  3,-3(1)	Load variable j
 71:     ST  3,-5(1)	Save left side 
 72:    LDC  3,1(6)	Load integer constant 
 73:     LD  4,-5(1)	Load left into ac1 
 74:    ADD  3,4,3	Op + 
 75:     ST  3,-3(1)	Store variable j
* END COMPOUND
 76:    LDA  7,-27(7)	go to beginning of loop 
 56:    LDA  7,20(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
 77:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 78:     LD  3,-4(1)	Load variable sum
 79:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 80:    LDA  1,-5(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-77(7)	CALL output
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 84:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
 85:    LDA  1,-5(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-51(7)	CALL outnl
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6)	Set return value to 0 
 90:     LD  3,-1(1)	Load return address 
 91:     LD  1,0(1)	Adjust fp 
 92:    LDA  7,0(3)	Return 
* END FUNCTION put
* FUNCTION main
 93:     ST  3,-1(1)	Store return address. 
* COMPOUND
 94:    LDC  3,20(6)	load size of array p
 95:     ST  3,-2(1)	save size of array p
* EXPRESSION
*                       Begin call to  input
 96:     ST  1,-25(1)	Store old fp in ghost frame 
*                       Jump to input
 97:    LDA  1,-25(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-99(7)	CALL input
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
101:     ST  3,0(0)	Store variable n
* EXPRESSION
102:    LDC  3,0(6)	Load integer constant 
103:     ST  3,-24(1)	Store variable j
* WHILE
104:     LD  3,-24(1)	Load variable j
105:     ST  3,-25(1)	Save left side 
106:     LD  3,0(0)	Load variable n
107:     LD  4,-25(1)	Load left into ac1 
108:    TLE  3,4,3	Op <= 
109:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
111:     LD  3,-24(1)	Load variable j
112:     ST  3,-25(1)	Save index 
113:     LD  3,-24(1)	Load variable j
114:     LD  4,-25(1)	Restore index 
115:    LDA  5,-3(1)	Load address of base of array p
116:    SUB  5,5,4	Compute offset of value 
117:     ST  3,0(5)	Store variable p
* EXPRESSION
118:     LD  3,-24(1)	Load variable j
119:     ST  3,-25(1)	Save left side 
120:    LDC  3,1(6)	Load integer constant 
121:     LD  4,-25(1)	Load left into ac1 
122:    ADD  3,4,3	Op + 
123:     ST  3,-24(1)	Store variable j
* END COMPOUND
124:    LDA  7,-21(7)	go to beginning of loop 
110:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
125:    LDC  3,1(6)	Load integer constant 
126:     ST  3,-23(1)	Store variable i
* WHILE
127:     LD  3,-23(1)	Load variable i
128:     ST  3,-25(1)	Save left side 
129:    LDC  3,0(6)	Load integer constant 
130:     LD  4,-25(1)	Load left into ac1 
131:    TGT  3,4,3	Op > 
132:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  put
134:     ST  1,-28(1)	Store old fp in ghost frame 
*                       Load param 1
135:    LDA  3,-3(1)	Load address of base of array p
136:     ST  3,-30(1)	Store parameter 
*                       Jump to put
137:    LDA  1,-28(1)	Load address of new frame 
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-98(7)	CALL put
140:    LDA  3,0(2)	Save the result in ac 
*                       End call to put
* EXPRESSION
141:     LD  3,0(0)	Load variable n
142:     ST  3,-28(1)	Save left side 
143:    LDC  3,1(6)	Load integer constant 
144:     LD  4,-28(1)	Load left into ac1 
145:    SUB  3,4,3	Op - 
146:     ST  3,-23(1)	Store variable i
* WHILE
147:     LD  3,-23(1)	Load variable i
148:    LDA  4,-3(1)	Load address of base of array p
149:    SUB  3,4,3	Compute offset of value 
150:     LD  3,0(3)	Load the value 
151:     ST  3,-28(1)	Save left side 
152:     LD  3,-23(1)	Load variable i
153:     ST  3,-29(1)	Save left side 
154:    LDC  3,1(6)	Load integer constant 
155:     LD  4,-29(1)	Load left into ac1 
156:    ADD  3,4,3	Op + 
157:    LDA  4,-3(1)	Load address of base of array p
158:    SUB  3,4,3	Compute offset of value 
159:     LD  3,0(3)	Load the value 
160:     LD  4,-28(1)	Load left into ac1 
161:    TGT  3,4,3	Op > 
162:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
164:     LD  3,-23(1)	Load variable i
165:     ST  3,-28(1)	Save left side 
166:    LDC  3,1(6)	Load integer constant 
167:     LD  4,-28(1)	Load left into ac1 
168:    SUB  3,4,3	Op - 
169:     ST  3,-23(1)	Store variable i
170:    LDA  7,-24(7)	go to beginning of loop 
163:    LDA  7,7(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
171:     LD  3,0(0)	Load variable n
172:     ST  3,-24(1)	Store variable j
* WHILE
173:     LD  3,-23(1)	Load variable i
174:    LDA  4,-3(1)	Load address of base of array p
175:    SUB  3,4,3	Compute offset of value 
176:     LD  3,0(3)	Load the value 
177:     ST  3,-28(1)	Save left side 
178:     LD  3,-24(1)	Load variable j
179:    LDA  4,-3(1)	Load address of base of array p
180:    SUB  3,4,3	Compute offset of value 
181:     LD  3,0(3)	Load the value 
182:     LD  4,-28(1)	Load left into ac1 
183:    TGT  3,4,3	Op > 
184:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
186:     LD  3,-24(1)	Load variable j
187:     ST  3,-28(1)	Save left side 
188:    LDC  3,1(6)	Load integer constant 
189:     LD  4,-28(1)	Load left into ac1 
190:    SUB  3,4,3	Op - 
191:     ST  3,-24(1)	Store variable j
192:    LDA  7,-20(7)	go to beginning of loop 
185:    LDA  7,7(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
193:     LD  3,-23(1)	Load variable i
194:    LDA  4,-3(1)	Load address of base of array p
195:    SUB  3,4,3	Compute offset of value 
196:     LD  3,0(3)	Load the value 
197:     ST  3,-27(1)	Store variable tmp
* EXPRESSION
198:     LD  3,-23(1)	Load variable i
199:     ST  3,-28(1)	Save index 
200:     LD  3,-24(1)	Load variable j
201:    LDA  4,-3(1)	Load address of base of array p
202:    SUB  3,4,3	Compute offset of value 
203:     LD  3,0(3)	Load the value 
204:     LD  4,-28(1)	Restore index 
205:    LDA  5,-3(1)	Load address of base of array p
206:    SUB  5,5,4	Compute offset of value 
207:     ST  3,0(5)	Store variable p
* EXPRESSION
208:     LD  3,-24(1)	Load variable j
209:     ST  3,-28(1)	Save index 
210:     LD  3,-27(1)	Load variable tmp
211:     LD  4,-28(1)	Restore index 
212:    LDA  5,-3(1)	Load address of base of array p
213:    SUB  5,5,4	Compute offset of value 
214:     ST  3,0(5)	Store variable p
* EXPRESSION
215:     LD  3,0(0)	Load variable n
216:     ST  3,-25(1)	Store variable r
* EXPRESSION
217:     LD  3,-23(1)	Load variable i
218:     ST  3,-28(1)	Save left side 
219:    LDC  3,1(6)	Load integer constant 
220:     LD  4,-28(1)	Load left into ac1 
221:    ADD  3,4,3	Op + 
222:     ST  3,-26(1)	Store variable s
* WHILE
223:     LD  3,-25(1)	Load variable r
224:     ST  3,-28(1)	Save left side 
225:     LD  3,-26(1)	Load variable s
226:     LD  4,-28(1)	Load left into ac1 
227:    TGT  3,4,3	Op > 
228:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
230:     LD  3,-25(1)	Load variable r
231:    LDA  4,-3(1)	Load address of base of array p
232:    SUB  3,4,3	Compute offset of value 
233:     LD  3,0(3)	Load the value 
234:     ST  3,-27(1)	Store variable tmp
* EXPRESSION
235:     LD  3,-25(1)	Load variable r
236:     ST  3,-28(1)	Save index 
237:     LD  3,-26(1)	Load variable s
238:    LDA  4,-3(1)	Load address of base of array p
239:    SUB  3,4,3	Compute offset of value 
240:     LD  3,0(3)	Load the value 
241:     LD  4,-28(1)	Restore index 
242:    LDA  5,-3(1)	Load address of base of array p
243:    SUB  5,5,4	Compute offset of value 
244:     ST  3,0(5)	Store variable p
* EXPRESSION
245:     LD  3,-26(1)	Load variable s
246:     ST  3,-28(1)	Save index 
247:     LD  3,-27(1)	Load variable tmp
248:     LD  4,-28(1)	Restore index 
249:    LDA  5,-3(1)	Load address of base of array p
250:    SUB  5,5,4	Compute offset of value 
251:     ST  3,0(5)	Store variable p
* EXPRESSION
252:     LD  3,-25(1)	Load variable r
253:     ST  3,-28(1)	Save left side 
254:    LDC  3,1(6)	Load integer constant 
255:     LD  4,-28(1)	Load left into ac1 
256:    SUB  3,4,3	Op - 
257:     ST  3,-25(1)	Store variable r
* EXPRESSION
258:     LD  3,-26(1)	Load variable s
259:     ST  3,-28(1)	Save left side 
260:    LDC  3,1(6)	Load integer constant 
261:     LD  4,-28(1)	Load left into ac1 
262:    ADD  3,4,3	Op + 
263:     ST  3,-26(1)	Store variable s
* END COMPOUND
264:    LDA  7,-42(7)	go to beginning of loop 
229:    LDA  7,35(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
265:    LDA  7,-139(7)	go to beginning of loop 
133:    LDA  7,132(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
266:    LDC  2,0(6)	Set return value to 0 
267:     LD  3,-1(1)	Load return address 
268:     LD  1,0(1)	Adjust fp 
269:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,269(7)	Jump to init [backpatch] 
* INIT
270:     LD  0,0(0)	Set the global pointer 
271:    LDA  1,-1(0)	set first frame at end of globals 
272:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
273:    LDA  3,1(7)	Return address in ac 
274:    LDA  7,-182(7)	Jump to main 
275:   HALT  0,0,0	DONE! 
* END INIT
