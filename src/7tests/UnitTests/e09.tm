* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  e09.c-
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
 45:    LDC  3,1(6)	Load Boolean constant 
* THEN
* WHILE
 47:     LD  3,-2(1)	Load variable x
 48:     ST  3,-3(1)	Save left side 
 49:    LDC  3,10(6)	Load integer constant 
 50:     LD  4,-3(1)	Load left into ac1 
 51:    TLT  3,4,3	Op < 
 52:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 54:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 55:     LD  3,-2(1)	Load variable x
 56:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 57:    LDA  1,-3(1)	Load address of new frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    LDA  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 61:     LD  3,-2(1)	Load variable x
 62:     ST  3,-3(1)	Save left side 
 63:    LDC  3,1(6)	Load integer constant 
 64:     LD  4,-3(1)	Load left into ac1 
 65:    ADD  3,4,3	Op + 
 66:     ST  3,-2(1)	Store variable x
* END COMPOUND
 67:    LDA  7,-21(7)	go to beginning of loop 
 53:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
 46:    JZR  3,21(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  output
 68:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 69:    LDC  3,666(6)	Load integer constant 
 70:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 71:    LDA  1,-3(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-68(7)	CALL output
 74:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
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
