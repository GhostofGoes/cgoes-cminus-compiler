* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  call5.c-
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
* FUNCTION dog
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,2(6)	Load integer constant 
 44:     ST  3,-3(1)	Save left side 
 45:     LD  3,-2(1)	Load variable x
 46:     LD  4,-3(1)	Load left into ac1 
 47:    MUL  3,4,3	Op * 
 48:     ST  3,0(0)	Store variable g
* RETURN
 49:     LD  3,-2(1)	Load variable x
 50:    LDA  2,0(3)	Copy result to rt register 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 54:    LDC  2,0(6)	Set return value to 0 
 55:     LD  3,-1(1)	Load return address 
 56:     LD  1,0(1)	Adjust fp 
 57:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION cat
 58:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 59:    LDC  3,3(6)	Load integer constant 
 60:     ST  3,-3(1)	Save left side 
 61:     LD  3,-2(1)	Load variable x
 62:     LD  4,-3(1)	Load left into ac1 
 63:    MUL  3,4,3	Op * 
 64:     ST  3,0(0)	Store variable g
* RETURN
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 68:    LDC  2,0(6)	Set return value to 0 
 69:     LD  3,-1(1)	Load return address 
 70:     LD  1,0(1)	Adjust fp 
 71:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION elk
 72:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 73:    LDC  3,4(6)	Load integer constant 
 74:     ST  3,-3(1)	Save left side 
 75:     LD  3,-2(1)	Load variable x
 76:     LD  4,-3(1)	Load left into ac1 
 77:    MUL  3,4,3	Op * 
 78:     ST  3,0(0)	Store variable g
* END COMPOUND
* Add standard closing in case there is no return statement
 79:    LDC  2,0(6)	Set return value to 0 
 80:     LD  3,-1(1)	Load return address 
 81:     LD  1,0(1)	Adjust fp 
 82:    LDA  7,0(3)	Return 
* END FUNCTION elk
* FUNCTION fox
 83:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 84:    LDC  3,5(6)	Load integer constant 
 85:     ST  3,-3(1)	Save left side 
 86:     LD  3,-2(1)	Load variable x
 87:     LD  4,-3(1)	Load left into ac1 
 88:    MUL  3,4,3	Op * 
 89:     ST  3,0(0)	Store variable g
* END COMPOUND
* Add standard closing in case there is no return statement
 90:    LDC  2,0(6)	Set return value to 0 
 91:     LD  3,-1(1)	Load return address 
 92:     LD  1,0(1)	Adjust fp 
 93:    LDA  7,0(3)	Return 
* END FUNCTION fox
* FUNCTION main
 94:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 95:    LDC  3,1279(6)	Load integer constant 
 96:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 98:     LD  3,0(0)	Load variable g
 99:     ST  3,-4(1)	Store parameter 
*                       Jump to output
100:    LDA  1,-2(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-97(7)	CALL output
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
104:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  dog
105:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
106:    LDC  3,111(6)	Load integer constant 
107:     ST  3,-6(1)	Store parameter 
*                       Jump to dog
108:    LDA  1,-4(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-69(7)	CALL dog
111:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
112:     ST  3,-4(1)	Store parameter 
*                       Jump to output
113:    LDA  1,-2(1)	Load address of new frame 
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-110(7)	CALL output
116:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
117:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
118:     LD  3,0(0)	Load variable g
119:     ST  3,-4(1)	Store parameter 
*                       Jump to output
120:    LDA  1,-2(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-117(7)	CALL output
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  cat
124:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
125:    LDC  3,222(6)	Load integer constant 
126:     ST  3,-4(1)	Store parameter 
*                       Jump to cat
127:    LDA  1,-2(1)	Load address of new frame 
128:    LDA  3,1(7)	Return address in ac 
129:    LDA  7,-72(7)	CALL cat
130:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  output
131:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
132:     LD  3,0(0)	Load variable g
133:     ST  3,-4(1)	Store parameter 
*                       Jump to output
134:    LDA  1,-2(1)	Load address of new frame 
135:    LDA  3,1(7)	Return address in ac 
136:    LDA  7,-131(7)	CALL output
137:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  elk
138:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
139:    LDC  3,333(6)	Load integer constant 
140:     ST  3,-4(1)	Store parameter 
*                       Jump to elk
141:    LDA  1,-2(1)	Load address of new frame 
142:    LDA  3,1(7)	Return address in ac 
143:    LDA  7,-72(7)	CALL elk
144:    LDA  3,0(2)	Save the result in ac 
*                       End call to elk
* EXPRESSION
*                       Begin call to  output
145:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
146:     LD  3,0(0)	Load variable g
147:     ST  3,-4(1)	Store parameter 
*                       Jump to output
148:    LDA  1,-2(1)	Load address of new frame 
149:    LDA  3,1(7)	Return address in ac 
150:    LDA  7,-145(7)	CALL output
151:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
152:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  fox
153:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
154:    LDC  3,444(6)	Load integer constant 
155:     ST  3,-6(1)	Store parameter 
*                       Jump to fox
156:    LDA  1,-4(1)	Load address of new frame 
157:    LDA  3,1(7)	Return address in ac 
158:    LDA  7,-76(7)	CALL fox
159:    LDA  3,0(2)	Save the result in ac 
*                       End call to fox
160:     ST  3,-4(1)	Store parameter 
*                       Jump to output
161:    LDA  1,-2(1)	Load address of new frame 
162:    LDA  3,1(7)	Return address in ac 
163:    LDA  7,-158(7)	CALL output
164:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
165:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
166:     LD  3,0(0)	Load variable g
167:     ST  3,-4(1)	Store parameter 
*                       Jump to output
168:    LDA  1,-2(1)	Load address of new frame 
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-165(7)	CALL output
171:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
172:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
173:    LDA  1,-2(1)	Load address of new frame 
174:    LDA  3,1(7)	Return address in ac 
175:    LDA  7,-139(7)	CALL outnl
176:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
177:    LDC  2,0(6)	Set return value to 0 
178:     LD  3,-1(1)	Load return address 
179:     LD  1,0(1)	Adjust fp 
180:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,180(7)	Jump to init [backpatch] 
* INIT
181:     LD  0,0(0)	Set the global pointer 
182:    LDA  1,-1(0)	set first frame at end of globals 
183:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-92(7)	Jump to main 
186:   HALT  0,0,0	DONE! 
* END INIT
