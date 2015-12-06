* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  globalArray.c-
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
* EXPRESSION
 43:    LDC  3,2(6)	Load integer constant 
 44:     ST  3,-2(1)	Save index 
 45:    LDC  3,666(6)	Load integer constant 
 46:     LD  4,-2(1)	Restore index 
 47:    LDA  5,-1(0)	Load address of base of array x
 48:    SUB  5,5,4	Compute offset of value 
 49:     ST  3,0(5)	Store variable x
* EXPRESSION
 50:    LDC  3,3(6)	Load integer constant 
 51:     ST  3,-2(1)	Save index 
 52:    LDC  3,1(6)	Load Boolean constant 
 53:     LD  4,-2(1)	Restore index 
 54:    LDA  5,-5(0)	Load address of base of array b
 55:    SUB  5,5,4	Compute offset of value 
 56:     ST  3,0(5)	Store variable b
* EXPRESSION
*                       Begin call to  output
 57:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 58:    LDC  3,2(6)	Load integer constant 
 59:    LDA  4,-1(0)	Load address of base of array x
 60:    SUB  3,4,3	Compute offset of value 
 61:     LD  3,0(3)	Load the value 
 62:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 63:    LDA  1,-2(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-60(7)	CALL output
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
 67:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 68:    LDC  3,3(6)	Load integer constant 
 69:    LDA  4,-5(0)	Load address of base of array b
 70:    SUB  3,4,3	Compute offset of value 
 71:     LD  3,0(3)	Load the value 
 72:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 73:    LDA  1,-2(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-58(7)	CALL outputb
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* RETURN
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,83(7)	Jump to init [backpatch] 
* INIT
 84:     LD  0,0(0)	Set the global pointer 
 85:    LDA  1,-9(0)	set first frame at end of globals 
 86:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
 87:    LDC  3,4(6)	load size of array b
 88:     ST  3,-4(0)	save size of array b
 89:    LDC  3,3(6)	load size of array x
 90:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	Jump to main 
 93:   HALT  0,0,0	DONE! 
* END INIT
