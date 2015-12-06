* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  d04.c-
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
 43:    LDC  3,1(6)	Load Boolean constant 
 44:     ST  3,-2(1)	Store variable x
* EXPRESSION
 45:    LDC  3,0(6)	Load Boolean constant 
 46:     ST  3,-3(1)	Store variable y
* EXPRESSION
 47:    LDC  3,1(6)	Load Boolean constant 
 48:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  outputb
 49:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 50:     LD  3,-2(1)	Load variable x
 51:     ST  3,-7(1)	Save left side 
 52:     LD  3,-3(1)	Load variable y
 53:     ST  3,-8(1)	Save left side 
 54:     LD  3,-4(1)	Load variable z
 55:     LD  4,-8(1)	Load left into ac1 
 56:    AND  3,4,3	Op AND 
 57:     LD  4,-7(1)	Load left into ac1 
 58:     OR  3,4,3	Op OR 
 59:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
 60:    LDA  1,-5(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-45(7)	CALL outputb
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 64:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 65:     LD  3,-2(1)	Load variable x
 66:     ST  3,-7(1)	Save left side 
 67:     LD  3,-3(1)	Load variable y
 68:     LD  4,-7(1)	Load left into ac1 
 69:    AND  3,4,3	Op AND 
 70:     ST  3,-7(1)	Save left side 
 71:     LD  3,-4(1)	Load variable z
 72:     LD  4,-7(1)	Load left into ac1 
 73:     OR  3,4,3	Op OR 
 74:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
 75:    LDA  1,-5(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-60(7)	CALL outputb
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 79:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 80:     LD  3,-2(1)	Load variable x
 81:     ST  3,-7(1)	Save left side 
 82:     LD  3,-3(1)	Load variable y
 83:     LD  4,-7(1)	Load left into ac1 
 84:    AND  3,4,3	Op AND 
 85:     ST  3,-7(1)	Save left side 
 86:     LD  3,-4(1)	Load variable z
 87:     ST  3,-8(1)	Save left side 
 88:     LD  3,-4(1)	Load variable z
 89:     LD  4,-8(1)	Load left into ac1 
 90:    AND  3,4,3	Op AND 
 91:     LD  4,-7(1)	Load left into ac1 
 92:     OR  3,4,3	Op OR 
 93:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
 94:    LDA  1,-5(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-79(7)	CALL outputb
 97:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 98:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 99:     LD  3,-2(1)	Load variable x
100:    LDC  4,1(6)	Load 1 
101:    XOR  3,3,4	Op NOT 
102:     ST  3,-7(1)	Save left side 
103:     LD  3,-3(1)	Load variable y
104:     ST  3,-8(1)	Save left side 
105:     LD  3,-4(1)	Load variable z
106:     LD  4,-8(1)	Load left into ac1 
107:    AND  3,4,3	Op AND 
108:     LD  4,-7(1)	Load left into ac1 
109:     OR  3,4,3	Op OR 
110:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
111:    LDA  1,-5(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-96(7)	CALL outputb
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
115:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
116:     LD  3,-2(1)	Load variable x
117:    LDC  4,1(6)	Load 1 
118:    XOR  3,3,4	Op NOT 
119:     ST  3,-7(1)	Save left side 
120:     LD  3,-3(1)	Load variable y
121:     LD  4,-7(1)	Load left into ac1 
122:    AND  3,4,3	Op AND 
123:     ST  3,-7(1)	Save left side 
124:     LD  3,-4(1)	Load variable z
125:     LD  4,-7(1)	Load left into ac1 
126:     OR  3,4,3	Op OR 
127:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
128:    LDA  1,-5(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-113(7)	CALL outputb
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
132:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
133:    LDA  1,-5(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-99(7)	CALL outnl
136:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
137:    LDC  3,1(6)	Load Boolean constant 
138:     ST  3,-2(1)	Store variable x
* EXPRESSION
139:    LDC  3,1(6)	Load Boolean constant 
140:     ST  3,-3(1)	Store variable y
* EXPRESSION
141:    LDC  3,0(6)	Load Boolean constant 
142:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  outputb
143:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
144:     LD  3,-2(1)	Load variable x
145:     ST  3,-7(1)	Save left side 
146:     LD  3,-3(1)	Load variable y
147:     ST  3,-8(1)	Save left side 
148:     LD  3,-4(1)	Load variable z
149:     LD  4,-8(1)	Load left into ac1 
150:    AND  3,4,3	Op AND 
151:     LD  4,-7(1)	Load left into ac1 
152:     OR  3,4,3	Op OR 
153:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
154:    LDA  1,-5(1)	Load address of new frame 
155:    LDA  3,1(7)	Return address in ac 
156:    LDA  7,-139(7)	CALL outputb
157:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
158:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
159:     LD  3,-2(1)	Load variable x
160:     ST  3,-7(1)	Save left side 
161:     LD  3,-3(1)	Load variable y
162:     LD  4,-7(1)	Load left into ac1 
163:    AND  3,4,3	Op AND 
164:     ST  3,-7(1)	Save left side 
165:     LD  3,-4(1)	Load variable z
166:     LD  4,-7(1)	Load left into ac1 
167:     OR  3,4,3	Op OR 
168:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
169:    LDA  1,-5(1)	Load address of new frame 
170:    LDA  3,1(7)	Return address in ac 
171:    LDA  7,-154(7)	CALL outputb
172:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
173:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
174:     LD  3,-2(1)	Load variable x
175:     ST  3,-7(1)	Save left side 
176:     LD  3,-3(1)	Load variable y
177:     LD  4,-7(1)	Load left into ac1 
178:    AND  3,4,3	Op AND 
179:     ST  3,-7(1)	Save left side 
180:     LD  3,-4(1)	Load variable z
181:     ST  3,-8(1)	Save left side 
182:     LD  3,-4(1)	Load variable z
183:     LD  4,-8(1)	Load left into ac1 
184:    AND  3,4,3	Op AND 
185:     LD  4,-7(1)	Load left into ac1 
186:     OR  3,4,3	Op OR 
187:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
188:    LDA  1,-5(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-173(7)	CALL outputb
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
192:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
193:     LD  3,-2(1)	Load variable x
194:    LDC  4,1(6)	Load 1 
195:    XOR  3,3,4	Op NOT 
196:     ST  3,-7(1)	Save left side 
197:     LD  3,-3(1)	Load variable y
198:     ST  3,-8(1)	Save left side 
199:     LD  3,-4(1)	Load variable z
200:     LD  4,-8(1)	Load left into ac1 
201:    AND  3,4,3	Op AND 
202:     LD  4,-7(1)	Load left into ac1 
203:     OR  3,4,3	Op OR 
204:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
205:    LDA  1,-5(1)	Load address of new frame 
206:    LDA  3,1(7)	Return address in ac 
207:    LDA  7,-190(7)	CALL outputb
208:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
209:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
210:     LD  3,-2(1)	Load variable x
211:    LDC  4,1(6)	Load 1 
212:    XOR  3,3,4	Op NOT 
213:     ST  3,-7(1)	Save left side 
214:     LD  3,-3(1)	Load variable y
215:     LD  4,-7(1)	Load left into ac1 
216:    AND  3,4,3	Op AND 
217:     ST  3,-7(1)	Save left side 
218:     LD  3,-4(1)	Load variable z
219:     LD  4,-7(1)	Load left into ac1 
220:     OR  3,4,3	Op OR 
221:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
222:    LDA  1,-5(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-207(7)	CALL outputb
225:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
226:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
227:    LDA  1,-5(1)	Load address of new frame 
228:    LDA  3,1(7)	Return address in ac 
229:    LDA  7,-193(7)	CALL outnl
230:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
231:    LDC  2,0(6)	Set return value to 0 
232:     LD  3,-1(1)	Load return address 
233:     LD  1,0(1)	Adjust fp 
234:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,234(7)	Jump to init [backpatch] 
* INIT
235:     LD  0,0(0)	Set the global pointer 
236:    LDA  1,0(0)	set first frame at end of globals 
237:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
238:    LDA  3,1(7)	Return address in ac 
239:    LDA  7,-198(7)	Jump to main 
240:   HALT  0,0,0	DONE! 
* END INIT
