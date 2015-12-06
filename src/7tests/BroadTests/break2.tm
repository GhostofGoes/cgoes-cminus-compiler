* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  break2.c-
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
 45:     LD  3,-2(1)	Load variable i
 46:     ST  3,-3(1)	Save left side 
 47:    LDC  3,10(6)	Load integer constant 
 48:     LD  4,-3(1)	Load left into ac1 
 49:    TLT  3,4,3	Op < 
 50:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
 52:    LDC  3,0(6)	Load integer constant 
 53:     ST  3,-3(1)	Store variable j
* WHILE
 54:     LD  3,-3(1)	Load variable j
 55:     ST  3,-4(1)	Save left side 
 56:    LDC  3,5(6)	Load integer constant 
 57:     LD  4,-4(1)	Load left into ac1 
 58:    TLE  3,4,3	Op <= 
 59:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 61:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 62:     LD  3,-2(1)	Load variable i
 63:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 64:    LDA  1,-4(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-61(7)	CALL output
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  output
 68:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 69:     LD  3,-3(1)	Load variable j
 70:     ST  3,-6(1)	Store parameter 
*                       Jump to output
 71:    LDA  1,-4(1)	Load address of new frame 
 72:    LDA  3,1(7)	Return address in ac 
 73:    LDA  7,-68(7)	CALL output
 74:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 75:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to outnl
 76:    LDA  1,-4(1)	Load address of new frame 
 77:    LDA  3,1(7)	Return address in ac 
 78:    LDA  7,-42(7)	CALL outnl
 79:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
 80:     LD  3,-2(1)	Load variable i
 81:     ST  3,-4(1)	Save left side 
 82:    LDC  3,4(6)	Load integer constant 
 83:     LD  4,-4(1)	Load left into ac1 
 84:    TGT  3,4,3	Op > 
* THEN
* BREAK
 86:    LDA  7,-27(7)	break 
 85:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 87:     LD  3,-3(1)	load lhs variable j
 88:    LDA  3,1(3)	increment value of j
 89:     ST  3,-3(1)	Store variable j
* END COMPOUND
 90:    LDA  7,-37(7)	go to beginning of loop 
 60:    LDA  7,30(7)	Jump past loop [backpatch] 
* ENDWHILE
* IF
 91:     LD  3,-3(1)	Load variable j
 92:     ST  3,-4(1)	Save left side 
 93:    LDC  3,3(6)	Load integer constant 
 94:     LD  4,-4(1)	Load left into ac1 
 95:    TGT  3,4,3	Op > 
* THEN
* BREAK
 97:    LDA  7,-47(7)	break 
 96:    JZR  3,1(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* EXPRESSION
 98:     LD  3,-2(1)	load lhs variable i
 99:    LDA  3,1(3)	increment value of i
100:     ST  3,-2(1)	Store variable i
* END COMPOUND
101:    LDA  7,-57(7)	go to beginning of loop 
 51:    LDA  7,50(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
102:    LDC  3,0(6)	Load integer constant 
103:    LDA  2,0(3)	Copy result to rt register 
104:     LD  3,-1(1)	Load return address 
105:     LD  1,0(1)	Adjust fp 
106:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
107:    LDC  2,0(6)	Set return value to 0 
108:     LD  3,-1(1)	Load return address 
109:     LD  1,0(1)	Adjust fp 
110:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,110(7)	Jump to init [backpatch] 
* INIT
111:     LD  0,0(0)	Set the global pointer 
112:    LDA  1,0(0)	set first frame at end of globals 
113:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-74(7)	Jump to main 
116:   HALT  0,0,0	DONE! 
* END INIT
