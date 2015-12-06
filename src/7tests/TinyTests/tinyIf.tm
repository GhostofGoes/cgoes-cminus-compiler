* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyIf.c-
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
 43:    LDC  3,0(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable x
* IF
 45:    LDC  3,0(6)	Load Boolean constant 
* THEN
* EXPRESSION
 47:     LD  3,-2(1)	load lhs variable x
 48:    LDA  3,1(3)	increment value of x
 49:     ST  3,-2(1)	Store variable x
 46:    JZR  3,3(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* IF
 50:     LD  3,-2(1)	Load variable x
 51:     ST  3,-3(1)	Save left side 
 52:    LDC  3,10(6)	Load integer constant 
 53:     LD  4,-3(1)	Load left into ac1 
 54:    TLT  3,4,3	Op < 
* THEN
* EXPRESSION
 56:     LD  3,-2(1)	load lhs variable x
 57:    LDA  3,1(3)	increment value of x
 58:     ST  3,-2(1)	Store variable x
 55:    JZR  3,4(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 60:     LD  3,-2(1)	load lhs variable x
 61:    LDA  3,-1(3)	decrement value of x
 62:     ST  3,-2(1)	Store variable x
 59:    LDA  7,3(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 63:    LDC  2,0(6)	Set return value to 0 
 64:     LD  3,-1(1)	Load return address 
 65:     LD  1,0(1)	Adjust fp 
 66:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,66(7)	Jump to init [backpatch] 
* INIT
 67:     LD  0,0(0)	Set the global pointer 
 68:    LDA  1,0(0)	set first frame at end of globals 
 69:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-30(7)	Jump to main 
 72:   HALT  0,0,0	DONE! 
* END INIT
