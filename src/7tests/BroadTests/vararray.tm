* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  vararray.c-
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
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,10(6)	Load integer constant 
 45:     LD  4,-2(1)	Load address of base of array q
 46:    SUB  3,4,3	Compute offset of value 
 47:     LD  3,0(3)	Load the value 
 48:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 49:    LDA  1,-3(1)	Load address of new frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    LDA  7,-46(7)	CALL output
 52:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* Add standard closing in case there is no return statement
 53:    LDC  2,0(6)	Set return value to 0 
 54:     LD  3,-1(1)	Load return address 
 55:     LD  1,0(1)	Adjust fp 
 56:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION dog
 57:     ST  3,-1(1)	Store return address. 
* COMPOUND
 58:    LDC  3,9(6)	load size of array y
 59:     ST  3,-3(1)	save size of array y
* EXPRESSION
*                       Begin call to  output
 60:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
 61:     LD  3,-2(1)	Load address of base of array x
 62:     LD  3,1(3)	Load array size 
 63:     ST  3,-15(1)	Store parameter 
*                       Jump to output
 64:    LDA  1,-13(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 68:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Jump to outnl
 69:    LDA  1,-13(1)	Load address of new frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-35(7)	CALL outnl
 72:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 73:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
 74:    LDC  3,10(6)	Load integer constant 
 75:     LD  4,-2(1)	Load address of base of array x
 76:    SUB  3,4,3	Compute offset of value 
 77:     LD  3,0(3)	Load the value 
 78:     ST  3,-15(1)	Store parameter 
*                       Jump to output
 79:    LDA  1,-13(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  cat
 83:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
 84:     LD  3,-2(1)	Load address of base of array x
 85:     ST  3,-15(1)	Store parameter 
*                       Jump to cat
 86:    LDA  1,-13(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-47(7)	CALL cat
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  outnl
 90:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Jump to outnl
 91:    LDA  1,-13(1)	Load address of new frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-57(7)	CALL outnl
 94:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
 95:    LDC  3,5(6)	Load integer constant 
 96:     ST  3,-13(1)	Save index 
 97:    LDC  3,5(6)	Load integer constant 
 98:    LDA  4,-4(1)	Load address of base of array y
 99:    SUB  3,4,3	Compute offset of value 
100:     LD  3,0(3)	Load the value 
101:     LD  4,-13(1)	Restore index 
102:     LD  5,-2(1)	Load address of base of array x
103:    SUB  5,5,4	Compute offset of value 
104:     ST  3,0(5)	Store variable x
* EXPRESSION
105:    LDC  3,6(6)	Load integer constant 
106:     ST  3,-13(1)	Save index 
107:    LDC  3,6(6)	Load integer constant 
108:    LDA  4,-1(0)	Load address of base of array g
109:    SUB  3,4,3	Compute offset of value 
110:     LD  3,0(3)	Load the value 
111:     LD  4,-13(1)	Restore index 
112:    LDA  5,-14(0)	Load address of base of array z
113:    SUB  5,5,4	Compute offset of value 
114:     ST  3,0(5)	Store variable z
* RETURN
115:    LDC  3,4(6)	Load integer constant 
116:    LDA  4,-14(0)	Load address of base of array z
117:    SUB  3,4,3	Compute offset of value 
118:     LD  3,0(3)	Load the value 
119:    LDA  2,0(3)	Copy result to rt register 
120:     LD  3,-1(1)	Load return address 
121:     LD  1,0(1)	Adjust fp 
122:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
123:    LDC  2,0(6)	Set return value to 0 
124:     LD  3,-1(1)	Load return address 
125:     LD  1,0(1)	Adjust fp 
126:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION main
127:     ST  3,-1(1)	Store return address. 
* COMPOUND
128:    LDC  3,11(6)	load size of array m
129:     ST  3,-2(1)	save size of array m
* EXPRESSION
130:    LDC  3,10(6)	Load integer constant 
131:     ST  3,-14(1)	Save index 
132:    LDC  3,111(6)	Load integer constant 
133:     LD  4,-14(1)	Restore index 
134:    LDA  5,-3(1)	Load address of base of array m
135:    SUB  5,5,4	Compute offset of value 
136:     ST  3,0(5)	Store variable m
* EXPRESSION
*                       Begin call to  dog
137:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
138:    LDA  3,-3(1)	Load address of base of array m
139:     ST  3,-16(1)	Store parameter 
*                       Jump to dog
140:    LDA  1,-14(1)	Load address of new frame 
141:    LDA  3,1(7)	Return address in ac 
142:    LDA  7,-86(7)	CALL dog
143:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
144:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
145:    LDC  3,10(6)	Load integer constant 
146:    LDA  4,-3(1)	Load address of base of array m
147:    SUB  3,4,3	Compute offset of value 
148:     LD  3,0(3)	Load the value 
149:     ST  3,-16(1)	Store parameter 
*                       Jump to output
150:    LDA  1,-14(1)	Load address of new frame 
151:    LDA  3,1(7)	Return address in ac 
152:    LDA  7,-147(7)	CALL output
153:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
154:    LDC  3,10(6)	Load integer constant 
155:     ST  3,-14(1)	Save index 
156:    LDC  3,222(6)	Load integer constant 
157:     LD  4,-14(1)	Restore index 
158:    LDA  5,-1(0)	Load address of base of array g
159:    SUB  5,5,4	Compute offset of value 
160:     ST  3,0(5)	Store variable g
* EXPRESSION
*                       Begin call to  dog
161:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
162:    LDA  3,-1(0)	Load address of base of array g
163:     ST  3,-16(1)	Store parameter 
*                       Jump to dog
164:    LDA  1,-14(1)	Load address of new frame 
165:    LDA  3,1(7)	Return address in ac 
166:    LDA  7,-110(7)	CALL dog
167:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
168:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
169:    LDC  3,10(6)	Load integer constant 
170:    LDA  4,-1(0)	Load address of base of array g
171:    SUB  3,4,3	Compute offset of value 
172:     LD  3,0(3)	Load the value 
173:     ST  3,-16(1)	Store parameter 
*                       Jump to output
174:    LDA  1,-14(1)	Load address of new frame 
175:    LDA  3,1(7)	Return address in ac 
176:    LDA  7,-171(7)	CALL output
177:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
178:    LDC  3,10(6)	Load integer constant 
179:     ST  3,-14(1)	Save index 
180:    LDC  3,333(6)	Load integer constant 
181:     LD  4,-14(1)	Restore index 
182:    LDA  5,-25(0)	Load address of base of array z
183:    SUB  5,5,4	Compute offset of value 
184:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  dog
185:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
186:    LDA  3,-25(0)	Load address of base of array z
187:     ST  3,-16(1)	Store parameter 
*                       Jump to dog
188:    LDA  1,-14(1)	Load address of new frame 
189:    LDA  3,1(7)	Return address in ac 
190:    LDA  7,-134(7)	CALL dog
191:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  output
192:     ST  1,-14(1)	Store old fp in ghost frame 
*                       Load param 1
193:    LDC  3,10(6)	Load integer constant 
194:    LDA  4,-25(0)	Load address of base of array z
195:    SUB  3,4,3	Compute offset of value 
196:     LD  3,0(3)	Load the value 
197:     ST  3,-16(1)	Store parameter 
*                       Jump to output
198:    LDA  1,-14(1)	Load address of new frame 
199:    LDA  3,1(7)	Return address in ac 
200:    LDA  7,-195(7)	CALL output
201:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
202:    LDC  2,0(6)	Set return value to 0 
203:     LD  3,-1(1)	Load return address 
204:     LD  1,0(1)	Adjust fp 
205:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,205(7)	Jump to init [backpatch] 
* INIT
206:     LD  0,0(0)	Set the global pointer 
207:    LDA  1,-38(0)	set first frame at end of globals 
208:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
209:    LDC  3,12(6)	load size of array g
210:     ST  3,0(0)	save size of array g
211:    LDC  3,10(6)	load size of array z-1
212:     ST  3,-13(0)	save size of array z-1
213:    LDC  3,13(6)	load size of array z-2
214:     ST  3,-24(0)	save size of array z-2
* END INIT GLOBALS AND STATICS
215:    LDA  3,1(7)	Return address in ac 
216:    LDA  7,-90(7)	Jump to main 
217:   HALT  0,0,0	DONE! 
* END INIT
