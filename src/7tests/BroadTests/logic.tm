* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  logic.c-
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
 43:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,0(6)	Load Boolean constant 
 45:     ST  3,-4(1)	Save left side 
 46:    LDC  3,0(6)	Load Boolean constant 
 47:     LD  4,-4(1)	Load left into ac1 
 48:    AND  3,4,3	Op AND 
 49:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 50:    LDA  1,-2(1)	Load address of new frame 
 51:    LDA  3,1(7)	Return address in ac 
 52:    LDA  7,-35(7)	CALL outputb
 53:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 54:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 55:    LDC  3,0(6)	Load Boolean constant 
 56:     ST  3,-4(1)	Save left side 
 57:    LDC  3,1(6)	Load Boolean constant 
 58:     LD  4,-4(1)	Load left into ac1 
 59:    AND  3,4,3	Op AND 
 60:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 61:    LDA  1,-2(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-46(7)	CALL outputb
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 65:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 66:    LDC  3,1(6)	Load Boolean constant 
 67:     ST  3,-4(1)	Save left side 
 68:    LDC  3,0(6)	Load Boolean constant 
 69:     LD  4,-4(1)	Load left into ac1 
 70:    AND  3,4,3	Op AND 
 71:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 72:    LDA  1,-2(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-57(7)	CALL outputb
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
 76:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 77:    LDC  3,1(6)	Load Boolean constant 
 78:     ST  3,-4(1)	Save left side 
 79:    LDC  3,1(6)	Load Boolean constant 
 80:     LD  4,-4(1)	Load left into ac1 
 81:    AND  3,4,3	Op AND 
 82:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 83:    LDA  1,-2(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-68(7)	CALL outputb
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
 87:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 88:    LDA  1,-2(1)	Load address of new frame 
 89:    LDA  3,1(7)	Return address in ac 
 90:    LDA  7,-54(7)	CALL outnl
 91:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  outputb
 92:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 93:    LDC  3,0(6)	Load Boolean constant 
 94:     ST  3,-4(1)	Save left side 
 95:    LDC  3,0(6)	Load Boolean constant 
 96:     LD  4,-4(1)	Load left into ac1 
 97:     OR  3,4,3	Op OR 
 98:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 99:    LDA  1,-2(1)	Load address of new frame 
100:    LDA  3,1(7)	Return address in ac 
101:    LDA  7,-84(7)	CALL outputb
102:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
103:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
104:    LDC  3,0(6)	Load Boolean constant 
105:     ST  3,-4(1)	Save left side 
106:    LDC  3,1(6)	Load Boolean constant 
107:     LD  4,-4(1)	Load left into ac1 
108:     OR  3,4,3	Op OR 
109:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
110:    LDA  1,-2(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-95(7)	CALL outputb
113:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
114:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
115:    LDC  3,1(6)	Load Boolean constant 
116:     ST  3,-4(1)	Save left side 
117:    LDC  3,0(6)	Load Boolean constant 
118:     LD  4,-4(1)	Load left into ac1 
119:     OR  3,4,3	Op OR 
120:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
121:    LDA  1,-2(1)	Load address of new frame 
122:    LDA  3,1(7)	Return address in ac 
123:    LDA  7,-106(7)	CALL outputb
124:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outputb
125:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
126:    LDC  3,1(6)	Load Boolean constant 
127:     ST  3,-4(1)	Save left side 
128:    LDC  3,1(6)	Load Boolean constant 
129:     LD  4,-4(1)	Load left into ac1 
130:     OR  3,4,3	Op OR 
131:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
132:    LDA  1,-2(1)	Load address of new frame 
133:    LDA  3,1(7)	Return address in ac 
134:    LDA  7,-117(7)	CALL outputb
135:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
136:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
137:    LDA  1,-2(1)	Load address of new frame 
138:    LDA  3,1(7)	Return address in ac 
139:    LDA  7,-103(7)	CALL outnl
140:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
141:    LDC  2,0(6)	Set return value to 0 
142:     LD  3,-1(1)	Load return address 
143:     LD  1,0(1)	Adjust fp 
144:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,144(7)	Jump to init [backpatch] 
* INIT
145:     LD  0,0(0)	Set the global pointer 
146:    LDA  1,0(0)	set first frame at end of globals 
147:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
148:    LDA  3,1(7)	Return address in ac 
149:    LDA  7,-108(7)	Jump to main 
150:   HALT  0,0,0	DONE! 
* END INIT
