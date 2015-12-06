* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  e0a.c-
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
 46:    JZR  3,22(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
 69:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 70:    LDC  3,666(6)	Load integer constant 
 71:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 72:    LDA  1,-3(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-69(7)	CALL output
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
 68:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* EXPRESSION
 76:    LDC  3,0(6)	Load integer constant 
 77:     ST  3,-2(1)	Store variable x
* IF
 78:    LDC  3,0(6)	Load Boolean constant 
* THEN
* WHILE
 80:     LD  3,-2(1)	Load variable x
 81:     ST  3,-3(1)	Save left side 
 82:    LDC  3,10(6)	Load integer constant 
 83:     LD  4,-3(1)	Load left into ac1 
 84:    TLT  3,4,3	Op < 
 85:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 87:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 88:     LD  3,-2(1)	Load variable x
 89:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 90:    LDA  1,-3(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-87(7)	CALL output
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 94:     LD  3,-2(1)	Load variable x
 95:     ST  3,-3(1)	Save left side 
 96:    LDC  3,1(6)	Load integer constant 
 97:     LD  4,-3(1)	Load left into ac1 
 98:    ADD  3,4,3	Op + 
 99:     ST  3,-2(1)	Store variable x
* END COMPOUND
100:    LDA  7,-21(7)	go to beginning of loop 
 86:    LDA  7,14(7)	Jump past loop [backpatch] 
* ENDWHILE
 79:    JZR  3,22(7)	Jump around the THEN if false [backpatch] 
* ELSE
* EXPRESSION
*                       Begin call to  output
102:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
103:    LDC  3,666(6)	Load integer constant 
104:     ST  3,-5(1)	Store parameter 
*                       Jump to output
105:    LDA  1,-3(1)	Load address of new frame 
106:    LDA  3,1(7)	Return address in ac 
107:    LDA  7,-102(7)	CALL output
108:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
101:    LDA  7,7(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
109:    LDC  2,0(6)	Set return value to 0 
110:     LD  3,-1(1)	Load return address 
111:     LD  1,0(1)	Adjust fp 
112:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,112(7)	Jump to init [backpatch] 
* INIT
113:     LD  0,0(0)	Set the global pointer 
114:    LDA  1,0(0)	set first frame at end of globals 
115:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
116:    LDA  3,1(7)	Return address in ac 
117:    LDA  7,-76(7)	Jump to main 
118:   HALT  0,0,0	DONE! 
* END INIT
