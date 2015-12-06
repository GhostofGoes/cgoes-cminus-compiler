* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  e.c-
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
*                       Begin call to  output
 43:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,111(6)	Load integer constant 
 45:     ST  3,-4(1)	Save left side 
 46:    LDC  3,222(6)	Load integer constant 
 47:     ST  3,-5(1)	Save left side 
 48:    LDC  3,333(6)	Load integer constant 
 49:     ST  3,-6(1)	Save left side 
 50:    LDC  3,444(6)	Load integer constant 
 51:     LD  4,-6(1)	Load left into ac1 
 52:    ADD  3,4,3	Op + 
 53:     LD  4,-5(1)	Load left into ac1 
 54:    ADD  3,4,3	Op + 
 55:     LD  4,-4(1)	Load left into ac1 
 56:    ADD  3,4,3	Op + 
 57:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 58:    LDA  1,-2(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-55(7)	CALL output
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 62:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 63:    LDA  1,-2(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-29(7)	CALL outnl
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 67:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 68:    LDC  3,111(6)	Load integer constant 
 69:     ST  3,-4(1)	Save left side 
 70:    LDC  3,222(6)	Load integer constant 
 71:     LD  4,-4(1)	Load left into ac1 
 72:    ADD  3,4,3	Op + 
 73:     ST  3,-4(1)	Save left side 
 74:    LDC  3,333(6)	Load integer constant 
 75:     LD  4,-4(1)	Load left into ac1 
 76:    ADD  3,4,3	Op + 
 77:     ST  3,-4(1)	Save left side 
 78:    LDC  3,444(6)	Load integer constant 
 79:     LD  4,-4(1)	Load left into ac1 
 80:    ADD  3,4,3	Op + 
 81:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 82:    LDA  1,-2(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-79(7)	CALL output
 85:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 86:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 87:    LDA  1,-2(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-53(7)	CALL outnl
 90:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 91:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 92:    LDC  3,111(6)	Load integer constant 
 93:     ST  3,-4(1)	Save left side 
 94:    LDC  3,222(6)	Load integer constant 
 95:     ST  3,-5(1)	Save left side 
 96:    LDC  3,333(6)	Load integer constant 
 97:     ST  3,-6(1)	Save left side 
 98:    LDC  3,444(6)	Load integer constant 
 99:     LD  4,-6(1)	Load left into ac1 
100:    SUB  3,4,3	Op - 
101:     LD  4,-5(1)	Load left into ac1 
102:    SUB  3,4,3	Op - 
103:     LD  4,-4(1)	Load left into ac1 
104:    SUB  3,4,3	Op - 
105:     ST  3,-4(1)	Store parameter 
*                       Jump to output
106:    LDA  1,-2(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-103(7)	CALL output
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
110:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
111:    LDA  1,-2(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-77(7)	CALL outnl
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
115:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
116:    LDC  3,111(6)	Load integer constant 
117:     ST  3,-4(1)	Save left side 
118:    LDC  3,222(6)	Load integer constant 
119:     LD  4,-4(1)	Load left into ac1 
120:    SUB  3,4,3	Op - 
121:     ST  3,-4(1)	Save left side 
122:    LDC  3,333(6)	Load integer constant 
123:     LD  4,-4(1)	Load left into ac1 
124:    SUB  3,4,3	Op - 
125:     ST  3,-4(1)	Save left side 
126:    LDC  3,444(6)	Load integer constant 
127:     LD  4,-4(1)	Load left into ac1 
128:    SUB  3,4,3	Op - 
129:     ST  3,-4(1)	Store parameter 
*                       Jump to output
130:    LDA  1,-2(1)	Load address of new frame 
131:    LDA  3,1(7)	Return address in ac 
132:    LDA  7,-127(7)	CALL output
133:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
134:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
135:    LDA  1,-2(1)	Load address of new frame 
136:    LDA  3,1(7)	Return address in ac 
137:    LDA  7,-101(7)	CALL outnl
138:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
139:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
140:    LDC  3,111(6)	Load integer constant 
141:     ST  3,-4(1)	Save left side 
142:    LDC  3,222(6)	Load integer constant 
143:     LD  4,-4(1)	Load left into ac1 
144:    SUB  3,4,3	Op - 
145:     ST  3,-4(1)	Save left side 
146:    LDC  3,333(6)	Load integer constant 
147:     LD  4,-4(1)	Load left into ac1 
148:    SUB  3,4,3	Op - 
149:     ST  3,-4(1)	Save left side 
150:    LDC  3,444(6)	Load integer constant 
151:     LD  4,-4(1)	Load left into ac1 
152:    SUB  3,4,3	Op - 
153:     ST  3,-4(1)	Store parameter 
*                       Jump to output
154:    LDA  1,-2(1)	Load address of new frame 
155:    LDA  3,1(7)	Return address in ac 
156:    LDA  7,-151(7)	CALL output
157:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
158:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
159:    LDA  1,-2(1)	Load address of new frame 
160:    LDA  3,1(7)	Return address in ac 
161:    LDA  7,-125(7)	CALL outnl
162:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
163:    LDC  2,0(6)	Set return value to 0 
164:     LD  3,-1(1)	Load return address 
165:     LD  1,0(1)	Adjust fp 
166:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,166(7)	Jump to init [backpatch] 
* INIT
167:     LD  0,0(0)	Set the global pointer 
168:    LDA  1,0(0)	set first frame at end of globals 
169:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
170:    LDA  3,1(7)	Return address in ac 
171:    LDA  7,-130(7)	Jump to main 
172:   HALT  0,0,0	DONE! 
* END INIT
