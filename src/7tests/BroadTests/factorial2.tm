* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  factorial2.c-
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
* EXPRESSION
 43:    LDC  3,1(6)	Load integer constant 
 44:     ST  3,-3(1)	Store variable i
 45:     ST  3,-4(1)	Store variable f
* WHILE
 46:     LD  3,-3(1)	Load variable i
 47:     ST  3,-5(1)	Save left side 
 48:     LD  3,-2(1)	Load variable n
 49:     LD  4,-5(1)	Load left into ac1 
 50:    TLE  3,4,3	Op <= 
 51:    JNZ  3,1(7)	Jump to while part 
* DO
* COMPOUND
* EXPRESSION
*                       Begin call to  output
 53:     ST  1,-5(1)	Store old fp in ghost frame 
*                       Load param 1
 54:     LD  3,-3(1)	Load variable i
 55:     ST  3,-7(1)	Store parameter 
*                       Jump to output
 56:    LDA  1,-5(1)	Load address of new frame 
 57:    LDA  3,1(7)	Return address in ac 
 58:    LDA  7,-53(7)	CALL output
 59:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
 60:     LD  3,-4(1)	Load variable f
 61:     ST  3,-5(1)	Save left side 
 62:     LD  3,-3(1)	Load variable i
 63:     LD  4,-5(1)	Load left into ac1 
 64:    MUL  3,4,3	Op * 
 65:     ST  3,-4(1)	Store variable f
* EXPRESSION
 66:    LDC  3,1(6)	Load integer constant 
 67:     LD  4,-3(1)	load lhs variable i
 68:    ADD  3,4,3	op += 
 69:     ST  3,-3(1)	Store variable i
* END COMPOUND
 70:    LDA  7,-25(7)	go to beginning of loop 
 52:    LDA  7,18(7)	Jump past loop [backpatch] 
* ENDWHILE
* RETURN
 71:     LD  3,-4(1)	Load variable f
 72:    LDA  2,0(3)	Copy result to rt register 
 73:     LD  3,-1(1)	Load return address 
 74:     LD  1,0(1)	Adjust fp 
 75:    LDA  7,0(3)	Return 
* END COMPOUND
* Add standard closing in case there is no return statement
 76:    LDC  2,0(6)	Set return value to 0 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
* END FUNCTION factorial
* FUNCTION main
 80:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  input
 81:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to input
 82:    LDA  1,-3(1)	Load address of new frame 
 83:    LDA  3,1(7)	Return address in ac 
 84:    LDA  7,-84(7)	CALL input
 85:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
 86:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  factorial
 87:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 88:     LD  3,-2(1)	Load variable n
 89:     ST  3,-5(1)	Store parameter 
*                       Jump to factorial
 90:    LDA  1,-3(1)	Load address of new frame 
 91:    LDA  3,1(7)	Return address in ac 
 92:    LDA  7,-51(7)	CALL factorial
 93:    LDA  3,0(2)	Save the result in ac 
*                       End call to factorial
 94:     ST  3,-2(1)	Store variable n
* EXPRESSION
*                       Begin call to  output
 95:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Load param 1
 96:     LD  3,-2(1)	Load variable n
 97:     ST  3,-5(1)	Store parameter 
*                       Jump to output
 98:    LDA  1,-3(1)	Load address of new frame 
 99:    LDA  3,1(7)	Return address in ac 
100:    LDA  7,-95(7)	CALL output
101:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* EXPRESSION
*                       Begin call to  outnl
102:     ST  1,-3(1)	Store old fp in ghost frame 
*                       Jump to outnl
103:    LDA  1,-3(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-69(7)	CALL outnl
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to outnl
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
115:    LDA  7,-36(7)	Jump to main 
116:   HALT  0,0,0	DONE! 
* END INIT
