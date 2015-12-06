* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  inc.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
 43:    LDC  3,1(6)	load size of array z
 44:     ST  3,-3(1)	save size of array z
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 46:    LDC  3,0(6)	Load integer constant 
 47:     LD  5,-2(1)	Load address of base of array y
 48:    SUB  5,5,3	Compute offset of value 
 49:     LD  3,0(5)	load lhs variable y
 50:    LDA  3,1(3)	increment value of y
 51:     ST  3,0(5)	Store variable y
 52:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 53:    LDA  1,-6(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-50(7)	CALL output
 56:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 57:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 58:    LDC  3,0(6)	Load integer constant 
 59:     LD  4,-2(1)	Load address of base of array y
 60:    SUB  3,4,3	Compute offset of value 
 61:     LD  3,0(3)	Load the value 
 62:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 63:    LDA  1,-6(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-60(7)	CALL output
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 67:    LDC  3,777(6)	Load integer constant 
 68:     ST  3,-5(1)	Store variable w
* EXPRESSION
 69:    LDC  3,0(6)	Load integer constant 
 70:     ST  3,-6(1)	Save index 
 71:    LDC  3,888(6)	Load integer constant 
 72:     LD  4,-6(1)	Restore index 
 73:    LDA  5,-4(1)	Load address of base of array z
 74:    SUB  5,5,4	Compute offset of value 
 75:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  output
 76:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 77:     LD  3,-5(1)	load lhs variable w
 78:    LDA  3,1(3)	increment value of w
 79:     ST  3,-5(1)	Store variable w
 80:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 81:    LDA  1,-6(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-78(7)	CALL output
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 85:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 86:     LD  3,-5(1)	Load variable w
 87:     ST  3,-8(1)	Store parameter 
*                       Jump to output
 88:    LDA  1,-6(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-85(7)	CALL output
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 92:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 93:    LDC  3,0(6)	Load integer constant 
 94:    LDA  5,-4(1)	Load address of base of array z
 95:    SUB  5,5,3	Compute offset of value 
 96:     LD  3,0(5)	load lhs variable z
 97:    LDA  3,1(3)	increment value of z
 98:     ST  3,0(5)	Store variable z
 99:     ST  3,-8(1)	Store parameter 
*                       Jump to output
100:    LDA  1,-6(1)	Load address of new frame 
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-97(7)	CALL output
103:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
104:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
105:    LDC  3,0(6)	Load integer constant 
106:    LDA  4,-4(1)	Load address of base of array z
107:    SUB  3,4,3	Compute offset of value 
108:     LD  3,0(3)	Load the value 
109:     ST  3,-8(1)	Store parameter 
*                       Jump to output
110:    LDA  1,-6(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-107(7)	CALL output
113:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
114:    LDC  3,1023(6)	Load integer constant 
115:     ST  3,0(0)	Store variable g
* EXPRESSION
116:     LD  3,0(0)	load lhs variable g
117:    LDA  3,1(3)	increment value of g
118:     ST  3,0(0)	Store variable g
* EXPRESSION
*                       Begin call to  output
119:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
120:     LD  3,0(0)	Load variable g
121:     ST  3,-8(1)	Store parameter 
*                       Jump to output
122:    LDA  1,-6(1)	Load address of new frame 
123:    LDA  3,1(7)	Return address in ac 
124:    LDA  7,-119(7)	CALL output
125:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
126:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
127:     LD  3,0(0)	load lhs variable g
128:    LDA  3,1(3)	increment value of g
129:     ST  3,0(0)	Store variable g
130:     ST  3,-8(1)	Store parameter 
*                       Jump to output
131:    LDA  1,-6(1)	Load address of new frame 
132:    LDA  3,1(7)	Return address in ac 
133:    LDA  7,-128(7)	CALL output
134:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
135:    LDC  2,0(6)	Set return value to 0 
136:     LD  3,-1(1)	Load return address 
137:     LD  1,0(1)	Adjust fp 
138:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
139:     ST  3,-1(1)	Store return address. 
* COMPOUND
140:    LDC  3,1(6)	load size of array x
141:     ST  3,-2(1)	save size of array x
* EXPRESSION
142:    LDC  3,0(6)	Load integer constant 
143:     ST  3,-4(1)	Save index 
144:    LDC  3,666(6)	Load integer constant 
145:     LD  4,-4(1)	Restore index 
146:    LDA  5,-3(1)	Load address of base of array x
147:    SUB  5,5,4	Compute offset of value 
148:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
149:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
150:    LDA  3,-3(1)	Load address of base of array x
151:     ST  3,-6(1)	Store parameter 
*                       Jump to cat
152:    LDA  1,-4(1)	Load address of new frame 
153:    LDA  3,1(7)	Return address in ac 
154:    LDA  7,-113(7)	CALL cat
155:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  output
156:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
157:    LDC  3,0(6)	Load integer constant 
158:    LDA  4,-3(1)	Load address of base of array x
159:    SUB  3,4,3	Compute offset of value 
160:     LD  3,0(3)	Load the value 
161:     ST  3,-6(1)	Store parameter 
*                       Jump to output
162:    LDA  1,-4(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-159(7)	CALL output
165:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
166:    LDC  3,1023(6)	Load integer constant 
167:     ST  3,-1(0)	Store variable s
* EXPRESSION
168:     LD  3,-1(0)	load lhs variable s
169:    LDA  3,1(3)	increment value of s
170:     ST  3,-1(0)	Store variable s
* EXPRESSION
*                       Begin call to  output
171:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
172:     LD  3,-1(0)	Load variable s
173:     ST  3,-6(1)	Store parameter 
*                       Jump to output
174:    LDA  1,-4(1)	Load address of new frame 
175:    LDA  3,1(7)	Return address in ac 
176:    LDA  7,-171(7)	CALL output
177:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
178:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
179:     LD  3,-1(0)	load lhs variable s
180:    LDA  3,1(3)	increment value of s
181:     ST  3,-1(0)	Store variable s
182:     ST  3,-6(1)	Store parameter 
*                       Jump to output
183:    LDA  1,-4(1)	Load address of new frame 
184:    LDA  3,1(7)	Return address in ac 
185:    LDA  7,-180(7)	CALL output
186:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* RETURN
187:    LDC  3,0(6)	Load integer constant 
188:    LDA  2,0(3)	Copy result to rt register 
189:     LD  3,-1(1)	Load return address 
190:     LD  1,0(1)	Adjust fp 
191:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
192:    LDC  2,0(6)	Set return value to 0 
193:     LD  3,-1(1)	Load return address 
194:     LD  1,0(1)	Adjust fp 
195:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,195(7)	Jump to init [backpatch] 
* INIT
196:     LD  0,0(0)	Set the global pointer 
197:    LDA  1,-2(0)	set first frame at end of globals 
198:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
199:    LDA  3,1(7)	Return address in ac 
200:    LDA  7,-62(7)	Jump to main 
201:   HALT  0,0,0	DONE! 
* END INIT
