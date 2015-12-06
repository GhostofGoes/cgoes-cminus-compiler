* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  logic2.c-
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
*                       Begin call to  outputb
 43:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,1(6)	Load Boolean constant 
 45:     ST  3,-2(1)	Store variable a
 46:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
 47:    LDA  1,-4(1)	Load address of new frame 
 48:    LDA  3,1(7)	Return address in ac 
 49:    LDA  7,-32(7)	CALL outputb
 50:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 51:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 52:    LDC  3,0(6)	Load Boolean constant 
 53:     ST  3,-3(1)	Store variable b
 54:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
 55:    LDA  1,-4(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-40(7)	CALL outputb
 58:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
 59:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 60:    LDA  1,-4(1)	Load address of new frame 
 61:    LDA  3,1(7)	Return address in ac 
 62:    LDA  7,-26(7)	CALL outnl
 63:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
 64:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 65:     LD  3,-2(1)	Load variable a
 66:     ST  3,-6(1)	Save left side 
 67:     LD  3,-3(1)	Load variable b
 68:     LD  4,-6(1)	Load left into ac1 
 69:    AND  3,4,3	Op AND 
 70:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
 71:    LDA  1,-4(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-56(7)	CALL outputb
 74:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 75:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 76:     LD  3,-2(1)	Load variable a
 77:     ST  3,-6(1)	Save left side 
 78:     LD  3,-3(1)	Load variable b
 79:     LD  4,-6(1)	Load left into ac1 
 80:     OR  3,4,3	Op OR 
 81:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
 82:    LDA  1,-4(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-67(7)	CALL outputb
 85:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 86:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 87:     LD  3,-2(1)	Load variable a
 88:    LDC  4,1(6)	Load 1 
 89:    XOR  3,3,4	Op NOT 
 90:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
 91:    LDA  1,-4(1)	Load address of new frame 
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-76(7)	CALL outputb
 94:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
 95:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 96:    LDA  1,-4(1)	Load address of new frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    LDA  7,-62(7)	CALL outnl
 99:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
100:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
101:    LDC  3,111(6)	Load integer constant 
102:     ST  3,-6(1)	Save left side 
103:    LDC  3,222(6)	Load integer constant 
104:     LD  4,-6(1)	Load left into ac1 
105:    TGT  3,4,3	Op > 
106:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
107:    LDA  1,-4(1)	Load address of new frame 
108:    LDA  3,1(7)	Return address in ac 
109:    LDA  7,-92(7)	CALL outputb
110:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
111:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
112:    LDC  3,111(6)	Load integer constant 
113:     ST  3,-6(1)	Save left side 
114:    LDC  3,222(6)	Load integer constant 
115:     LD  4,-6(1)	Load left into ac1 
116:    TLT  3,4,3	Op < 
117:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
118:    LDA  1,-4(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-103(7)	CALL outputb
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
122:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
123:    LDC  3,111(6)	Load integer constant 
124:     ST  3,-6(1)	Save left side 
125:    LDC  3,222(6)	Load integer constant 
126:     LD  4,-6(1)	Load left into ac1 
127:    TEQ  3,4,3	Op == 
128:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
129:    LDA  1,-4(1)	Load address of new frame 
130:    LDA  3,1(7)	Return address in ac 
131:    LDA  7,-114(7)	CALL outputb
132:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
133:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
134:    LDC  3,111(6)	Load integer constant 
135:     ST  3,-6(1)	Save left side 
136:    LDC  3,222(6)	Load integer constant 
137:     LD  4,-6(1)	Load left into ac1 
138:    TGE  3,4,3	Op >= 
139:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
140:    LDA  1,-4(1)	Load address of new frame 
141:    LDA  3,1(7)	Return address in ac 
142:    LDA  7,-125(7)	CALL outputb
143:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
144:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
145:    LDC  3,111(6)	Load integer constant 
146:     ST  3,-6(1)	Save left side 
147:    LDC  3,222(6)	Load integer constant 
148:     LD  4,-6(1)	Load left into ac1 
149:    TLE  3,4,3	Op <= 
150:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
151:    LDA  1,-4(1)	Load address of new frame 
152:    LDA  3,1(7)	Return address in ac 
153:    LDA  7,-136(7)	CALL outputb
154:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
155:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
156:    LDC  3,111(6)	Load integer constant 
157:     ST  3,-6(1)	Save left side 
158:    LDC  3,222(6)	Load integer constant 
159:     LD  4,-6(1)	Load left into ac1 
160:    TNE  3,4,3	Op != 
161:     ST  3,-6(1)	Store parameter 
*                       Jump to outputb
162:    LDA  1,-4(1)	Load address of new frame 
163:    LDA  3,1(7)	Return address in ac 
164:    LDA  7,-147(7)	CALL outputb
165:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
166:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
167:    LDA  1,-4(1)	Load address of new frame 
168:    LDA  3,1(7)	Return address in ac 
169:    LDA  7,-133(7)	CALL outnl
170:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
171:    LDC  2,0(6)	Set return value to 0 
172:     LD  3,-1(1)	Load return address 
173:     LD  1,0(1)	Adjust fp 
174:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,174(7)	Jump to init [backpatch] 
* INIT
175:     LD  0,0(0)	Set the global pointer 
176:    LDA  1,0(0)	set first frame at end of globals 
177:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
178:    LDA  3,1(7)	Return address in ac 
179:    LDA  7,-138(7)	Jump to main 
180:   HALT  0,0,0	DONE! 
* END INIT
