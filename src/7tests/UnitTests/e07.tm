* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  e07.c-
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
* WHILE
 45:     LD  3,-2(1)	Load variable x
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,10(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 52:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 53:     LD  3,-2(1)	Load variable x
 54:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 55:    LDA  1,-3(1)	Load address of new frame 
 56:    LDA  3,1(7)	Return address in ac 
 57:    LDA  7,-52(7)	CALL output
 58:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* IF
 59:     LD  3,-2(1)	Load variable x
 60:     ST  3,-3(1)	Save left side 
 61:    LDC  3,5(6)	Load integer constant 
 62:     LD  4,-3(1)	Load left into ac1 
 63:    TEQ  3,4,3	Op == 
* THEN
* BREAK
 65:    LDA  7,-15(7)	break 
 64:    JZR  3,2(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 67:     LD  3,-2(1)	Load variable x
 68:     ST  3,-3(1)	Save left side 
 69:    LDC  3,1(6)	Load integer constant 
 70:     LD  4,-3(1)	Load left into ac1 
 71:    ADD  3,4,3	Op + 
 72:     ST  3,-2(1)	Store variable x
 66:    LDA  7,6(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
 73:    LDA  7,-29(7)	go to beginning of loop 
 51:    LDA  7,22(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
 74:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 75:    LDC  3,666(6)	Load integer constant 
 76:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 77:    LDA  1,-3(1)	Load address of new frame 
 78:    LDA  3,1(7)	Return address in ac 
 79:    LDA  7,-74(7)	CALL output
 80:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
 81:    LDC  2,0(6)	Set return value to 0 
 82:     LD  3,-1(1)	Load return address 
 83:     LD  1,0(1)	Adjust fp 
 84:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,84(7)	Jump to init [backpatch] 
* INIT
 85:     LD  0,0(0)	Set the global pointer 
 86:    LDA  1,0(0)	set first frame at end of globals 
 87:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
 88:    LDA  3,1(7)	Return address in ac 
 89:    LDA  7,-48(7)	Jump to main 
 90:   HALT  0,0,0	DONE! 
* END INIT
