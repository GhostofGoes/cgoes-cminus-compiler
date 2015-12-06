* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  f0a.c-
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
* COMPOUND
* RETURN
 43:    LDC  3,93(6)	Load integer constant 
 44:    LDA  2,0(3)	Copy result to rt register 
 45:     LD  3,-1(1)	Load return address 
 46:     LD  1,0(1)	Adjust fp 
 47:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 48:    LDC  2,0(6)	Set return value to 0 
 49:     LD  3,-1(1)	Load return address 
 50:     LD  1,0(1)	Adjust fp 
 51:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
 52:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 53:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
 54:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to cat
 55:    LDA  1,-4(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-16(7)	CALL cat
 58:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 59:     ST  3,-4(1)	Save left side 
*                       Begin call to  cat
 60:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to cat
 61:    LDA  1,-5(1)	Load address of new frame 
 62:    LDA  3,1(7)	Return address in ac 
 63:    LDA  7,-22(7)	CALL cat
 64:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 65:     LD  4,-4(1)	Load left into ac1 
 66:    ADD  3,4,3	Op + 
 67:     ST  3,-4(1)	Save left side 
*                       Begin call to  cat
 68:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Jump to cat
 69:    LDA  1,-5(1)	Load address of new frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-30(7)	CALL cat
 72:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 73:     LD  4,-4(1)	Load left into ac1 
 74:    MUL  3,4,3	Op * 
 75:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 76:    LDA  1,-2(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-73(7)	CALL output
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 80:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Jump to outnl
 81:    LDA  1,-2(1)	Load address of new frame 
 82:    LDA  3,1(7)	Return address in ac 
 83:    LDA  7,-47(7)	CALL outnl
 84:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 85:    LDC  2,0(6)	Set return value to 0 
 86:     LD  3,-1(1)	Load return address 
 87:     LD  1,0(1)	Adjust fp 
 88:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,88(7)	Jump to init [backpatch] 
* INIT
 89:     LD  0,0(0)	Set the global pointer 
 90:    LDA  1,0(0)	set first frame at end of globals 
 91:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 92:    LDA  3,1(7)	Return address in ac 
 93:    LDA  7,-42(7)	Jump to main 
 94:   HALT  0,0,0	DONE! 
* END INIT
