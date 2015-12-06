* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  h05.c-
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
 44:    LDC  3,3(6)	Load integer constant 
 45:     LD  4,-2(1)	Load address of base of array x
 46:    SUB  3,4,3	Compute offset of value 
 47:     LD  3,0(3)	Load the value 
 48:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 49:    LDA  1,-3(1)	Load address of new frame 
 50:    LDA  3,1(7)	Return address in ac 
 51:    LDA  7,-46(7)	CALL output
 52:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 53:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 54:    LDA  1,-3(1)	Load address of new frame 
 55:    LDA  3,1(7)	Return address in ac 
 56:    LDA  7,-20(7)	CALL outnl
 57:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* IF
 58:    LDC  3,3(6)	Load integer constant 
 59:     LD  4,-2(1)	Load address of base of array x
 60:    SUB  3,4,3	Compute offset of value 
 61:     LD  3,0(3)	Load the value 
 62:     ST  3,-3(1)	Save left side 
 63:    LDC  3,0(6)	Load integer constant 
 64:     LD  4,-3(1)	Load left into ac1 
 65:    TGT  3,4,3	Op > 
* THEN
* COMPOUND
* EXPRESSION
 67:    LDC  3,3(6)	Load integer constant 
 68:     ST  3,-3(1)	Save index 
 69:    LDC  3,1(6)	Load integer constant 
 70:     LD  4,-3(1)	Restore index 
 71:     LD  5,-2(1)	Load address of base of array x
 72:    SUB  5,5,4	Compute offset of value 
 73:     LD  4,0(5)	load lhs variable x
 74:    SUB  3,4,3	op -= 
 75:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
 76:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 77:     LD  3,-2(1)	Load address of base of array x
 78:     ST  3,-5(1)	Store parameter 
*                       Jump to cat
 79:    LDA  1,-3(1)	Load address of new frame 
 80:    LDA  3,1(7)	Return address in ac 
 81:    LDA  7,-40(7)	CALL cat
 82:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
 66:    JZR  3,16(7)	Jump around the THEN if false [backpatch] 
* ENDIF
* RETURN
 83:     LD  3,-1(1)	Load return address 
 84:     LD  1,0(1)	Adjust fp 
 85:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 86:    LDC  2,0(6)	Set return value to 0 
 87:     LD  3,-1(1)	Load return address 
 88:     LD  1,0(1)	Adjust fp 
 89:    LDA  7,0(3)	Return 
* END FUNCTION cat
* FUNCTION main
 90:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 91:    LDC  3,3(6)	Load integer constant 
 92:     ST  3,-2(1)	Save index 
 93:    LDC  3,12(6)	Load integer constant 
 94:     LD  4,-2(1)	Restore index 
 95:    LDA  5,-1(0)	Load address of base of array x
 96:    SUB  5,5,4	Compute offset of value 
 97:     ST  3,0(5)	Store variable x
* EXPRESSION
*                       Begin call to  cat
 98:     ST  1,-2(1)	Store old fp in ghost frame 
*                       Load param 1
 99:    LDA  3,-1(0)	Load address of base of array x
100:     ST  3,-4(1)	Store parameter 
*                       Jump to cat
101:    LDA  1,-2(1)	Load address of new frame 
102:    LDA  3,1(7)	Return address in ac 
103:    LDA  7,-62(7)	CALL cat
104:    LDA  3,0(2)	Save the result in ac 
*                       End call to cat
* END COMPOUND
* Add standard closing in case there is no return statement
105:    LDC  2,0(6)	Set return value to 0 
106:     LD  3,-1(1)	Load return address 
107:     LD  1,0(1)	Adjust fp 
108:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,108(7)	Jump to init [backpatch] 
* INIT
109:     LD  0,0(0)	Set the global pointer 
110:    LDA  1,-19(0)	set first frame at end of globals 
111:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
112:    LDC  3,18(6)	load size of array x
113:     ST  3,0(0)	save size of array x
* END INIT GLOBALS AND STATICS
114:    LDA  3,1(7)	Return address in ac 
115:    LDA  7,-26(7)	Jump to main 
116:   HALT  0,0,0	DONE! 
* END INIT
