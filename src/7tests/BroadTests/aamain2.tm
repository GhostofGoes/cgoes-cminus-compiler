* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  aamain2.c-
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
*                       Begin call to  output
 43:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 44:    LDC  3,666(6)	Load integer constant 
 45:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-2(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outputb
 50:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 51:    LDC  3,1(6)	Load Boolean constant 
 52:     ST  3,-4(1)	Store parameter 
*                       Jump to outputb
 53:    LDA  1,-2(1)	Load address of new frame 
 54:    LDA  3,1(7)	Return address in ac 
 55:    LDA  7,-38(7)	CALL outputb
 56:    LDA  3,0(2)	Save the result in ac 
*                       End call to outputb
* EXPRESSION
*                       Begin call to  outnl
 57:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 58:    LDA  1,-2(1)	Load address of new frame 
 59:    LDA  3,1(7)	Return address in ac 
 60:    LDA  7,-24(7)	CALL outnl
 61:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* EXPRESSION
*                       Begin call to  input
 62:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to input
 63:    LDA  1,-2(1)	Load address of new frame 
 64:    LDA  3,1(7)	Return address in ac 
 65:    LDA  7,-65(7)	CALL input
 66:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
* EXPRESSION
*                       Begin call to  inputb
 67:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to inputb
 68:    LDA  1,-2(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-58(7)	CALL inputb
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to inputb
* RETURN
 72:     LD  3,-1(1)	Load return address 
 73:     LD  1,0(1)	Adjust fp 
 74:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 75:    LDC  2,0(6)	Set return value to 0 
 76:     LD  3,-1(1)	Load return address 
 77:     LD  1,0(1)	Adjust fp 
 78:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,78(7)	Jump to init [backpatch] 
* INIT
 79:     LD  0,0(0)	Set the global pointer 
 80:    LDA  1,0(0)	set first frame at end of globals 
 81:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-42(7)	Jump to main 
 84:   HALT  0,0,0	DONE! 
* END INIT
