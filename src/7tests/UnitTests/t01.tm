* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  t01.c-
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
* FUNCTION factorial
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 43:     LD  3,-2(1)	Load variable n
 44:     ST  3,-4(1)	Save left side 
 45:    LDC  3,2(6)	Load integer constant 
 46:     LD  4,-4(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* EXPRESSION
 49:     LD  3,-2(1)	Load variable n
 50:     ST  3,-4(1)	Save index 
 51:    LDC  3,1(6)	Load integer constant 
 52:     LD  4,-4(1)	Restore index 
 53:     LD  5,-3(1)	Load address of base of array k
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable k
* END COMPOUND
 48:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
 57:     LD  3,-2(1)	Load variable n
 58:     ST  3,-4(1)	Save index 
 59:     LD  3,-2(1)	Load variable n
 60:     ST  3,-5(1)	Save left side 
*                       Begin call to  factorial
 61:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 62:     LD  3,-2(1)	Load variable n
 63:     ST  3,-8(1)	Save left side 
 64:    LDC  3,1(6)	Load integer constant 
 65:     LD  4,-8(1)	Load left into ac1 
 66:    SUB  3,4,3	Op - 
 67:     ST  3,-8(1)	Store parameter 
*                       Load param 2
 68:     LD  3,-3(1)	Load address of base of array k
 69:     ST  3,-9(1)	Store parameter 
*                       Jump to factorial
 70:    LDA  1,-6(1)	Load address of new frame 
 71:    LDA  3,1(7)	Return address in ac 
 72:    LDA  7,-31(7)	CALL factorial
 73:    LDA  3,0(2)	Save the result in ac 
*                       End call to factorial
 74:     LD  4,-5(1)	Load left into ac1 
 75:    MUL  3,4,3	Op * 
 76:     LD  4,-4(1)	Restore index 
 77:     LD  5,-3(1)	Load address of base of array k
 78:    SUB  5,5,4	Compute offset of value 
 79:     ST  3,0(5)	Store variable k
* END COMPOUND
 56:    LDA  7,23(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
 80:     LD  3,-2(1)	Load variable n
 81:     LD  4,-3(1)	Load address of base of array k
 82:    SUB  3,4,3	Compute offset of value 
 83:     LD  3,0(3)	Load the value 
 84:    LDA  2,0(3)	Copy result to rt register 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 88:    LDC  2,0(6)	Set return value to 0 
 89:     LD  3,-1(1)	Load return address 
 90:     LD  1,0(1)	Adjust fp 
 91:    LDA  7,0(3)	Return 
* END FUNCTION factorial
* FUNCTION main
 92:     ST  3,-1(1)	Store return address. 
* COMPOUND
 93:    LDC  3,20(6)	load size of array k
 94:     ST  3,-3(1)	save size of array k
* EXPRESSION
 95:    LDC  3,10(6)	Load integer constant 
 96:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  factorial
 97:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
 98:     LD  3,-2(1)	Load variable n
 99:     ST  3,-26(1)	Store parameter 
*                       Load param 2
100:    LDA  3,-4(1)	Load address of base of array k
101:     ST  3,-27(1)	Store parameter 
*                       Jump to factorial
102:    LDA  1,-24(1)	Load address of new frame 
103:    LDA  3,1(7)	Return address in ac 
104:    LDA  7,-63(7)	CALL factorial
105:    LDA  3,0(2)	Save the result in ac 
*                       End call to factorial
106:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  output
107:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Load param 1
108:     LD  3,-2(1)	Load variable n
109:     ST  3,-26(1)	Store parameter 
*                       Jump to output
110:    LDA  1,-24(1)	Load address of new frame 
111:    LDA  3,1(7)	Return address in ac 
112:    LDA  7,-107(7)	CALL output
113:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
114:     ST  1,-24(1)	Store old fp in ghost frame 
*                       Jump to outnl
115:    LDA  1,-24(1)	Load address of new frame 
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-81(7)	CALL outnl
118:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
119:    LDC  2,0(6)	Set return value to 0 
120:     LD  3,-1(1)	Load return address 
121:     LD  1,0(1)	Adjust fp 
122:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,122(7)	Jump to init [backpatch] 
* INIT
123:     LD  0,0(0)	Set the global pointer 
124:    LDA  1,0(0)	set first frame at end of globals 
125:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
126:    LDA  3,1(7)	Return address in ac 
127:    LDA  7,-36(7)	Jump to main 
128:   HALT  0,0,0	DONE! 
* END INIT
