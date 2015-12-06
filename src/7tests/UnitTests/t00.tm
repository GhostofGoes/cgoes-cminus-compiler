* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  t00.c-
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
* FUNCTION factorial
 42:     ST  3,-1(1)	Store return address. 
* COMPOUND
* IF
 43:     LD  3,-2(1)	Load variable n
 44:     ST  3,-3(1)	Save left side 
 45:    LDC  3,2(6)	Load integer constant 
 46:     LD  4,-3(1)	Load left into ac1 
 47:    TLT  3,4,3	Op < 
* THEN
* RETURN
 49:    LDC  3,1(6)	Load integer constant 
 50:    LDA  2,0(3)	Copy result to rt register 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
 48:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
 55:     LD  3,-2(1)	Load variable n
 56:     ST  3,-3(1)	Save left side 
*                       Begin call to  factorial
 57:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 58:     LD  3,-2(1)	Load variable n
 59:     ST  3,-6(1)	Save left side 
 60:    LDC  3,1(6)	Load integer constant 
 61:     LD  4,-6(1)	Load left into ac1 
 62:    SUB  3,4,3	Op - 
 63:     ST  3,-6(1)	Store parameter 
*                       Jump to factorial
 64:    LDA  1,-4(1)	Load address of new frame 
 65:    LDA  3,1(7)	Return address in ac 
 66:    LDA  7,-25(7)	CALL factorial
 67:    LDA  3,0(2)	Save the result in ac 
*                       End call to factorial
 68:     LD  4,-3(1)	Load left into ac1 
 69:    MUL  3,4,3	Op * 
 70:    LDA  2,0(3)	Copy result to rt register 
 71:     LD  3,-1(1)	Load return address 
 72:     LD  1,0(1)	Adjust fp 
 73:    LDA  7,0(3)	Return 
 54:    LDA  7,19(7)	Jump around the ELSE [backpatch] 
* ENDIF
* END COMPOUND
* Add standard closing in case there is no return statement
 74:    LDC  2,0(6)	Set return value to 0 
 75:     LD  3,-1(1)	Load return address 
 76:     LD  1,0(1)	Adjust fp 
 77:    LDA  7,0(3)	Return 
* END FUNCTION factorial
* FUNCTION main
 78:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
 79:    LDC  3,10(6)	Load integer constant 
 80:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  factorial
 81:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 82:     LD  3,-2(1)	Load variable n
 83:     ST  3,-5(1)	Store parameter 
*                       Jump to factorial
 84:    LDA  1,-3(1)	Load address of new frame 
 85:    LDA  3,1(7)	Return address in ac 
 86:    LDA  7,-45(7)	CALL factorial
 87:    LDA  3,0(2)	Save the result in ac 
*                       End call to factorial
 88:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  output
 89:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 90:     LD  3,-2(1)	Load variable n
 91:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 92:    LDA  1,-3(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-89(7)	CALL output
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
 96:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
 97:    LDA  1,-3(1)	Load address of new frame 
 98:    LDA  3,1(7)	Return address in ac 
 99:    LDA  7,-63(7)	CALL outnl
100:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
* END COMPOUND
* Add standard closing in case there is no return statement
101:    LDC  2,0(6)	Set return value to 0 
102:     LD  3,-1(1)	Load return address 
103:     LD  1,0(1)	Adjust fp 
104:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,104(7)	Jump to init [backpatch] 
* INIT
105:     LD  0,0(0)	Set the global pointer 
106:    LDA  1,0(0)	set first frame at end of globals 
107:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
108:    LDA  3,1(7)	Return address in ac 
109:    LDA  7,-32(7)	Jump to main 
110:   HALT  0,0,0	DONE! 
* END INIT
