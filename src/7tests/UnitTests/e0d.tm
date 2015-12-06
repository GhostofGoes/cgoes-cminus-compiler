* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  e0d.c-
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
 46:     ST  3,-4(1)	Save left side 
 47:    LDC  3,6(6)	Load integer constant 
 48:     LD  4,-4(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 52:    LDC  3,0(6)	Load integer constant 
 53:     ST  3,-3(1)	Store variable y
* WHILE
 54:     LD  3,-3(1)	Load variable y
 55:     ST  3,-4(1)	Save left side 
 56:    LDC  3,6(6)	Load integer constant 
 57:     LD  4,-4(1)	Load left into ac1 
 58:    TLT  3,4,3	Op < 
 59:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 61:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 62:     LD  3,-3(1)	Load variable y
 63:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 64:    LDA  1,-4(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* IF
 68:     LD  3,-3(1)	Load variable y
 69:     ST  3,-4(1)	Save left side 
 70:    LDC  3,4(6)	Load integer constant 
 71:     LD  4,-4(1)	Load left into ac1 
 72:    TEQ  3,4,3	Op == 
* THEN
* BREAK
 74:    LDA  7,-15(7)	break 
 73:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 75:     LD  3,-3(1)	Load variable y
 76:     ST  3,-4(1)	Save left side 
 77:    LDC  3,1(6)	Load integer constant 
 78:     LD  4,-4(1)	Load left into ac1 
 79:    ADD  3,4,3	Op + 
 80:     ST  3,-3(1)	Store variable y
* END COMPOUND
 81:    LDA  7,-28(7)	go to beginning of loop 
 60:    LDA  7,21(7)	Jump past loop [backpatch] 
* ENDWHILE
* EXPRESSION
*                       Begin call to  output
 82:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 83:     LD  3,-2(1)	Load variable x
 84:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 85:    LDA  1,-4(1)	Load address of new frame 
 86:    LDA  3,1(7)	Return address in ac 
 87:    LDA  7,-82(7)	CALL output
 88:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* IF
 89:     LD  3,-2(1)	Load variable x
 90:     ST  3,-4(1)	Save left side 
 91:    LDC  3,4(6)	Load integer constant 
 92:     LD  4,-4(1)	Load left into ac1 
 93:    TEQ  3,4,3	Op == 
* THEN
* BREAK
 95:    LDA  7,-45(7)	break 
 94:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 96:     LD  3,-2(1)	Load variable x
 97:     ST  3,-4(1)	Save left side 
 98:    LDC  3,1(6)	Load integer constant 
 99:     LD  4,-4(1)	Load left into ac1 
100:    ADD  3,4,3	Op + 
101:     ST  3,-2(1)	Store variable x
* END COMPOUND
102:    LDA  7,-58(7)	go to beginning of loop 
 51:    LDA  7,51(7)	Jump past loop [backpatch] 
* ENDWHILE
* END COMPOUND
* Add standard closing in case there is no return statement
103:    LDC  2,0(6)	Set return value to 0 
104:     LD  3,-1(1)	Load return address 
105:     LD  1,0(1)	Adjust fp 
106:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,106(7)	Jump to init [backpatch] 
* INIT
107:     LD  0,0(0)	Set the global pointer 
108:    LDA  1,0(0)	set first frame at end of globals 
109:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
110:    LDA  3,1(7)	Return address in ac 
111:    LDA  7,-70(7)	Jump to main 
112:   HALT  0,0,0	DONE! 
* END INIT
