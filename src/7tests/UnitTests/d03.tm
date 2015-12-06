* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  d03.c-
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
 43:    LDC  3,755(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable x
* EXPRESSION
 45:    LDC  3,88(6)	Load integer constant 
 46:     ST  3,-3(1)	Store variable y
* EXPRESSION
 47:    LDC  3,3(6)	Load integer constant 
 48:     ST  3,-4(1)	Store variable z
* EXPRESSION
*                       Begin call to  output
 49:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 50:     LD  3,-2(1)	Load variable x
 51:     ST  3,-7(1)	Save left side 
 52:     LD  3,-3(1)	Load variable y
 53:     ST  3,-8(1)	Save left side 
 54:     LD  3,-4(1)	Load variable z
 55:     LD  4,-8(1)	Load left into ac1 
 56:    MUL  3,4,3	Op * 
 57:     LD  4,-7(1)	Load left into ac1 
 58:    ADD  3,4,3	Op + 
 59:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 60:    LDA  1,-5(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 64:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 65:     LD  3,-2(1)	Load variable x
 66:     ST  3,-7(1)	Save left side 
 67:     LD  3,-3(1)	Load variable y
 68:     LD  4,-7(1)	Load left into ac1 
 69:    MUL  3,4,3	Op * 
 70:     ST  3,-7(1)	Save left side 
 71:     LD  3,-4(1)	Load variable z
 72:     LD  4,-7(1)	Load left into ac1 
 73:    ADD  3,4,3	Op + 
 74:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-5(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 79:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 80:     LD  3,-2(1)	Load variable x
 81:     ST  3,-7(1)	Save left side 
 82:     LD  3,-3(1)	Load variable y
 83:     LD  4,-7(1)	Load left into ac1 
 84:    SUB  3,4,3	Op - 
 85:     ST  3,-7(1)	Save left side 
 86:     LD  3,-4(1)	Load variable z
 87:     LD  4,-7(1)	Load left into ac1 
 88:    SUB  3,4,3	Op - 
 89:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-5(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 94:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 95:     LD  3,-2(1)	Load variable x
 96:     ST  3,-7(1)	Save left side 
 97:     LD  3,-3(1)	Load variable y
 98:     LD  4,-7(1)	Load left into ac1 
 99:    DIV  3,4,3	Op / 
100:     ST  3,-7(1)	Save left side 
101:     LD  3,-4(1)	Load variable z
102:     LD  4,-7(1)	Load left into ac1 
103:    DIV  3,4,3	Op / 
104:     ST  3,-7(1)	Store parameter 
*                       Jump to output
105:    LDA  1,-5(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-102(7)	CALL output
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
109:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
110:     LD  3,-2(1)	Load variable x
111:     ST  3,-7(1)	Save left side 
112:     LD  3,-3(1)	Load variable y
113:     LD  4,-7(1)	Load left into ac1 
114:    MUL  3,4,3	Op * 
115:     ST  3,-7(1)	Save left side 
116:     LD  3,-4(1)	Load variable z
117:     ST  3,-8(1)	Save left side 
118:     LD  3,-4(1)	Load variable z
119:     LD  4,-8(1)	Load left into ac1 
120:    MUL  3,4,3	Op * 
121:     LD  4,-7(1)	Load left into ac1 
122:    ADD  3,4,3	Op + 
123:     ST  3,-7(1)	Store parameter 
*                       Jump to output
124:    LDA  1,-5(1)	Load address of new frame 
125:    LDA  3,1(7)	Return address in ac 
126:    LDA  7,-121(7)	CALL output
127:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
128:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
129:     LD  3,-2(1)	Load variable x
130:     ST  3,-7(1)	Save left side 
131:     LD  3,-3(1)	Load variable y
132:     LD  4,-7(1)	Load left into ac1 
133:    DIV  5,4,3	Op % 
134:    MUL  5,5,3	 
135:    SUB  3,4,5	 
136:     ST  3,-7(1)	Save left side 
137:     LD  3,-4(1)	Load variable z
138:     LD  4,-7(1)	Load left into ac1 
139:    DIV  5,4,3	Op % 
140:    MUL  5,5,3	 
141:    SUB  3,4,5	 
142:     ST  3,-7(1)	Store parameter 
*                       Jump to output
143:    LDA  1,-5(1)	Load address of new frame 
144:    LDA  3,1(7)	Return address in ac 
145:    LDA  7,-140(7)	CALL output
146:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
147:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
148:     LD  3,-2(1)	Load variable x
149:    LDC  4,0(6)	Load 0 
150:    SUB  3,4,3	Op unary - 
151:     ST  3,-7(1)	Save left side 
152:     LD  3,-3(1)	Load variable y
153:     ST  3,-8(1)	Save left side 
154:     LD  3,-4(1)	Load variable z
155:     LD  4,-8(1)	Load left into ac1 
156:    MUL  3,4,3	Op * 
157:     LD  4,-7(1)	Load left into ac1 
158:    ADD  3,4,3	Op + 
159:     ST  3,-7(1)	Store parameter 
*                       Jump to output
160:    LDA  1,-5(1)	Load address of new frame 
161:    LDA  3,1(7)	Return address in ac 
162:    LDA  7,-157(7)	CALL output
163:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
164:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to outnl
165:    LDA  1,-5(1)	Load address of new frame 
166:    LDA  3,1(7)	Return address in ac 
167:    LDA  7,-131(7)	CALL outnl
168:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
169:    LDC  2,0(6)	Set return value to 0 
170:     LD  3,-1(1)	Load return address 
171:     LD  1,0(1)	Adjust fp 
172:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,172(7)	Jump to init [backpatch] 
* INIT
173:     LD  0,0(0)	Set the global pointer 
174:    LDA  1,0(0)	set first frame at end of globals 
175:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
176:    LDA  3,1(7)	Return address in ac 
177:    LDA  7,-136(7)	Jump to main 
178:   HALT  0,0,0	DONE! 
* END INIT
