* C- compiler version C-F15
* Built: Oct 14, 2015
* Author: Robert B. Heckendorn
* File compiled:  simple3.c-
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
* FUNCTION fred
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 43:    LDC  3,666(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  output
 45:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 46:     LD  3,-2(1)	Load variable x
 47:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 48:    LDA  1,-3(1)	Load address of new frame 
 49:    LDA  3,1(7)	Return address in ac 
 50:    LDA  7,-45(7)	CALL output
 51:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 52:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 53:    LDA  1,-3(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-19(7)	CALL outnl
 56:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 57:    LDC  2,0(6)	Set return value to 0 
 58:     LD  3,-1(1)	Load return address 
 59:     LD  1,0(1)	Adjust fp 
 60:    LDA  7,0(3)	Return 
* END FUNCTION fred
* FUNCTION main
 61:     ST  3,-1(1)	Store return address. 
* EXPRESSION
*                       Begin call to  fred
 62:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to fred
 63:    LDA  1,-2(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-24(7)	CALL fred
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to fred
* Add standard closing in case there is no return statement
 67:    LDC  2,0(6)	Set return value to 0 
 68:     LD  3,-1(1)	Load return address 
 69:     LD  1,0(1)	Adjust fp 
 70:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,70(7)	Jump to init [backpatch] 
* INIT
 71:     LD  0,0(0)	Set the global pointer 
 72:    LDA  1,0(0)	set first frame at end of globals 
 73:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-15(7)	Jump to main 
 76:   HALT  0,0,0	DONE! 
* END INIT
