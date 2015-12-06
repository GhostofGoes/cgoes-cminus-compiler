* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  s04.c-
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
* IF
 43:     LD  3,-2(1)	Load variable d
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,0(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  output
 49:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 50:     LD  3,-1(0)	Load variable s
 51:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 52:    LDA  1,-3(1)	Load address of new frame 
 53:    LDA  3,1(7)	Return address in ac 
 54:    LDA  7,-49(7)	CALL output
 55:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 48:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 57:     LD  3,-2(1)	Load variable d
 58:     ST  3,-1(0)	Store variable s
 56:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 59:    LDC  2,0(6)	Set return value to 0 
 60:     LD  3,-1(1)	Load return address 
 61:     LD  1,0(1)	Adjust fp 
 62:    LDA  7,0(3)	Return 
* END FUNCTION dog
* FUNCTION cat
 63:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 64:     LD  3,-2(1)	Load variable c
 65:     ST  3,-3(1)	Save left side 
 66:    LDC  3,0(6)	Load integer constant 
 67:     LD  4,-3(1)	Load left into ac1 
 68:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
*                       Begin call to  output
 70:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 71:     LD  3,-2(0)	Load variable s
 72:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 73:    LDA  1,-3(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-70(7)	CALL output
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 69:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 78:     LD  3,-2(1)	Load variable c
 79:     ST  3,-2(0)	Store variable s
 77:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
 84:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 85:    LDC  3,333(6)	Load integer constant 
 86:     ST  3,0(0)	Store variable s
* EXPRESSION
*                       Begin call to  dog
 87:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDC  3,111(6)	Load integer constant 
 89:     ST  3,-4(1)	Store parameter 
*                       Jump to dog
 90:    LDA  1,-2(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	CALL dog
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  cat
 94:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 95:    LDC  3,222(6)	Load integer constant 
 96:     ST  3,-4(1)	Store parameter 
*                       Jump to cat
 97:    LDA  1,-2(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-37(7)	CALL cat
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  dog
101:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
102:    LDC  3,0(6)	Load integer constant 
103:     ST  3,-4(1)	Store parameter 
*                       Jump to dog
104:    LDA  1,-2(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-65(7)	CALL dog
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to dog
* EXPRESSION
*                       Begin call to  cat
108:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
109:    LDC  3,0(6)	Load integer constant 
110:     ST  3,-4(1)	Store parameter 
*                       Jump to cat
111:    LDA  1,-2(1)	Load address of new frame 
112:    LDA  3,1(7)	Return address in ac 
113:    LDA  7,-51(7)	CALL cat
114:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* EXPRESSION
*                       Begin call to  output
115:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
116:     LD  3,0(0)	Load variable s
117:     ST  3,-4(1)	Store parameter 
*                       Jump to output
118:    LDA  1,-2(1)	Load address of new frame 
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-115(7)	CALL output
121:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
122:    LDC  2,0(6)	Set return value to 0 
123:     LD  3,-1(1)	Load return address 
124:     LD  1,0(1)	Adjust fp 
125:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,125(7)	Jump to init [backpatch] 
* INIT
126:     LD  0,0(0)	Set the global pointer 
127:    LDA  1,-3(0)	set first frame at end of globals 
128:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
129:    LDA  3,1(7)	Return address in ac 
130:    LDA  7,-47(7)	Jump to main 
131:   HALT  0,0,0	DONE! 
* END INIT
