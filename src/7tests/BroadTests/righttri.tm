* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  righttri.c-
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
 44:     ST  3,-2(1)	Store variable a
* EXPRESSION
 45:    LDC  3,1(6)	Load integer constant 
 46:     ST  3,-4(1)	Store variable aa
* EXPRESSION
 47:    LDC  3,0(6)	Load integer constant 
 48:     ST  3,-6(1)	Store variable c
* WHILE
 49:     LD  3,-6(1)	Load variable c
 50:     ST  3,-8(1)	Save left side 
 51:    LDC  3,50(6)	Load integer constant 
 52:     LD  4,-8(1)	Load left into ac1 
 53:    TLT  3,4,3	Op < 
 54:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 56:    LDC  3,1(6)	Load integer constant 
 57:     ST  3,-7(1)	Store variable cc
 58:     ST  3,-6(1)	Store variable c
* EXPRESSION
 59:    LDC  3,1(6)	Load integer constant 
 60:     ST  3,-3(1)	Store variable b
* EXPRESSION
 61:    LDC  3,1(6)	Load integer constant 
 62:     ST  3,-5(1)	Store variable bb
* WHILE
 63:     LD  3,-3(1)	Load variable b
 64:     ST  3,-8(1)	Save left side 
 65:     LD  3,-2(1)	Load variable a
 66:     LD  4,-8(1)	Load left into ac1 
 67:    TLE  3,4,3	Op <= 
 68:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
 70:     LD  3,-4(1)	Load variable aa
 71:     ST  3,-8(1)	Save left side 
 72:     LD  3,-5(1)	Load variable bb
 73:     LD  4,-8(1)	Load left into ac1 
 74:    ADD  3,4,3	Op + 
 75:     ST  3,-8(1)	Save left side 
 76:    LDC  3,2(6)	Load integer constant 
 77:     LD  4,-8(1)	Load left into ac1 
 78:    DIV  3,4,3	Op / 
 79:     ST  3,-8(1)	Save left side 
 80:    LDC  3,2(6)	Load integer constant 
 81:     LD  4,-8(1)	Load left into ac1 
 82:    DIV  5,4,3	Op % 
 83:    MUL  5,5,3	 
 84:    SUB  3,4,5	 
 85:     ST  3,-8(1)	Save left side 
 86:    LDC  3,0(6)	Load integer constant 
 87:     LD  4,-8(1)	Load left into ac1 
 88:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* WHILE
 90:     LD  3,-7(1)	Load variable cc
 91:     ST  3,-8(1)	Save left side 
 92:     LD  3,-4(1)	Load variable aa
 93:     ST  3,-9(1)	Save left side 
 94:     LD  3,-5(1)	Load variable bb
 95:     LD  4,-9(1)	Load left into ac1 
 96:    ADD  3,4,3	Op + 
 97:     LD  4,-8(1)	Load left into ac1 
 98:    TLT  3,4,3	Op < 
 99:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
101:     LD  3,-6(1)	Load variable c
102:     ST  3,-8(1)	Save left side 
103:    LDC  3,1(6)	Load integer constant 
104:     LD  4,-8(1)	Load left into ac1 
105:    ADD  3,4,3	Op + 
106:     ST  3,-6(1)	Store variable c
* EXPRESSION
107:     LD  3,-7(1)	Load variable cc
108:     ST  3,-8(1)	Save left side 
109:    LDC  3,2(6)	Load integer constant 
110:     ST  3,-9(1)	Save left side 
111:     LD  3,-6(1)	Load variable c
112:     LD  4,-9(1)	Load left into ac1 
113:    MUL  3,4,3	Op * 
114:     LD  4,-8(1)	Load left into ac1 
115:    ADD  3,4,3	Op + 
116:     ST  3,-8(1)	Save left side 
117:    LDC  3,1(6)	Load integer constant 
118:     LD  4,-8(1)	Load left into ac1 
119:    SUB  3,4,3	Op - 
120:     ST  3,-7(1)	Store variable cc
* END COMPOUND
121:    LDA  7,-32(7)	go to beginning of loop 
100:    LDA  7,21(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
122:     LD  3,-4(1)	Load variable aa
123:     ST  3,-8(1)	Save left side 
124:     LD  3,-5(1)	Load variable bb
125:     LD  4,-8(1)	Load left into ac1 
126:    ADD  3,4,3	Op + 
127:     ST  3,-8(1)	Save left side 
128:     LD  3,-7(1)	Load variable cc
129:     LD  4,-8(1)	Load left into ac1 
130:    TEQ  3,4,3	Op == 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  output
132:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
133:     LD  3,-2(1)	Load variable a
134:     ST  3,-10(1)	Store parameter 
*                       Jump to output
135:    LDA  1,-8(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-132(7)	CALL output
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
139:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
140:     LD  3,-3(1)	Load variable b
141:     ST  3,-10(1)	Store parameter 
*                       Jump to output
142:    LDA  1,-8(1)	Load address of new frame 
143:    LDA  3,1(7)	Return address in ac 
144:    LDA  7,-139(7)	CALL output
145:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
146:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
147:     LD  3,-6(1)	Load variable c
148:     ST  3,-10(1)	Store parameter 
*                       Jump to output
149:    LDA  1,-8(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-146(7)	CALL output
152:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
153:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Jump to outnl
154:    LDA  1,-8(1)	Load address of new frame 
155:    LDA  3,1(7)	Return address in ac 
156:    LDA  7,-120(7)	CALL outnl
157:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
131:    JZR  3,26(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
 89:    JZR  3,68(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
158:     LD  3,-3(1)	Load variable b
159:     ST  3,-8(1)	Save left side 
160:    LDC  3,1(6)	Load integer constant 
161:     LD  4,-8(1)	Load left into ac1 
162:    ADD  3,4,3	Op + 
163:     ST  3,-3(1)	Store variable b
* EXPRESSION
164:     LD  3,-5(1)	Load variable bb
165:     ST  3,-8(1)	Save left side 
166:    LDC  3,2(6)	Load integer constant 
167:     ST  3,-9(1)	Save left side 
168:     LD  3,-3(1)	Load variable b
169:     LD  4,-9(1)	Load left into ac1 
170:    MUL  3,4,3	Op * 
171:     LD  4,-8(1)	Load left into ac1 
172:    ADD  3,4,3	Op + 
173:     ST  3,-8(1)	Save left side 
174:    LDC  3,1(6)	Load integer constant 
175:     LD  4,-8(1)	Load left into ac1 
176:    SUB  3,4,3	Op - 
177:     ST  3,-5(1)	Store variable bb
* END COMPOUND
178:    LDA  7,-116(7)	go to beginning of loop 
 69:    LDA  7,109(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
179:     LD  3,-2(1)	Load variable a
180:     ST  3,-8(1)	Save left side 
181:    LDC  3,1(6)	Load integer constant 
182:     LD  4,-8(1)	Load left into ac1 
183:    ADD  3,4,3	Op + 
184:     ST  3,-2(1)	Store variable a
* EXPRESSION
185:     LD  3,-4(1)	Load variable aa
186:     ST  3,-8(1)	Save left side 
187:    LDC  3,2(6)	Load integer constant 
188:     ST  3,-9(1)	Save left side 
189:     LD  3,-2(1)	Load variable a
190:     LD  4,-9(1)	Load left into ac1 
191:    MUL  3,4,3	Op * 
192:     LD  4,-8(1)	Load left into ac1 
193:    ADD  3,4,3	Op + 
194:     ST  3,-8(1)	Save left side 
195:    LDC  3,1(6)	Load integer constant 
196:     LD  4,-8(1)	Load left into ac1 
197:    SUB  3,4,3	Op - 
198:     ST  3,-4(1)	Store variable aa
* END COMPOUND
199:    LDA  7,-151(7)	go to beginning of loop 
 55:    LDA  7,144(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
200:    LDC  2,0(6)	Set return value to 0 
201:     LD  3,-1(1)	Load return address 
202:     LD  1,0(1)	Adjust fp 
203:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,203(7)	Jump to init [backpatch] 
* INIT
204:     LD  0,0(0)	Set the global pointer 
205:    LDA  1,0(0)	set first frame at end of globals 
206:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
207:    LDA  3,1(7)	Return address in ac 
208:    LDA  7,-167(7)	Jump to main 
209:   HALT  0,0,0	DONE! 
* END INIT
