* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  var2.c-
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
 43:    LDC  3,222(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable y
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 46:     LD  3,-2(1)	Load variable x
 47:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 48:    LDA  1,-4(1)	Load address of new frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    LDA  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 52:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 53:    LDA  1,-4(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-19(7)	CALL outnl
 56:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 57:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 58:     LD  3,-10(0)	Load variable z
 59:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 60:    LDA  1,-4(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-57(7)	CALL output
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 64:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 65:    LDA  1,-4(1)	Load address of new frame 
 66:    LDA  3,1(7)	Return address in ac 
 67:    LDA  7,-31(7)	CALL outnl
 68:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 69:     LD  3,-3(1)	Load variable y
 70:     ST  3,-2(1)	Store variable x
* EXPRESSION
 71:     LD  3,0(0)	Load variable g
 72:     ST  3,-10(0)	Store variable z
* EXPRESSION
*                       Begin call to  output
 73:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 74:     LD  3,-2(1)	Load variable x
 75:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 76:    LDA  1,-4(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 80:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 81:    LDA  1,-4(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-47(7)	CALL outnl
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 85:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 86:     LD  3,-10(0)	Load variable z
 87:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 88:    LDA  1,-4(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-85(7)	CALL output
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 92:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 93:    LDA  1,-4(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-59(7)	CALL outnl
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
 97:     LD  3,-10(0)	Load variable z
 98:    LDA  2,0(3)	Copy result to rt register 
 99:     LD  3,-1(1)	Load return address 
100:     LD  1,0(1)	Adjust fp 
101:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
102:    LDC  2,0(6)	Set return value to 0 
103:     LD  3,-1(1)	Load return address 
104:     LD  1,0(1)	Adjust fp 
105:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION main
106:     ST  3,-1(1)	Store return address. 
* COMPOUND
107:    LDC  3,444(6)	Load integer constant 
108:     ST  3,-2(1)	Store variable m
* EXPRESSION
*                       Begin call to  output
109:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
110:    LDA  3,-2(0)	Load address of base of array h
111:     LD  3,1(3)	Load array size 
112:     ST  3,-5(1)	Store parameter 
*                       Jump to output
113:    LDA  1,-3(1)	Load address of new frame 
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-110(7)	CALL output
116:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
117:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
118:     LD  3,0(0)	Load variable g
119:     ST  3,-5(1)	Store parameter 
*                       Jump to output
120:    LDA  1,-3(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-117(7)	CALL output
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
124:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
125:     LD  3,-2(1)	Load variable m
126:     ST  3,-5(1)	Store parameter 
*                       Jump to output
127:    LDA  1,-3(1)	Load address of new frame 
128:    LDA  3,1(7)	Return address in ac 
129:    LDA  7,-124(7)	CALL output
130:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
131:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
132:     LD  3,-11(0)	Load variable z
133:     ST  3,-5(1)	Store parameter 
*                       Jump to output
134:    LDA  1,-3(1)	Load address of new frame 
135:    LDA  3,1(7)	Return address in ac 
136:    LDA  7,-131(7)	CALL output
137:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
138:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
139:    LDA  1,-3(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-105(7)	CALL outnl
142:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  dog
143:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
144:     LD  3,-2(1)	Load variable m
145:     ST  3,-5(1)	Store parameter 
*                       Jump to dog
146:    LDA  1,-3(1)	Load address of new frame 
147:    LDA  3,1(7)	Return address in ac 
148:    LDA  7,-107(7)	CALL dog
149:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
150:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
151:     LD  3,-11(0)	Load variable z
152:     ST  3,-5(1)	Store parameter 
*                       Jump to output
153:    LDA  1,-3(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-150(7)	CALL output
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
157:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
158:    LDA  1,-3(1)	Load address of new frame 
159:    LDA  3,1(7)	Return address in ac 
160:    LDA  7,-124(7)	CALL outnl
161:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
162:    LDC  2,0(6)	Set return value to 0 
163:     LD  3,-1(1)	Load return address 
164:     LD  1,0(1)	Adjust fp 
165:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,165(7)	Jump to init [backpatch] 
* INIT
166:     LD  0,0(0)	Set the global pointer 
167:    LDA  1,-12(0)	set first frame at end of globals 
168:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
169:    LDC  3,111(6)	Load integer constant 
170:     ST  3,-2(1)	Save left side 
171:    LDC  3,22(6)	Load integer constant 
172:     ST  3,-3(1)	Save left side 
173:    LDC  3,33(6)	Load integer constant 
174:     LD  4,-3(1)	Load left into ac1 
175:    MUL  3,4,3	Op * 
176:     LD  4,-2(1)	Load left into ac1 
177:    ADD  3,4,3	Op + 
178:     ST  3,0(0)	Store variable g
179:    LDC  3,8(6)	load size of array h
180:     ST  3,-1(0)	save size of array h
181:    LDC  3,333(6)	Load integer constant 
182:     ST  3,-10(0)	Store variable z-1
183:    LDC  3,555(6)	Load integer constant 
184:     ST  3,-11(0)	Store variable z-2
* END INIT GLOBALS AND STATICS
185:    LDA  3,1(7)	Return address in ac 
186:    LDA  7,-81(7)	Jump to main 
187:   HALT  0,0,0	DONE! 
* END INIT
