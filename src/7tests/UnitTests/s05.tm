* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  s05.c-
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
 43:    LDC  3,22(6)	load size of array b
 44:     ST  3,-3(1)	save size of array b
* COMPOUND
 45:    LDC  3,33(6)	load size of array d
 46:     ST  3,-27(1)	save size of array d
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-61(1)	Store old fp in ghost frame 
*                       Load param 1
 48:    LDA  3,-2(0)	Load address of base of array h
 49:     LD  3,1(3)	Load array size 
 50:     ST  3,-63(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-61(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 55:     ST  1,-61(1)	Store old fp in ghost frame 
*                       Load param 1
 56:    LDA  3,-4(1)	Load address of base of array b
 57:     LD  3,1(3)	Load array size 
 58:     ST  3,-63(1)	Store parameter 
*                       Jump to output
 59:    LDA  1,-61(1)	Load address of new frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    LDA  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 63:     ST  1,-61(1)	Store old fp in ghost frame 
*                       Load param 1
 64:    LDA  3,-15(0)	Load address of base of array bs
 65:     LD  3,1(3)	Load array size 
 66:     ST  3,-63(1)	Store parameter 
*                       Jump to output
 67:    LDA  1,-61(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-64(7)	CALL output
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 71:     ST  1,-61(1)	Store old fp in ghost frame 
*                       Load param 1
 72:    LDA  3,-28(1)	Load address of base of array d
 73:     LD  3,1(3)	Load array size 
 74:     ST  3,-63(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-61(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 79:     ST  1,-61(1)	Store old fp in ghost frame 
*                       Load param 1
 80:    LDA  3,-40(0)	Load address of base of array ds
 81:     LD  3,1(3)	Load array size 
 82:     ST  3,-63(1)	Store parameter 
*                       Jump to output
 83:    LDA  1,-61(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-80(7)	CALL output
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* COMPOUND
 87:    LDC  3,44(6)	load size of array d
 88:     ST  3,-27(1)	save size of array d
* EXPRESSION
*                       Begin call to  output
 89:     ST  1,-72(1)	Store old fp in ghost frame 
*                       Load param 1
 90:    LDA  3,-2(0)	Load address of base of array h
 91:     LD  3,1(3)	Load array size 
 92:     ST  3,-74(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-72(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-72(1)	Store old fp in ghost frame 
*                       Load param 1
 98:    LDA  3,-4(1)	Load address of base of array b
 99:     LD  3,1(3)	Load array size 
100:     ST  3,-74(1)	Store parameter 
*                       Jump to output
101:    LDA  1,-72(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-98(7)	CALL output
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
105:     ST  1,-72(1)	Store old fp in ghost frame 
*                       Load param 1
106:    LDA  3,-15(0)	Load address of base of array bs
107:     LD  3,1(3)	Load array size 
108:     ST  3,-74(1)	Store parameter 
*                       Jump to output
109:    LDA  1,-72(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-106(7)	CALL output
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
113:     ST  1,-72(1)	Store old fp in ghost frame 
*                       Load param 1
114:    LDA  3,-28(1)	Load address of base of array d
115:     LD  3,1(3)	Load array size 
116:     ST  3,-74(1)	Store parameter 
*                       Jump to output
117:    LDA  1,-72(1)	Load address of new frame 
118:    LDA  3,1(7)	Return address in ac 
119:    LDA  7,-114(7)	CALL output
120:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
121:     ST  1,-72(1)	Store old fp in ghost frame 
*                       Load param 1
122:    LDA  3,-76(0)	Load address of base of array ds
123:     LD  3,1(3)	Load array size 
124:     ST  3,-74(1)	Store parameter 
*                       Jump to output
125:    LDA  1,-72(1)	Load address of new frame 
126:    LDA  3,1(7)	Return address in ac 
127:    LDA  7,-122(7)	CALL output
128:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
129:    LDC  2,0(6)	Set return value to 0 
130:     LD  3,-1(1)	Load return address 
131:     LD  1,0(1)	Adjust fp 
132:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION dog
133:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
134:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
135:    LDA  3,-123(0)	Load address of base of array j
136:     LD  3,1(3)	Load array size 
137:     ST  3,-4(1)	Store parameter 
*                       Jump to output
138:    LDA  1,-2(1)	Load address of new frame 
139:    LDA  3,1(7)	Return address in ac 
140:    LDA  7,-135(7)	CALL output
141:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
142:    LDC  2,0(6)	Set return value to 0 
143:     LD  3,-1(1)	Load return address 
144:     LD  1,0(1)	Adjust fp 
145:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION main
146:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  cat
147:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to cat
148:    LDA  1,-2(1)	Load address of new frame 
149:    LDA  3,1(7)	Return address in ac 
150:    LDA  7,-109(7)	CALL cat
151:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  dog
152:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to dog
153:    LDA  1,-2(1)	Load address of new frame 
154:    LDA  3,1(7)	Return address in ac 
155:    LDA  7,-23(7)	CALL dog
156:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* END COMPOUND
* Add standard closing in case there is no return statement
157:    LDC  2,0(6)	Set return value to 0 
158:     LD  3,-1(1)	Load return address 
159:     LD  1,0(1)	Adjust fp 
160:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,160(7)	Jump to init [backpatch] 
* INIT
161:     LD  0,0(0)	Set the global pointer 
162:    LDA  1,-178(0)	set first frame at end of globals 
163:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
164:    LDC  3,23(6)	load size of array bs-2
165:     ST  3,-14(0)	save size of array bs-2
166:    LDC  3,34(6)	load size of array ds-4
167:     ST  3,-39(0)	save size of array ds-4
168:    LDC  3,45(6)	load size of array ds-6
169:     ST  3,-75(0)	save size of array ds-6
170:    LDC  3,11(6)	load size of array h
171:     ST  3,-1(0)	save size of array h
172:    LDC  3,55(6)	load size of array j
173:     ST  3,-122(0)	save size of array j
* END INIT GLOBALS AND STATICS
174:    LDA  3,1(7)	Return address in ac 
175:    LDA  7,-30(7)	Jump to main 
176:   HALT  0,0,0	DONE! 
* END INIT
