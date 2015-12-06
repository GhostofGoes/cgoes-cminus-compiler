* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  var.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable x
 45:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-4(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 50:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 51:    LDC  3,3(6)	Load integer constant 
 52:     LD  4,-3(1)	Load address of base of array xa
 53:    SUB  3,4,3	Compute offset of value 
 54:     LD  3,0(3)	Load the value 
 55:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 56:    LDA  1,-4(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-53(7)	CALL output
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 60:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 61:    LDA  1,-4(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-27(7)	CALL outnl
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 65:    LDC  2,0(6)	Set return value to 0 
 66:     LD  3,-1(1)	Load return address 
 67:     LD  1,0(1)	Adjust fp 
 68:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION dog
 69:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 70:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 71:     LD  3,-2(1)	Load variable x
 72:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 73:    LDA  1,-4(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 77:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 78:    LDC  3,3(6)	Load integer constant 
 79:     LD  4,-3(1)	Load address of base of array xa
 80:    SUB  3,4,3	Compute offset of value 
 81:     LD  3,0(3)	Load the value 
 82:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 83:    LDA  1,-4(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 87:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 88:    LDA  1,-4(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-54(7)	CALL outnl
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 92:    LDC  3,668(6)	Load integer constant 
 93:     ST  3,-2(1)	Store variable x
* EXPRESSION
 94:    LDC  3,1(6)	Load integer constant 
 95:     ST  3,-4(1)	Save left side 
 96:    LDC  3,2(6)	Load integer constant 
 97:     LD  4,-4(1)	Load left into ac1 
 98:    ADD  3,4,3	Op + 
 99:     ST  3,-4(1)	Save index 
100:    LDC  3,669(6)	Load integer constant 
101:     LD  4,-4(1)	Restore index 
102:     LD  5,-3(1)	Load address of base of array xa
103:    SUB  5,5,4	Compute offset of value 
104:     ST  3,0(5)	Store variable xa
* EXPRESSION
*                       Begin call to  output
105:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
106:     LD  3,-2(1)	Load variable x
107:     ST  3,-6(1)	Store parameter 
*                       Jump to output
108:    LDA  1,-4(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-105(7)	CALL output
111:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
112:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
113:    LDC  3,3(6)	Load integer constant 
114:     LD  4,-3(1)	Load address of base of array xa
115:    SUB  3,4,3	Compute offset of value 
116:     LD  3,0(3)	Load the value 
117:     ST  3,-6(1)	Store parameter 
*                       Jump to output
118:    LDA  1,-4(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-115(7)	CALL output
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
122:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
123:    LDA  1,-4(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-89(7)	CALL outnl
126:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
127:    LDC  3,670(6)	Load integer constant 
128:     ST  3,0(0)	Store variable g
* EXPRESSION
129:    LDC  3,2(6)	Load integer constant 
130:     ST  3,-4(1)	Save left side 
131:    LDC  3,1(6)	Load integer constant 
132:     LD  4,-4(1)	Load left into ac1 
133:    ADD  3,4,3	Op + 
134:     ST  3,-4(1)	Save index 
135:    LDC  3,671(6)	Load integer constant 
136:     LD  4,-4(1)	Restore index 
137:    LDA  5,-2(0)	Load address of base of array ga
138:    SUB  5,5,4	Compute offset of value 
139:     ST  3,0(5)	Store variable ga
* EXPRESSION
*                       Begin call to  output
140:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
141:     LD  3,0(0)	Load variable g
142:     ST  3,-6(1)	Store parameter 
*                       Jump to output
143:    LDA  1,-4(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-140(7)	CALL output
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
147:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
148:    LDC  3,3(6)	Load integer constant 
149:    LDA  4,-2(0)	Load address of base of array ga
150:    SUB  3,4,3	Compute offset of value 
151:     LD  3,0(3)	Load the value 
152:     ST  3,-6(1)	Store parameter 
*                       Jump to output
153:    LDA  1,-4(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-150(7)	CALL output
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
157:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
158:    LDA  1,-4(1)	Load address of new frame 
159:    LDA  3,1(7)	Return address in ac 
160:    LDA  7,-124(7)	CALL outnl
161:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  cat
162:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
163:     LD  3,-2(1)	Load variable x
164:     ST  3,-6(1)	Store parameter 
*                       Load param 2
165:     LD  3,-3(1)	Load address of base of array xa
166:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
167:    LDA  1,-4(1)	Load address of new frame 
168:    LDA  3,1(7)	Return address in ac 
169:    LDA  7,-128(7)	CALL cat
170:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  cat
171:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
172:     LD  3,0(0)	Load variable g
173:     ST  3,-6(1)	Store parameter 
*                       Load param 2
174:    LDA  3,-2(0)	Load address of base of array ga
175:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
176:    LDA  1,-4(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-137(7)	CALL cat
179:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
180:    LDC  2,0(6)	Set return value to 0 
181:     LD  3,-1(1)	Load return address 
182:     LD  1,0(1)	Adjust fp 
183:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION main
184:     ST  3,-1(1)	Store return address. 
* COMPOUND
185:    LDC  3,10(6)	load size of array ya
186:     ST  3,-3(1)	save size of array ya
* EXPRESSION
187:    LDC  3,666(6)	Load integer constant 
188:     ST  3,-2(1)	Store variable y
* EXPRESSION
189:    LDC  3,1(6)	Load integer constant 
190:     ST  3,-14(1)	Save left side 
191:    LDC  3,2(6)	Load integer constant 
192:     LD  4,-14(1)	Load left into ac1 
193:    ADD  3,4,3	Op + 
194:     ST  3,-14(1)	Save index 
195:    LDC  3,667(6)	Load integer constant 
196:     LD  4,-14(1)	Restore index 
197:    LDA  5,-4(1)	Load address of base of array ya
198:    SUB  5,5,4	Compute offset of value 
199:     ST  3,0(5)	Store variable ya
* EXPRESSION
*                       Begin call to  output
200:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
201:     LD  3,-2(1)	Load variable y
202:     ST  3,-16(1)	Store parameter 
*                       Jump to output
203:    LDA  1,-14(1)	Load address of new frame 
204:    LDA  3,1(7)	Return address in ac 
205:    LDA  7,-200(7)	CALL output
206:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
207:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
208:    LDC  3,3(6)	Load integer constant 
209:    LDA  4,-4(1)	Load address of base of array ya
210:    SUB  3,4,3	Compute offset of value 
211:     LD  3,0(3)	Load the value 
212:     ST  3,-16(1)	Store parameter 
*                       Jump to output
213:    LDA  1,-14(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-210(7)	CALL output
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
217:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
218:    LDA  1,-14(1)	Load address of new frame 
219:    LDA  3,1(7)	Return address in ac 
220:    LDA  7,-184(7)	CALL outnl
221:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  dog
222:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
223:     LD  3,-2(1)	Load variable y
224:     ST  3,-16(1)	Store parameter 
*                       Load param 2
225:    LDA  3,-4(1)	Load address of base of array ya
226:     ST  3,-17(1)	Store parameter 
*                       Jump to dog
227:    LDA  1,-14(1)	Load address of new frame 
228:    LDA  3,1(7)	Return address in ac 
229:    LDA  7,-161(7)	CALL dog
230:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
231:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
232:     LD  3,-2(1)	Load variable y
233:     ST  3,-16(1)	Store parameter 
*                       Jump to output
234:    LDA  1,-14(1)	Load address of new frame 
235:    LDA  3,1(7)	Return address in ac 
236:    LDA  7,-231(7)	CALL output
237:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
238:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
239:    LDC  3,3(6)	Load integer constant 
240:    LDA  4,-4(1)	Load address of base of array ya
241:    SUB  3,4,3	Compute offset of value 
242:     LD  3,0(3)	Load the value 
243:     ST  3,-16(1)	Store parameter 
*                       Jump to output
244:    LDA  1,-14(1)	Load address of new frame 
245:    LDA  3,1(7)	Return address in ac 
246:    LDA  7,-241(7)	CALL output
247:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
248:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
249:    LDA  1,-14(1)	Load address of new frame 
250:    LDA  3,1(7)	Return address in ac 
251:    LDA  7,-215(7)	CALL outnl
252:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
253:    LDC  2,0(6)	Set return value to 0 
254:     LD  3,-1(1)	Load return address 
255:     LD  1,0(1)	Adjust fp 
256:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,256(7)	Jump to init [backpatch] 
* INIT
257:     LD  0,0(0)	Set the global pointer 
258:    LDA  1,-12(0)	set first frame at end of globals 
259:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
260:    LDC  3,10(6)	load size of array ga
261:     ST  3,-1(0)	save size of array ga
* END INIT GLOBALS AND STATICS
262:    LDA  3,1(7)	Return address in ac 
263:    LDA  7,-80(7)	Jump to main 
264:   HALT  0,0,0	DONE! 
* END INIT
