* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  d01.c-
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
*                       Begin call to  outputb
 43:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,1(6)	Load integer constant 
 45:     ST  3,-4(1)	Save left side 
 46:    LDC  3,2(6)	Load integer constant 
 47:     LD  4,-4(1)	Load left into ac1 
 48:    TLT  3,4,3	Op < 
 49:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 50:    LDA  1,-2(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-35(7)	CALL outputb
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 54:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 55:    LDC  3,1(6)	Load integer constant 
 56:     ST  3,-4(1)	Save left side 
 57:    LDC  3,2(6)	Load integer constant 
 58:     LD  4,-4(1)	Load left into ac1 
 59:    TGT  3,4,3	Op > 
 60:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 61:    LDA  1,-2(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-46(7)	CALL outputb
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 65:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 66:    LDC  3,1(6)	Load integer constant 
 67:     ST  3,-4(1)	Save left side 
 68:    LDC  3,2(6)	Load integer constant 
 69:     LD  4,-4(1)	Load left into ac1 
 70:    TEQ  3,4,3	Op == 
 71:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 72:    LDA  1,-2(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-57(7)	CALL outputb
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 76:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 77:    LDC  3,1(6)	Load integer constant 
 78:     ST  3,-4(1)	Save left side 
 79:    LDC  3,2(6)	Load integer constant 
 80:     LD  4,-4(1)	Load left into ac1 
 81:    TNE  3,4,3	Op != 
 82:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 83:    LDA  1,-2(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-68(7)	CALL outputb
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 87:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDC  3,1(6)	Load integer constant 
 89:     ST  3,-4(1)	Save left side 
 90:    LDC  3,2(6)	Load integer constant 
 91:     LD  4,-4(1)	Load left into ac1 
 92:    TGE  3,4,3	Op >= 
 93:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 94:    LDA  1,-2(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-79(7)	CALL outputb
 97:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 98:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 99:    LDC  3,1(6)	Load integer constant 
100:     ST  3,-4(1)	Save left side 
101:    LDC  3,2(6)	Load integer constant 
102:     LD  4,-4(1)	Load left into ac1 
103:    TLE  3,4,3	Op <= 
104:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
105:    LDA  1,-2(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-90(7)	CALL outputb
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
109:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
110:    LDC  3,2(6)	Load integer constant 
111:     ST  3,-4(1)	Save left side 
112:    LDC  3,2(6)	Load integer constant 
113:     LD  4,-4(1)	Load left into ac1 
114:    TEQ  3,4,3	Op == 
115:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
116:    LDA  1,-2(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-101(7)	CALL outputb
119:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
120:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
121:    LDC  3,2(6)	Load integer constant 
122:     ST  3,-4(1)	Save left side 
123:    LDC  3,2(6)	Load integer constant 
124:     LD  4,-4(1)	Load left into ac1 
125:    TNE  3,4,3	Op != 
126:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
127:    LDA  1,-2(1)	Load address of new frame 
128:    LDA  3,1(7)	Return address in ac 
129:    LDA  7,-112(7)	CALL outputb
130:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
131:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
132:    LDC  3,2(6)	Load integer constant 
133:     ST  3,-4(1)	Save left side 
134:    LDC  3,2(6)	Load integer constant 
135:     LD  4,-4(1)	Load left into ac1 
136:    TGE  3,4,3	Op >= 
137:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
138:    LDA  1,-2(1)	Load address of new frame 
139:    LDA  3,1(7)	Return address in ac 
140:    LDA  7,-123(7)	CALL outputb
141:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
142:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
143:    LDC  3,2(6)	Load integer constant 
144:     ST  3,-4(1)	Save left side 
145:    LDC  3,2(6)	Load integer constant 
146:     LD  4,-4(1)	Load left into ac1 
147:    TLE  3,4,3	Op <= 
148:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
149:    LDA  1,-2(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-134(7)	CALL outputb
152:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
153:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
154:    LDC  3,1(6)	Load Boolean constant 
155:     ST  3,-4(1)	Save left side 
156:    LDC  3,1(6)	Load Boolean constant 
157:     LD  4,-4(1)	Load left into ac1 
158:    TEQ  3,4,3	Op == 
159:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
160:    LDA  1,-2(1)	Load address of new frame 
161:    LDA  3,1(7)	Return address in ac 
162:    LDA  7,-145(7)	CALL outputb
163:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
164:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
165:    LDC  3,1(6)	Load Boolean constant 
166:     ST  3,-4(1)	Save left side 
167:    LDC  3,1(6)	Load Boolean constant 
168:     LD  4,-4(1)	Load left into ac1 
169:    TNE  3,4,3	Op != 
170:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
171:    LDA  1,-2(1)	Load address of new frame 
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-156(7)	CALL outputb
174:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
175:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
176:    LDC  3,0(6)	Load Boolean constant 
177:     ST  3,-4(1)	Save left side 
178:    LDC  3,1(6)	Load Boolean constant 
179:     LD  4,-4(1)	Load left into ac1 
180:    TEQ  3,4,3	Op == 
181:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
182:    LDA  1,-2(1)	Load address of new frame 
183:    LDA  3,1(7)	Return address in ac 
184:    LDA  7,-167(7)	CALL outputb
185:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
186:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
187:    LDC  3,0(6)	Load Boolean constant 
188:     ST  3,-4(1)	Save left side 
189:    LDC  3,1(6)	Load Boolean constant 
190:     LD  4,-4(1)	Load left into ac1 
191:    TNE  3,4,3	Op != 
192:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
193:    LDA  1,-2(1)	Load address of new frame 
194:    LDA  3,1(7)	Return address in ac 
195:    LDA  7,-178(7)	CALL outputb
196:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
197:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
198:    LDC  3,0(6)	Load Boolean constant 
199:     ST  3,-4(1)	Save left side 
200:    LDC  3,0(6)	Load Boolean constant 
201:     LD  4,-4(1)	Load left into ac1 
202:    TEQ  3,4,3	Op == 
203:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
204:    LDA  1,-2(1)	Load address of new frame 
205:    LDA  3,1(7)	Return address in ac 
206:    LDA  7,-189(7)	CALL outputb
207:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
208:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
209:    LDC  3,0(6)	Load Boolean constant 
210:     ST  3,-4(1)	Save left side 
211:    LDC  3,0(6)	Load Boolean constant 
212:     LD  4,-4(1)	Load left into ac1 
213:    TNE  3,4,3	Op != 
214:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
215:    LDA  1,-2(1)	Load address of new frame 
216:    LDA  3,1(7)	Return address in ac 
217:    LDA  7,-200(7)	CALL outputb
218:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* END COMPOUND
* Add standard closing in case there is no return statement
219:    LDC  2,0(6)	Set return value to 0 
220:     LD  3,-1(1)	Load return address 
221:     LD  1,0(1)	Adjust fp 
222:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,222(7)	Jump to init [backpatch] 
* INIT
223:     LD  0,0(0)	Set the global pointer 
224:    LDA  1,0(0)	set first frame at end of globals 
225:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
226:    LDA  3,1(7)	Return address in ac 
227:    LDA  7,-186(7)	Jump to main 
228:   HALT  0,0,0	DONE! 
* END INIT
