* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyVarPair.c-
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
 43:    LDC  3,10(6)	load size of array y
 44:     ST  3,-5(1)	save size of array y
* EXPRESSION
 45:     LD  3,0(0)	Load variable gx
 46:     ST  3,0(0)	Store variable gx
* EXPRESSION
 47:    LDC  3,9(6)	Load integer constant 
 48:     ST  3,-16(1)	Save index 
 49:    LDC  3,9(6)	Load integer constant 
 50:    LDA  4,-2(0)	Load address of base of array gy
 51:    SUB  3,4,3	Compute offset of value 
 52:     LD  3,0(3)	Load the value 
 53:     LD  4,-16(1)	Restore index 
 54:    LDA  5,-2(0)	Load address of base of array gy
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,0(5)	Store variable gy
* EXPRESSION
 57:     LD  3,-4(1)	Load variable x
 58:     ST  3,-4(1)	Store variable x
* EXPRESSION
 59:    LDC  3,9(6)	Load integer constant 
 60:     ST  3,-16(1)	Save index 
 61:    LDC  3,9(6)	Load integer constant 
 62:    LDA  4,-6(1)	Load address of base of array y
 63:    SUB  3,4,3	Compute offset of value 
 64:     LD  3,0(3)	Load the value 
 65:     LD  4,-16(1)	Restore index 
 66:    LDA  5,-6(1)	Load address of base of array y
 67:    SUB  5,5,4	Compute offset of value 
 68:     ST  3,0(5)	Store variable y
* EXPRESSION
 69:     LD  3,-2(1)	Load variable px
 70:     ST  3,-2(1)	Store variable px
* EXPRESSION
 71:    LDC  3,9(6)	Load integer constant 
 72:     ST  3,-16(1)	Save index 
 73:    LDC  3,9(6)	Load integer constant 
 74:     LD  4,-3(1)	Load address of base of array py
 75:    SUB  3,4,3	Compute offset of value 
 76:     LD  3,0(3)	Load the value 
 77:     LD  4,-16(1)	Restore index 
 78:     LD  5,-3(1)	Load address of base of array py
 79:    SUB  5,5,4	Compute offset of value 
 80:     ST  3,0(5)	Store variable py
* EXPRESSION
 81:     LD  3,-12(0)	Load variable sx
 82:     ST  3,-12(0)	Store variable sx
* EXPRESSION
 83:    LDC  3,9(6)	Load integer constant 
 84:     ST  3,-16(1)	Save index 
 85:    LDC  3,9(6)	Load integer constant 
 86:    LDA  4,-14(0)	Load address of base of array sy
 87:    SUB  3,4,3	Compute offset of value 
 88:     LD  3,0(3)	Load the value 
 89:     LD  4,-16(1)	Restore index 
 90:    LDA  5,-14(0)	Load address of base of array sy
 91:    SUB  5,5,4	Compute offset of value 
 92:     ST  3,0(5)	Store variable sy
* END COMPOUND
* Add standard closing in case there is no return statement
 93:    LDC  2,0(6)	Set return value to 0 
 94:     LD  3,-1(1)	Load return address 
 95:     LD  1,0(1)	Adjust fp 
 96:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,96(7)	Jump to init [backpatch] 
* INIT
 97:     LD  0,0(0)	Set the global pointer 
 98:    LDA  1,-24(0)	set first frame at end of globals 
 99:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
100:    LDC  3,10(6)	load size of array gy
101:     ST  3,-1(0)	save size of array gy
102:    LDC  3,10(6)	load size of array sy-2
103:     ST  3,-13(0)	save size of array sy-2
* END INIT GLOBALS AND STATICS
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-64(7)	Jump to main 
106:   HALT  0,0,0	DONE! 
* END INIT
