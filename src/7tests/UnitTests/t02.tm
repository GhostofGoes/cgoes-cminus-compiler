* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  t02.c-
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
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,2(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
* THEN
* COMPOUND
* EXPRESSION
 49:     LD  3,-2(1)	Load variable n
 50:     ST  3,-3(1)	Save index 
 51:    LDC  3,1(6)	Load integer constant 
 52:     LD  4,-3(1)	Restore index 
 53:    LDA  5,-1(0)	Load address of base of array k
 54:    SUB  5,5,4	Compute offset of value 
 55:     ST  3,0(5)	Store variable k
* END COMPOUND
 48:    JZR  3,8(7)	Jump around the THEN if false [backpatch] 
* ELSE
* COMPOUND
* EXPRESSION
 57:     LD  3,-2(1)	Load variable n
 58:     ST  3,-3(1)	Save index 
 59:     LD  3,-2(1)	Load variable n
 60:     ST  3,-4(1)	Save left side 
*                       Begin call to  factorial
 61:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 62:     LD  3,-2(1)	Load variable n
 63:     ST  3,-7(1)	Save left side 
 64:    LDC  3,1(6)	Load integer constant 
 65:     LD  4,-7(1)	Load left into ac1 
 66:    SUB  3,4,3	Op - 
 67:     ST  3,-7(1)	Store parameter 
*                       Jump to factorial
 68:    LDA  1,-5(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-29(7)	CALL factorial
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to factorial
 72:     LD  4,-4(1)	Load left into ac1 
 73:    MUL  3,4,3	Op * 
 74:     LD  4,-3(1)	Restore index 
 75:    LDA  5,-1(0)	Load address of base of array k
 76:    SUB  5,5,4	Compute offset of value 
 77:     ST  3,0(5)	Store variable k
* END COMPOUND
 56:    LDA  7,21(7)	Jump around the ELSE [backpatch] 
* ENDIF
* RETURN
 78:     LD  3,-2(1)	Load variable n
 79:    LDA  4,-1(0)	Load address of base of array k
 80:    SUB  3,4,3	Compute offset of value 
 81:     LD  3,0(3)	Load the value 
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
* END FUNCTION factorial
* FUNCTION main
 90:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 91:    LDC  3,10(6)	Load integer constant 
 92:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  factorial
 93:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 94:     LD  3,-2(1)	Load variable n
 95:     ST  3,-5(1)	Store parameter 
*                       Jump to factorial
 96:    LDA  1,-3(1)	Load address of new frame 
 97:    LDA  3,1(7)	Return address in ac 
 98:    LDA  7,-57(7)	CALL factorial
 99:    LDA  3,0(2)	Save the result in ac 
*                       End call to factorial
100:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  output
101:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
102:     LD  3,-2(1)	Load variable n
103:     ST  3,-5(1)	Store parameter 
*                       Jump to output
104:    LDA  1,-3(1)	Load address of new frame 
105:    LDA  3,1(7)	Return address in ac 
106:    LDA  7,-101(7)	CALL output
107:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
108:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
109:    LDA  1,-3(1)	Load address of new frame 
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-75(7)	CALL outnl
112:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
113:    LDC  2,0(6)	Set return value to 0 
114:     LD  3,-1(1)	Load return address 
115:     LD  1,0(1)	Adjust fp 
116:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,116(7)	Jump to init [backpatch] 
* INIT
117:     LD  0,0(0)	Set the global pointer 
118:    LDA  1,-21(0)	set first frame at end of globals 
119:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
120:    LDC  3,20(6)	load size of array k
121:     ST  3,0(0)	save size of array k
* END INIT GLOBALS AND STATICS
122:    LDA  3,1(7)	Return address in ac 
123:    LDA  7,-34(7)	Jump to main 
124:   HALT  0,0,0	DONE! 
* END INIT
