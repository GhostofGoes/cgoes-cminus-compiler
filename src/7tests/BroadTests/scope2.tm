* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  scope2.c-
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
* FUNCTION ant
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,111(6)	Load integer constant 
 44:     ST  3,-4(1)	Store variable b
* EXPRESSION
 45:    LDC  3,222(6)	Load integer constant 
 46:     ST  3,-2(1)	Store variable x
* EXPRESSION
 47:    LDC  3,333(6)	Load integer constant 
 48:     ST  3,0(0)	Store variable g
* COMPOUND
* EXPRESSION
 49:    LDC  3,444(6)	Load integer constant 
 50:     ST  3,-3(1)	Store variable a
* EXPRESSION
 51:    LDC  3,555(6)	Load integer constant 
 52:     ST  3,-6(1)	Store variable b
* EXPRESSION
 53:    LDC  3,666(6)	Load integer constant 
 54:     ST  3,-5(1)	Store variable c
* EXPRESSION
 55:    LDC  3,777(6)	Load integer constant 
 56:     ST  3,0(0)	Store variable g
* EXPRESSION
 57:    LDC  3,888(6)	Load integer constant 
 58:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
 59:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 60:     LD  3,-3(1)	Load variable a
 61:     ST  3,-9(1)	Store parameter 
*                       Jump to output
 62:    LDA  1,-7(1)	Load address of new frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    LDA  7,-59(7)	CALL output
 65:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 66:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 67:     LD  3,-6(1)	Load variable b
 68:     ST  3,-9(1)	Store parameter 
*                       Jump to output
 69:    LDA  1,-7(1)	Load address of new frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-66(7)	CALL output
 72:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 73:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 74:     LD  3,-5(1)	Load variable c
 75:     ST  3,-9(1)	Store parameter 
*                       Jump to output
 76:    LDA  1,-7(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 80:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 81:     LD  3,0(0)	Load variable g
 82:     ST  3,-9(1)	Store parameter 
*                       Jump to output
 83:    LDA  1,-7(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Load param 1
 88:     LD  3,-2(1)	Load variable x
 89:     ST  3,-9(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-7(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 94:     ST  1,-7(1)	Store old fp in ghost frame 
*                       Jump to outnl
 95:    LDA  1,-7(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-61(7)	CALL outnl
 98:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* EXPRESSION
*                       Begin call to  output
 99:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
100:     LD  3,-3(1)	Load variable a
101:     ST  3,-7(1)	Store parameter 
*                       Jump to output
102:    LDA  1,-5(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-99(7)	CALL output
105:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
106:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
107:     LD  3,-4(1)	Load variable b
108:     ST  3,-7(1)	Store parameter 
*                       Jump to output
109:    LDA  1,-5(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
113:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
114:     LD  3,0(0)	Load variable g
115:     ST  3,-7(1)	Store parameter 
*                       Jump to output
116:    LDA  1,-5(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-113(7)	CALL output
119:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
120:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
121:     LD  3,-2(1)	Load variable x
122:     ST  3,-7(1)	Store parameter 
*                       Jump to output
123:    LDA  1,-5(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-120(7)	CALL output
126:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
127:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
128:    LDA  1,-5(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-94(7)	CALL outnl
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
132:    LDC  3,11(6)	Load integer constant 
133:     ST  3,-3(1)	Store variable a
* EXPRESSION
134:    LDC  3,12(6)	Load integer constant 
135:     ST  3,-4(1)	Store variable b
* EXPRESSION
136:    LDC  3,14(6)	Load integer constant 
137:     ST  3,-2(1)	Store variable x
* COMPOUND
* EXPRESSION
138:    LDC  3,15(6)	Load integer constant 
139:     ST  3,-2(1)	Store variable x
* END COMPOUND
* EXPRESSION
*                       Begin call to  output
140:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
141:     LD  3,-3(1)	Load variable a
142:     ST  3,-7(1)	Store parameter 
*                       Jump to output
143:    LDA  1,-5(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-140(7)	CALL output
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
147:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
148:     LD  3,-4(1)	Load variable b
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
155:     LD  3,0(0)	Load variable g
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
162:     LD  3,-2(1)	Load variable x
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
* RETURN
173:     LD  3,-3(1)	Load variable a
174:     ST  3,-5(1)	Save left side 
175:     LD  3,-4(1)	Load variable b
176:     LD  4,-5(1)	Load left into ac1 
177:    ADD  3,4,3	Op + 
178:     ST  3,-5(1)	Save left side 
179:     LD  3,0(0)	Load variable g
180:     LD  4,-5(1)	Load left into ac1 
181:    ADD  3,4,3	Op + 
182:     ST  3,-5(1)	Save left side 
183:     LD  3,-2(1)	Load variable x
184:     LD  4,-5(1)	Load left into ac1 
185:    ADD  3,4,3	Op + 
186:    LDA  2,0(3)	Copy result to rt register 
187:     LD  3,-1(1)	Load return address 
188:     LD  1,0(1)	Adjust fp 
189:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
190:    LDC  2,0(6)	Set return value to 0 
191:     LD  3,-1(1)	Load return address 
192:     LD  1,0(1)	Adjust fp 
193:    LDA  7,0(3)	Return 
* END FUNCTION ant
* FUNCTION main
194:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
195:    LDC  3,16(6)	Load integer constant 
196:     ST  3,-2(1)	Store variable a
* EXPRESSION
197:    LDC  3,1(6)	Load integer constant 
198:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
199:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  ant
200:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
201:    LDC  3,2(6)	Load integer constant 
202:     ST  3,-7(1)	Store parameter 
*                       Jump to ant
203:    LDA  1,-5(1)	Load address of new frame 
204:    LDA  3,1(7)	Return address in ac 
205:    LDA  7,-164(7)	CALL ant
206:    LDA  3,0(2)	Save the result in ac 
*                       End call to ant
207:     ST  3,-5(1)	Store parameter 
*                       Jump to output
208:    LDA  1,-3(1)	Load address of new frame 
209:    LDA  3,1(7)	Return address in ac 
210:    LDA  7,-205(7)	CALL output
211:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
212:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
213:     LD  3,0(0)	Load variable g
214:     ST  3,-5(1)	Store parameter 
*                       Jump to output
215:    LDA  1,-3(1)	Load address of new frame 
216:    LDA  3,1(7)	Return address in ac 
217:    LDA  7,-212(7)	CALL output
218:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
219:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
220:     LD  3,-2(1)	Load variable a
221:     ST  3,-5(1)	Store parameter 
*                       Jump to output
222:    LDA  1,-3(1)	Load address of new frame 
223:    LDA  3,1(7)	Return address in ac 
224:    LDA  7,-219(7)	CALL output
225:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
226:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
227:    LDA  1,-3(1)	Load address of new frame 
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
236:    LDA  1,-1(0)	set first frame at end of globals 
237:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
238:    LDA  3,1(7)	Return address in ac 
239:    LDA  7,-46(7)	Jump to main 
240:   HALT  0,0,0	DONE! 
* END INIT
