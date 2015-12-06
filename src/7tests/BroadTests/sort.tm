* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  sort.c-
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
* FUNCTION minloc
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:     LD  3,-3(1)	Load variable low
 44:     ST  3,-7(1)	Store variable k
* EXPRESSION
 45:     LD  3,-3(1)	Load variable low
 46:     LD  4,-2(1)	Load address of base of array a
 47:    SUB  3,4,3	Compute offset of value 
 48:     LD  3,0(3)	Load the value 
 49:     ST  3,-6(1)	Store variable x
* EXPRESSION
 50:     LD  3,-3(1)	Load variable low
 51:     ST  3,-8(1)	Save left side 
 52:    LDC  3,1(6)	Load integer constant 
 53:     LD  4,-8(1)	Load left into ac1 
 54:    ADD  3,4,3	Op + 
 55:     ST  3,-5(1)	Store variable i
* WHILE
 56:     LD  3,-5(1)	Load variable i
 57:     ST  3,-8(1)	Save left side 
 58:     LD  3,-4(1)	Load variable high
 59:     LD  4,-8(1)	Load left into ac1 
 60:    TLT  3,4,3	Op < 
 61:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
 63:     LD  3,-5(1)	Load variable i
 64:     LD  4,-2(1)	Load address of base of array a
 65:    SUB  3,4,3	Compute offset of value 
 66:     LD  3,0(3)	Load the value 
 67:     ST  3,-8(1)	Save left side 
 68:     LD  3,-6(1)	Load variable x
 69:     LD  4,-8(1)	Load left into ac1 
 70:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* EXPRESSION
 72:     LD  3,-5(1)	Load variable i
 73:     LD  4,-2(1)	Load address of base of array a
 74:    SUB  3,4,3	Compute offset of value 
 75:     LD  3,0(3)	Load the value 
 76:     ST  3,-6(1)	Store variable x
* EXPRESSION
 77:     LD  3,-5(1)	Load variable i
 78:     ST  3,-7(1)	Store variable k
* END COMPOUND
 71:    JZR  3,7(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 79:     LD  3,-5(1)	load lhs variable i
 80:    LDA  3,1(3)	increment value of i
 81:     ST  3,-5(1)	Store variable i
* END COMPOUND
 82:    LDA  7,-27(7)	go to beginning of loop 
 62:    LDA  7,20(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
 83:     LD  3,-7(1)	Load variable k
 84:    LDA  2,0(3)	Copy result to rt register 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    LDA  7,0(3)	Return 
* END FUNCTION minloc
* FUNCTION sort
 92:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 93:     LD  3,-3(1)	Load variable low
 94:     ST  3,-5(1)	Store variable i
* WHILE
 95:     LD  3,-5(1)	Load variable i
 96:     ST  3,-7(1)	Save left side 
 97:     LD  3,-4(1)	Load variable high
 98:     ST  3,-8(1)	Save left side 
 99:    LDC  3,1(6)	Load integer constant 
100:     LD  4,-8(1)	Load left into ac1 
101:    SUB  3,4,3	Op - 
102:     LD  4,-7(1)	Load left into ac1 
103:    TLT  3,4,3	Op < 
104:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  minloc
106:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
107:     LD  3,-2(1)	Load address of base of array a
108:     ST  3,-10(1)	Store parameter 
*                       Load param 2
109:     LD  3,-5(1)	Load variable i
110:     ST  3,-11(1)	Store parameter 
*                       Load param 3
111:     LD  3,-4(1)	Load variable high
112:     ST  3,-12(1)	Store parameter 
*                       Jump to minloc
113:    LDA  1,-8(1)	Load address of new frame 
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-74(7)	CALL minloc
116:    LDA  3,0(2)	Save the result in ac 
*                       End call to minloc
117:     ST  3,-6(1)	Store variable k
* EXPRESSION
118:     LD  3,-6(1)	Load variable k
119:     LD  4,-2(1)	Load address of base of array a
120:    SUB  3,4,3	Compute offset of value 
121:     LD  3,0(3)	Load the value 
122:     ST  3,-7(1)	Store variable t
* EXPRESSION
123:     LD  3,-6(1)	Load variable k
124:     ST  3,-8(1)	Save index 
125:     LD  3,-5(1)	Load variable i
126:     LD  4,-2(1)	Load address of base of array a
127:    SUB  3,4,3	Compute offset of value 
128:     LD  3,0(3)	Load the value 
129:     LD  4,-8(1)	Restore index 
130:     LD  5,-2(1)	Load address of base of array a
131:    SUB  5,5,4	Compute offset of value 
132:     ST  3,0(5)	Store variable a
* EXPRESSION
133:     LD  3,-5(1)	Load variable i
134:     ST  3,-8(1)	Save index 
135:     LD  3,-7(1)	Load variable t
136:     LD  4,-8(1)	Restore index 
137:     LD  5,-2(1)	Load address of base of array a
138:    SUB  5,5,4	Compute offset of value 
139:     ST  3,0(5)	Store variable a
* EXPRESSION
140:     LD  3,-5(1)	load lhs variable i
141:    LDA  3,1(3)	increment value of i
142:     ST  3,-5(1)	Store variable i
* END COMPOUND
143:    LDA  7,-49(7)	go to beginning of loop 
105:    LDA  7,38(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
144:    LDC  2,0(6)	Set return value to 0 
145:     LD  3,-1(1)	Load return address 
146:     LD  1,0(1)	Adjust fp 
147:    LDA  7,0(3)	Return 
* END FUNCTION sort
* FUNCTION main
148:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
149:    LDC  3,0(6)	Load integer constant 
150:     ST  3,-2(1)	Store variable i
* WHILE
151:     LD  3,-2(1)	Load variable i
152:     ST  3,-3(1)	Save left side 
153:    LDC  3,10(6)	Load integer constant 
154:     LD  4,-3(1)	Load left into ac1 
155:    TLT  3,4,3	Op < 
156:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
158:     LD  3,-2(1)	Load variable i
159:     ST  3,-3(1)	Save index 
*                       Begin call to  input
160:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
161:    LDA  1,-4(1)	Load address of new frame 
162:    LDA  3,1(7)	Return address in ac 
163:    LDA  7,-163(7)	CALL input
164:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
165:     LD  4,-3(1)	Restore index 
166:    LDA  5,-1(0)	Load address of base of array x
167:    SUB  5,5,4	Compute offset of value 
168:     ST  3,0(5)	Store variable x
* EXPRESSION
169:     LD  3,-2(1)	load lhs variable i
170:    LDA  3,1(3)	increment value of i
171:     ST  3,-2(1)	Store variable i
* END COMPOUND
172:    LDA  7,-22(7)	go to beginning of loop 
157:    LDA  7,15(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  sort
173:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
174:    LDA  3,-1(0)	Load address of base of array x
175:     ST  3,-5(1)	Store parameter 
*                       Load param 2
176:    LDC  3,0(6)	Load integer constant 
177:     ST  3,-6(1)	Store parameter 
*                       Load param 3
178:    LDC  3,10(6)	Load integer constant 
179:     ST  3,-7(1)	Store parameter 
*                       Jump to sort
180:    LDA  1,-3(1)	Load address of new frame 
181:    LDA  3,1(7)	Return address in ac 
182:    LDA  7,-91(7)	CALL sort
183:    LDA  3,0(2)	Save the result in ac 
*                       End call to sort
* EXPRESSION
184:    LDC  3,0(6)	Load integer constant 
185:     ST  3,-2(1)	Store variable i
* WHILE
186:     LD  3,-2(1)	Load variable i
187:     ST  3,-3(1)	Save left side 
188:    LDC  3,10(6)	Load integer constant 
189:     LD  4,-3(1)	Load left into ac1 
190:    TLT  3,4,3	Op < 
191:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
193:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
194:     LD  3,-2(1)	Load variable i
195:    LDA  4,-1(0)	Load address of base of array x
196:    SUB  3,4,3	Compute offset of value 
197:     LD  3,0(3)	Load the value 
198:     ST  3,-5(1)	Store parameter 
*                       Jump to output
199:    LDA  1,-3(1)	Load address of new frame 
200:    LDA  3,1(7)	Return address in ac 
201:    LDA  7,-196(7)	CALL output
202:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
203:     LD  3,-2(1)	load lhs variable i
204:    LDA  3,1(3)	increment value of i
205:     ST  3,-2(1)	Store variable i
* END COMPOUND
206:    LDA  7,-21(7)	go to beginning of loop 
192:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
207:    LDC  2,0(6)	Set return value to 0 
208:     LD  3,-1(1)	Load return address 
209:     LD  1,0(1)	Adjust fp 
210:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,210(7)	Jump to init [backpatch] 
* INIT
211:     LD  0,0(0)	Set the global pointer 
212:    LDA  1,-11(0)	set first frame at end of globals 
213:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
214:    LDC  3,10(6)	load size of array x
215:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
216:    LDA  3,1(7)	Return address in ac 
217:    LDA  7,-70(7)	Jump to main 
218:   HALT  0,0,0	DONE! 
* END INIT
