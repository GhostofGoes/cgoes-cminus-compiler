* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  g0f.c-
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
* IF
 43:     LD  3,-2(1)	Load variable x
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,0(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TGT  3,4,3	Op > 
* THEN
* RETURN
 49:     LD  3,-2(1)	Load variable x
 50:     ST  3,-3(1)	Save left side 
 51:     LD  3,-2(1)	Load variable x
 52:     LD  4,-3(1)	Load left into ac1 
 53:    ADD  3,4,3	Op + 
 54:    LDA  2,0(3)	Copy result to rt register 
 55:     LD  3,-1(1)	Load return address 
 56:     LD  1,0(1)	Adjust fp 
 57:    LDA  7,0(3)	Return 
 48:    JZR  3,10(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
 59:     LD  3,-2(1)	Load variable x
 60:     ST  3,-3(1)	Save left side 
 61:     LD  3,-2(1)	Load variable x
 62:     LD  4,-3(1)	Load left into ac1 
 63:    MUL  3,4,3	Op * 
 58:    LDA  7,5(7)	Jump around the ELSE [backpatch] 
* ENDIF
* Add standard closing in case there is no return statement
 64:    LDC  2,0(6)	Set return value to 0 
 65:     LD  3,-1(1)	Load return address 
 66:     LD  1,0(1)	Adjust fp 
 67:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
 68:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  cat
 70:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 71:    LDC  3,88(6)	Load integer constant 
 72:     ST  3,-6(1)	Store parameter 
*                       Jump to cat
 73:    LDA  1,-4(1)	Load address of new frame 
 74:    LDA  3,1(7)	Return address in ac 
 75:    LDA  7,-34(7)	CALL cat
 76:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 77:     ST  3,-4(1)	Save left side 
*                       Begin call to  cat
 78:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 79:    LDC  3,17(6)	Load integer constant 
 80:    LDC  4,0(6)	Load 0 
 81:    SUB  3,4,3	Op unary - 
 82:     ST  3,-7(1)	Store parameter 
*                       Jump to cat
 83:    LDA  1,-5(1)	Load address of new frame 
 84:    LDA  3,1(7)	Return address in ac 
 85:    LDA  7,-44(7)	CALL cat
 86:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
 87:     LD  4,-4(1)	Load left into ac1 
 88:    ADD  3,4,3	Op + 
 89:     ST  3,-4(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-2(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
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
102:    LDA  7,-35(7)	Jump to main 
103:   HALT  0,0,0	DONE! 
* END INIT
