* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  assign4.c-
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
 43:    LDC  3,111(6)	Load integer constant 
 44:     LD  4,-2(1)	load lhs variable x
 45:    ADD  3,4,3	op += 
 46:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 48:     LD  3,-2(1)	Load variable x
 49:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 50:    LDA  1,-4(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 54:    LDC  3,222(6)	Load integer constant 
 55:     LD  4,-3(1)	load lhs variable y
 56:    ADD  3,4,3	op += 
 57:     ST  3,-3(1)	Store variable y
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 59:     LD  3,-3(1)	Load variable y
 60:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 61:    LDA  1,-4(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-58(7)	CALL output
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 65:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 66:    LDA  1,-4(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-32(7)	CALL outnl
 69:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 70:    LDC  3,333(6)	Load integer constant 
 71:     LD  4,0(0)	load lhs variable gx
 72:    ADD  3,4,3	op += 
 73:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
 74:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 75:     LD  3,0(0)	Load variable gx
 76:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 77:    LDA  1,-4(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 81:    LDC  3,444(6)	Load integer constant 
 82:     LD  4,-1(0)	load lhs variable gy
 83:    ADD  3,4,3	op += 
 84:     ST  3,-1(0)	Store variable gy
* EXPRESSION
*                       Begin call to  output
 85:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 86:     LD  3,-1(0)	Load variable gy
 87:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 88:    LDA  1,-4(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-85(7)	CALL output
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 92:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 93:    LDA  1,-4(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-59(7)	CALL outnl
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 97:     LD  3,-3(1)	Load variable y
 98:     LD  4,-2(1)	load lhs variable x
 99:    ADD  3,4,3	op += 
100:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
101:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
102:     LD  3,-2(1)	Load variable x
103:     ST  3,-6(1)	Store parameter 
*                       Jump to output
104:    LDA  1,-4(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-101(7)	CALL output
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
108:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
109:    LDA  1,-4(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-75(7)	CALL outnl
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
113:     LD  3,-1(0)	Load variable gy
114:     LD  4,0(0)	load lhs variable gx
115:    ADD  3,4,3	op += 
116:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
117:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
118:     LD  3,0(0)	Load variable gx
119:     ST  3,-6(1)	Store parameter 
*                       Jump to output
120:    LDA  1,-4(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-117(7)	CALL output
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
124:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
125:    LDA  1,-4(1)	Load address of new frame 
126:    LDA  3,1(7)	Return address in ac 
127:    LDA  7,-91(7)	CALL outnl
128:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
129:    LDC  3,111(6)	Load integer constant 
130:     LD  4,-2(1)	load lhs variable x
131:    SUB  3,4,3	op -= 
132:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
133:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
134:     LD  3,-2(1)	Load variable x
135:     ST  3,-6(1)	Store parameter 
*                       Jump to output
136:    LDA  1,-4(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
140:    LDC  3,222(6)	Load integer constant 
141:     LD  4,-3(1)	load lhs variable y
142:    SUB  3,4,3	op -= 
143:     ST  3,-3(1)	Store variable y
* EXPRESSION
*                       Begin call to  output
144:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
145:     LD  3,-3(1)	Load variable y
146:     ST  3,-6(1)	Store parameter 
*                       Jump to output
147:    LDA  1,-4(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
151:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
152:    LDA  1,-4(1)	Load address of new frame 
153:    LDA  3,1(7)	Return address in ac 
154:    LDA  7,-118(7)	CALL outnl
155:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
156:    LDC  3,333(6)	Load integer constant 
157:     LD  4,0(0)	load lhs variable gx
158:    SUB  3,4,3	op -= 
159:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
160:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
161:     LD  3,0(0)	Load variable gx
162:     ST  3,-6(1)	Store parameter 
*                       Jump to output
163:    LDA  1,-4(1)	Load address of new frame 
164:    LDA  3,1(7)	Return address in ac 
165:    LDA  7,-160(7)	CALL output
166:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
167:    LDC  3,444(6)	Load integer constant 
168:     LD  4,-1(0)	load lhs variable gy
169:    SUB  3,4,3	op -= 
170:     ST  3,-1(0)	Store variable gy
* EXPRESSION
*                       Begin call to  output
171:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
172:     LD  3,-1(0)	Load variable gy
173:     ST  3,-6(1)	Store parameter 
*                       Jump to output
174:    LDA  1,-4(1)	Load address of new frame 
175:    LDA  3,1(7)	Return address in ac 
176:    LDA  7,-171(7)	CALL output
177:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
178:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
179:    LDA  1,-4(1)	Load address of new frame 
180:    LDA  3,1(7)	Return address in ac 
181:    LDA  7,-145(7)	CALL outnl
182:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
183:     LD  3,-3(1)	Load variable y
184:     LD  4,-2(1)	load lhs variable x
185:    SUB  3,4,3	op -= 
186:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
187:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
188:     LD  3,-2(1)	Load variable x
189:     ST  3,-6(1)	Store parameter 
*                       Jump to output
190:    LDA  1,-4(1)	Load address of new frame 
191:    LDA  3,1(7)	Return address in ac 
192:    LDA  7,-187(7)	CALL output
193:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
194:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
195:    LDA  1,-4(1)	Load address of new frame 
196:    LDA  3,1(7)	Return address in ac 
197:    LDA  7,-161(7)	CALL outnl
198:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
199:     LD  3,-1(0)	Load variable gy
200:     LD  4,0(0)	load lhs variable gx
201:    SUB  3,4,3	op -= 
202:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
203:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
204:     LD  3,0(0)	Load variable gx
205:     ST  3,-6(1)	Store parameter 
*                       Jump to output
206:    LDA  1,-4(1)	Load address of new frame 
207:    LDA  3,1(7)	Return address in ac 
208:    LDA  7,-203(7)	CALL output
209:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
210:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
211:    LDA  1,-4(1)	Load address of new frame 
212:    LDA  3,1(7)	Return address in ac 
213:    LDA  7,-177(7)	CALL outnl
214:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
215:     LD  3,-1(1)	Load return address 
216:     LD  1,0(1)	Adjust fp 
217:    LDA  7,0(3)	Return 
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
223:    LDA  1,-2(0)	set first frame at end of globals 
224:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
225:    LDA  3,1(7)	Return address in ac 
226:    LDA  7,-185(7)	Jump to main 
227:   HALT  0,0,0	DONE! 
* END INIT
