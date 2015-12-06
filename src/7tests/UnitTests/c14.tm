* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  c14.c-
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
 43:    LDC  3,3(6)	load size of array x
 44:     ST  3,-2(1)	save size of array x
 45:    LDC  3,4(6)	load size of array y
 46:     ST  3,-6(1)	save size of array y
* EXPRESSION
 47:    LDC  3,1(6)	Load integer constant 
 48:     ST  3,-11(1)	Store variable z
* EXPRESSION
 49:    LDC  3,2(6)	Load integer constant 
 50:     ST  3,-12(1)	Store variable zz
* EXPRESSION
 51:     LD  3,-12(1)	Load variable zz
 52:     ST  3,-13(1)	Save index 
 53:    LDC  3,73(6)	Load integer constant 
 54:     LD  4,-13(1)	Restore index 
 55:    LDA  5,-3(1)	Load address of base of array x
 56:    SUB  5,5,4	Compute offset of value 
 57:     ST  3,0(5)	Store variable x
* EXPRESSION
 58:     LD  3,-11(1)	Load variable z
 59:     ST  3,-13(1)	Save index 
 60:    LDC  3,211(6)	Load integer constant 
 61:     LD  4,-13(1)	Restore index 
 62:    LDA  5,-7(1)	Load address of base of array y
 63:    SUB  5,5,4	Compute offset of value 
 64:     ST  3,0(5)	Store variable y
* EXPRESSION
*                       Begin call to  output
 65:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
 66:     LD  3,-12(1)	Load variable zz
 67:    LDA  4,-3(1)	Load address of base of array x
 68:    SUB  3,4,3	Compute offset of value 
 69:     LD  3,0(3)	Load the value 
 70:     ST  3,-15(1)	Save left side 
 71:     LD  3,-11(1)	Load variable z
 72:    LDA  4,-7(1)	Load address of base of array y
 73:    SUB  3,4,3	Compute offset of value 
 74:     LD  3,0(3)	Load the value 
 75:     LD  4,-15(1)	Load left into ac1 
 76:    ADD  3,4,3	Op + 
 77:     ST  3,-15(1)	Store parameter 
*                       Jump to output
 78:    LDA  1,-13(1)	Load address of new frame 
 79:    LDA  3,1(7)	Return address in ac 
 80:    LDA  7,-75(7)	CALL output
 81:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 82:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Jump to outnl
 83:    LDA  1,-13(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-49(7)	CALL outnl
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 87:    LDC  2,0(6)	Set return value to 0 
 88:     LD  3,-1(1)	Load return address 
 89:     LD  1,0(1)	Adjust fp 
 90:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,90(7)	Jump to init [backpatch] 
* INIT
 91:     LD  0,0(0)	Set the global pointer 
 92:    LDA  1,0(0)	set first frame at end of globals 
 93:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 94:    LDA  3,1(7)	Return address in ac 
 95:    LDA  7,-54(7)	Jump to main 
 96:   HALT  0,0,0	DONE! 
* END INIT
