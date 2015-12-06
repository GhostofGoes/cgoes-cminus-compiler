* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  i05.c-
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
 43:    LDC  3,1(6)	Load Boolean constant 
 44:     ST  3,-2(1)	Store variable ba
 45:    LDC  3,1(6)	Load Boolean constant 
 46:     ST  3,-5(1)	Save left side 
 47:    LDC  3,0(6)	Load Boolean constant 
 48:    LDC  4,1(6)	Load 1 
 49:    XOR  3,3,4	Op NOT 
 50:     LD  4,-5(1)	Load left into ac1 
 51:    AND  3,4,3	Op AND 
 52:     ST  3,-3(1)	Store variable bb
 53:    LDC  3,5(6)	Load integer constant 
 54:     ST  3,-5(1)	Save left side 
 55:    LDC  3,4(6)	Load integer constant 
 56:     LD  4,-5(1)	Load left into ac1 
 57:    TGT  3,4,3	Op > 
 58:     ST  3,-4(1)	Store variable bc
* EXPRESSION
*                       Begin call to  outputb
 59:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 60:     LD  3,-2(1)	Load variable ba
 61:     ST  3,-7(1)	Store parameter 
*                       Jump to outputb
 62:    LDA  1,-5(1)	Load address of new frame 
 63:    LDA  3,1(7)	Return address in ac 
 64:    LDA  7,-47(7)	CALL outputb
 65:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* END COMPOUND
* Add standard closing in case there is no return statement
 66:    LDC  2,0(6)	Set return value to 0 
 67:     LD  3,-1(1)	Load return address 
 68:     LD  1,0(1)	Adjust fp 
 69:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,69(7)	Jump to init [backpatch] 
* INIT
 70:     LD  0,0(0)	Set the global pointer 
 71:    LDA  1,0(0)	set first frame at end of globals 
 72:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-33(7)	Jump to main 
 75:   HALT  0,0,0	DONE! 
* END INIT
