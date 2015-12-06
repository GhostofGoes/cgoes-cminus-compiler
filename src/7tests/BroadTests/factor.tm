* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  factor.c-
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
* FUNCTION sqrt
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 43:     LD  3,-2(1)	Load variable x
 44:     ST  3,-5(1)	Save left side 
 45:    LDC  3,1(6)	Load integer constant 
 46:     LD  4,-5(1)	Load left into ac1 
 47:    TEQ  3,4,3	Op == 
* THEN
* RETURN
 49:    LDC  3,1(6)	Load integer constant 
 50:    LDA  2,0(3)	Copy result to rt register 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
 48:    JZR  3,5(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 54:     LD  3,-2(1)	Load variable x
 55:     ST  3,-5(1)	Save left side 
 56:    LDC  3,2(6)	Load integer constant 
 57:     LD  4,-5(1)	Load left into ac1 
 58:    DIV  3,4,3	Op / 
 59:     ST  3,-3(1)	Store variable guess
* EXPRESSION
 60:     LD  3,-2(1)	Load variable x
 61:     ST  3,-5(1)	Save left side 
 62:     LD  3,-3(1)	Load variable guess
 63:     LD  4,-5(1)	Load left into ac1 
 64:    DIV  3,4,3	Op / 
 65:     ST  3,-5(1)	Save left side 
 66:     LD  3,-3(1)	Load variable guess
 67:     LD  4,-5(1)	Load left into ac1 
 68:    ADD  3,4,3	Op + 
 69:     ST  3,-5(1)	Save left side 
 70:    LDC  3,2(6)	Load integer constant 
 71:     LD  4,-5(1)	Load left into ac1 
 72:    DIV  3,4,3	Op / 
 73:     ST  3,-4(1)	Store variable newguess
* WHILE
 74:     LD  3,-3(1)	Load variable guess
 75:     ST  3,-5(1)	Save left side 
 76:     LD  3,-4(1)	Load variable newguess
 77:     LD  4,-5(1)	Load left into ac1 
 78:    SUB  3,4,3	Op - 
 79:     ST  3,-5(1)	Save left side 
 80:    LDC  3,1(6)	Load integer constant 
 81:     LD  4,-5(1)	Load left into ac1 
 82:    TGT  3,4,3	Op > 
 83:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 85:     LD  3,-4(1)	Load variable newguess
 86:     ST  3,-3(1)	Store variable guess
* EXPRESSION
 87:     LD  3,-2(1)	Load variable x
 88:     ST  3,-5(1)	Save left side 
 89:     LD  3,-3(1)	Load variable guess
 90:     LD  4,-5(1)	Load left into ac1 
 91:    DIV  3,4,3	Op / 
 92:     ST  3,-5(1)	Save left side 
 93:     LD  3,-3(1)	Load variable guess
 94:     LD  4,-5(1)	Load left into ac1 
 95:    ADD  3,4,3	Op + 
 96:     ST  3,-5(1)	Save left side 
 97:    LDC  3,2(6)	Load integer constant 
 98:     LD  4,-5(1)	Load left into ac1 
 99:    DIV  3,4,3	Op / 
100:     ST  3,-4(1)	Store variable newguess
* END COMPOUND
101:    LDA  7,-28(7)	go to beginning of loop 
 84:    LDA  7,17(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
102:     LD  3,-4(1)	Load variable newguess
103:     ST  3,-5(1)	Save left side 
104:     LD  3,-4(1)	Load variable newguess
105:     LD  4,-5(1)	Load left into ac1 
106:    MUL  3,4,3	Op * 
107:     ST  3,-5(1)	Save left side 
108:     LD  3,-2(1)	Load variable x
109:     LD  4,-5(1)	Load left into ac1 
110:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
112:     LD  3,-4(1)	Load variable newguess
113:     ST  3,-5(1)	Save left side 
114:    LDC  3,1(6)	Load integer constant 
115:     LD  4,-5(1)	Load left into ac1 
116:    SUB  3,4,3	Op - 
117:     ST  3,-4(1)	Store variable newguess
111:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
118:     LD  3,-4(1)	Load variable newguess
119:    LDA  2,0(3)	Copy result to rt register 
120:     LD  3,-1(1)	Load return address 
121:     LD  1,0(1)	Adjust fp 
122:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
123:    LDC  2,0(6)	Set return value to 0 
124:     LD  3,-1(1)	Load return address 
125:     LD  1,0(1)	Adjust fp 
126:    LDA  7,0(3)	Return 
* END FUNCTION sqrt
* FUNCTION main
127:     ST  3,-1(1)	Store return address. 
* COMPOUND
* WHILE
*                       Begin call to  input
128:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
129:    LDA  1,-4(1)	Load address of new frame 
130:    LDA  3,1(7)	Return address in ac 
131:    LDA  7,-131(7)	CALL input
132:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
133:     ST  3,-2(1)	Store variable n
134:     ST  3,-4(1)	Save left side 
135:    LDC  3,1(6)	Load integer constant 
136:     LD  4,-4(1)	Load left into ac1 
137:    TGT  3,4,3	Op > 
138:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  sqrt
140:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
141:     LD  3,-2(1)	Load variable n
142:     ST  3,-7(1)	Store parameter 
*                       Jump to sqrt
143:    LDA  1,-5(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-104(7)	CALL sqrt
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to sqrt
147:     ST  3,-4(1)	Store variable limit
* WHILE
148:     LD  3,-2(1)	Load variable n
149:     ST  3,-5(1)	Save left side 
150:    LDC  3,2(6)	Load integer constant 
151:     LD  4,-5(1)	Load left into ac1 
152:    DIV  5,4,3	Op % 
153:    MUL  5,5,3	 
154:    SUB  3,4,5	 
155:     ST  3,-5(1)	Save left side 
156:    LDC  3,0(6)	Load integer constant 
157:     LD  4,-5(1)	Load left into ac1 
158:    TEQ  3,4,3	Op == 
159:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
161:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
162:    LDC  3,2(6)	Load integer constant 
163:     ST  3,-7(1)	Store parameter 
*                       Jump to output
164:    LDA  1,-5(1)	Load address of new frame 
165:    LDA  3,1(7)	Return address in ac 
166:    LDA  7,-161(7)	CALL output
167:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
168:     LD  3,-2(1)	Load variable n
169:     ST  3,-5(1)	Save left side 
170:    LDC  3,2(6)	Load integer constant 
171:     LD  4,-5(1)	Load left into ac1 
172:    DIV  3,4,3	Op / 
173:     ST  3,-2(1)	Store variable n
* END COMPOUND
174:    LDA  7,-27(7)	go to beginning of loop 
160:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
175:    LDC  3,3(6)	Load integer constant 
176:     ST  3,-3(1)	Store variable i
* WHILE
177:     LD  3,-3(1)	Load variable i
178:     ST  3,-5(1)	Save left side 
179:     LD  3,-4(1)	Load variable limit
180:     LD  4,-5(1)	Load left into ac1 
181:    TLE  3,4,3	Op <= 
182:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* WHILE
184:     LD  3,-2(1)	Load variable n
185:     ST  3,-5(1)	Save left side 
186:     LD  3,-3(1)	Load variable i
187:     LD  4,-5(1)	Load left into ac1 
188:    DIV  5,4,3	Op % 
189:    MUL  5,5,3	 
190:    SUB  3,4,5	 
191:     ST  3,-5(1)	Save left side 
192:    LDC  3,0(6)	Load integer constant 
193:     LD  4,-5(1)	Load left into ac1 
194:    TEQ  3,4,3	Op == 
195:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
197:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
198:     LD  3,-3(1)	Load variable i
199:     ST  3,-7(1)	Store parameter 
*                       Jump to output
200:    LDA  1,-5(1)	Load address of new frame 
201:    LDA  3,1(7)	Return address in ac 
202:    LDA  7,-197(7)	CALL output
203:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
204:     LD  3,-2(1)	Load variable n
205:     ST  3,-5(1)	Save left side 
206:     LD  3,-3(1)	Load variable i
207:     LD  4,-5(1)	Load left into ac1 
208:    DIV  3,4,3	Op / 
209:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  sqrt
210:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
211:     LD  3,-2(1)	Load variable n
212:     ST  3,-7(1)	Store parameter 
*                       Jump to sqrt
213:    LDA  1,-5(1)	Load address of new frame 
214:    LDA  3,1(7)	Return address in ac 
215:    LDA  7,-174(7)	CALL sqrt
216:    LDA  3,0(2)	Save the result in ac 
*                       End call to sqrt
217:     ST  3,-4(1)	Store variable limit
* END COMPOUND
218:    LDA  7,-35(7)	go to beginning of loop 
196:    LDA  7,22(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
219:     LD  3,-3(1)	Load variable i
220:     ST  3,-5(1)	Save left side 
221:    LDC  3,2(6)	Load integer constant 
222:     LD  4,-5(1)	Load left into ac1 
223:    ADD  3,4,3	Op + 
224:     ST  3,-3(1)	Store variable i
* END COMPOUND
225:    LDA  7,-49(7)	go to beginning of loop 
183:    LDA  7,42(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
226:     LD  3,-2(1)	Load variable n
227:     ST  3,-5(1)	Save left side 
228:    LDC  3,1(6)	Load integer constant 
229:     LD  4,-5(1)	Load left into ac1 
230:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
232:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
233:     LD  3,-2(1)	Load variable n
234:     ST  3,-7(1)	Store parameter 
*                       Jump to output
235:    LDA  1,-5(1)	Load address of new frame 
236:    LDA  3,1(7)	Return address in ac 
237:    LDA  7,-232(7)	CALL output
238:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
231:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
239:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
240:    LDA  1,-5(1)	Load address of new frame 
241:    LDA  3,1(7)	Return address in ac 
242:    LDA  7,-206(7)	CALL outnl
243:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
244:    LDA  7,-117(7)	go to beginning of loop 
139:    LDA  7,105(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
245:    LDC  2,0(6)	Set return value to 0 
246:     LD  3,-1(1)	Load return address 
247:     LD  1,0(1)	Adjust fp 
248:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,248(7)	Jump to init [backpatch] 
* INIT
249:     LD  0,0(0)	Set the global pointer 
250:    LDA  1,0(0)	set first frame at end of globals 
251:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
252:    LDA  3,1(7)	Return address in ac 
253:    LDA  7,-127(7)	Jump to main 
254:   HALT  0,0,0	DONE! 
* END INIT
