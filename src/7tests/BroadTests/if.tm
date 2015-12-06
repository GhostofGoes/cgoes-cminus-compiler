* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  if.c-
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
 43:    LDC  3,23(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable j
 45:     ST  3,-2(1)	Store variable i
* IF
 46:     LD  3,-2(1)	Load variable i
 47:     ST  3,-4(1)	Save left side 
 48:     LD  3,-3(1)	Load variable j
 49:     LD  4,-4(1)	Load left into ac1 
 50:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
 52:    LDC  3,666(6)	Load integer constant 
 53:     ST  3,-2(1)	Store variable i
 51:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 54:     LD  3,-3(1)	Load variable j
 55:     ST  3,-4(1)	Save left side 
 56:     LD  3,-2(1)	Load variable i
 57:     LD  4,-4(1)	Load left into ac1 
 58:    TEQ  3,4,3	Op == 
* THEN
* EXPRESSION
 60:    LDC  3,666(6)	Load integer constant 
 61:     ST  3,-2(1)	Store variable i
 59:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 63:    LDC  3,777(6)	Load integer constant 
 64:     ST  3,-3(1)	Store variable j
 62:    LDA  7,2(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  output
 65:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 66:     LD  3,-2(1)	Load variable i
 67:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 68:    LDA  1,-4(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-65(7)	CALL output
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 72:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 73:     LD  3,-3(1)	Load variable j
 74:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 75:    LDA  1,-4(1)	Load address of new frame 
 76:    LDA  3,1(7)	Return address in ac 
 77:    LDA  7,-72(7)	CALL output
 78:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 79:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 80:    LDA  1,-4(1)	Load address of new frame 
 81:    LDA  3,1(7)	Return address in ac 
 82:    LDA  7,-46(7)	CALL outnl
 83:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 84:    LDC  2,0(6)	Set return value to 0 
 85:     LD  3,-1(1)	Load return address 
 86:     LD  1,0(1)	Adjust fp 
 87:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,87(7)	Jump to init [backpatch] 
* INIT
 88:     LD  0,0(0)	Set the global pointer 
 89:    LDA  1,0(0)	set first frame at end of globals 
 90:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	Jump to main 
 93:   HALT  0,0,0	DONE! 
* END INIT
