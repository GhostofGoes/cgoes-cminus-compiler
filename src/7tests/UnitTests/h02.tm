* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  h02.c-
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
* EXPRESSION
*                       Begin call to  output
 43:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 44:     LD  3,-2(1)	Load variable x
 45:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 46:    LDA  1,-3(1)	Load address of new frame 
 47:    LDA  3,1(7)	Return address in ac 
 48:    LDA  7,-43(7)	CALL output
 49:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 50:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 51:    LDA  1,-3(1)	Load address of new frame 
 52:    LDA  3,1(7)	Return address in ac 
 53:    LDA  7,-17(7)	CALL outnl
 54:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
 55:     LD  3,-2(1)	Load variable x
 56:     ST  3,-3(1)	Save left side 
 57:    LDC  3,0(6)	Load integer constant 
 58:     LD  4,-3(1)	Load left into ac1 
 59:    TGT  3,4,3	Op > 
* THEN
* EXPRESSION
*                       Begin call to  cat
 61:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 62:     LD  3,-2(1)	Load variable x
 63:     ST  3,-5(1)	Save left side 
 64:    LDC  3,1(6)	Load integer constant 
 65:     LD  4,-5(1)	Load left into ac1 
 66:    SUB  3,4,3	Op - 
 67:     ST  3,-5(1)	Store parameter 
*                       Jump to cat
 68:    LDA  1,-3(1)	Load address of new frame 
 69:    LDA  3,1(7)	Return address in ac 
 70:    LDA  7,-29(7)	CALL cat
 71:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 60:    JZR  3,11(7)	Jump around the THEN if false [backpatch] 
* ENDIF
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
* END FUNCTION cat
* FUNCTION main
 79:     ST  3,-1(1)	Store return address. 
* EXPRESSION
*                       Begin call to  cat
 80:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 81:    LDC  3,10(6)	Load integer constant 
 82:     ST  3,-4(1)	Store parameter 
*                       Jump to cat
 83:    LDA  1,-2(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-44(7)	CALL cat
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
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
 95:    LDA  7,-17(7)	Jump to main 
 96:   HALT  0,0,0	DONE! 
* END INIT
