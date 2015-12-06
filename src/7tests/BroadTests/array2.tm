* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  array2.c-
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
* FUNCTION ford
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,3(6)	Load integer constant 
 44:     LD  4,-2(1)	Load address of base of array x
 45:    SUB  3,4,3	Compute offset of value 
 46:     LD  3,0(3)	Load the value 
 47:     ST  3,-3(1)	Store variable y
* EXPRESSION
*                       Begin call to  output
 48:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 49:     LD  3,-3(1)	Load variable y
 50:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-4(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 55:    LDC  3,3(6)	Load integer constant 
 56:     ST  3,-4(1)	Save index 
 57:    LDC  3,777(6)	Load integer constant 
 58:     LD  4,-4(1)	Restore index 
 59:     LD  5,-2(1)	Load address of base of array x
 60:    SUB  5,5,4	Compute offset of value 
 61:     ST  3,0(5)	Store variable x
* END COMPOUND
* Add standard closing in case there is no return statement
 62:    LDC  2,0(6)	Set return value to 0 
 63:     LD  3,-1(1)	Load return address 
 64:     LD  1,0(1)	Adjust fp 
 65:    LDA  7,0(3)	Return 
* END FUNCTION ford
* FUNCTION main
 66:     ST  3,-1(1)	Store return address. 
* COMPOUND
 67:    LDC  3,5(6)	load size of array y
 68:     ST  3,-2(1)	save size of array y
* EXPRESSION
 69:    LDC  3,3(6)	Load integer constant 
 70:     ST  3,-8(1)	Save index 
 71:    LDC  3,666(6)	Load integer constant 
 72:     LD  4,-8(1)	Restore index 
 73:    LDA  5,-3(1)	Load address of base of array y
 74:    SUB  5,5,4	Compute offset of value 
 75:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  ford
 76:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
 77:    LDA  3,-3(1)	Load address of base of array y
 78:     ST  3,-10(1)	Store parameter 
*                       Jump to ford
 79:    LDA  1,-8(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-40(7)	CALL ford
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to ford
* EXPRESSION
 83:    LDC  3,3(6)	Load integer constant 
 84:    LDA  4,-3(1)	Load address of base of array y
 85:    SUB  3,4,3	Compute offset of value 
 86:     LD  3,0(3)	Load the value 
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-8(1)	Store old fp in ghost frame 
*                       Load param 1
 88:    LDC  3,3(6)	Load integer constant 
 89:    LDA  4,-3(1)	Load address of base of array y
 90:    SUB  3,4,3	Compute offset of value 
 91:     LD  3,0(3)	Load the value 
 92:     ST  3,-10(1)	Store parameter 
*                       Jump to output
 93:    LDA  1,-8(1)	Load address of new frame 
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-90(7)	CALL output
 96:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 97:    LDC  2,0(6)	Set return value to 0 
 98:     LD  3,-1(1)	Load return address 
 99:     LD  1,0(1)	Adjust fp 
100:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,100(7)	Jump to init [backpatch] 
* INIT
101:     LD  0,0(0)	Set the global pointer 
102:    LDA  1,0(0)	set first frame at end of globals 
103:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-40(7)	Jump to main 
106:   HALT  0,0,0	DONE! 
* END INIT
