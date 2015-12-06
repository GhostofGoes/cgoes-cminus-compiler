* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  sieve.c-
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
 43:    LDC  3,201(6)	load size of array n
 44:     ST  3,-4(1)	save size of array n
* EXPRESSION
 45:    LDC  3,200(6)	Load integer constant 
 46:     ST  3,-2(1)	Store variable max
* EXPRESSION
 47:    LDC  3,2(6)	Load integer constant 
 48:     ST  3,-3(1)	Store variable k
* WHILE
 49:     LD  3,-3(1)	Load variable k
 50:     ST  3,-206(1)	Save left side 
 51:     LD  3,-2(1)	Load variable max
 52:     LD  4,-206(1)	Load left into ac1 
 53:    TLE  3,4,3	Op <= 
 54:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 56:     LD  3,-3(1)	Load variable k
 57:     ST  3,-206(1)	Save index 
 58:    LDC  3,1(6)	Load Boolean constant 
 59:     LD  4,-206(1)	Restore index 
 60:    LDA  5,-5(1)	Load address of base of array n
 61:    SUB  5,5,4	Compute offset of value 
 62:     ST  3,0(5)	Store variable n
* EXPRESSION
 63:     LD  3,-3(1)	Load variable k
 64:     ST  3,-206(1)	Save left side 
 65:    LDC  3,1(6)	Load integer constant 
 66:     LD  4,-206(1)	Load left into ac1 
 67:    ADD  3,4,3	Op + 
 68:     ST  3,-3(1)	Store variable k
* END COMPOUND
 69:    LDA  7,-21(7)	go to beginning of loop 
 55:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
 70:    LDC  3,2(6)	Load integer constant 
 71:     ST  3,-3(1)	Store variable k
* WHILE
 72:     LD  3,-3(1)	Load variable k
 73:     ST  3,-206(1)	Save left side 
 74:     LD  3,-3(1)	Load variable k
 75:     LD  4,-206(1)	Load left into ac1 
 76:    MUL  3,4,3	Op * 
 77:     ST  3,-206(1)	Save left side 
 78:     LD  3,-2(1)	Load variable max
 79:     LD  4,-206(1)	Load left into ac1 
 80:    TLE  3,4,3	Op <= 
 81:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 83:     LD  3,-3(1)	Load variable k
 84:     ST  3,-207(1)	Save left side 
 85:     LD  3,-3(1)	Load variable k
 86:     LD  4,-207(1)	Load left into ac1 
 87:    MUL  3,4,3	Op * 
 88:     ST  3,-206(1)	Store variable j
* WHILE
 89:     LD  3,-206(1)	Load variable j
 90:     ST  3,-207(1)	Save left side 
 91:     LD  3,-2(1)	Load variable max
 92:     LD  4,-207(1)	Load left into ac1 
 93:    TLE  3,4,3	Op <= 
 94:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 96:     LD  3,-206(1)	Load variable j
 97:     ST  3,-207(1)	Save index 
 98:    LDC  3,0(6)	Load Boolean constant 
 99:     LD  4,-207(1)	Restore index 
100:    LDA  5,-5(1)	Load address of base of array n
101:    SUB  5,5,4	Compute offset of value 
102:     ST  3,0(5)	Store variable n
* EXPRESSION
103:     LD  3,-206(1)	Load variable j
104:     ST  3,-207(1)	Save left side 
105:     LD  3,-3(1)	Load variable k
106:     LD  4,-207(1)	Load left into ac1 
107:    ADD  3,4,3	Op + 
108:     ST  3,-206(1)	Store variable j
* END COMPOUND
109:    LDA  7,-21(7)	go to beginning of loop 
 95:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
110:     LD  3,-3(1)	Load variable k
111:     ST  3,-207(1)	Save left side 
112:    LDC  3,1(6)	Load integer constant 
113:     LD  4,-207(1)	Load left into ac1 
114:    ADD  3,4,3	Op + 
115:     ST  3,-3(1)	Store variable k
* WHILE
116:     LD  3,-3(1)	Load variable k
117:     ST  3,-207(1)	Save left side 
118:     LD  3,-2(1)	Load variable max
119:     LD  4,-207(1)	Load left into ac1 
120:    TLE  3,4,3	Op <= 
121:     ST  3,-207(1)	Save left side 
122:     LD  3,-3(1)	Load variable k
123:    LDA  4,-5(1)	Load address of base of array n
124:    SUB  3,4,3	Compute offset of value 
125:     LD  3,0(3)	Load the value 
126:    LDC  4,1(6)	Load 1 
127:    XOR  3,3,4	Op NOT 
128:     LD  4,-207(1)	Load left into ac1 
129:    AND  3,4,3	Op AND 
130:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
132:     LD  3,-3(1)	Load variable k
133:     ST  3,-207(1)	Save left side 
134:    LDC  3,1(6)	Load integer constant 
135:     LD  4,-207(1)	Load left into ac1 
136:    ADD  3,4,3	Op + 
137:     ST  3,-3(1)	Store variable k
138:    LDA  7,-23(7)	go to beginning of loop 
131:    LDA  7,7(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
139:    LDA  7,-68(7)	go to beginning of loop 
 82:    LDA  7,57(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
140:    LDC  3,2(6)	Load integer constant 
141:     ST  3,-3(1)	Store variable k
* WHILE
142:     LD  3,-3(1)	Load variable k
143:     ST  3,-206(1)	Save left side 
144:     LD  3,-2(1)	Load variable max
145:     LD  4,-206(1)	Load left into ac1 
146:    TLE  3,4,3	Op <= 
147:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* IF
149:     LD  3,-3(1)	Load variable k
150:    LDA  4,-5(1)	Load address of base of array n
151:    SUB  3,4,3	Compute offset of value 
152:     LD  3,0(3)	Load the value 
* THEN
* COMPOUND
* EXPRESSION
*                       Begin call to  output
154:     ST  1,-206(1)	Store old fp in ghost frame 
*                       Load param 1
155:     LD  3,-3(1)	Load variable k
156:     ST  3,-208(1)	Store parameter 
*                       Jump to output
157:    LDA  1,-206(1)	Load address of new frame 
158:    LDA  3,1(7)	Return address in ac 
159:    LDA  7,-154(7)	CALL output
160:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
161:     ST  1,-206(1)	Store old fp in ghost frame 
*                       Jump to outnl
162:    LDA  1,-206(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-128(7)	CALL outnl
165:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
153:    JZR  3,12(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
166:     LD  3,-3(1)	Load variable k
167:     ST  3,-206(1)	Save left side 
168:    LDC  3,1(6)	Load integer constant 
169:     LD  4,-206(1)	Load left into ac1 
170:    ADD  3,4,3	Op + 
171:     ST  3,-3(1)	Store variable k
* END COMPOUND
172:    LDA  7,-31(7)	go to beginning of loop 
148:    LDA  7,24(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
173:    LDC  3,0(6)	Load integer constant 
174:    LDA  2,0(3)	Copy result to rt register 
175:     LD  3,-1(1)	Load return address 
176:     LD  1,0(1)	Adjust fp 
177:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
178:    LDC  2,0(6)	Set return value to 0 
179:     LD  3,-1(1)	Load return address 
180:     LD  1,0(1)	Adjust fp 
181:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,181(7)	Jump to init [backpatch] 
* INIT
182:     LD  0,0(0)	Set the global pointer 
183:    LDA  1,0(0)	set first frame at end of globals 
184:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-145(7)	Jump to main 
187:   HALT  0,0,0	DONE! 
* END INIT
