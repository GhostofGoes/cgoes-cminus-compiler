* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  unary.c-
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
 43:    LDC  3,7(6)	load size of array a
 44:     ST  3,-4(1)	save size of array a
 45:    LDC  3,5(6)	load size of array b
 46:     ST  3,-12(1)	save size of array b
* EXPRESSION
 47:    LDC  3,88(6)	Load integer constant 
 48:     ST  3,-2(1)	Store variable x
* EXPRESSION
 49:     LD  3,-2(1)	Load variable x
 50:     ST  3,-18(1)	Save left side 
 51:    LDC  3,9(6)	Load integer constant 
 52:     LD  4,-18(1)	Load left into ac1 
 53:    SUB  3,4,3	Op - 
 54:     ST  3,-3(1)	Store variable y
* EXPRESSION
 55:     LD  3,-2(1)	Load variable x
 56:    LDC  4,0(6)	Load 0 
 57:    SUB  3,4,3	Op unary - 
 58:     ST  3,-3(1)	Store variable y
* EXPRESSION
*                       Begin call to  output
 59:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 60:     LD  3,-2(1)	Load variable x
 61:    LDC  4,0(6)	Load 0 
 62:    SUB  3,4,3	Op unary - 
 63:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 64:    LDA  1,-18(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 68:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 69:     LD  3,-3(1)	Load variable y
 70:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 71:    LDA  1,-18(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-68(7)	CALL output
 74:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 75:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Jump to outnl
 76:    LDA  1,-18(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-42(7)	CALL outnl
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 80:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 81:    LDC  3,3(6)	Load integer constant 
 82:    LDC  4,0(6)	Load 0 
 83:    SUB  3,4,3	Op unary - 
 84:    LDC  4,0(6)	Load 0 
 85:    SUB  3,4,3	Op unary - 
 86:     ST  3,-20(1)	Save left side 
 87:    LDC  3,5(6)	Load integer constant 
 88:    LDC  4,0(6)	Load 0 
 89:    SUB  3,4,3	Op unary - 
 90:     LD  4,-20(1)	Load left into ac1 
 91:    MUL  3,4,3	Op * 
 92:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-18(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 98:    LDC  3,3(6)	Load integer constant 
 99:    LDC  4,0(6)	Load 0 
100:    SUB  3,4,3	Op unary - 
101:    LDC  4,0(6)	Load 0 
102:    SUB  3,4,3	Op unary - 
103:     ST  3,-20(1)	Store parameter 
*                       Jump to output
104:    LDA  1,-18(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-101(7)	CALL output
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
108:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Jump to outnl
109:    LDA  1,-18(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-75(7)	CALL outnl
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* COMPOUND
* EXPRESSION
113:    LDC  3,1(6)	Load Boolean constant 
114:     ST  3,-18(1)	Store variable x
* EXPRESSION
115:     LD  3,-18(1)	Load variable x
116:    LDC  4,1(6)	Load 1 
117:    XOR  3,3,4	Op NOT 
118:     ST  3,-19(1)	Store variable y
* EXPRESSION
*                       Begin call to  outputb
119:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
120:     LD  3,-18(1)	Load variable x
121:    LDC  4,1(6)	Load 1 
122:    XOR  3,3,4	Op NOT 
123:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
124:    LDA  1,-20(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-109(7)	CALL outputb
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
128:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
129:     LD  3,-19(1)	Load variable y
130:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
131:    LDA  1,-20(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-116(7)	CALL outputb
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
135:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
136:     LD  3,-18(1)	Load variable x
137:    LDC  4,1(6)	Load 1 
138:    XOR  3,3,4	Op NOT 
139:    LDC  4,1(6)	Load 1 
140:    XOR  3,3,4	Op NOT 
141:     ST  3,-22(1)	Save left side 
142:     LD  3,-19(1)	Load variable y
143:    LDC  4,1(6)	Load 1 
144:    XOR  3,3,4	Op NOT 
145:     LD  4,-22(1)	Load left into ac1 
146:    AND  3,4,3	Op AND 
147:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
148:    LDA  1,-20(1)	Load address of new frame 
149:    LDA  3,1(7)	Return address in ac 
150:    LDA  7,-133(7)	CALL outputb
151:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
152:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
153:     LD  3,-18(1)	Load variable x
154:    LDC  4,1(6)	Load 1 
155:    XOR  3,3,4	Op NOT 
156:    LDC  4,1(6)	Load 1 
157:    XOR  3,3,4	Op NOT 
158:     ST  3,-22(1)	Save left side 
159:     LD  3,-19(1)	Load variable y
160:    LDC  4,1(6)	Load 1 
161:    XOR  3,3,4	Op NOT 
162:     LD  4,-22(1)	Load left into ac1 
163:     OR  3,4,3	Op OR 
164:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
165:    LDA  1,-20(1)	Load address of new frame 
166:    LDA  3,1(7)	Return address in ac 
167:    LDA  7,-150(7)	CALL outputb
168:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
169:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
170:     LD  3,-19(1)	Load variable y
171:    LDC  4,1(6)	Load 1 
172:    XOR  3,3,4	Op NOT 
173:    LDC  4,1(6)	Load 1 
174:    XOR  3,3,4	Op NOT 
175:     ST  3,-22(1)	Save left side 
176:     LD  3,-18(1)	Load variable x
177:    LDC  4,1(6)	Load 1 
178:    XOR  3,3,4	Op NOT 
179:     LD  4,-22(1)	Load left into ac1 
180:     OR  3,4,3	Op OR 
181:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
182:    LDA  1,-20(1)	Load address of new frame 
183:    LDA  3,1(7)	Return address in ac 
184:    LDA  7,-167(7)	CALL outputb
185:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
186:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
187:     LD  3,-18(1)	Load variable x
188:    LDC  4,1(6)	Load 1 
189:    XOR  3,3,4	Op NOT 
190:    LDC  4,1(6)	Load 1 
191:    XOR  3,3,4	Op NOT 
192:     ST  3,-22(1)	Store parameter 
*                       Jump to outputb
193:    LDA  1,-20(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-178(7)	CALL outputb
196:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
197:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
198:    LDA  1,-20(1)	Load address of new frame 
199:    LDA  3,1(7)	Return address in ac 
200:    LDA  7,-164(7)	CALL outnl
201:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* EXPRESSION
*                       Begin call to  output
202:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
203:    LDA  3,-5(1)	Load address of base of array a
204:     LD  3,1(3)	Load array size 
205:     ST  3,-20(1)	Store parameter 
*                       Jump to output
206:    LDA  1,-18(1)	Load address of new frame 
207:    LDA  3,1(7)	Return address in ac 
208:    LDA  7,-203(7)	CALL output
209:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
210:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
211:    LDA  3,-13(1)	Load address of base of array b
212:     LD  3,1(3)	Load array size 
213:     ST  3,-20(1)	Store parameter 
*                       Jump to output
214:    LDA  1,-18(1)	Load address of new frame 
215:    LDA  3,1(7)	Return address in ac 
216:    LDA  7,-211(7)	CALL output
217:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
218:    LDC  2,0(6)	Set return value to 0 
219:     LD  3,-1(1)	Load return address 
220:     LD  1,0(1)	Adjust fp 
221:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,221(7)	Jump to init [backpatch] 
* INIT
222:     LD  0,0(0)	Set the global pointer 
223:    LDA  1,0(0)	set first frame at end of globals 
224:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-185(7)	Jump to main 
227:   HALT  0,0,0	DONE! 
* END INIT
