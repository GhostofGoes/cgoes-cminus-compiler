* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  tinyBreak2.c-
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
 44:     ST  3,-2(1)	Store variable i
* WHILE
 45:    LDC  3,1(6)	Load Boolean constant 
 46:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* WHILE
 48:    LDC  3,1(6)	Load Boolean constant 
 49:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 51:     LD  3,-2(1)	load lhs variable i
 52:    LDA  3,1(3)	increment value of i
 53:     ST  3,-2(1)	Store variable i
* EXPRESSION
*                       Begin call to  output
 54:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 55:     LD  3,-2(1)	Load variable i
 56:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 57:    LDA  1,-3(1)	Load address of new frame 
 58:    LDA  3,1(7)	Return address in ac 
 59:    LDA  7,-54(7)	CALL output
 60:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* IF
 61:     LD  3,-2(1)	Load variable i
 62:     ST  3,-3(1)	Save left side 
 63:    LDC  3,4(6)	Load integer constant 
 64:     LD  4,-3(1)	Load left into ac1 
 65:    TGT  3,4,3	Op > 
* THEN
* BREAK
 67:    LDA  7,-18(7)	break 
 66:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
*                       Begin call to  outnl
 68:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 69:    LDA  1,-3(1)	Load address of new frame 
 70:    LDA  3,1(7)	Return address in ac 
 71:    LDA  7,-35(7)	CALL outnl
 72:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
 73:    LDA  7,-26(7)	go to beginning of loop 
 50:    LDA  7,23(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
 74:     LD  3,-2(1)	Load variable i
 75:     ST  3,-3(1)	Save left side 
 76:    LDC  3,8(6)	Load integer constant 
 77:     LD  4,-3(1)	Load left into ac1 
 78:    TGT  3,4,3	Op > 
* THEN
* BREAK
 80:    LDA  7,-34(7)	break 
 79:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* END COMPOUND
 81:    LDA  7,-37(7)	go to beginning of loop 
 47:    LDA  7,34(7)	Jump past loop [backpatch] 
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
* EXPRESSION
*                       Begin call to  outnl
 89:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 90:    LDA  1,-3(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-56(7)	CALL outnl
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
 94:    LDC  2,0(6)	Set return value to 0 
 95:     LD  3,-1(1)	Load return address 
 96:     LD  1,0(1)	Adjust fp 
 97:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,97(7)	Jump to init [backpatch] 
* INIT
 98:     LD  0,0(0)	Set the global pointer 
 99:    LDA  1,0(0)	set first frame at end of globals 
100:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
101:    LDA  3,1(7)	Return address in ac 
102:    LDA  7,-61(7)	Jump to main 
103:   HALT  0,0,0	DONE! 
* END INIT
