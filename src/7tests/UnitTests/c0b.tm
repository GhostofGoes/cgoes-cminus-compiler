* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  c0b.c-
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
 43:    LDC  3,753(6)	Load integer constant 
 44:     ST  3,0(0)	Store variable x
* EXPRESSION
 45:    LDC  3,444(6)	Load integer constant 
 46:     ST  3,-1(0)	Store variable y
* EXPRESSION
*                       Begin call to  output
 47:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 48:     LD  3,-1(0)	Load variable y
 49:     ST  3,0(0)	Store variable x
 50:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 51:    LDA  1,-2(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-48(7)	CALL output
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 55:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 56:    LDA  1,-2(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-22(7)	CALL outnl
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 60:    LDC  2,0(6)	Set return value to 0 
 61:     LD  3,-1(1)	Load return address 
 62:     LD  1,0(1)	Adjust fp 
 63:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,63(7)	Jump to init [backpatch] 
* INIT
 64:     LD  0,0(0)	Set the global pointer 
 65:    LDA  1,-2(0)	set first frame at end of globals 
 66:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 67:    LDA  3,1(7)	Return address in ac 
 68:    LDA  7,-27(7)	Jump to main 
 69:   HALT  0,0,0	DONE! 
* END INIT
