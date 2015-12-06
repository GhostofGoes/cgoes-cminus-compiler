* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  while.c-
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
 43:    LDC  3,10(6)	Load integer constant 
 44:     ST  3,-2(1)	Store variable i
* WHILE
 45:     LD  3,-2(1)	Load variable i
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,0(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    TGT  3,4,3	Op > 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 53:     LD  3,-2(1)	Load variable i
 54:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 55:    LDA  1,-3(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 59:     LD  3,-2(1)	load lhs variable i
 60:    LDA  3,-1(3)	decrement value of i
 61:     ST  3,-2(1)	Store variable i
* END COMPOUND
 62:    LDA  7,-18(7)	go to beginning of loop 
 51:    LDA  7,11(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  outnl
 63:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 64:    LDA  1,-3(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-30(7)	CALL outnl
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* WHILE
 68:     LD  3,-2(1)	Load variable i
 69:     ST  3,-3(1)	Save left side 
 70:    LDC  3,10(6)	Load integer constant 
 71:     LD  4,-3(1)	Load left into ac1 
 72:    TLT  3,4,3	Op < 
 73:    JNZ  3,1(7)	Jump to while part 
* DO
* EXPRESSION
 75:     LD  3,-2(1)	Load variable i
 76:     ST  3,-3(1)	Save left side 
 77:    LDC  3,1(6)	Load integer constant 
 78:     LD  4,-3(1)	Load left into ac1 
 79:    ADD  3,4,3	Op + 
 80:     ST  3,-2(1)	Store variable i
 81:    LDA  7,-14(7)	go to beginning of loop 
 74:    LDA  7,7(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
 82:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 83:     LD  3,-2(1)	Load variable i
 84:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 85:    LDA  1,-3(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 89:    LDC  2,0(6)	Set return value to 0 
 90:     LD  3,-1(1)	Load return address 
 91:     LD  1,0(1)	Adjust fp 
 92:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,92(7)	Jump to init [backpatch] 
* INIT
 93:     LD  0,0(0)	Set the global pointer 
 94:    LDA  1,0(0)	set first frame at end of globals 
 95:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 96:    LDA  3,1(7)	Return address in ac 
 97:    LDA  7,-56(7)	Jump to main 
 98:   HALT  0,0,0	DONE! 
* END INIT
