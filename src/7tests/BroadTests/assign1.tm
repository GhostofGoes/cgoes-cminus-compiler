* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  assign1.c-
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
 43:    LDC  3,111(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 46:     LD  3,-2(1)	Load variable x
 47:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 48:    LDA  1,-6(1)	Load address of new frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    LDA  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 52:    LDC  3,222(6)	Load integer constant 
 53:     ST  3,-3(1)	Store variable y
* EXPRESSION
*                       Begin call to  output
 54:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 55:     LD  3,-3(1)	Load variable y
 56:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 57:    LDA  1,-6(1)	Load address of new frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    LDA  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 61:    LDC  3,1(6)	Load Boolean constant 
 62:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  outputb
 63:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 64:     LD  3,-4(1)	Load variable a
 65:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
 66:    LDA  1,-6(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-51(7)	CALL outputb
 69:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
 70:    LDC  3,0(6)	Load Boolean constant 
 71:     ST  3,-5(1)	Store variable b
* EXPRESSION
*                       Begin call to  outputb
 72:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 73:     LD  3,-5(1)	Load variable b
 74:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
 75:    LDA  1,-6(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-60(7)	CALL outputb
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
 79:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
 80:    LDA  1,-6(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-46(7)	CALL outnl
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 84:    LDC  3,333(6)	Load integer constant 
 85:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
 86:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 87:     LD  3,0(0)	Load variable gx
 88:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 89:    LDA  1,-6(1)	Load address of new frame 
 90:    LDA  3,1(7)	Return address in ac 
 91:    LDA  7,-86(7)	CALL output
 92:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 93:    LDC  3,444(6)	Load integer constant 
 94:     ST  3,-1(0)	Store variable gy
* EXPRESSION
*                       Begin call to  output
 95:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 96:     LD  3,-1(0)	Load variable gy
 97:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 98:    LDA  1,-6(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
102:    LDC  3,0(6)	Load Boolean constant 
103:     ST  3,-2(0)	Store variable ga
* EXPRESSION
*                       Begin call to  outputb
104:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
105:     LD  3,-2(0)	Load variable ga
106:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
107:    LDA  1,-6(1)	Load address of new frame 
108:    LDA  3,1(7)	Return address in ac 
109:    LDA  7,-92(7)	CALL outputb
110:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
111:    LDC  3,1(6)	Load Boolean constant 
112:     ST  3,-3(0)	Store variable gb
* EXPRESSION
*                       Begin call to  outputb
113:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
114:     LD  3,-3(0)	Load variable gb
115:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
116:    LDA  1,-6(1)	Load address of new frame 
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-101(7)	CALL outputb
119:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
120:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
121:    LDA  1,-6(1)	Load address of new frame 
122:    LDA  3,1(7)	Return address in ac 
123:    LDA  7,-87(7)	CALL outnl
124:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
125:     LD  3,-3(1)	Load variable y
126:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
127:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
128:     LD  3,-2(1)	Load variable x
129:     ST  3,-8(1)	Store parameter 
*                       Jump to output
130:    LDA  1,-6(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
134:     LD  3,-5(1)	Load variable b
135:     ST  3,-4(1)	Store variable a
* EXPRESSION
*                       Begin call to  outputb
136:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
137:     LD  3,-4(1)	Load variable a
138:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
139:    LDA  1,-6(1)	Load address of new frame 
140:    LDA  3,1(7)	Return address in ac 
141:    LDA  7,-124(7)	CALL outputb
142:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
143:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
144:    LDA  1,-6(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-110(7)	CALL outnl
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
148:     LD  3,-1(0)	Load variable gy
149:     ST  3,0(0)	Store variable gx
* EXPRESSION
*                       Begin call to  output
150:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
151:     LD  3,0(0)	Load variable gx
152:     ST  3,-8(1)	Store parameter 
*                       Jump to output
153:    LDA  1,-6(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-150(7)	CALL output
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
157:     LD  3,-3(0)	Load variable gb
158:     ST  3,-2(0)	Store variable ga
* EXPRESSION
*                       Begin call to  outputb
159:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
160:     LD  3,-2(0)	Load variable ga
161:     ST  3,-8(1)	Store parameter 
*                       Jump to outputb
162:    LDA  1,-6(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-147(7)	CALL outputb
165:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
166:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Jump to outnl
167:    LDA  1,-6(1)	Load address of new frame 
168:    LDA  3,1(7)	Return address in ac 
169:    LDA  7,-133(7)	CALL outnl
170:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* RETURN
171:     LD  3,-1(1)	Load return address 
172:     LD  1,0(1)	Adjust fp 
173:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
174:    LDC  2,0(6)	Set return value to 0 
175:     LD  3,-1(1)	Load return address 
176:     LD  1,0(1)	Adjust fp 
177:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,177(7)	Jump to init [backpatch] 
* INIT
178:     LD  0,0(0)	Set the global pointer 
179:    LDA  1,-4(0)	set first frame at end of globals 
180:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
181:    LDA  3,1(7)	Return address in ac 
182:    LDA  7,-141(7)	Jump to main 
183:   HALT  0,0,0	DONE! 
* END INIT
