* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  g0b.c-
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
* FUNCTION cat
 42:     ST  3,-1(1)	Store return address. 
* RETURN
 43:     LD  3,-2(1)	Load variable x
 44:    LDA  2,0(3)	Copy result to rt register 
 45:     LD  3,-1(1)	Load return address 
 46:     LD  1,0(1)	Adjust fp 
 47:    LDA  7,0(3)	Return 
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6)	Set return value to 0 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
 52:     ST  3,-1(1)	Store return address. 
* COMPOUND
 53:    LDC  3,10(6)	load size of array z
 54:     ST  3,-2(1)	save size of array z
* EXPRESSION
 55:    LDC  3,3(6)	Load integer constant 
 56:     ST  3,-13(1)	Save index 
 57:    LDC  3,445(6)	Load integer constant 
 58:     LD  4,-13(1)	Restore index 
 59:    LDA  5,-3(1)	Load address of base of array z
 60:    SUB  5,5,4	Compute offset of value 
 61:     ST  3,0(5)	Store variable z
* EXPRESSION
*                       Begin call to  output
 62:     ST  1,-13(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
 63:     ST  1,-15(1)	Store old fp in ghost frame 
*                       Load param 1
 64:    LDC  3,3(6)	Load integer constant 
 65:     ST  3,-17(1)	Store parameter 
*                       Jump to cat
 66:    LDA  1,-15(1)	Load address of new frame 
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-27(7)	CALL cat
 69:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 70:    LDA  4,-3(1)	Load address of base of array z
 71:    SUB  3,4,3	Compute offset of value 
 72:     LD  3,0(3)	Load the value 
 73:     ST  3,-15(1)	Store parameter 
*                       Jump to output
 74:    LDA  1,-13(1)	Load address of new frame 
 75:    LDA  3,1(7)	Return address in ac 
 76:    LDA  7,-71(7)	CALL output
 77:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 78:    LDC  2,0(6)	Set return value to 0 
 79:     LD  3,-1(1)	Load return address 
 80:     LD  1,0(1)	Adjust fp 
 81:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,81(7)	Jump to init [backpatch] 
* INIT
 82:     LD  0,0(0)	Set the global pointer 
 83:    LDA  1,0(0)	set first frame at end of globals 
 84:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-35(7)	Jump to main 
 87:   HALT  0,0,0	DONE! 
* END INIT
