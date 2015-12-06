* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  comb.c-
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
* FUNCTION comb
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:     LD  3,-2(1)	Load variable n
 44:     ST  3,-7(1)	Save left side 
 45:     LD  3,-3(1)	Load variable r
 46:     LD  4,-7(1)	Load left into ac1 
 47:    SUB  3,4,3	Op - 
 48:     ST  3,-7(1)	Save left side 
 49:    LDC  3,1(6)	Load integer constant 
 50:     LD  4,-7(1)	Load left into ac1 
 51:    ADD  3,4,3	Op + 
 52:     ST  3,-6(1)	Store variable c
* EXPRESSION
 53:     LD  3,-2(1)	Load variable n
 54:     ST  3,-7(1)	Save left side 
 55:     LD  3,-3(1)	Load variable r
 56:     LD  4,-7(1)	Load left into ac1 
 57:    SUB  3,4,3	Op - 
 58:     ST  3,-7(1)	Save left side 
 59:    LDC  3,2(6)	Load integer constant 
 60:     LD  4,-7(1)	Load left into ac1 
 61:    ADD  3,4,3	Op + 
 62:     ST  3,-4(1)	Store variable i
* EXPRESSION
 63:    LDC  3,2(6)	Load integer constant 
 64:     ST  3,-5(1)	Store variable j
* WHILE
 65:     LD  3,-4(1)	Load variable i
 66:     ST  3,-7(1)	Save left side 
 67:     LD  3,-2(1)	Load variable n
 68:     LD  4,-7(1)	Load left into ac1 
 69:    TLE  3,4,3	Op <= 
 70:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 72:     LD  3,-6(1)	Load variable c
 73:     ST  3,-7(1)	Save left side 
 74:     LD  3,-4(1)	Load variable i
 75:     LD  4,-7(1)	Load left into ac1 
 76:    MUL  3,4,3	Op * 
 77:     ST  3,-7(1)	Save left side 
 78:     LD  3,-5(1)	Load variable j
 79:     LD  4,-7(1)	Load left into ac1 
 80:    DIV  3,4,3	Op / 
 81:     ST  3,-6(1)	Store variable c
* EXPRESSION
 82:     LD  3,-4(1)	load lhs variable i
 83:    LDA  3,1(3)	increment value of i
 84:     ST  3,-4(1)	Store variable i
* EXPRESSION
 85:     LD  3,-5(1)	load lhs variable j
 86:    LDA  3,1(3)	increment value of j
 87:     ST  3,-5(1)	Store variable j
* END COMPOUND
 88:    LDA  7,-24(7)	go to beginning of loop 
 71:    LDA  7,17(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
 89:     LD  3,-6(1)	Load variable c
 90:    LDA  2,0(3)	Copy result to rt register 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 94:    LDC  2,0(6)	Set return value to 0 
 95:     LD  3,-1(1)	Load return address 
 96:     LD  1,0(1)	Adjust fp 
 97:    LDA  7,0(3)	Return 
* END FUNCTION comb
* FUNCTION main
 98:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 99:    LDC  3,15(6)	Load integer constant 
100:     ST  3,-2(1)	Store variable max
* EXPRESSION
101:    LDC  3,2(6)	Load integer constant 
102:     ST  3,-3(1)	Store variable n
* WHILE
103:     LD  3,-3(1)	Load variable n
104:     ST  3,-6(1)	Save left side 
105:     LD  3,-2(1)	Load variable max
106:     LD  4,-6(1)	Load left into ac1 
107:    TLE  3,4,3	Op <= 
108:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
110:    LDC  3,2(6)	Load integer constant 
111:     ST  3,-5(1)	Store variable r
* WHILE
112:     LD  3,-5(1)	Load variable r
113:     ST  3,-6(1)	Save left side 
114:     LD  3,-3(1)	Load variable n
115:     ST  3,-7(1)	Save left side 
116:    LDC  3,2(6)	Load integer constant 
117:     LD  4,-7(1)	Load left into ac1 
118:    DIV  3,4,3	Op / 
119:     LD  4,-6(1)	Load left into ac1 
120:    TLE  3,4,3	Op <= 
121:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
123:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
124:     LD  3,-3(1)	Load variable n
125:     ST  3,-8(1)	Store parameter 
*                       Jump to output
126:    LDA  1,-6(1)	Load address of new frame 
127:    LDA  3,1(7)	Return address in ac 
128:    LDA  7,-123(7)	CALL output
129:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
130:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
131:     LD  3,-5(1)	Load variable r
132:     ST  3,-8(1)	Store parameter 
*                       Jump to output
133:    LDA  1,-6(1)	Load address of new frame 
134:    LDA  3,1(7)	Return address in ac 
135:    LDA  7,-130(7)	CALL output
136:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
137:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  comb
138:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
139:     LD  3,-3(1)	Load variable n
140:     ST  3,-10(1)	Store parameter 
*                       Load param 2
141:     LD  3,-5(1)	Load variable r
142:     ST  3,-11(1)	Store parameter 
*                       Jump to comb
143:    LDA  1,-8(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-104(7)	CALL comb
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to comb
147:     ST  3,-8(1)	Store parameter 
*                       Jump to output
148:    LDA  1,-6(1)	Load address of new frame 
149:    LDA  3,1(7)	Return address in ac 
150:    LDA  7,-145(7)	CALL output
151:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
152:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
153:    LDA  1,-6(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-119(7)	CALL outnl
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
157:     LD  3,-5(1)	load lhs variable r
158:    LDA  3,1(3)	increment value of r
159:     ST  3,-5(1)	Store variable r
* END COMPOUND
160:    LDA  7,-49(7)	go to beginning of loop 
122:    LDA  7,38(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
161:     LD  3,-3(1)	load lhs variable n
162:    LDA  3,1(3)	increment value of n
163:     ST  3,-3(1)	Store variable n
* END COMPOUND
164:    LDA  7,-62(7)	go to beginning of loop 
109:    LDA  7,55(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
165:    LDC  2,0(6)	Set return value to 0 
166:     LD  3,-1(1)	Load return address 
167:     LD  1,0(1)	Adjust fp 
168:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,168(7)	Jump to init [backpatch] 
* INIT
169:     LD  0,0(0)	Set the global pointer 
170:    LDA  1,0(0)	set first frame at end of globals 
171:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
172:    LDA  3,1(7)	Return address in ac 
173:    LDA  7,-76(7)	Jump to main 
174:   HALT  0,0,0	DONE! 
* END INIT
