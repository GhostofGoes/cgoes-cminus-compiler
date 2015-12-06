* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  e01.c-
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
 43:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 46:    LDC  3,13(6)	Load integer constant 
 47:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 48:    LDA  1,-3(1)	Load address of new frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    LDA  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 44:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 53:    LDC  3,23(6)	Load integer constant 
 54:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 55:    LDA  1,-3(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 59:    LDC  3,0(6)	Load Boolean constant 
 60:     ST  3,-2(1)	Store variable x
* IF
 61:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
*                       Begin call to  output
 63:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 64:    LDC  3,44(6)	Load integer constant 
 65:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 66:    LDA  1,-3(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-63(7)	CALL output
 69:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 62:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 70:     LD  3,-2(1)	Load variable x
 71:    LDC  4,1(6)	Load 1 
 72:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
 74:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 75:    LDC  3,55(6)	Load integer constant 
 76:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 77:    LDA  1,-3(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 73:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 81:    LDC  3,3(6)	Load integer constant 
 82:     ST  3,-3(1)	Save left side 
 83:    LDC  3,1(6)	Load integer constant 
 84:     LD  4,-3(1)	Load left into ac1 
 85:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDC  3,987(6)	Load integer constant 
 89:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-3(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 86:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 94:    LDC  3,3(6)	Load integer constant 
 95:     ST  3,-3(1)	Save left side 
 96:    LDC  3,1(6)	Load integer constant 
 97:     LD  4,-3(1)	Load left into ac1 
 98:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
100:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
101:    LDC  3,211(6)	Load integer constant 
102:     ST  3,-5(1)	Store parameter 
*                       Jump to output
103:    LDA  1,-3(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-100(7)	CALL output
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 99:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
107:    LDC  3,1(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
109:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
110:    LDC  3,13(6)	Load integer constant 
111:     ST  3,-5(1)	Store parameter 
*                       Jump to output
112:    LDA  1,-3(1)	Load address of new frame 
113:    LDA  3,1(7)	Return address in ac 
114:    LDA  7,-109(7)	CALL output
115:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
108:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
117:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
118:    LDC  3,51(6)	Load integer constant 
119:     ST  3,-5(1)	Store parameter 
*                       Jump to output
120:    LDA  1,-3(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-117(7)	CALL output
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
116:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
124:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
*                       Begin call to  output
126:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
127:    LDC  3,23(6)	Load integer constant 
128:     ST  3,-5(1)	Store parameter 
*                       Jump to output
129:    LDA  1,-3(1)	Load address of new frame 
130:    LDA  3,1(7)	Return address in ac 
131:    LDA  7,-126(7)	CALL output
132:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
125:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
134:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
135:    LDC  3,451(6)	Load integer constant 
136:     ST  3,-5(1)	Store parameter 
*                       Jump to output
137:    LDA  1,-3(1)	Load address of new frame 
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-134(7)	CALL output
140:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
133:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
141:    LDC  3,0(6)	Load Boolean constant 
142:     ST  3,-2(1)	Store variable x
* IF
143:     LD  3,-2(1)	Load variable x
* THEN
* EXPRESSION
*                       Begin call to  output
145:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
146:    LDC  3,44(6)	Load integer constant 
147:     ST  3,-5(1)	Store parameter 
*                       Jump to output
148:    LDA  1,-3(1)	Load address of new frame 
149:    LDA  3,1(7)	Return address in ac 
150:    LDA  7,-145(7)	CALL output
151:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
144:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
153:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
154:    LDC  3,514(6)	Load integer constant 
155:     ST  3,-5(1)	Store parameter 
*                       Jump to output
156:    LDA  1,-3(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-153(7)	CALL output
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
152:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
160:     LD  3,-2(1)	Load variable x
161:    LDC  4,1(6)	Load 1 
162:    XOR  3,3,4	Op NOT 
* THEN
* EXPRESSION
*                       Begin call to  output
164:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
165:    LDC  3,55(6)	Load integer constant 
166:     ST  3,-5(1)	Store parameter 
*                       Jump to output
167:    LDA  1,-3(1)	Load address of new frame 
168:    LDA  3,1(7)	Return address in ac 
169:    LDA  7,-164(7)	CALL output
170:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
163:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
172:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
173:    LDC  3,1514(6)	Load integer constant 
174:     ST  3,-5(1)	Store parameter 
*                       Jump to output
175:    LDA  1,-3(1)	Load address of new frame 
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-172(7)	CALL output
178:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
171:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
179:    LDC  3,3(6)	Load integer constant 
180:     ST  3,-3(1)	Save left side 
181:    LDC  3,1(6)	Load integer constant 
182:     LD  4,-3(1)	Load left into ac1 
183:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  output
185:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
186:    LDC  3,987(6)	Load integer constant 
187:     ST  3,-5(1)	Store parameter 
*                       Jump to output
188:    LDA  1,-3(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-185(7)	CALL output
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
184:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
193:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
194:    LDC  3,114(6)	Load integer constant 
195:     ST  3,-5(1)	Store parameter 
*                       Jump to output
196:    LDA  1,-3(1)	Load address of new frame 
197:    LDA  3,1(7)	Return address in ac 
198:    LDA  7,-193(7)	CALL output
199:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
192:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* IF
200:    LDC  3,3(6)	Load integer constant 
201:     ST  3,-3(1)	Save left side 
202:    LDC  3,1(6)	Load integer constant 
203:     LD  4,-3(1)	Load left into ac1 
204:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
*                       Begin call to  output
206:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
207:    LDC  3,211(6)	Load integer constant 
208:     ST  3,-5(1)	Store parameter 
*                       Jump to output
209:    LDA  1,-3(1)	Load address of new frame 
210:    LDA  3,1(7)	Return address in ac 
211:    LDA  7,-206(7)	CALL output
212:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
205:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
214:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
215:    LDC  3,1614(6)	Load integer constant 
216:     ST  3,-5(1)	Store parameter 
*                       Jump to output
217:    LDA  1,-3(1)	Load address of new frame 
218:    LDA  3,1(7)	Return address in ac 
219:    LDA  7,-214(7)	CALL output
220:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
213:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
221:    LDC  2,0(6)	Set return value to 0 
222:     LD  3,-1(1)	Load return address 
223:     LD  1,0(1)	Adjust fp 
224:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,224(7)	Jump to init [backpatch] 
* INIT
225:     LD  0,0(0)	Set the global pointer 
226:    LDA  1,0(0)	set first frame at end of globals 
227:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
228:    LDA  3,1(7)	Return address in ac 
229:    LDA  7,-188(7)	Jump to main 
230:   HALT  0,0,0	DONE! 
* END INIT
