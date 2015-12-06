* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  s02e.c-
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
* FUNCTION toad
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* END COMPOUND
* Add standard closing in case there is no return statement
 43:    LDC  2,0(6)	Set return value to 0 
 44:     LD  3,-1(1)	Load return address 
 45:     LD  1,0(1)	Adjust fp 
 46:    LDA  7,0(3)	Return 
* END FUNCTION toad
* FUNCTION load
 47:     ST  3,-1(1)	Store return address. 
* COMPOUND
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 48:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 49:     LD  3,-2(0)	Load variable goad
 50:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-2(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* EXPRESSION
*                       Begin call to  output
 55:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 56:     LD  3,0(0)	Load variable goad
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
* END COMPOUND
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6)	Set return value to 0 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    LDA  7,0(3)	Return 
* END FUNCTION load
* FUNCTION sum
 71:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 72:     LD  3,-2(1)	Load variable init
* THEN
* EXPRESSION
 74:    LDC  3,0(6)	Load integer constant 
 75:     ST  3,-4(0)	Store variable runningSum
 73:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 77:     LD  3,-3(1)	Load variable x
 78:     LD  4,-4(0)	load lhs variable runningSum
 79:    ADD  3,4,3	op += 
 80:     ST  3,-4(0)	Store variable runningSum
 76:    LDA  7,4(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
 81:     LD  3,-4(0)	Load variable runningSum
 82:    LDA  2,0(3)	Copy result to rt register 
 83:     LD  3,-1(1)	Load return address 
 84:     LD  1,0(1)	Adjust fp 
 85:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 86:    LDC  2,0(6)	Set return value to 0 
 87:     LD  3,-1(1)	Load return address 
 88:     LD  1,0(1)	Adjust fp 
 89:    LDA  7,0(3)	Return 
* END FUNCTION sum
* FUNCTION main
 90:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  load
 91:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to load
 92:    LDA  1,-2(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-48(7)	CALL load
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to load
* EXPRESSION
*                       Begin call to  sum
 96:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 97:    LDC  3,1(6)	Load Boolean constant 
 98:     ST  3,-4(1)	Store parameter 
*                       Load param 2
 99:    LDC  3,666(6)	Load integer constant 
100:     ST  3,-5(1)	Store parameter 
*                       Jump to sum
101:    LDA  1,-2(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-33(7)	CALL sum
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
* EXPRESSION
*                       Begin call to  sum
105:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
106:    LDC  3,0(6)	Load Boolean constant 
107:     ST  3,-4(1)	Store parameter 
*                       Load param 2
108:    LDC  3,777(6)	Load integer constant 
109:     ST  3,-5(1)	Store parameter 
*                       Jump to sum
110:    LDA  1,-2(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-42(7)	CALL sum
113:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
* EXPRESSION
*                       Begin call to  output
114:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  sum
115:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
116:    LDC  3,0(6)	Load Boolean constant 
117:     ST  3,-6(1)	Store parameter 
*                       Load param 2
118:    LDC  3,0(6)	Load integer constant 
119:     ST  3,-7(1)	Store parameter 
*                       Jump to sum
120:    LDA  1,-4(1)	Load address of new frame 
121:    LDA  3,1(7)	Return address in ac 
122:    LDA  7,-52(7)	CALL sum
123:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
124:     ST  3,-4(1)	Store parameter 
*                       Jump to output
125:    LDA  1,-2(1)	Load address of new frame 
126:    LDA  3,1(7)	Return address in ac 
127:    LDA  7,-122(7)	CALL output
128:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  sum
129:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
130:    LDC  3,0(6)	Load Boolean constant 
131:     ST  3,-4(1)	Store parameter 
*                       Load param 2
132:    LDC  3,888(6)	Load integer constant 
133:     ST  3,-5(1)	Store parameter 
*                       Jump to sum
134:    LDA  1,-2(1)	Load address of new frame 
135:    LDA  3,1(7)	Return address in ac 
136:    LDA  7,-66(7)	CALL sum
137:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
* EXPRESSION
*                       Begin call to  output
138:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  sum
139:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
140:    LDC  3,0(6)	Load Boolean constant 
141:     ST  3,-6(1)	Store parameter 
*                       Load param 2
142:    LDC  3,0(6)	Load integer constant 
143:     ST  3,-7(1)	Store parameter 
*                       Jump to sum
144:    LDA  1,-4(1)	Load address of new frame 
145:    LDA  3,1(7)	Return address in ac 
146:    LDA  7,-76(7)	CALL sum
147:    LDA  3,0(2)	Save the result in ac 
*                       End call to sum
148:     ST  3,-4(1)	Store parameter 
*                       Jump to output
149:    LDA  1,-2(1)	Load address of new frame 
150:    LDA  3,1(7)	Return address in ac 
151:    LDA  7,-146(7)	CALL output
152:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
153:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
154:    LDA  1,-2(1)	Load address of new frame 
155:    LDA  3,1(7)	Return address in ac 
156:    LDA  7,-120(7)	CALL outnl
157:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
158:    LDC  2,0(6)	Set return value to 0 
159:     LD  3,-1(1)	Load return address 
160:     LD  1,0(1)	Adjust fp 
161:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,161(7)	Jump to init [backpatch] 
* INIT
162:     LD  0,0(0)	Set the global pointer 
163:    LDA  1,-5(0)	set first frame at end of globals 
164:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
165:    LDC  3,666(6)	Load integer constant 
166:     ST  3,0(0)	Store variable goad
167:    LDC  3,777(6)	Load integer constant 
168:     ST  3,-2(0)	Store variable goad-2
* END INIT GLOBALS AND STATICS
169:    LDA  3,1(7)	Return address in ac 
170:    LDA  7,-81(7)	Jump to main 
171:   HALT  0,0,0	DONE! 
* END INIT
