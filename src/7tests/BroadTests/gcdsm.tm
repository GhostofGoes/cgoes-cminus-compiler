* C- compiler version C-F15
* Built: Dec 1, 2015
* Author: Robert B. Heckendorn
* File compiled:  gcdsm.c-
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
* FUNCTION gcd
 42:     ST  3,-1(1)	Store return address. 
* IF
 43:     LD  3,-3(1)	Load variable v
 44:     ST  3,-4(1)	Save left side 
 45:    LDC  3,0(6)	Load integer constant 
 46:     LD  4,-4(1)	Load left into ac1 
 47:    TEQ  3,4,3	Op == 
* THEN
* RETURN
 49:     LD  3,-2(1)	Load variable u
 50:    LDA  2,0(3)	Copy result to rt register 
 51:     LD  3,-1(1)	Load return address 
 52:     LD  1,0(1)	Adjust fp 
 53:    LDA  7,0(3)	Return 
 48:    JZR  3,6(7)	Jump around the THEN if false [backpatch] 
* ELSE
* RETURN
*                       Begin call to  gcd
 55:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
 56:     LD  3,-3(1)	Load variable v
 57:     ST  3,-6(1)	Store parameter 
*                       Load param 2
 58:     LD  3,-2(1)	Load variable u
 59:     ST  3,-7(1)	Save left side 
 60:     LD  3,-2(1)	Load variable u
 61:     ST  3,-8(1)	Save left side 
 62:     LD  3,-3(1)	Load variable v
 63:     LD  4,-8(1)	Load left into ac1 
 64:    DIV  3,4,3	Op / 
 65:     ST  3,-8(1)	Save left side 
 66:     LD  3,-3(1)	Load variable v
 67:     LD  4,-8(1)	Load left into ac1 
 68:    MUL  3,4,3	Op * 
 69:     LD  4,-7(1)	Load left into ac1 
 70:    SUB  3,4,3	Op - 
 71:     ST  3,-7(1)	Store parameter 
*                       Jump to gcd
 72:    LDA  1,-4(1)	Load address of new frame 
 73:    LDA  3,1(7)	Return address in ac 
 74:    LDA  7,-33(7)	CALL gcd
 75:    LDA  3,0(2)	Save the result in ac 
*                       End call to gcd
 76:    LDA  2,0(3)	Copy result to rt register 
 77:     LD  3,-1(1)	Load return address 
 78:     LD  1,0(1)	Adjust fp 
 79:    LDA  7,0(3)	Return 
 54:    LDA  7,25(7)	Jump around the ELSE [backpatch] 
* ENDIF
* Add standard closing in case there is no return statement
 80:    LDC  2,0(6)	Set return value to 0 
 81:     LD  3,-1(1)	Load return address 
 82:     LD  1,0(1)	Adjust fp 
 83:    LDA  7,0(3)	Return 
* END FUNCTION gcd
* FUNCTION main
 84:     ST  3,-1(1)	Store return address. 
* COMPOUND
* EXPRESSION
*                       Begin call to  input
 85:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
 86:    LDA  1,-4(1)	Load address of new frame 
 87:    LDA  3,1(7)	Return address in ac 
 88:    LDA  7,-88(7)	CALL input
 89:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
 90:     ST  3,-2(1)	Store variable x
* EXPRESSION
*                       Begin call to  input
 91:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Jump to input
 92:    LDA  1,-4(1)	Load address of new frame 
 93:    LDA  3,1(7)	Return address in ac 
 94:    LDA  7,-94(7)	CALL input
 95:    LDA  3,0(2)	Save the result in ac 
*                       End call to input
 96:     ST  3,-3(1)	Store variable y
* EXPRESSION
*                       Begin call to  output
 97:     ST  1,-4(1)	Store old fp in ghost frame 
*                       Load param 1
*                       Begin call to  gcd
 98:     ST  1,-6(1)	Store old fp in ghost frame 
*                       Load param 1
 99:     LD  3,-2(1)	Load variable x
100:     ST  3,-8(1)	Store parameter 
*                       Load param 2
101:     LD  3,-3(1)	Load variable y
102:     ST  3,-9(1)	Store parameter 
*                       Jump to gcd
103:    LDA  1,-6(1)	Load address of new frame 
104:    LDA  3,1(7)	Return address in ac 
105:    LDA  7,-64(7)	CALL gcd
106:    LDA  3,0(2)	Save the result in ac 
*                       End call to gcd
107:     ST  3,-6(1)	Store parameter 
*                       Jump to output
108:    LDA  1,-4(1)	Load address of new frame 
109:    LDA  3,1(7)	Return address in ac 
110:    LDA  7,-105(7)	CALL output
111:    LDA  3,0(2)	Save the result in ac 
*                       End call to output
* END COMPOUND
* Add standard closing in case there is no return statement
112:    LDC  2,0(6)	Set return value to 0 
113:     LD  3,-1(1)	Load return address 
114:     LD  1,0(1)	Adjust fp 
115:    LDA  7,0(3)	Return 
* END FUNCTION main
  0:    LDA  7,115(7)	Jump to init [backpatch] 
* INIT
116:     LD  0,0(0)	Set the global pointer 
117:    LDA  1,0(0)	set first frame at end of globals 
118:     ST  1,0(1)	store old fp (point to self) 
* INIT GLOBALS AND STATICS
* END INIT GLOBALS AND STATICS
119:    LDA  3,1(7)	Return address in ac 
120:    LDA  7,-37(7)	Jump to main 
121:   HALT  0,0,0	DONE! 
* END INIT
