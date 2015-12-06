* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  c18.c-
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
 43:    LDC  3,7(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
 45:    LDC  3,9(6)	load size of array y
 46:     ST  3,-10(1)	save size of array y
* EXPRESSION
 47:    LDC  3,5(6)	Load integer constant 
 48:     ST  3,-20(1)	Save index 
 49:    LDC  3,333(6)	Load integer constant 
 50:     LD  4,-20(1)	Restore index 
 51:    LDA  5,-3(1)	Load address of base of array x
 52:    SUB  5,5,4	Compute offset of value 
 53:     ST  3,0(5)	Store variable x
* EXPRESSION
 54:    LDC  3,7(6)	Load integer constant 
 55:     ST  3,-20(1)	Save index 
 56:    LDC  3,444(6)	Load integer constant 
 57:     LD  4,-20(1)	Restore index 
 58:    LDA  5,-11(1)	Load address of base of array y
 59:    SUB  5,5,4	Compute offset of value 
 60:     ST  3,0(5)	Store variable y
* EXPRESSION
 61:    LDC  3,5(6)	Load integer constant 
 62:     ST  3,-20(1)	Save index 
 63:    LDC  3,7(6)	Load integer constant 
 64:    LDA  4,-11(1)	Load address of base of array y
 65:    SUB  3,4,3	Compute offset of value 
 66:     LD  3,0(3)	Load the value 
 67:     LD  4,-20(1)	Restore index 
 68:    LDA  5,-3(1)	Load address of base of array x
 69:    SUB  5,5,4	Compute offset of value 
 70:     LD  4,0(5)	load lhs variable x
 71:    ADD  3,4,3	op += 
 72:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  output
 73:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
 74:    LDC  3,5(6)	Load integer constant 
 75:    LDA  4,-3(1)	Load address of base of array x
 76:    SUB  3,4,3	Compute offset of value 
 77:     LD  3,0(3)	Load the value 
 78:     ST  3,-22(1)	Store parameter 
*                       Jump to output
 79:    LDA  1,-20(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-76(7)	CALL output
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 83:    LDC  3,7(6)	Load integer constant 
 84:     ST  3,-20(1)	Save index 
 85:    LDC  3,5(6)	Load integer constant 
 86:    LDA  4,-3(1)	Load address of base of array x
 87:    SUB  3,4,3	Compute offset of value 
 88:     LD  3,0(3)	Load the value 
 89:     LD  4,-20(1)	Restore index 
 90:    LDA  5,-11(1)	Load address of base of array y
 91:    SUB  5,5,4	Compute offset of value 
 92:     LD  4,0(5)	load lhs variable y
 93:    SUB  3,4,3	op -= 
 94:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 95:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Load param 1
 96:    LDC  3,7(6)	Load integer constant 
 97:    LDA  4,-11(1)	Load address of base of array y
 98:    SUB  3,4,3	Compute offset of value 
 99:     LD  3,0(3)	Load the value 
100:     ST  3,-22(1)	Store parameter 
*                       Jump to output
101:    LDA  1,-20(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-98(7)	CALL output
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
105:     ST  1,-20(1)	Store old fp in ghost frame 
*                       Jump to outnl
106:    LDA  1,-20(1)	Load address of new frame 
107:    LDA  3,1(7)	Return address in ac 
108:    LDA  7,-72(7)	CALL outnl
109:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
110:    LDC  2,0(6)	Set return value to 0 
111:     LD  3,-1(1)	Load return address 
112:     LD  1,0(1)	Adjust fp 
113:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,113(7)	Jump to init [backpatch] 
* INIT
114:     LD  0,0(0)	Set the global pointer 
115:    LDA  1,0(0)	set first frame at end of globals 
116:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
117:    LDA  3,1(7)	Return address in ac 
118:    LDA  7,-77(7)	Jump to main 
119:   HALT  0,0,0	DONE! 
* END INIT
