* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  arraysize.c-
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
* FUNCTION ford
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,13(6)	load size of array y
 44:     ST  3,-4(1)	save size of array y
* EXPRESSION
 45:    LDC  3,0(6)	Load integer constant 
 46:     ST  3,-18(1)	Save index 
 47:    LDC  3,666(6)	Load integer constant 
 48:     LD  4,-18(1)	Restore index 
 49:    LDA  5,-5(1)	Load address of base of array y
 50:    SUB  5,5,4	Compute offset of value 
 51:     ST  3,0(5)	Store variable y
* EXPRESSION
 52:    LDC  3,0(6)	Load integer constant 
 53:     ST  3,-18(1)	Save index 
 54:    LDC  3,888(6)	Load integer constant 
 55:     LD  4,-18(1)	Restore index 
 56:    LDA  5,-1(0)	Load address of base of array g
 57:    SUB  5,5,4	Compute offset of value 
 58:     ST  3,0(5)	Store variable g
* EXPRESSION
*                       Begin call to  output
 59:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 60:    LDC  3,0(6)	Load integer constant 
 61:     LD  4,-2(1)	Load address of base of array x
 62:    SUB  3,4,3	Compute offset of value 
 63:     LD  3,0(3)	Load the value 
 64:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 65:    LDA  1,-18(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-62(7)	CALL output
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 70:     LD  3,-2(1)	Load address of base of array x
 71:     LD  3,1(3)	Load array size 
 72:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 73:    LDA  1,-18(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 77:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 78:    LDC  3,0(6)	Load integer constant 
 79:    LDA  4,-1(0)	Load address of base of array g
 80:    SUB  3,4,3	Compute offset of value 
 81:     LD  3,0(3)	Load the value 
 82:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 83:    LDA  1,-18(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDC  3,1(6)	Load integer constant 
 89:    LDC  4,0(6)	Load 0 
 90:    SUB  3,4,3	Op unary - 
 91:    LDA  4,-1(0)	Load address of base of array g
 92:    SUB  3,4,3	Compute offset of value 
 93:     LD  3,0(3)	Load the value 
 94:     ST  3,-20(1)	Store parameter 
*                       Jump to output
 95:    LDA  1,-18(1)	Load address of new frame 
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-92(7)	CALL output
 98:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 99:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Jump to outnl
100:    LDA  1,-18(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-66(7)	CALL outnl
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
104:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
105:    LDC  3,0(6)	Load integer constant 
106:    LDA  4,-5(1)	Load address of base of array y
107:    SUB  3,4,3	Compute offset of value 
108:     LD  3,0(3)	Load the value 
109:     ST  3,-20(1)	Store parameter 
*                       Jump to output
110:    LDA  1,-18(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-107(7)	CALL output
113:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
114:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Load param 1
115:    LDA  3,-5(1)	Load address of base of array y
116:     LD  3,1(3)	Load array size 
117:     ST  3,-20(1)	Store parameter 
*                       Jump to output
118:    LDA  1,-18(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-115(7)	CALL output
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
122:     ST  1,-18(1)	Store old fp in ghost frame 
*                       Jump to outnl
123:    LDA  1,-18(1)	Load address of new frame 
124:    LDA  3,1(7)	Return address in ac 
125:    LDA  7,-89(7)	CALL outnl
126:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
127:    LDC  2,0(6)	Set return value to 0 
128:     LD  3,-1(1)	Load return address 
129:     LD  1,0(1)	Adjust fp 
130:    LDA  7,0(3)	Return 
* END FUNCTION ford
* FUNCTION main
131:     ST  3,-1(1)	Store return address. 
* COMPOUND
132:    LDC  3,11(6)	load size of array m
133:     ST  3,-2(1)	save size of array m
* EXPRESSION
134:    LDC  3,0(6)	Load integer constant 
135:     ST  3,-14(1)	Save index 
136:    LDC  3,777(6)	Load integer constant 
137:     LD  4,-14(1)	Restore index 
138:    LDA  5,-3(1)	Load address of base of array m
139:    SUB  5,5,4	Compute offset of value 
140:     ST  3,0(5)	Store variable m
* EXPRESSION
*                       Begin call to  output
141:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
142:    LDC  3,0(6)	Load integer constant 
143:    LDA  4,-3(1)	Load address of base of array m
144:    SUB  3,4,3	Compute offset of value 
145:     LD  3,0(3)	Load the value 
146:     ST  3,-16(1)	Store parameter 
*                       Jump to output
147:    LDA  1,-14(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
151:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
152:    LDA  3,-3(1)	Load address of base of array m
153:     LD  3,1(3)	Load array size 
154:     ST  3,-16(1)	Store parameter 
*                       Jump to output
155:    LDA  1,-14(1)	Load address of new frame 
156:    LDA  3,1(7)	Return address in ac 
157:    LDA  7,-152(7)	CALL output
158:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
159:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
160:    LDC  3,0(6)	Load integer constant 
161:    LDA  4,-1(0)	Load address of base of array g
162:    SUB  3,4,3	Compute offset of value 
163:     LD  3,0(3)	Load the value 
164:     ST  3,-16(1)	Store parameter 
*                       Jump to output
165:    LDA  1,-14(1)	Load address of new frame 
166:    LDA  3,1(7)	Return address in ac 
167:    LDA  7,-162(7)	CALL output
168:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
169:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
170:    LDA  3,-1(0)	Load address of base of array g
171:     LD  3,1(3)	Load array size 
172:     ST  3,-16(1)	Store parameter 
*                       Jump to output
173:    LDA  1,-14(1)	Load address of new frame 
174:    LDA  3,1(7)	Return address in ac 
175:    LDA  7,-170(7)	CALL output
176:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
177:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
178:    LDA  1,-14(1)	Load address of new frame 
179:    LDA  3,1(7)	Return address in ac 
180:    LDA  7,-144(7)	CALL outnl
181:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  ford
182:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
183:    LDA  3,-3(1)	Load address of base of array m
184:     ST  3,-16(1)	Store parameter 
*                       Jump to ford
185:    LDA  1,-14(1)	Load address of new frame 
186:    LDA  3,1(7)	Return address in ac 
187:    LDA  7,-146(7)	CALL ford
188:    LDA  3,0(2)	Save the result in ac 
*                       End call to ford
* EXPRESSION
*                       Begin call to  ford
189:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
190:    LDA  3,-1(0)	Load address of base of array g
191:     ST  3,-16(1)	Store parameter 
*                       Jump to ford
192:    LDA  1,-14(1)	Load address of new frame 
193:    LDA  3,1(7)	Return address in ac 
194:    LDA  7,-153(7)	CALL ford
195:    LDA  3,0(2)	Save the result in ac 
*                       End call to ford
* EXPRESSION
*                       Begin call to  output
196:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
197:    LDA  3,-3(1)	Load address of base of array m
198:     LD  3,1(3)	Load array size 
199:     ST  3,-16(1)	Save left side 
200:    LDA  3,-1(0)	Load address of base of array g
201:     LD  3,1(3)	Load array size 
202:     LD  4,-16(1)	Load left into ac1 
203:    MUL  3,4,3	Op * 
204:     ST  3,-16(1)	Store parameter 
*                       Jump to output
205:    LDA  1,-14(1)	Load address of new frame 
206:    LDA  3,1(7)	Return address in ac 
207:    LDA  7,-202(7)	CALL output
208:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
209:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Jump to outnl
210:    LDA  1,-14(1)	Load address of new frame 
211:    LDA  3,1(7)	Return address in ac 
212:    LDA  7,-176(7)	CALL outnl
213:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
214:    LDC  2,0(6)	Set return value to 0 
215:     LD  3,-1(1)	Load return address 
216:     LD  1,0(1)	Adjust fp 
217:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,217(7)	Jump to init [backpatch] 
* INIT
218:     LD  0,0(0)	Set the global pointer 
219:    LDA  1,-37(0)	set first frame at end of globals 
220:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
221:    LDC  3,12(6)	load size of array g
222:     ST  3,0(0)	save size of array g
223:    LDC  3,23(6)	load size of array h
224:     ST  3,-13(0)	save size of array h
* END INIT GLOBALS AND STATICS
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-96(7)	Jump to main 
227:   HALT  0,0,0	DONE! 
* END INIT
