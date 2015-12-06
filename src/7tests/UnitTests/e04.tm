* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  e04.c-
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
* IF
 43:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 45:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 48:    LDC  3,13(6)	Load integer constant 
 49:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 50:    LDA  1,-3(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-47(7)	CALL output
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 46:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 44:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 54:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 56:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
 58:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 59:    LDC  3,23(6)	Load integer constant 
 60:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 61:    LDA  1,-3(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-58(7)	CALL output
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 57:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 55:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 65:    LDC  3,0(6)	Load Boolean constant 
 66:     ST  3,-2(1)	Store variable x
* IF
 67:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 69:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
*                       Begin call to  output
 71:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 72:    LDC  3,44(6)	Load integer constant 
 73:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 74:    LDA  1,-3(1)	Load address of new frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    LDA  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 70:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 68:    JZR  3,9(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 78:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 80:     LD  3,-2(1)	Load variable x
 81:    LDC  4,1(6)	Load 1 
 82:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
 84:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 85:    LDC  3,55(6)	Load integer constant 
 86:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 87:    LDA  1,-3(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 83:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 79:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 91:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
 93:    LDC  3,3(6)	Load integer constant 
 94:     ST  3,-3(1)	Save left side 
 95:    LDC  3,1(6)	Load integer constant 
 96:     LD  4,-3(1)	Load left into ac1 
 97:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
 99:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
100:    LDC  3,987(6)	Load integer constant 
101:     ST  3,-5(1)	Store parameter 
*                       Jump to output
102:    LDA  1,-3(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-99(7)	CALL output
105:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 98:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
 92:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
106:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
108:    LDC  3,3(6)	Load integer constant 
109:     ST  3,-3(1)	Save left side 
110:    LDC  3,1(6)	Load integer constant 
111:     LD  4,-3(1)	Load left into ac1 
112:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
114:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
115:    LDC  3,211(6)	Load integer constant 
116:     ST  3,-5(1)	Store parameter 
*                       Jump to output
117:    LDA  1,-3(1)	Load address of new frame 
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
113:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
107:    JZR  3,13(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
121:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
123:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
125:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
126:    LDC  3,13(6)	Load integer constant 
127:     ST  3,-5(1)	Store parameter 
*                       Jump to output
128:    LDA  1,-3(1)	Load address of new frame 
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-125(7)	CALL output
131:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
124:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
133:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
134:    LDC  3,51(6)	Load integer constant 
135:     ST  3,-5(1)	Store parameter 
*                       Jump to output
136:    LDA  1,-3(1)	Load address of new frame 
137:    LDA  3,1(7)	Return address in ac 
138:    LDA  7,-133(7)	CALL output
139:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
132:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
122:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
140:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
142:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
144:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
145:    LDC  3,23(6)	Load integer constant 
146:     ST  3,-5(1)	Store parameter 
*                       Jump to output
147:    LDA  1,-3(1)	Load address of new frame 
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-144(7)	CALL output
150:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
143:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
152:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
153:    LDC  3,451(6)	Load integer constant 
154:     ST  3,-5(1)	Store parameter 
*                       Jump to output
155:    LDA  1,-3(1)	Load address of new frame 
156:    LDA  3,1(7)	Return address in ac 
157:    LDA  7,-152(7)	CALL output
158:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
151:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
141:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
159:    LDC  3,0(6)	Load Boolean constant 
160:     ST  3,-2(1)	Store variable x
* IF
161:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
163:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
*                       Begin call to  output
165:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
166:    LDC  3,44(6)	Load integer constant 
167:     ST  3,-5(1)	Store parameter 
*                       Jump to output
168:    LDA  1,-3(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-165(7)	CALL output
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
164:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
173:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
174:    LDC  3,514(6)	Load integer constant 
175:     ST  3,-5(1)	Store parameter 
*                       Jump to output
176:    LDA  1,-3(1)	Load address of new frame 
177:    LDA  3,1(7)	Return address in ac 
178:    LDA  7,-173(7)	CALL output
179:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
172:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
162:    JZR  3,17(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
180:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
182:     LD  3,-2(1)	Load variable x
183:    LDC  4,1(6)	Load 1 
184:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
186:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
187:    LDC  3,55(6)	Load integer constant 
188:     ST  3,-5(1)	Store parameter 
*                       Jump to output
189:    LDA  1,-3(1)	Load address of new frame 
190:    LDA  3,1(7)	Return address in ac 
191:    LDA  7,-186(7)	CALL output
192:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
185:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
194:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
195:    LDC  3,1514(6)	Load integer constant 
196:     ST  3,-5(1)	Store parameter 
*                       Jump to output
197:    LDA  1,-3(1)	Load address of new frame 
198:    LDA  3,1(7)	Return address in ac 
199:    LDA  7,-194(7)	CALL output
200:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
193:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
181:    JZR  3,19(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
201:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
203:    LDC  3,3(6)	Load integer constant 
204:     ST  3,-3(1)	Save left side 
205:    LDC  3,1(6)	Load integer constant 
206:     LD  4,-3(1)	Load left into ac1 
207:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
209:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
210:    LDC  3,987(6)	Load integer constant 
211:     ST  3,-5(1)	Store parameter 
*                       Jump to output
212:    LDA  1,-3(1)	Load address of new frame 
213:    LDA  3,1(7)	Return address in ac 
214:    LDA  7,-209(7)	CALL output
215:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
208:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
217:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
218:    LDC  3,114(6)	Load integer constant 
219:     ST  3,-5(1)	Store parameter 
*                       Jump to output
220:    LDA  1,-3(1)	Load address of new frame 
221:    LDA  3,1(7)	Return address in ac 
222:    LDA  7,-217(7)	CALL output
223:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
216:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
202:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
224:    LDC  3,0(6)	Load Boolean constant 
* THEN
* IF
226:    LDC  3,3(6)	Load integer constant 
227:     ST  3,-3(1)	Save left side 
228:    LDC  3,1(6)	Load integer constant 
229:     LD  4,-3(1)	Load left into ac1 
230:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
232:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
233:    LDC  3,211(6)	Load integer constant 
234:     ST  3,-5(1)	Store parameter 
*                       Jump to output
235:    LDA  1,-3(1)	Load address of new frame 
236:    LDA  3,1(7)	Return address in ac 
237:    LDA  7,-232(7)	CALL output
238:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
231:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
240:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
241:    LDC  3,1614(6)	Load integer constant 
242:     ST  3,-5(1)	Store parameter 
*                       Jump to output
243:    LDA  1,-3(1)	Load address of new frame 
244:    LDA  3,1(7)	Return address in ac 
245:    LDA  7,-240(7)	CALL output
246:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
239:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
225:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
247:    LDC  2,0(6)	Set return value to 0 
248:     LD  3,-1(1)	Load return address 
249:     LD  1,0(1)	Adjust fp 
250:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,250(7)	Jump to init [backpatch] 
* INIT
251:     LD  0,0(0)	Set the global pointer 
252:    LDA  1,0(0)	set first frame at end of globals 
253:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
254:    LDA  3,1(7)	Return address in ac 
255:    LDA  7,-214(7)	Jump to main 
256:   HALT  0,0,0	DONE! 
* END INIT
