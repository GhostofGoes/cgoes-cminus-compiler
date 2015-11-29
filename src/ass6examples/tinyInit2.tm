* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyInit2.c-
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
 43:    LDC  3,22(6)	load size of array b
 44:     ST  3,-2(1)	save size of array b
 45:    LDC  3,777(6)	Load integer constant 
 46:     ST  3,-26(1)	Save left side 
 47:    LDC  3,666(6)	Load integer constant 
 48:     ST  3,-27(1)	Save left side 
 49:    LDC  3,888(6)	Load integer constant 
 50:     LD  4,-27(1)	Load left into ac1 
 51:    MUL  3,4,3	Op * 
 52:     LD  4,-26(1)	Load left into ac1 
 53:    ADD  3,4,3	Op + 
 54:     ST  3,-25(1)	Store variable y
* EXPRESSION
*                       Begin call to  output
 55:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
 56:    LDA  3,-1(0)	Load address of base of array a
 57:     LD  3,1(3)	Load array size 
 58:     ST  3,-28(1)	Store parameter 
*                       Jump to output
 59:    LDA  1,-26(1)	Load address of new frame 
 60:    LDA  3,1(7)	Return address in ac 
 61:    LDA  7,-56(7)	CALL output
 62:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 63:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
 64:    LDA  3,-3(1)	Load address of base of array b
 65:     LD  3,1(3)	Load array size 
 66:     ST  3,-28(1)	Store parameter 
*                       Jump to output
 67:    LDA  1,-26(1)	Load address of new frame 
 68:    LDA  3,1(7)	Return address in ac 
 69:    LDA  7,-64(7)	CALL output
 70:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 71:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
 72:    LDA  3,-14(0)	Load address of base of array c
 73:     LD  3,1(3)	Load array size 
 74:     ST  3,-28(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-26(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 79:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Jump to outnl
 80:    LDA  1,-26(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-46(7)	CALL outnl
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  output
 84:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
 85:     LD  3,-12(0)	Load variable x
 86:     ST  3,-28(1)	Store parameter 
*                       Jump to output
 87:    LDA  1,-26(1)	Load address of new frame 
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-84(7)	CALL output
 90:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 91:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
 92:     LD  3,-25(1)	Load variable y
 93:     ST  3,-28(1)	Store parameter 
*                       Jump to output
 94:    LDA  1,-26(1)	Load address of new frame 
 95:    LDA  3,1(7)	Return address in ac 
 96:    LDA  7,-91(7)	CALL output
 97:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 98:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Load param 1
 99:     LD  3,-47(0)	Load variable z
100:     ST  3,-28(1)	Store parameter 
*                       Jump to output
101:    LDA  1,-26(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-98(7)	CALL output
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
105:     ST  1,-26(1)	Store old fp in ghost frame 
*                       Jump to outnl
106:    LDA  1,-26(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-72(7)	CALL outnl
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
110:    LDC  3,999(6)	Load integer constant 
111:     ST  3,-47(0)	Store variable z
* END COMPOUND
* Add standard closing in case there is no return statement
112:    LDC  2,0(6)	Set return value to 0 
113:     LD  3,-1(1)	Load return address 
114:     LD  1,0(1)	Adjust fp 
115:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,115(7)	Jump to init [backpatch] 
* INIT
116:     LD  0,0(0)	Set the global pointer 
117:    LDA  1,-48(0)	set first frame at end of globals 
118:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
119:    LDC  3,11(6)	load size of array a
120:     ST  3,0(0)	save size of array a
121:    LDC  3,33(6)	load size of array c-1
122:     ST  3,-13(0)	save size of array c-1
123:    LDC  3,666(6)	Load integer constant 
124:     ST  3,-2(1)	Save left side 
125:    LDC  3,777(6)	Load integer constant 
126:     ST  3,-3(1)	Save left side 
127:    LDC  3,888(6)	Load integer constant 
128:     LD  4,-3(1)	Load left into ac1 
129:    MUL  3,4,3	Op * 
130:     LD  4,-2(1)	Load left into ac1 
131:    ADD  3,4,3	Op + 
132:     ST  3,-12(0)	Store variable x
133:    LDC  3,888(6)	Load integer constant 
134:     ST  3,-2(1)	Save left side 
135:    LDC  3,777(6)	Load integer constant 
136:     ST  3,-3(1)	Save left side 
137:    LDC  3,666(6)	Load integer constant 
138:     LD  4,-3(1)	Load left into ac1 
139:    MUL  3,4,3	Op * 
140:     LD  4,-2(1)	Load left into ac1 
141:    ADD  3,4,3	Op + 
142:     ST  3,-47(0)	Store variable z-2
* END INIT GLOBALS AND STATICS
143:    LDA  3,1(7)	Return address in ac 
144:    LDA  7,-103(7)	Jump to main 
145:   HALT  0,0,0	DONE! 
* END INIT
