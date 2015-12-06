* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  polynum.c-
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
 43:    LDC  3,1(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
* EXPRESSION
 45:    LDC  3,1(6)	Load integer constant 
 46:     ST  3,-8(1)	Store variable min
* WHILE
 47:     LD  3,-2(1)	Load variable i
 48:     ST  3,-11(1)	Save left side 
 49:    LDC  3,2000(6)	Load integer constant 
 50:     LD  4,-11(1)	Load left into ac1 
 51:    TLT  3,4,3	Op < 
 52:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 54:    LDC  3,2(6)	Load integer constant 
 55:     ST  3,-3(1)	Store variable m
* EXPRESSION
 56:     LD  3,-3(1)	Load variable m
 57:     ST  3,-11(1)	Save left side 
 58:     LD  3,-3(1)	Load variable m
 59:     ST  3,-12(1)	Save left side 
 60:    LDC  3,1(6)	Load integer constant 
 61:     LD  4,-12(1)	Load left into ac1 
 62:    ADD  3,4,3	Op + 
 63:     LD  4,-11(1)	Load left into ac1 
 64:    MUL  3,4,3	Op * 
 65:     ST  3,-11(1)	Save left side 
 66:    LDC  3,2(6)	Load integer constant 
 67:     LD  4,-11(1)	Load left into ac1 
 68:    DIV  3,4,3	Op / 
 69:     ST  3,-6(1)	Store variable tm
* EXPRESSION
 70:     LD  3,-2(1)	Load variable i
 71:     ST  3,-11(1)	Save left side 
 72:     LD  3,-3(1)	Load variable m
 73:     ST  3,-12(1)	Save left side 
 74:    LDC  3,1(6)	Load integer constant 
 75:     LD  4,-12(1)	Load left into ac1 
 76:    ADD  3,4,3	Op + 
 77:     LD  4,-11(1)	Load left into ac1 
 78:    SUB  3,4,3	Op - 
 79:     ST  3,-5(1)	Store variable x
* EXPRESSION
 80:     LD  3,-5(1)	Load variable x
 81:     ST  3,-11(1)	Save left side 
 82:     LD  3,-6(1)	Load variable tm
 83:     LD  4,-11(1)	Load left into ac1 
 84:    DIV  3,4,3	Op / 
 85:     ST  3,-4(1)	Store variable t
* EXPRESSION
 86:    LDC  3,0(6)	Load integer constant 
 87:     ST  3,-7(1)	Store variable num
* WHILE
 88:     LD  3,-4(1)	Load variable t
 89:     ST  3,-11(1)	Save left side 
 90:    LDC  3,0(6)	Load integer constant 
 91:     LD  4,-11(1)	Load left into ac1 
 92:    TGT  3,4,3	Op > 
 93:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
 95:     LD  3,-4(1)	Load variable t
 96:     ST  3,-11(1)	Save left side 
 97:     LD  3,-6(1)	Load variable tm
 98:     LD  4,-11(1)	Load left into ac1 
 99:    MUL  3,4,3	Op * 
100:     ST  3,-11(1)	Save left side 
101:     LD  3,-5(1)	Load variable x
102:     LD  4,-11(1)	Load left into ac1 
103:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
105:     LD  3,-7(1)	Load variable num
106:     ST  3,-11(1)	Save left side 
107:    LDC  3,1(6)	Load integer constant 
108:     LD  4,-11(1)	Load left into ac1 
109:    ADD  3,4,3	Op + 
110:     ST  3,-7(1)	Store variable num
104:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
111:     LD  3,-3(1)	Load variable m
112:     ST  3,-11(1)	Save left side 
113:    LDC  3,1(6)	Load integer constant 
114:     LD  4,-11(1)	Load left into ac1 
115:    ADD  3,4,3	Op + 
116:     ST  3,-3(1)	Store variable m
* EXPRESSION
117:     LD  3,-3(1)	Load variable m
118:     ST  3,-11(1)	Save left side 
119:    LDC  3,1(6)	Load integer constant 
120:     LD  4,-11(1)	Load left into ac1 
121:    ADD  3,4,3	Op + 
122:     ST  3,-9(1)	Store variable a
* EXPRESSION
123:     LD  3,-3(1)	Load variable m
124:     ST  3,-11(1)	Save left side 
125:     LD  3,-3(1)	Load variable m
126:     ST  3,-12(1)	Save left side 
127:    LDC  3,1(6)	Load integer constant 
128:     LD  4,-12(1)	Load left into ac1 
129:    ADD  3,4,3	Op + 
130:     LD  4,-11(1)	Load left into ac1 
131:    MUL  3,4,3	Op * 
132:     ST  3,-10(1)	Store variable b
* EXPRESSION
133:     LD  3,-3(1)	Load variable m
134:     ST  3,-11(1)	Save left side 
135:     LD  3,-3(1)	Load variable m
136:     ST  3,-12(1)	Save left side 
137:    LDC  3,1(6)	Load integer constant 
138:     LD  4,-12(1)	Load left into ac1 
139:    ADD  3,4,3	Op + 
140:     LD  4,-11(1)	Load left into ac1 
141:    MUL  3,4,3	Op * 
142:     ST  3,-11(1)	Save left side 
143:    LDC  3,1(6)	Load integer constant 
144:     ST  3,-12(1)	Save left side 
145:    LDC  3,1(6)	Load integer constant 
146:     LD  4,-12(1)	Load left into ac1 
147:    ADD  3,4,3	Op + 
148:     LD  4,-11(1)	Load left into ac1 
149:    DIV  3,4,3	Op / 
150:     ST  3,-6(1)	Store variable tm
* EXPRESSION
151:     LD  3,-2(1)	Load variable i
152:     ST  3,-11(1)	Save left side 
153:     LD  3,-3(1)	Load variable m
154:     ST  3,-12(1)	Save left side 
155:    LDC  3,1(6)	Load integer constant 
156:     LD  4,-12(1)	Load left into ac1 
157:    ADD  3,4,3	Op + 
158:     LD  4,-11(1)	Load left into ac1 
159:    SUB  3,4,3	Op - 
160:     ST  3,-11(1)	Save left side 
161:    LDC  3,0(6)	Load integer constant 
162:     LD  4,-11(1)	Load left into ac1 
163:    ADD  3,4,3	Op + 
164:     ST  3,-5(1)	Store variable x
* EXPRESSION
165:     LD  3,-5(1)	Load variable x
166:     ST  3,-11(1)	Save left side 
167:     LD  3,-6(1)	Load variable tm
168:     LD  4,-11(1)	Load left into ac1 
169:    DIV  3,4,3	Op / 
170:     ST  3,-11(1)	Save left side 
171:    LDC  3,1(6)	Load integer constant 
172:     LD  4,-11(1)	Load left into ac1 
173:    MUL  3,4,3	Op * 
174:     ST  3,-4(1)	Store variable t
* END COMPOUND
175:    LDA  7,-88(7)	go to beginning of loop 
 94:    LDA  7,81(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
176:     LD  3,-7(1)	Load variable num
177:     ST  3,-11(1)	Save left side 
178:     LD  3,-8(1)	Load variable min
179:     LD  4,-11(1)	Load left into ac1 
180:    TGE  3,4,3	Op >= 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  output
182:     ST  1,-11(1)	Store old fp in ghost frame 
*                       Load param 1
183:     LD  3,-7(1)	Load variable num
184:     ST  3,-13(1)	Store parameter 
*                       Jump to output
185:    LDA  1,-11(1)	Load address of new frame 
186:    LDA  3,1(7)	Return address in ac 
187:    LDA  7,-182(7)	CALL output
188:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
189:     ST  1,-11(1)	Store old fp in ghost frame 
*                       Load param 1
190:     LD  3,-2(1)	Load variable i
191:     ST  3,-13(1)	Store parameter 
*                       Jump to output
192:    LDA  1,-11(1)	Load address of new frame 
193:    LDA  3,1(7)	Return address in ac 
194:    LDA  7,-189(7)	CALL output
195:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
196:     ST  1,-11(1)	Store old fp in ghost frame 
*                       Load param 1
197:    LDC  3,11111111(6)	Load integer constant 
198:     ST  3,-13(1)	Store parameter 
*                       Jump to output
199:    LDA  1,-11(1)	Load address of new frame 
200:    LDA  3,1(7)	Return address in ac 
201:    LDA  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
203:     LD  3,-7(1)	Load variable num
204:     ST  3,-11(1)	Save left side 
205:    LDC  3,1(6)	Load integer constant 
206:     LD  4,-11(1)	Load left into ac1 
207:    ADD  3,4,3	Op + 
208:     ST  3,-8(1)	Store variable min
* END COMPOUND
181:    JZR  3,27(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
209:     LD  3,-2(1)	Load variable i
210:     ST  3,-11(1)	Save left side 
211:    LDC  3,1(6)	Load integer constant 
212:     LD  4,-11(1)	Load left into ac1 
213:    ADD  3,4,3	Op + 
214:     ST  3,-2(1)	Store variable i
* END COMPOUND
215:    LDA  7,-169(7)	go to beginning of loop 
 53:    LDA  7,162(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
216:    LDC  3,0(6)	Load integer constant 
217:    LDA  2,0(3)	Copy result to rt register 
218:     LD  3,-1(1)	Load return address 
219:     LD  1,0(1)	Adjust fp 
220:    LDA  7,0(3)	Return 
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
