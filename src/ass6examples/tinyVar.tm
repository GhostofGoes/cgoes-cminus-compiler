* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyVar.c-
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
* EXPRESSION
 46:    LDC  3,9(6)	Load integer constant 
 47:    LDA  4,-2(0)	Load address of base of array gy
 48:    SUB  3,4,3	Compute offset of value 
 49:     LD  3,0(3)	Load the value 
* EXPRESSION
 50:    LDA  3,-2(0)	Load address of base of array gy
 51:     LD  3,1(3)	Load array size 
* EXPRESSION
 52:     LD  3,-4(1)	Load variable x
* EXPRESSION
 53:    LDC  3,9(6)	Load integer constant 
 54:    LDA  4,-6(1)	Load address of base of array y
 55:    SUB  3,4,3	Compute offset of value 
 56:     LD  3,0(3)	Load the value 
* EXPRESSION
 57:    LDA  3,-6(1)	Load address of base of array y
 58:     LD  3,1(3)	Load array size 
* EXPRESSION
 59:     LD  3,-2(1)	Load variable px
* EXPRESSION
 60:    LDC  3,9(6)	Load integer constant 
 61:     LD  4,-3(1)	Load address of base of array py
 62:    SUB  3,4,3	Compute offset of value 
 63:     LD  3,0(3)	Load the value 
* EXPRESSION
 64:     LD  3,-3(1)	Load address of base of array py
 65:     LD  3,1(3)	Load array size 
* EXPRESSION
 66:     LD  3,-12(0)	Load variable sx
* EXPRESSION
 67:    LDC  3,9(6)	Load integer constant 
 68:    LDA  4,-14(0)	Load address of base of array sy
 69:    SUB  3,4,3	Compute offset of value 
 70:     LD  3,0(3)	Load the value 
* EXPRESSION
 71:    LDA  3,-14(0)	Load address of base of array sy
 72:     LD  3,1(3)	Load array size 
* END COMPOUND
* Add standard closing in case there is no return statement
 73:    LDC  2,0(6)	Set return value to 0 
 74:     LD  3,-1(1)	Load return address 
 75:     LD  1,0(1)	Adjust fp 
 76:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,76(7)	Jump to init [backpatch] 
* INIT
 77:     LD  0,0(0)	Set the global pointer 
 78:    LDA  1,-24(0)	set first frame at end of globals 
 79:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 80:    LDC  3,10(6)	load size of array gy
 81:     ST  3,-1(0)	save size of array gy
 82:    LDC  3,10(6)	load size of array sy-2
 83:     ST  3,-13(0)	save size of array sy-2
* END INIT GLOBALS AND STATICS
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-44(7)	Jump to main 
 86:   HALT  0,0,0	DONE! 
* END INIT
